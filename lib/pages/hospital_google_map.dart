import 'dart:convert';
import 'package:firestoreapp/pages/hospital_json_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HospitalGoogleMap extends StatefulWidget {
  const HospitalGoogleMap({Key key, this.hospitalCardDetails})
      : super(key: key);
  final HospitalJson hospitalCardDetails;

  @override
  _HospitalGoogleMapState createState() => _HospitalGoogleMapState();
}

class _HospitalGoogleMapState extends State<HospitalGoogleMap> {
  final Map<String, Marker> _markers = {};
  List<HospitalJson> hospitalDetails = List();
  Future<void> _onMapCreated(GoogleMapController controller) async {
    var hospital = await rootBundle.loadString('assets/json/hospital.json');
    var hospitalData = jsonDecode(hospital) as List;
    for (var hospitalGoogleDetails in hospitalData) {
      HospitalJson details = HospitalJson.fromJson(hospitalGoogleDetails);
      hospitalDetails.add(details);
    }
    setState(() {
      _markers.clear();
      for (final hospital in hospitalDetails) {
        final marker = Marker(
          markerId: MarkerId(hospital.markerId),
          position: LatLng(double.parse(hospital.positionLat),
              double.parse(hospital.positionLng)),
          infoWindow: InfoWindow(
            title: hospital.title,
            snippet: hospital.address,
          ),
        );
        _markers[hospital.title] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text("Hospital ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold))),
          backgroundColor: Colors.red,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(12.954893, 77.571468),
            zoom: 10,
          ),
          myLocationEnabled: true,
          markers: _markers.values.toSet(),
        ));
  }
}

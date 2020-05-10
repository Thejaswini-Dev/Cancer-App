class HospitalJson {
  String markerId;
  String positionLat;
  String positionLng;
  String address;
  String title;
  

  HospitalJson(
      {this.markerId,
      this.positionLat,
      this.positionLng,
      this.address,
      this.title,
  });

  HospitalJson.fromJson(Map<String, dynamic> json) {
    markerId = json['markerId'];
    positionLat = json['positionLat'];
    positionLng = json['positionLng'];
    address = json['Address'];
    title = json['title'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['markerId'] = this.markerId;
    data['positionLat'] = this.positionLat;
    data['positionLng'] = this.positionLng;
    data['Address'] = this.address;
    data['title'] = this.title;
   
    return data;
  }
}
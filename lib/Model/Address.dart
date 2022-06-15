class Addresses {
  int? id;
  int? longitude;
  int? latitude;
  String? address;
  int? provinceId;
  int? districtId;
  int? communeId;
  int? userAddressId;

  Addresses(
      {this.id,
      this.longitude,
      this.latitude,
      this.address,
      this.provinceId,
      this.districtId,
      this.communeId,
      this.userAddressId});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    provinceId = json['provinceId'];
    districtId = json['districtId'];
    communeId = json['communeId'];
    userAddressId = json['userAddressId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['address'] = this.address;
    data['provinceId'] = this.provinceId;
    data['districtId'] = this.districtId;
    data['communeId'] = this.communeId;
    data['userAddressId'] = this.userAddressId;
    return data;
  }
}

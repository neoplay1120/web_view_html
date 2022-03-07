class ZipCode {
  final String zonecode;
  final String roadAddress;
  final String bname;

  ZipCode(this.zonecode, this.roadAddress, this.bname);

  factory ZipCode.fromJson(Map<String, dynamic> json) {
    return ZipCode(
      json['zonecode'],
      json['roadAddress'],
      json['bname'],
    );
  }
}
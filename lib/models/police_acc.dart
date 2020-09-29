import 'dart:convert';

class PoliceAccModel {
  String name;
  String email;
  String phone;
  String address;
  String desig;
  String state;
  String district;
  String ps;
  String filePath;
  PoliceAccModel({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.desig,
    this.state,
    this.district,
    this.ps,
    this.filePath,
  });

  PoliceAccModel copyWith({
    String name,
    String email,
    String phone,
    String address,
    String desig,
    String state,
    String district,
    String ps,
    String filePath,
  }) {
    return PoliceAccModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      desig: desig ?? this.desig,
      state: state ?? this.state,
      district: district ?? this.district,
      ps: ps ?? this.ps,
      filePath: filePath ?? this.filePath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'desig': desig,
      'state': state,
      'district': district,
      'ps': ps,
      'filePath': filePath,
    };
  }

  factory PoliceAccModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PoliceAccModel(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      desig: map['desig'],
      state: map['state'],
      district: map['district'],
      ps: map['ps'],
      filePath: map['filePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PoliceAccModel.fromJson(String source) =>
      PoliceAccModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PoliceAccModel(name: $name, email: $email, phone: $phone, address: $address, desig: $desig, state: $state, district: $district, ps: $ps, filePath: $filePath)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PoliceAccModel &&
        o.name == name &&
        o.email == email &&
        o.phone == phone &&
        o.address == address &&
        o.desig == desig &&
        o.state == state &&
        o.district == district &&
        o.ps == ps &&
        o.filePath == filePath;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        desig.hashCode ^
        state.hashCode ^
        district.hashCode ^
        ps.hashCode ^
        filePath.hashCode;
  }
}

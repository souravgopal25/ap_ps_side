import 'dart:convert';

class FirDetails {
  String state;
  String city;
  String district;
  String policeStation;
  String titleCase;
  String caseType;
  String caseTitle;
  String description;
  String suspect;
  String document;
  FirDetails({
    this.state,
    this.city,
    this.district,
    this.policeStation,
    this.titleCase,
    this.caseType,
    this.caseTitle,
    this.description,
    this.suspect,
    this.document,
  });

  FirDetails copyWith({
    String state,
    String city,
    String district,
    String policeStation,
    String titleCase,
    String caseType,
    String caseTitle,
    String description,
    String suspect,
    String document,
  }) {
    return FirDetails(
      state: state ?? this.state,
      city: city ?? this.city,
      district: district ?? this.district,
      policeStation: policeStation ?? this.policeStation,
      titleCase: titleCase ?? this.titleCase,
      caseType: caseType ?? this.caseType,
      caseTitle: caseTitle ?? this.caseTitle,
      description: description ?? this.description,
      suspect: suspect ?? this.suspect,
      document: document ?? this.document,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'city': city,
      'district': district,
      'policeStation': policeStation,
      'titleCase': titleCase,
      'caseType': caseType,
      'caseTitle': caseTitle,
      'description': description,
      'suspect': suspect,
      'document': document,
    };
  }

  factory FirDetails.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FirDetails(
      state: map['state'],
      city: map['city'],
      district: map['district'],
      policeStation: map['policeStation'],
      titleCase: map['titleCase'],
      caseType: map['caseType'],
      caseTitle: map['caseTitle'],
      description: map['description'],
      suspect: map['suspect'],
      document: map['document'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FirDetails.fromJson(String source) =>
      FirDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirDetails(state: $state, city: $city, district: $district, policeStation: $policeStation, titleCase: $titleCase, caseType: $caseType, caseTitle: $caseTitle, description: $description, suspect: $suspect, document: $document)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FirDetails &&
        o.state == state &&
        o.city == city &&
        o.district == district &&
        o.policeStation == policeStation &&
        o.titleCase == titleCase &&
        o.caseType == caseType &&
        o.caseTitle == caseTitle &&
        o.description == description &&
        o.suspect == suspect &&
        o.document == document;
  }

  @override
  int get hashCode {
    return state.hashCode ^
        city.hashCode ^
        district.hashCode ^
        policeStation.hashCode ^
        titleCase.hashCode ^
        caseType.hashCode ^
        caseTitle.hashCode ^
        description.hashCode ^
        suspect.hashCode ^
        document.hashCode;
  }
}

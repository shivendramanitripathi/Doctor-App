import 'dart:convert';

List<CountryStatusModel> countryStatusModelListFromJson(String str) {
  final List<dynamic> jsonList = json.decode(str);
  return List<CountryStatusModel>.from(
      jsonList.map((x) => CountryStatusModel.fromJson(x)));
}


String countryStatusModelListToJson(List<CountryStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<CountryStatusModel> countryStatusModelFromJson(String str) =>
    List<CountryStatusModel>.from(
        json.decode(str).map((x) => CountryStatusModel.fromJson(x)));

String countryStatusModelToJson(List<CountryStatusModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryStatusModel {
  List<String> webPages;
  String name;
  List<String> domains;
  Country country;
  String? stateProvince;
  AlphaTwoCode alphaTwoCode;

  CountryStatusModel({
    required this.webPages,
    required this.name,
    required this.domains,
    required this.country,
    required this.stateProvince,
    required this.alphaTwoCode,
  });

  factory CountryStatusModel.fromJson(Map<String, dynamic> json) {
    return CountryStatusModel(
      webPages: List<String>.from(json["web_pages"].map((x) => x)),
      name: json["name"],
      domains: List<String>.from(json["domains"].map((x) => x)),
      country: countryValues.map[json["country"]] ??
          Country.UNKNOWN, // Add a default value for unknown countries
      stateProvince: json["state-province"],
      alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]] ??
          AlphaTwoCode
              .UNKNOWN, // Add a default value for unknown alpha two codes
    );
  }

  Map<String, dynamic> toJson() => {
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "name": name,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "country": countryValues.reverse[country] ?? "Unknown",
        "state-province": stateProvince,
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode] ?? "Unknown",
      };
}

enum Country {
  UNITED_STATES,
  UNKNOWN,
}

final countryValues = EnumValues({
  "United States": Country.UNITED_STATES,
  "Unknown": Country.UNKNOWN,
});

enum AlphaTwoCode {
  US,
  UNKNOWN,
}

final alphaTwoCodeValues = EnumValues({
  "US": AlphaTwoCode.US,
  // Add more alpha two code mappings as needed
  // ...
  // Add UNKNOWN as a default mapping
  "Unknown": AlphaTwoCode.UNKNOWN,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

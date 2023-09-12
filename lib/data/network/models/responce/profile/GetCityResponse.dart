class GetCityResponse {
  List<CityList>? cityList;

  GetCityResponse({this.cityList});

  GetCityResponse.fromJson(Map<String, dynamic> json) {
    if (json['cityList'] != null) {
      cityList = <CityList>[];
      json['cityList'].forEach((v) {
        cityList!.add(new CityList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cityList != null) {
      data['cityList'] = this.cityList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CityList {
  String? code;
  String? name;

  CityList({this.code, this.name});

  CityList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

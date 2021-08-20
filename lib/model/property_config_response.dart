import 'package:kalifa_gardens/model/plot_type.dart';

class PropertyConfig {
  late String id;
  late String id2;
  late String name;
  late int unitPrice;
  late String publishedAt;
  late String createdAt;
  late String updatedAt;
  late int v;
  late List<PlotType> plotTypes;
  late String size;

  PropertyConfig(
      {required this.id,
      required this.id2,
      required this.name,
      required this.createdAt,
      required this.plotTypes,
      required this.publishedAt,
      required this.unitPrice,
      required this.updatedAt,
      required this.v,
      required this.size});

  PropertyConfig.fromJson(Map<String, dynamic> json) {
    id2 = json['_id'];
    name = json['name'];
    unitPrice = json['unitPrice'];
    publishedAt = json['published_at'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    if (json['plotTypes'] != null) {
      plotTypes = [];
      json['plotTypes'].forEach((a) {
        plotTypes.add(new PlotType.fromJson(a));
      });
    }
    size = json['size'];
    id = json['id'];
  }

  // factory PropertyConfig.fromJson(Map<String, dynamic> parsedJson) {
  //   return PropertyConfig(
  //       id: parsedJson['_id'],
  //       createdAt: parsedJson['createdAt'],
  //       name: parsedJson['name'],
  //       publishedAt: parsedJson['publishedAt'],
  //       unitPrice: parsedJson['unitPrice'],
  //       updatedAt: parsedJson['updatedAt'],
  //       v: parsedJson['__v'],
  //       // plotTypes: List<PlotType>.from(parsedJson['plotTypes'].map((x) => x)),
  //       plotTypes: List<PlotType>.from(
  //           parsedJson["plotTypes"].map((x) => PlotType.fromJson(x))),
  //       id2: parsedJson['id'],
  //       size: parsedJson['size']);
  // }
}

class PlotType {
  String id;
  int size;
  String title;
  int v;
  String id2;

  PlotType(
      {required this.id,
      required this.size,
      required this.title,
      required this.v,
      required this.id2});

  factory PlotType.fromJson(Map<String, dynamic> parsedJson) {
    return PlotType(
        id: parsedJson['_id'],
        size: parsedJson['size'],
        title: parsedJson['title'],
        v: parsedJson['__v'],
        id2: parsedJson['id']);
  }
}

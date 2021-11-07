class RegisterInterestModel {
  String id;
  String publishedAt;
  String status;
  int size;
  int qty;
  int totalCost;
  String updatedAt;
  String user;
  int v;

  RegisterInterestModel({
    required this.id,
    required this.publishedAt,
    required this.qty,
    required this.size,
    required this.status,
    required this.totalCost,
    required this.updatedAt,
    required this.user,
    required this.v,
  });

  factory RegisterInterestModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return RegisterInterestModel(
      id: parsedJson['id'],
      publishedAt: parsedJson['published_at'],
      qty: parsedJson['qty'],
      size: parsedJson['size'],
      status: parsedJson['status'],
      totalCost: parsedJson['totalCost'],
      updatedAt: parsedJson['updatedAt'],
      v: parsedJson['__v'],
      user: parsedJson['user'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'published_at': publishedAt,
        'qty': qty,
        'size': size,
        'status': status,
        'totalCost': totalCost,
        'updatedAt': updatedAt,
        'user': user,
        '__v': v,
      };
}

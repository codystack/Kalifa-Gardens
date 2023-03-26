class InterestResponse {
  late int id;
  late int size;
  late int qty;
  late int unitPrice;
  late int totalAmount;
  late String createdAt;
  late String updatedAt;
  late String status;

  InterestResponse({
    required this.id,
    required this.size,
    required this.qty,
    required this.unitPrice,
    required this.totalAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
  });

  InterestResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    qty = json['qty'];
    unitPrice = json['unit_price'];
    totalAmount = json['total_amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['qty'] = this.qty;
    data['unit_price'] = this.unitPrice;
    data['total_amount'] = this.totalAmount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['status'] = this.status;
    return data;
  }
}

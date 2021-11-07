class Role {
  final String? id;
  final String? name;
  final String? description;
  final String? type;
  final int? v;

  Role({this.id, this.name, this.description, this.type, this.v});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
        description: json['description'],
        id: json['_id'],
        name: json['name'],
        type: json['type'],
        v: json['__v']);
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        '_id': id,
        'name': name,
        'type': type,
        '__v': v
      };
}

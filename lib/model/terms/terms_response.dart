class TermsResponse {
  late Data data;
  late Meta meta;

  TermsResponse({required this.data, required this.meta});

  TermsResponse.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
    meta = (json['meta'] != null ? Meta.fromJson(json['meta']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data.toJson();
    data['meta'] = this.meta.toJson();
    return data;
  }
}

class Data {
  late int id;
  late Attributes attributes;

  Data({required this.id, required this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributes = (json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attributes'] = this.attributes.toJson();
    return data;
  }
}

class Attributes {
  String? content;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;

  Attributes({
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  Attributes.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    publishedAt = json['publishedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['publishedAt'] = this.publishedAt;
    return data;
  }
}

class Meta {
  // Meta({});

  Meta.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}

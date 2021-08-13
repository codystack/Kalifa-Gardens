class TermsAndConditions {

  final String _id;
  final String content;
  final String published_at;
  final String createdAt;
  final String updatedAt;
  final int __v;
  final String id;

  TermsAndConditions(this._id, this.content, this.published_at, this.createdAt, this.updatedAt, this.__v, this.id);

  TermsAndConditions.fromJson(Map<dynamic, dynamic> json)
      : _id = json['_id'],
        content = json['content'],
        published_at = json['published_at'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        __v = json['__v'],
        id = json['id'];

  Map<dynamic, dynamic> toJson() => {
    '_id': _id,
    'content': content,
    'published_at': published_at,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': __v,
    'id': id
  };
}
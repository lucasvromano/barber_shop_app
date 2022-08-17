class ApiModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  ApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };

  static List<ApiModel> listFromJson(List<dynamic> list) =>
      List<ApiModel>.from(list.map((x) => ApiModel.fromJson(x)));
}

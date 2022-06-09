class ArtigosModel {
  String? author;
  String? title;
  String? description;
  String? content;
  String? url;
  List<String> favoritos = [];

  ArtigosModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.content,
  });

  ArtigosModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = Map<String, dynamic>();
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['content'] = content;
    return data;
  }
}

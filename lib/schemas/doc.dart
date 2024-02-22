


class Doc {
  final String id;
  final String title;
  final String description;
  final String content;
  final List<String> tags;
  
  Doc({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.tags,
  });

  factory Doc.fromJson(Map<String, dynamic> json) {
    return Doc(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      content: json['content'],
      tags: json['tags'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      "description": description,
      'content': content,
      'tags': tags,
    };
  }
}


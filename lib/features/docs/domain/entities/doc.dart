class Document {
  final String id;
  final String title;
  final String description;
  final String content;
  final List<String> tags;

  Document({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.tags,
  });

}

class DocumentSchema {
  
  final String id;
  final String title;
  final String description;
  final String content;
  final List<String> tags;

  DocumentSchema({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.tags,
  });

  factory DocumentSchema.fromJson(Map<String, dynamic> json) {
    return DocumentSchema(
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

  Document toDocument() => Document(
      id: id,
      title: title,
      description: description,
      content: content,
      tags: tags,
    );  

}




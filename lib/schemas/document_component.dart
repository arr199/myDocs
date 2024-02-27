enum ComponentType { title, description, codeblock }

class DocumentComponent {
  final String id;
  final ComponentType type;
  final String content;

  DocumentComponent({
    required this.id,
    required this.type,
    required this.content,
  });
}

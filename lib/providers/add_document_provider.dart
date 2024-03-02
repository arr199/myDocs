import 'package:flutter/material.dart';
import 'package:my_docs/schemas/document_component.dart';

class AddDocumentProvider extends ChangeNotifier {
  List<DocumentComponent> componentsList = [
    DocumentComponent(
      type: ComponentType.title,
      content: "Test Title",
      id: '1',
    ),
    DocumentComponent(
        type: ComponentType.description, content: "Test Description", id: "as"),
    DocumentComponent(
        type: ComponentType.codeblock,
        content: " const [ isOpen , setIsOpen ] = useState()",
        id: "as"),
  ];
}

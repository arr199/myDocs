import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_docs/features/docs/domain/entities/document_component.dart';

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

  TextEditingController content = TextEditingController();
  ComponentType type = ComponentType.title;

  void setState() {
    notifyListeners();
  }

  void addComponent({
    required String componentContent,
    required ComponentType componentType,
  }) {
    componentsList.add(DocumentComponent(
      type: componentType,
      content: componentContent,
      id: DateTime.now().toString(),
    ));

    notifyListeners();
  }
}

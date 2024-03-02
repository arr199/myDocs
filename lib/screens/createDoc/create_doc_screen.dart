import 'package:flutter/material.dart';
import 'package:flutter_highlighting/flutter_highlighting.dart';
import 'package:my_docs/schemas/document_component.dart';
import 'package:my_docs/shared/widgets/app_bar.dart';
import 'package:highlighting/languages/javascript.dart';
import 'package:flutter_highlighting/themes/dark.dart';

class CreateDocScreen extends StatefulWidget {
  const CreateDocScreen({super.key});

  @override
  State<CreateDocScreen> createState() => _CreateDocScreenState();
}

class _CreateDocScreenState extends State<CreateDocScreen> {
  final List<DocumentComponent> components = [
    DocumentComponent(
      type: ComponentType.title,
      content: "Title",
      id: '1',
    ),
    DocumentComponent(
        type: ComponentType.description, content: "Description", id: "as"),
    DocumentComponent(
        type: ComponentType.codeblock, content: "Code blocks", id: "as"),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SelectionArea(
      child: Scaffold(
          appBar: const MainAppBar(),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: components.length,
                      itemBuilder: (context, index) {
                        switch (components[index].type) {
                          case ComponentType.title:
                            return const TitleComponent();
                          case ComponentType.description:
                            return const DescriptionComponent();
                          case ComponentType.codeblock:
                            return CodeBlockComponent();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                side: BorderSide(color: colors.primary, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
            child: const Text(
              "Save All",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          )),
    );
  }
}

class TitleComponent extends StatelessWidget {
  const TitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      textColor: colors.primary,
      title: const Text(
        'Remove white spaces in Zod',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
      ),
    );
  }
}

class DescriptionComponent extends StatelessWidget {
  const DescriptionComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      textColor: colors.primary,
      title: const Text(
        'In order to remove white spaces in zod you can use the following method ',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    );
  }
}

class CodeBlockComponent extends StatelessWidget {
  CodeBlockComponent({super.key});
  final String source = """
  const [ isAlive , setIsAlive] = useState(true)

  useEffect( () => {
    console.log("asd")
  } , [])

  let a = 12

  const a = 23;
""";

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return HighlightView(
      // The original code to be highlighted
      source,
      
      // Specify language
      // It is recommended to give it a value for performance
      languageId: javascript.id,
      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: darkTheme,
      // Specify padding
      padding: EdgeInsets.all(12),
      // Specify text style
      textStyle: TextStyle(
        fontSize: 16,
      ),
    );
  }
}

// Components
//  Title
// Description
// Code blocks

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_docs/providers/add_document_provider.dart';
import 'package:my_docs/schemas/document_component.dart';
import 'package:my_docs/screens/createDoc/widgets/add_component_button.dart';
import 'package:my_docs/screens/createDoc/widgets/add_component_drawer.dart';
import 'package:my_docs/screens/createDoc/widgets/codeblock_component.dart';
import 'package:my_docs/screens/createDoc/widgets/description_component.dart';
import 'package:my_docs/screens/createDoc/widgets/save_button.dart';
import 'package:my_docs/screens/createDoc/widgets/title_component.dart';
import 'package:my_docs/shared/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class CreateDocScreen extends StatelessWidget {
  const CreateDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final components = context.watch<AddDocumentProvider>().componentsList;
    final colors = Theme.of(context).colorScheme;

    return SelectionArea(
      child: Scaffold(
          appBar: const MainAppBar(),
          endDrawer: AddComponentDrawer(),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          itemCount: components.length,
                          itemBuilder: (context, index) {
                            switch (components[index].type) {
                              case ComponentType.title:
                                return TitleComponent(
                                  content: components[index].content,
                                );
                              case ComponentType.description:
                                return DescriptionComponent(
                                  content: components[index].content,
                                );
                              case ComponentType.codeblock:
                                return CodeBlockComponent(
                                  content: components[index].content,
                                );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: ButtonBar(
            children: [
              SaveButton(colors: colors),
              AddComponentButton(colors: colors),
            ],
          )),
    );
  }
}

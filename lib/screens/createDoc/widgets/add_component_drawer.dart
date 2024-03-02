import 'package:flutter/material.dart';
import 'package:my_docs/schemas/document_component.dart';

class AddComponentDrawer extends StatelessWidget {
  const AddComponentDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final deviceWith = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Colors.black,
      width: deviceWith * 0.3,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.primary,
            ),
            child: const Center(
              child: Text(
                'Add a component to this document',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),

          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TYPE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(
                            color: colors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      DropdownButton(
                        onChanged: (value) {},
                        items: ComponentType.values.map((ComponentType type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(
                              type.toString().split('.').last,
                              style: TextStyle(
                                  color: colors.primary,
                                  fontWeight: FontWeight.w700),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),

                  //  CONTENT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Content",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: colors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        maxLines: 8,
                        onSubmitted: (value) {},
                        onChanged: (value) {},
                        style: TextStyle(
                            color: colors.primary, fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          focusColor: colors.primary,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colors.primary.withOpacity(.7),
                                  width: 3)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colors.primary, width: 3)),
                          labelStyle: TextStyle(
                            color: colors.primary.withOpacity(.7),
                            fontWeight: FontWeight.w900,
                          ),
                          contentPadding: const EdgeInsets.all(20.0),
                        ),
                      ),
                    ],
                  )
                ],
              )),

          // CONTENT
        ],
      ),
    );
  }
}

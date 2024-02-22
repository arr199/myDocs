import 'package:flutter/material.dart';
import 'package:my_docs/data/data.dart';
import 'package:my_docs/schemas/doc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arr Documentation',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Doc> data = [];
  final searchInputController = TextEditingController();
  final searchInputFocusNode = FocusNode();

  Future<void> filterData() async {
    final initialData = exampleData.map((e) => Doc.fromJson(e)).toList();
    data = initialData.where((element) {
      final search = searchInputController.text.toLowerCase();
      final title = element.title.toLowerCase();
      final tags = element.tags.map((e) => e.toLowerCase()).toList();
      return title.contains(search) || tags.contains(search);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    filterData();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          'Arr Documentation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        splashColor: Colors.black12,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      width: screenSize * 0.8,
                      alignment: Alignment.center,
                      child: TextField(
                        onSubmitted: (value) {
                          setState(() {});
                          searchInputFocusNode.requestFocus();
                        },
                        onChanged: (value) {},
                        focusNode: searchInputFocusNode,
                        controller: searchInputController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Search docs by tag or name',
                            contentPadding: EdgeInsets.only(left: 20.0),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20.0,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: BoxBorder.lerp(
                          Border.all(color: Colors.black87),
                          Border.all(color: Colors.black87),
                          0.5,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                            width: 100,
                            child: const Center(
                                child: Text(
                              "Search",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (data.isEmpty)
            const Center(
              child: Text(
                "No docs found",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          DocsList(data: data),
        ],
      ),
    );
  }
}

class DocsList extends StatelessWidget {
  const DocsList({
    super.key,
    required this.data,
  });

  final List<Doc> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            final item = data[index];

            final description = item.description.length > 30
                ? item.description.substring(0, 30) + "..."
                : item.description;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(12),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 600,
                      ),
                      child: Text(description)),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}

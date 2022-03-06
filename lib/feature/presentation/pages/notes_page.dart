import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  bool isBlockView = false;
  final List<String> titles = [
    'title',
    'title',
    'title',
    'title',
    'title',
  ];

  final List<String> texts = [
    'titletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle title',
    'titletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle title',
    'titletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle title',
    'titletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle titletitletitl etittitle letitletitlet itletitlet itletitletitle title',
    'titletitl etittitle letitletitlet itletitlet itletitletitle title',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(54, 54), shape: const CircleBorder()),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Dub notes'),
        actions: [
          IconButton(
            onPressed: () => !isBlockView,
            icon: const Icon(
              Icons.view_headline_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListViewWidget(
        texts: texts,
        titles: titles,
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List<String> titles;
  final List<String> texts;

  const ListViewWidget({
    Key? key,
    required this.titles,
    required this.texts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              titles[index],
              style: const TextStyle(fontSize: 22),
            ),
            subtitle: Text(
              texts[index],
              // style: const TextStyle(fontSize: 22),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: titles.length);
  }
}

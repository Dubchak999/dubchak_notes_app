import 'package:dubchak_notes_app/feature/notes/bloc/notes_view/notes_view_mode_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView>
    with SingleTickerProviderStateMixin {
  // bool isBlockView = false;
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

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesViewModeCubit, bool>(
      builder: (context, isBlockView) {
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
            actions: <Widget>[
              IconButton(
                  key: const Key('notesView_changeViewType_IconButton'),
                  onPressed: () {
                    context.read<NotesViewModeCubit>().changeViewMode();
                    isBlockView
                        ? _animationController.reverse()
                        : _animationController.forward();
                  },
                  icon: AnimatedIcon(
                      icon: AnimatedIcons.view_list,
                      progress: _animationController))
            ],
          ),
          body: _NotesGridView(
              titles: titles, texts: texts, isBlockView: isBlockView),
        );
      },
    );
  }
}

class _NotesGridView extends StatelessWidget {
  final List<String> titles;
  final List<String> texts;
  final bool isBlockView;

  const _NotesGridView({
    Key? key,
    required this.titles,
    required this.texts,
    required this.isBlockView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: isBlockView ? 2 : 1,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: titles.length,
      itemBuilder: (context, index) {
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
    );
  }
}

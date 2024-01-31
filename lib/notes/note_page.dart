import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:practice_dart/database/notes_db.dart';
import 'package:practice_dart/notes/add_edit_page.dart';
import 'package:practice_dart/notes/note_detail_page.dart';
import 'package:practice_dart/notes/widgets/note_card_widget.dart';
import 'notes_model.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  List<Note> notes = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    NoteDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Center(
        child: loading ? const CupertinoActivityIndicator()
        : notes.isEmpty ? Text('No Notes', style: Theme.of(context).textTheme.displayMedium,)
        : buildNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddEditPage())
          );
          refreshNotes();
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

  Future<void> refreshNotes() async {
    setState(() => loading = true);
    notes = await NoteDatabase.instance.readAllNotes();
    setState(() => loading = false);
  }

  Widget buildNotes() => StaggeredGrid.count(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    crossAxisSpacing: 2,
    children: List.generate(notes.length, (index) {
      return StaggeredGridTile.fit(
        crossAxisCellCount: 1,
        child: GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NoteDetailPage(noteId: notes[index].id!))
            );
            refreshNotes();
          },
          child: NoteCardWidget(note: notes[index], index: index,),
        ),
      );
    })
  );
}



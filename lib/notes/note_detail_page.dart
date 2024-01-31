import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice_dart/database/notes_db.dart';
import 'package:practice_dart/notes/add_edit_page.dart';
import 'notes_model.dart';

class NoteDetailPage extends StatefulWidget {
  const NoteDetailPage({super.key, required this.noteId});

  final int noteId;

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  Note? note;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [editButton(), deleteButton()],
      ),
      body: isLoading ? const CupertinoActivityIndicator()
      :  Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            Text(
              note?.title ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              DateFormat.yMMMd().format(note!.createdTime),
              style: const TextStyle(color: Colors.white38),
            ),
            const SizedBox(height: 8),
            Text(
              note?.description ?? '',
              style:
              const TextStyle(color: Colors.white70, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditPage(note: note),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
    icon: const Icon(Icons.delete),
    onPressed: () async {
      await NoteDatabase.instance.delete(widget.noteId);

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    },
  );

  Future<void> refreshNote() async {
    setState(() => isLoading = true);

    note = await NoteDatabase.instance.readNote(widget.noteId);

    setState(() => isLoading = false);
  }
}

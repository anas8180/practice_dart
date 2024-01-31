import 'package:flutter/material.dart';
import 'package:practice_dart/database/notes_db.dart';
import 'package:practice_dart/notes/notes_model.dart';
import 'package:practice_dart/notes/widgets/note_form_widget.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({super.key, this.note});

  final Note? note;

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  late bool  isActive;

  @override
  void initState() {
    super.initState();

    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    isActive = widget.note?.isActive ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [buildButton()],
      ),
      body: Form(
        key: _formKey,
        child: NoteFormWidget(
          onChangedImportant: (bool value) {
            setState(() {
              isImportant = value;
            });
          },
          onChangedNumber: (int value) {
            setState(() {
              number = value;
            });
          },
          onChangedTitle: (String value) {
            setState(() {
              title = value;
            });
          },
          onChangedDescription: (String value) {
            setState(() {
              description = value;
            });
          },
          onChangedIsActive: (bool value) {
            setState(() {
              isActive = value;
            });
          },
          isImportant: isImportant,
          number: number,
          title: title,
          description: description,
          isActive: isActive
        ),
      )
    );
  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: (){
            addOrUpdateNote();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey.shade700,
          ),
          child: const Text('Save')
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = (widget.note != null);

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      if (context.mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  Future addNote() async {
    final note = Note(
      title: title,
      description: description,
      isImportant: isImportant,
      number: number,
      createdTime: DateTime.now(),
      isActive: isActive
    );

    await NoteDatabase.instance.create(note);
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      title: title,
      description: description,
      isImportant: isImportant,
      number: number,
      isActive: isActive
    );

    await NoteDatabase.instance.update(note);
  }
}

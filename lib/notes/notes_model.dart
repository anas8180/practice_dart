
const String tableNotes = 'notes';

class NoteFields {

  static final List<String> values = [
    id, isImportant, number, title, description, createdTime, isActive
  ];

  static const String id = '_id';
  static const String isImportant = 'isImportant';
  static const String number = 'number';
  static const String title = 'title';
  static const String description = 'description';
  static const String createdTime = 'time';
  static const String isActive = 'isActive';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  final bool isActive;

  Note({this.id, required this.isImportant, required this.number, required this.title, required this.description, required this.createdTime, required this.isActive});
  
  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
    bool? isActive
  }) => Note(id: id ?? this.id,
      isImportant: isImportant ?? this.isImportant,
      number: number ?? this.number,
      title: title ?? this.title,
      description: description ?? this.description,
      createdTime: createdTime ?? this.createdTime,
      isActive: isActive ?? this.isActive);

  static Note fromJson(Map<String, Object?> json) => Note(
      id: json[NoteFields.id] as int?,
      isImportant: json[NoteFields.isImportant] == 1,
      number: json[NoteFields.number] as int,
      title: json[NoteFields.title] as String,
      description: json[NoteFields.description] as String,
      createdTime: DateTime.parse(json[NoteFields.createdTime] as String,),
      isActive: json[NoteFields.isActive] == 1);
  
  Map<String, Object?> toJson() => {
    NoteFields.id: id,
    NoteFields.isImportant: isImportant ? 1 : 0,
    NoteFields.number: number,
    NoteFields.title: title,
    NoteFields.description: description,
    NoteFields.createdTime: createdTime.toIso8601String(),
    NoteFields.isActive: isActive ? 1 : 0
  };
}
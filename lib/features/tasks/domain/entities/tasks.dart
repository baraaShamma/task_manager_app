import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final int? id;
  final String title;
  final String body;

  const Tasks({this.id, required this.title, required this.body});

  @override
  List<Object?> get props => [id, title, body];
}

import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
// ignore: must_be_immutable
class TodoEntity extends Equatable {
  @Id(assignable: true)
  int id;
  String task;
  String description;
  bool isCompleted;
  @Property(type: PropertyType.date)
  final DateTime createdAt;

  TodoEntity({
    this.id = 0,
    required this.task,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        task,
        description,
        isCompleted,
        createdAt,
      ];
}
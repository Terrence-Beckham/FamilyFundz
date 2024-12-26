import 'package:objectbox/objectbox.dart';
import 'package:equatable/equatable.dart';
import 'transaction.dart';

@Entity()
class ExpenseCategory extends Equatable {
  @Id()
  int id;
  
  final String name;
  final String? description;
  final String? icon;
  
  @Property(type: PropertyType.date)
  final DateTime createdAt;
  
  @Property(type: PropertyType.date)
  final DateTime updatedAt;

  @Backlink()
  final transactions = ToMany<Transaction>();

  ExpenseCategory.empty()
      : id = 0,
        name = '',
        description = null,
        icon = null,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  ExpenseCategory({
    this.id = 0,
    required this.name,
    this.description,
    this.icon,
    required this.createdAt,
    required this.updatedAt,
  });

  ExpenseCategory copyWith({
    int? id,
    String? name,
    String? description,
    String? icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExpenseCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    icon,
    createdAt,
    updatedAt,
  ];
}

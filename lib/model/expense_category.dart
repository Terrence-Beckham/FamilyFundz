import 'package:objectbox/objectbox.dart';
import 'transaction.dart';

@Entity()
class ExpenseCategory {
  @Id()
  int id;

  String name;
  String? description;
  String? icon;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  @Backlink()
  final transactions = ToMany<Transaction>();

  ExpenseCategory({
    this.id = 0,
    required this.name,
    this.description,
    this.icon,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();
}

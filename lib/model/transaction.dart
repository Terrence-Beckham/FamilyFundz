import 'package:objectbox/objectbox.dart';
import 'expense_category.dart';
import 'family_member.dart';

@Entity()
class Transaction {
  @Id()
  int id;

  String description;
  double amount;
  
  @Property(type: PropertyType.date)
  DateTime date;

  @Property(type: PropertyType.date)
  DateTime createdAt;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  final category = ToOne<ExpenseCategory>();
  final familyMember = ToOne<FamilyMember>();

  Transaction({
    this.id = 0,
    required this.description,
    required this.amount,
    required this.date,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();
}

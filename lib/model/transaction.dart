import 'package:objectbox/objectbox.dart';
import 'package:equatable/equatable.dart';
import 'expense_category.dart';
import 'family_member.dart';

@Entity()
class Transaction extends Equatable {
  @Id()
  int id;

  final String description;
  final double amount;

  @Property(type: PropertyType.date)
  final DateTime date;

  @Property(type: PropertyType.date)
  final DateTime createdAt;

  @Property(type: PropertyType.date)
  final DateTime updatedAt;

  final category = ToOne<ExpenseCategory>();
  final familyMember = ToOne<FamilyMember>();

  Transaction.empty()
      : id = 0,
        description = '',
        amount = 0.0,
        date = DateTime.now(),
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();

  Transaction({
    this.id = 0,
    required this.description,
    required this.amount,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  Transaction copyWith({
    int? id,
    String? description,
    double? amount,
    DateTime? date,
    DateTime? createdAt,
    DateTime? updatedAt,
    ExpenseCategory? category,
    FamilyMember? familyMember,
  }) {
    final transaction = Transaction(
      id: id ?? this.id,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );

    if (category != null) {
      transaction.category.target = category;
    } else {
      transaction.category.target = this.category.target;
    }

    if (familyMember != null) {
      transaction.familyMember.target = familyMember;
    } else {
      transaction.familyMember.target = this.familyMember.target;
    }

    return transaction;
  }

  @override
  List<Object?> get props => [
    id,
    description,
    amount,
    date,
    createdAt,
    updatedAt,
    category.target,
    familyMember.target,
  ];
}

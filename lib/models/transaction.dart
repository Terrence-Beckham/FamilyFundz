import 'package:family_fundz/models/expense_category.dart';
import 'package:family_fundz/models/family_member.dart';

enum TransactionType {
  income,
  expense,
}

class Transaction {
  final String note;
  final double amount;
  final DateTime date;
  final ExpenseCategory? expenseCategory;
  final FamilyMember? familyMember;
  final TransactionType transactionType;

  const Transaction({
    required this.note,
    required this.amount,
    required this.date,
    this.expenseCategory,
    this.familyMember,
    this.transactionType = TransactionType.expense,
  });
}

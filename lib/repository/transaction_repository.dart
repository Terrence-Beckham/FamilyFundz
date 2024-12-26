import 'package:family_fundz/model/transaction.dart';
import 'package:family_fundz/model/family_member.dart';
import 'package:family_fundz/model/expense_category.dart';
import 'package:family_fundz/objectbox.g.dart';

class TransactionRepository {
  final Store _store;
  late final Box<Transaction> _box;

  TransactionRepository(this._store) {
    _box = _store.box<Transaction>();
  }

  // Create
  int add(Transaction transaction) {
    return _box.put(transaction);
  }

  // Read
  Transaction? get(int id) {
    return _box.get(id);
  }

  List<Transaction> getAll() {
    return _box.getAll();
  }

  // Update
  bool update(Transaction transaction) {
    return _box.put(transaction) > 0;
  }

  // Delete
  bool delete(int id) {
    return _box.remove(id);
  }

  // Additional queries
  Stream<List<Transaction>> watchAll() {
    return _box.query().watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  List<Transaction> getByDateRange(DateTime start, DateTime end) {
    return _box
        .query(Transaction_.date.between(
          start.millisecondsSinceEpoch,
          end.millisecondsSinceEpoch,
        ))
        .build()
        .find();
  }

  List<Transaction> getByFamilyMember(FamilyMember member) {
    return _box
        .query(Transaction_.familyMember.equals(member.id))
        .build()
        .find();
  }

  List<Transaction> getByCategory(ExpenseCategory category) {
    return _box
        .query(Transaction_.category.equals(category.id))
        .build()
        .find();
  }

  double getTotalSpendingByFamilyMember(int familyMemberId) {
    final query = _box.query(Transaction_.familyMember.equals(familyMemberId))
        .build();
    final transactions = query.find();
    query.close();
    return transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);
  }

  Stream<List<Transaction>> watchByFamilyMember(int familyMemberId) {
    return _box
        .query(Transaction_.familyMember.equals(familyMemberId))
        .watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  void dispose() {
    _store.close();
  }
}

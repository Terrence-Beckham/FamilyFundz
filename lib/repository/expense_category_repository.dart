import 'package:family_fundz/model/expense_category.dart';
import 'package:family_fundz/objectbox.g.dart';

class ExpenseCategoryRepository {
  final Store _store;
  late final Box<ExpenseCategory> _box;

  ExpenseCategoryRepository(this._store) {
    _box = _store.box<ExpenseCategory>();
  }

  // Create
  int add(ExpenseCategory category) {
    return _box.put(category);
  }

  // Read
  ExpenseCategory? get(int id) {
    return _box.get(id);
  }

  List<ExpenseCategory> getAll() {
    return _box.getAll();
  }

  // Update
  bool update(ExpenseCategory category) {
    return _box.put(category) > 0;
  }

  // Delete
  bool delete(int id) {
    return _box.remove(id);
  }

  // Additional queries
  Stream<List<ExpenseCategory>> watchAll() {
    return _box.query().watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  List<ExpenseCategory> searchByName(String name) {
    return _box.query(ExpenseCategory_.name.contains(name, caseSensitive: false))
        .build()
        .find();
  }

  void dispose() {
    _store.close();
  }
}

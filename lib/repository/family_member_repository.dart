import 'package:family_fundz/model/family_member.dart';
import 'package:family_fundz/objectbox.g.dart';

class FamilyMemberRepository {
  final Store _store;
  late final Box<FamilyMember> _box;

  FamilyMemberRepository(this._store) {
    _box = _store.box<FamilyMember>();
  }

  // Create
  int add(FamilyMember member) {
    return _box.put(member);
  }

  // Read
  FamilyMember? get(int id) {
    return _box.get(id);
  }

  List<FamilyMember> getAll() {
    return _box.getAll();
  }

  // Update
  bool update(FamilyMember member) {
    return _box.put(member) > 0;
  }

  // Delete
  bool delete(int id) {
    return _box.remove(id);
  }

  // Additional queries
  Stream<List<FamilyMember>> watchAll() {
    return _box.query().watch(triggerImmediately: true)
        .map((query) => query.find());
  }

  List<FamilyMember> searchByName(String name) {
    return _box.query(FamilyMember_.name.contains(name, caseSensitive: false))
        .build()
        .find();
  }

  void dispose() {
    _store.close();
  }
}

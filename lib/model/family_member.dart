import 'package:objectbox/objectbox.dart';
import 'transaction.dart';

@Entity()
class FamilyMember {
  @Id()
  int id;

  String name;
  String? profilePic;
  double totalSpending;

  @Backlink()
  final transactions = ToMany<Transaction>();

  FamilyMember({
    this.id = 0,
    required this.name,
    this.profilePic,
    this.totalSpending = 0.0,
  });
}
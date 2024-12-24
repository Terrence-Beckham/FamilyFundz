import 'package:objectbox/objectbox.dart';

@Entity()
class Expense {
  @Id()
  int id;
  
  String description;
  double amount;
  DateTime date;

  Expense({
    this.id = 0,
    required this.description,
    required this.amount,
    required this.date,
  });
}

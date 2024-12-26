import 'package:objectbox/objectbox.dart';
import 'package:equatable/equatable.dart';
import 'transaction.dart';

@Entity()
class FamilyMember extends Equatable {
  @Id()
  int id;

  final String name;
  final String? profilePic;
  final double totalSpending;

  @Backlink()
  final transactions = ToMany<Transaction>();

  FamilyMember.empty()
      : id = 0,
        name = '',
        profilePic = null,
        totalSpending = 0.0;

  FamilyMember({
    this.id = 0,
    required this.name,
    this.profilePic,
    required this.totalSpending,
  });

  FamilyMember copyWith({
    int? id,
    String? name,
    String? profilePic,
    double? totalSpending,
  }) {
    return FamilyMember(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      totalSpending: totalSpending ?? this.totalSpending,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    profilePic,
    totalSpending,
  ];
}

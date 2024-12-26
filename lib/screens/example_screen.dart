import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_fundz/repository/family_member_repository.dart';
import 'package:family_fundz/repository/expense_category_repository.dart';
import 'package:family_fundz/repository/transaction_repository.dart';
import 'package:family_fundz/model/family_member.dart';
import 'package:family_fundz/model/expense_category.dart';
import 'package:family_fundz/model/transaction.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access repositories using context.read()
    final familyMemberRepo = context.read<FamilyMemberRepository>();
    final categoryRepo = context.read<ExpenseCategoryRepository>();
    final transactionRepo = context.read<TransactionRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Screen'),
      ),
      body: Column(
        children: [
          // Example of using repositories with StreamBuilder
          Expanded(
            child: StreamBuilder<List<FamilyMember>>(
              stream: familyMemberRepo.watchAll(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final members = snapshot.data!;
                  return ListView.builder(
                    itemCount: members.length,
                    itemBuilder: (context, index) {
                      final member = members[index];
                      return ListTile(
                        title: Text(member.name),
                        subtitle: Text('Total Spending: \$${member.totalSpending}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            familyMemberRepo.delete(member.id);
                          },
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          // Example of adding a new family member
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                final newMember = FamilyMember(
                  name: 'New Member',
                  totalSpending: 0.0,
                );
                familyMemberRepo.add(newMember);
              },
              child: const Text('Add Family Member'),
            ),
          ),
        ],
      ),
    );
  }
}

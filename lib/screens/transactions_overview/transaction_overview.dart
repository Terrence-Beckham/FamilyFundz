import 'package:family_fundz/screens/transactions_overview/credit_card_view.dart';
import 'package:family_fundz/services/mock_data.dart';
import 'package:family_fundz/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:family_fundz/models/transaction.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = MockData.generateInitialTransactions()
      ..sort((a, b) => b.date.compareTo(a.date)); // Sort by most recent first

    double totalBalance = 0;
    double totalIncome = 0;
    double totalExpense = 0;

    for (final transaction in transactions) {
      if (transaction.transactionType == TransactionType.income) {
        totalIncome += transaction.amount;
      } else {
        totalExpense += transaction.amount;
      }
    }
    totalBalance = totalIncome - totalExpense;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          CreditCardView(
            balance: totalBalance,
            incomeTotal: totalIncome,
            expenseTotal: totalExpense,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionCard(transaction: transaction);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

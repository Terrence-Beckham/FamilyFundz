import 'package:family_fundz/screens/transactions_overview/credit_card_view.dart';
import 'package:flutter/material.dart';

class TransactionOverview extends StatelessWidget {
  const TransactionOverview({super.key});

  @override
  Widget build(BuildContext context) {
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
          CreditCardView(balance: 4000, incomeTotal: 6000, expenseTotal: 2000),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final bool isExpense = index % 2 == 0;
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: isExpense
                          ? Colors.red.withOpacity(0.1)
                          : Colors.green.withOpacity(0.1),
                      child: Icon(
                        isExpense ? Icons.remove : Icons.add,
                        color: isExpense ? Colors.red : Colors.green,
                      ),
                    ),
                    title: Text(
                      isExpense
                          ? 'Expense ${index + 1}'
                          : 'Income ${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Category: ${isExpense ? "Shopping" : "Salary"}',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Text(
                      isExpense
                          ? '-\$${50 * (index + 1)}'
                          : '+\$${100 * (index + 1)}',
                      style: TextStyle(
                        color: isExpense ? Colors.red : Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
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

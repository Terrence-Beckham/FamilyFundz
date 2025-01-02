import 'package:family_fundz/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(20),
    //   ),
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Category Icon
          Icon(
            _getIconData(transaction.expenseCategory?.icon ?? 'question_mark'),
            size: 24,
            color: transaction.transactionType == TransactionType.income
                ? Colors.green
                : Colors.red,
          ),
          const SizedBox(width: 12),

          // Category Name and Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  transaction.expenseCategory?.name ?? 'Unknown',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat.yMMMd().format(transaction.date),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),

          // Amount and Profile Picture
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${transaction.transactionType == TransactionType.income ? '+' : '-'}\$${transaction.amount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: transaction.transactionType == TransactionType.income
                      ? Colors.green
                      : Colors.red,
                ),
              ),
              const SizedBox(height: 4),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[200],
                child: transaction.familyMember?.profilePic != null
                    ? SvgPicture.asset(
                        'assets/images/${transaction.familyMember!.profilePic}.svg',
                        width: 16,
                        height: 16,
                      )
                    : const Icon(Icons.person, size: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getIconData(String iconName) {
    // Map icon names to Flutter Icons
    switch (iconName) {
      // Expense category icons
      case 'house.fill':
        return Icons.home;
      case 'lightbulb.fill':
        return Icons.lightbulb;
      case 'cart.fill':
        return Icons.shopping_cart;
      case 'car.fill':
        return Icons.directions_car;
      case 'fork.knife':
        return Icons.restaurant;
      case 'film.fill':
        return Icons.movie;
      case 'heart.fill':
        return Icons.favorite;
      case 'shield.fill':
        return Icons.shield;
      case 'tshirt.fill':
        return Icons.checkroom;
      case 'graduationcap.fill':
        return Icons.school;
      case 'stroller.fill':
        return Icons.stroller;
      case 'scissors':
        return Icons.content_cut;
      case 'bookmark.fill':
        return Icons.bookmark;
      case 'creditcard.fill':
        return Icons.credit_card;
      case 'gift.fill':
        return Icons.card_giftcard;
      case 'airplane':
        return Icons.flight;
      case 'pawprint.fill':
        return Icons.pets;
      case 'desktopcomputer':
        return Icons.computer;
      case 'banknote.fill':
        return Icons.savings;
      case 'hammer.fill':
        return Icons.build;
      case 'bandage.fill':
        return Icons.medical_services;
      case 'hands.sparkles.fill':
        return Icons.volunteer_activism;
      case 'chart.bar.xaxis':
        return Icons.bar_chart;
      case 'doc.text.magnifyingglass':
        return Icons.description;
      case 'paintbrush.fill':
        return Icons.brush;
      case 'square.grid.2x2.fill':
        return Icons.grid_view;

      // Income category icons
      case 'work':
        return Icons.work;
      case 'computer':
        return Icons.computer;
      case 'home':
        return Icons.home;
      case 'trending_up':
        return Icons.trending_up;
      case 'school':
        return Icons.school;
      case 'replay':
        return Icons.replay;
      case 'currency_bitcoin':
        return Icons.currency_bitcoin;
      case 'show_chart':
        return Icons.show_chart;

      default:
        return Icons.question_mark;
    }
  }
}

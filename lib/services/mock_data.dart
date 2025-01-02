import 'dart:math';
import 'package:family_fundz/models/expense_category.dart';
import 'package:family_fundz/models/family_member.dart';
import 'package:family_fundz/models/transaction.dart';

class MockData {
  static final List<ExpenseCategory> expenseCategories = [
    ExpenseCategory(name: "Housing", icon: "house.fill"),
    ExpenseCategory(name: "Utilities", icon: "lightbulb.fill"),
    ExpenseCategory(name: "Groceries", icon: "cart.fill"),
    ExpenseCategory(name: "Transportation", icon: "car.fill"),
    ExpenseCategory(name: "Dining Out", icon: "fork.knife"),
    ExpenseCategory(name: "Entertainment", icon: "film.fill"),
    ExpenseCategory(name: "Health & Fitness", icon: "heart.fill"),
    ExpenseCategory(name: "Insurance", icon: "shield.fill"),
    ExpenseCategory(name: "Clothing", icon: "tshirt.fill"),
    ExpenseCategory(name: "Education", icon: "graduationcap.fill"),
    ExpenseCategory(name: "Childcare", icon: "stroller.fill"),
    ExpenseCategory(name: "Personal Care", icon: "scissors"),
    ExpenseCategory(name: "Subscriptions", icon: "bookmark.fill"),
    ExpenseCategory(name: "Debt Repayment", icon: "creditcard.fill"),
    ExpenseCategory(name: "Gifts", icon: "gift.fill"),
    ExpenseCategory(name: "Travel", icon: "airplane"),
    ExpenseCategory(name: "Pets", icon: "pawprint.fill"),
    ExpenseCategory(name: "Electronics", icon: "desktopcomputer"),
    ExpenseCategory(name: "Savings", icon: "banknote.fill"),
    ExpenseCategory(name: "Home Maintenance", icon: "hammer.fill"),
    ExpenseCategory(name: "Medical Expenses", icon: "bandage.fill"),
    ExpenseCategory(name: "Charity", icon: "hands.sparkles.fill"),
    ExpenseCategory(name: "Investments", icon: "chart.bar.xaxis"),
    ExpenseCategory(name: "Taxes", icon: "doc.text.magnifyingglass"),
    ExpenseCategory(name: "Hobbies", icon: "paintbrush.fill"),
    ExpenseCategory(name: "Miscellaneous", icon: "square.grid.2x2.fill"),
  ];

  static final List<ExpenseCategory> incomeCategories = [
    ExpenseCategory(name: "Business Income", icon: "work"),
    ExpenseCategory(name: "Freelance Work", icon: "computer"),
    ExpenseCategory(name: "Rental Income", icon: "home"),
    ExpenseCategory(name: "Investments", icon: "trending_up"),
    ExpenseCategory(name: "Scholarships", icon: "school"),
    ExpenseCategory(name: "Refunds", icon: "replay"),
    ExpenseCategory(name: "Crypto Income", icon: "currency_bitcoin"),
    ExpenseCategory(
      name: "Stock Market Gains",
      icon: "show_chart",
    ),
  ];

  static final List<FamilyMember> familyMembers = [
    FamilyMember(
      name: "Terrence",
      profilePic: "hacker",
      totalSpending: 500.0,
    ),
    FamilyMember(
      name: "Khadijah",
      profilePic: "woman",
      totalSpending: 400.0,
    ),
    FamilyMember(
      name: "Yahyaa",
      profilePic: "man",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Musa",
      profilePic: "gamer",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Husayn",
      profilePic: "panda",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Fatimah",
      profilePic: "woman",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Layla",
      profilePic: "woman-2",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Zaynab",
      profilePic: "woman-3",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Teri",
      profilePic: "hacker",
      totalSpending: 0.0,
    ),
    FamilyMember(
      name: "Jeff",
      profilePic: "man",
      totalSpending: 0.0,
    ),
  ];

  static List<Transaction> generateRandomTransactions(int count) {
    final random = Random();
    final transactions = <Transaction>[];
    final now = DateTime.now();

    for (var i = 0; i < count; i++) {
      final randomFamilyMember = familyMembers[random.nextInt(familyMembers.length)];
      final transactionType = TransactionType.values[random.nextInt(TransactionType.values.length)];
      final categories = transactionType == TransactionType.expense ? expenseCategories : incomeCategories;
      final randomCategory = categories[random.nextInt(categories.length)];
      final randomAmount = 10.0 + random.nextDouble() * 490.0; // Random amount between 10 and 500
      final randomDays = random.nextInt(365);
      final randomDate = now.subtract(Duration(days: randomDays));

      transactions.add(
        Transaction(
          note: "${randomCategory.name} ${transactionType.name}",
          amount: randomAmount,
          date: randomDate,
          expenseCategory: randomCategory,
          familyMember: randomFamilyMember,
          transactionType: transactionType,
        ),
      );
    }

    return transactions;
  }

  // Generate initial data
  static List<Transaction> generateInitialTransactions() {
    final allTransactions = <Transaction>[];
    for (var _ in familyMembers) {
      allTransactions.addAll(generateRandomTransactions(20));
    }
    return allTransactions;
  }
}

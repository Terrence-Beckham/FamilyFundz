import 'package:family_fundz/repository/expense_category_repository.dart';
import 'package:family_fundz/repository/family_member_repository.dart';
import 'package:family_fundz/repository/transaction_repository.dart';
import 'package:family_fundz/screens/analysis_screen.dart';
import 'package:family_fundz/screens/budget_screen.dart';
import 'package:family_fundz/screens/family_view.dart';
import 'package:family_fundz/screens/settings_screen.dart';
import 'package:family_fundz/screens/transactions_overview/transaction_overview.dart';
import 'package:family_fundz/services/objectbox_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late ObjectBoxService objectbox;

void main() async {
  // This is required so ObjectBox can get the application directory
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize ObjectBox
  objectbox = await ObjectBoxService.create();

  // Initialize repositories
  final familyMemberRepo = FamilyMemberRepository(objectbox.store);
  final expenseCategoryRepo = ExpenseCategoryRepository(objectbox.store);
  final transactionRepo = TransactionRepository(objectbox.store);

  // Run app
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FamilyMemberRepository>(
          create: (context) => familyMemberRepo,
        ),
        RepositoryProvider<ExpenseCategoryRepository>(
          create: (context) => expenseCategoryRepo,
        ),
        RepositoryProvider<TransactionRepository>(
          create: (context) => transactionRepo,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Fundz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const MyHomePage(title: 'Family Fundz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _counter,
            onTap: (index) => setState(() => _counter = index),
            selectedItemColor: Colors.blue[700],
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'Family',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Analysis',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Budgets',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
          body: IndexedStack(
            index: _counter,
            children: const [
              TransactionOverview(),
              FamilyView(),
              AnalysisScreen(),
              BudgetScreen(),
              SettingsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

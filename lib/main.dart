import 'package:family_fundz/repository/expense_category_repository.dart';
import 'package:family_fundz/repository/family_member_repository.dart';
import 'package:family_fundz/repository/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:family_fundz/services/objectbox_service.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

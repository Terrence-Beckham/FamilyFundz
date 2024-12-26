import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_fundz/services/objectbox_service.dart';
import 'package:family_fundz/repository/family_member_repository.dart';
import 'package:family_fundz/repository/expense_category_repository.dart';
import 'package:family_fundz/repository/transaction_repository.dart';

class AppRepositoryProvider {
  static Widget getProviders({
    required Widget child,
    required ObjectBoxService objectBoxService,
  }) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<FamilyMemberRepository>(
          create: (context) => FamilyMemberRepository(objectBoxService.store),
          dispose: (context, repository) => repository.dispose(),
        ),
        RepositoryProvider<ExpenseCategoryRepository>(
          create: (context) => ExpenseCategoryRepository(objectBoxService.store),
          dispose: (context, repository) => repository.dispose(),
        ),
        RepositoryProvider<TransactionRepository>(
          create: (context) => TransactionRepository(objectBoxService.store),
          dispose: (context, repository) => repository.dispose(),
        ),
      ],
      child: child,
    );
  }
}

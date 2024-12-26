import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'objectbox.g.dart';

/// Provides access to the ObjectBox Store throughout the app.
late Store store;

/// Initialize ObjectBox for use throughout the app.
Future<void> initObjectBox() async {
  final docsDir = await getApplicationDocumentsDirectory();
  final store = await openStore(directory: p.join(docsDir.path, "family-fundz-db"));
  // Add any store configurations here if needed
}

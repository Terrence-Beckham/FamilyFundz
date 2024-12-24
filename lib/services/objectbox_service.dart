import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../objectbox.g.dart';

class ObjectBoxService {
  /// The Store of this app.
  late final Store store;

  ObjectBoxService._create(this.store) {
    // Add any additional setup code here.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBoxService> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: path.join(docsDir.path, "family-fundz-db"));
    return ObjectBoxService._create(store);
  }
}

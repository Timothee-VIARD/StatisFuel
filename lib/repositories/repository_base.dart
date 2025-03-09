import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class RepositoryBase {
late Isar isar;

  Future<Isar> getIsar(List<CollectionSchema> collections) async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      collections,
      directory: dir.path,
    );
  }
}

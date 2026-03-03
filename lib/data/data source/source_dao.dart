
import '../model/source_response/Source_response.dart';

abstract interface class SourceDao {
  Future<SourceResponse?> fetchSource(String categoryId);
}
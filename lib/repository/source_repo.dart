import 'package:news_c17/data/model/source_response/Source_response.dart';

abstract interface class SourceRepo {
  Future<SourceResponse?> fetchSource(String categoryId);
}
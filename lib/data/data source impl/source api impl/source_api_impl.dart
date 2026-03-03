import 'package:injectable/injectable.dart';
import 'package:news_c17/core/remote/api/api_manager.dart';
import 'package:news_c17/data/data%20source/source_dao.dart';

import '../../model/source_response/Source_response.dart';
@Injectable(as:SourceDao )
class SourceApiImpl implements SourceDao{
  ApiManager apiManager;
  SourceApiImpl(this.apiManager);
  @override
  Future<SourceResponse?> fetchSource(String categoryId) {
    // TODO: implement fetchSource
    return apiManager.getSources(categoryId);
  }

}
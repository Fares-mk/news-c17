import 'package:injectable/injectable.dart';
import 'package:news_c17/data/data%20source/source_dao.dart';
import 'package:news_c17/data/model/source_response/Source_response.dart';
import 'package:news_c17/repository/source_repo.dart';
@Injectable(as:SourceRepo )
class SourceRepoImpl implements SourceRepo{
  SourceDao sourceDao;
  SourceRepoImpl(this.sourceDao);
  @override
  Future<SourceResponse?> fetchSource(String categoryId) {
    // TODO: implement fetchSource
    return sourceDao.fetchSource(categoryId);
  }

}
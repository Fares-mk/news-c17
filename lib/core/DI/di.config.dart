// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data%20source%20impl/source%20api%20impl/articles_api_impl.dart'
    as _i595;
import '../../data/data%20source%20impl/source%20api%20impl/source_api_impl.dart'
    as _i233;
import '../../data/data%20source/articles_dao.dart' as _i742;
import '../../data/data%20source/source_dao.dart' as _i95;
import '../../data/repository%20impl/articles_repo_impl.dart' as _i548;
import '../../data/repository%20impl/source_repo_impl.dart' as _i710;
import '../../repository/articles_repo.dart' as _i707;
import '../../repository/source_repo.dart' as _i416;
import '../../ui/articles/screen/source_screen_viewmodel.dart' as _i854;
import '../../ui/articles/widget/article_screen_viewmodel.dart' as _i384;
import '../remote/api/api_manager.dart' as _i384;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i384.ApiManager>(() => _i384.ApiManager());
    gh.factory<_i742.ArticlesDao>(
      () => _i595.ArticlesApiImpl(gh<_i384.ApiManager>()),
    );
    gh.factory<_i95.SourceDao>(
      () => _i233.SourceApiImpl(gh<_i384.ApiManager>()),
    );
    gh.factory<_i416.SourceRepo>(
      () => _i710.SourceRepoImpl(gh<_i95.SourceDao>()),
    );
    gh.factory<_i707.ArticlesRepo>(
      () => _i548.ArticlesRepoImpl(gh<_i742.ArticlesDao>()),
    );
    gh.factory<_i854.SourceScreenViewmodel>(
      () => _i854.SourceScreenViewmodel(gh<_i416.SourceRepo>()),
    );
    gh.factory<_i384.ArticleScreenViewmodel>(
      () => _i384.ArticleScreenViewmodel(gh<_i707.ArticlesRepo>()),
    );
    return this;
  }
}

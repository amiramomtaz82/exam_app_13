// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/register_module.dart' as _i259;
import '../feature/auth/login&&regestier/data/data_sources/auth_remote_data_source.dart'
    as _i902;
import '../feature/auth/login&&regestier/data/data_sources/auth_remote_data_source_impl.dart'
    as _i172;
import '../feature/auth/login&&regestier/data/data_sources/auth_retrofit_client.dart'
    as _i306;
import '../feature/auth/login&&regestier/data/repository_impl/auth_repository_impl.dart'
    as _i328;
import '../feature/auth/login&&regestier/domain/repository/auth_repository.dart'
    as _i459;
import '../feature/auth/login&&regestier/domain/usecases/signin_use_case.dart'
    as _i754;
import '../feature/auth/login&&regestier/domain/usecases/signup_use_case.dart'
    as _i136;
import '../feature/auth/login&&regestier/presentaion/view_model/auth_cubit.dart'
    as _i762;
import 'shared_preferences/shared_prefs.dart' as _i608;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i608.SharedPrefsUtils>(() => _i608.SharedPrefsUtils());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i306.AuthRetrofitClient>(
      () => _i306.AuthRetrofitClient(gh<_i361.Dio>()),
    );
    gh.factory<_i902.AuthRemoteDataSource>(
      () => _i172.AuthRemoteDataSourceImpl(gh<_i306.AuthRetrofitClient>()),
    );
    gh.factory<_i459.AuthRepository>(
      () => _i328.AuthRepositoryImpl(gh<_i902.AuthRemoteDataSource>()),
    );
    gh.factory<_i754.SigninUseCase>(
      () => _i754.SigninUseCase(gh<_i459.AuthRepository>()),
    );
    gh.factory<_i136.SignupUseCase>(
      () => _i136.SignupUseCase(gh<_i459.AuthRepository>()),
    );
    gh.factory<_i762.AuthCubit>(
      () =>
          _i762.AuthCubit(gh<_i754.SigninUseCase>(), gh<_i136.SignupUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i259.RegisterModule {}

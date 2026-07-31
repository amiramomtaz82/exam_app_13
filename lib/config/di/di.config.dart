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

import '../app_module/dio_module.dart' as _i301;
import '../shared_prefrences/shared_prefs.dart' as _i785;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i785.SharedPrefsUtils>(() => _i785.SharedPrefsUtils());
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i824.AuthApiClient>(
      () => _i824.AuthApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i46.AuthRemoteDataSource>(
      () => _i1017.AuthRemoteDataSourceImpl(gh<_i824.AuthApiClient>()),
    );
    gh.lazySingleton<_i170.AuthRepo>(
      () => _i39.AuthRepoImp(gh<_i46.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i16.ForgetPasswordUsecase>(
      () => _i16.ForgetPasswordUsecase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i98.ResetCodeUsecase>(
      () => _i98.ResetCodeUsecase(gh<_i170.AuthRepo>()),
    );
    gh.lazySingleton<_i6.ResetPasswordUsecase>(
      () => _i6.ResetPasswordUsecase(gh<_i170.AuthRepo>()),
    );
    gh.factory<_i40.ResetPasswordCubit>(
      () => _i40.ResetPasswordCubit(gh<_i6.ResetPasswordUsecase>()),
    );
    gh.factory<_i203.ForgetPasswordCubit>(
      () => _i203.ForgetPasswordCubit(gh<_i16.ForgetPasswordUsecase>()),
    );
    gh.factory<_i903.ResetCodeCubit>(
      () => _i903.ResetCodeCubit(gh<_i98.ResetCodeUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i301.DioModule {}

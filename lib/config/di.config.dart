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

import '../features/auth/api/api_Auth.dart' as _i164;
import '../features/auth/api/api_client/auth_api_client.dart' as _i19;
import '../features/auth/api/datasource/remote_data/auth_remote_data_source_imp.dart'
    as _i1073;
import '../features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i235;
import '../features/auth/data/data_sources/auth_remote_data_source_impl.dart'
    as _i877;
import '../features/auth/data/datasource/remote_data/auth_remote_data_source.dart'
    as _i225;
import '../features/auth/data/repo/auth_repo_imp.dart' as _i527;
import '../features/auth/data/repository_impl/auth_repository_impl.dart'
    as _i92;
import '../features/auth/domain/repo/auth_repo.dart' as _i113;
import '../features/auth/domain/repository/auth_repository.dart' as _i267;
import '../features/auth/domain/usecase/forget_password_usecase.dart' as _i344;
import '../features/auth/domain/usecase/reset_code_usecase.dart' as _i291;
import '../features/auth/domain/usecase/reset_pssword_usecase.dart' as _i570;
import '../features/auth/domain/usecases/signin_use_case.dart' as _i93;
import '../features/auth/domain/usecases/signup_use_case.dart' as _i450;
import '../features/auth/presentaion/forgetpassword/forget_password/view_model/forget_password_cubit.dart'
    as _i77;
import '../features/auth/presentaion/forgetpassword/Reset_password/view_model/reset_password_cubit.dart'
    as _i25;
import '../features/auth/presentaion/forgetpassword/verify_code/view_model/reset_code_cubit.dart'
    as _i922;
import '../features/auth/presentaion/sign_Up_in/view_model/auth_cubit.dart'
    as _i72;
import 'app_module/dio_module.dart' as _i459;
import 'shared_preferences/shared_prefs.dart' as _i608;
import 'shared_prefrences/shared_prefs.dart' as _i167;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i608.SharedPrefsUtils>(() => _i608.SharedPrefsUtils());
    gh.factory<_i167.SharedPrefsUtils>(() => _i167.SharedPrefsUtils());
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i164.ApiAuth>(() => _i164.ApiAuth(gh<_i361.Dio>()));
    gh.singleton<_i19.AuthApiClient>(() => _i19.AuthApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i225.AuthRemoteDataSource>(
      () => _i1073.AuthRemoteDataSourceImpl(gh<_i19.AuthApiClient>()),
    );
    gh.factory<_i235.AuthRemoteDataSource>(
      () => _i877.AuthRemoteDataSourceImpl(gh<_i164.ApiAuth>()),
    );
    gh.factory<_i267.AuthRepository>(
      () => _i92.AuthRepositoryImpl(gh<_i235.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i113.AuthRepo>(
      () => _i527.AuthRepoImp(gh<_i225.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i344.ForgetPasswordUsecase>(
      () => _i344.ForgetPasswordUsecase(gh<_i113.AuthRepo>()),
    );
    gh.lazySingleton<_i291.ResetCodeUsecase>(
      () => _i291.ResetCodeUsecase(gh<_i113.AuthRepo>()),
    );
    gh.lazySingleton<_i570.ResetPasswordUsecase>(
      () => _i570.ResetPasswordUsecase(gh<_i113.AuthRepo>()),
    );
    gh.factory<_i25.ResetPasswordCubit>(
      () => _i25.ResetPasswordCubit(gh<_i570.ResetPasswordUsecase>()),
    );
    gh.factory<_i93.SigninUseCase>(
      () => _i93.SigninUseCase(gh<_i267.AuthRepository>()),
    );
    gh.factory<_i450.SignupUseCase>(
      () => _i450.SignupUseCase(gh<_i267.AuthRepository>()),
    );
    gh.factory<_i77.ForgetPasswordCubit>(
      () => _i77.ForgetPasswordCubit(gh<_i344.ForgetPasswordUsecase>()),
    );
    gh.factory<_i72.AuthCubit>(
      () => _i72.AuthCubit(gh<_i93.SigninUseCase>(), gh<_i450.SignupUseCase>()),
    );
    gh.factory<_i922.ResetCodeCubit>(
      () => _i922.ResetCodeCubit(gh<_i291.ResetCodeUsecase>()),
    );
    return this;
  }
}

class _$DioModule extends _i459.DioModule {}

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:testproj/src/unbored/data/datasource/bore_remote_datasource.dart';
import 'package:testproj/src/unbored/data/repos/bored_repo_impl.dart';
import 'package:testproj/src/unbored/domain/repos/bored_repo.dart';
import 'package:testproj/src/unbored/domain/usecases/get_interesting_message_usecase.dart';
import 'package:testproj/src/unbored/presentation/bloc/bored_api_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  await _initBoarding();
}


Future<void> _initBoarding() async {
  final client = http.Client();
  sl
    ..registerFactory(
          () =>
              BoredApiBloc(getInterestingMessageUseCase: sl()),
    )
    ..registerLazySingleton(() => GetInterestingMessageUseCase(sl()))

    ..registerLazySingleton<BoredRepo>(() => BoredRepoImpl( remoteDataSource: sl()))
    ..registerLazySingleton<BoredLocalDataSource>(
            () => BoredRemoteDataSourceImpl(client: sl()),)
    ..registerLazySingleton(() => client);
}
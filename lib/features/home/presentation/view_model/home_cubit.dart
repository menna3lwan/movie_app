import 'package:movie_app/core/common/base/base_cubit.dart';
import 'package:movie_app/features/home/data/models/movies_response_dto.dart';
import 'package:movie_app/features/home/domain/use_case/get_now_playing_use_case.dart';
import 'package:movie_app/features/home/domain/use_case/get_popular_use_case.dart';
import 'package:movie_app/features/home/domain/use_case/get_top_rated_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/home/presentation/view_model/home_states.dart';

@injectable
class HomeCubit extends BaseCubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  Future<void> getNowPlayingMovies() async {
    emit(NowPlayingLoadingState());
    final result = await GetNowPlayingUseCase.call();
    handleResult<MoviesResponseDto>(
      result,
      onSuccess: (data) => NowPlayingSuccessState(data.toEntities()),
      onError: (message) => NowPlayingErrorState(message),
    );
  }

  Future<void> getPopularMovies() async {
    emit(PopularLoadingState());
    final result = await GetPopularUseCase.call();
    handleResult<MoviesResponseDto>(
      result,
      onSuccess: (data) => PopularSuccessState(data.toEntities()),
      onError: (message) => PopularErrorState(message),
    );
  }

  Future<void> getTopRatedMovies() async {
    emit(TopRatedLoadingState());
    final result = await GetTopRatedUseCase.call();
    handleResult<MoviesResponseDto>(
      result,
      onSuccess: (data) => TopRatedSuccessState(data.toEntities()),
      onError: (message) => TopRatedErrorState(message),
    );
  }
}

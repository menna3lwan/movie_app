import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_result.dart';

abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(super.initialState);

  void handleResult<T>(
    ApiResult<T> result, {
    required State Function(T data) onSuccess,
    required State Function(String message) onError,
  }) {
    if (isClosed) return;
    switch (result) {
      case ApiSuccess<T>():
        emit(onSuccess(result.data));
      case ApiFailure<T>():
        emit(onError(result.message));
    }
  }
}

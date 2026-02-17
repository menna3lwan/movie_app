
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_state.dart';

abstract class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(const InitialState());

  void emitLoading() => emit(const LoadingState());

  void emitSuccess(T data) => emit(SuccessState(data));

  void emitError(String message) => emit(ErrorState(message));
}

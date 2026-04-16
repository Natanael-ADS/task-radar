import 'package:bloc/bloc.dart';

final class HomeCounterCubit extends Cubit<int> {
  HomeCounterCubit() : super(0);

  void increment() {
    emit(state + 1);
  }
}

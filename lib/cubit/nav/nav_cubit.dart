import 'package:bloc/bloc.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(0);

  void changeNavItem(int index) {
    emit(index);
  }

  void popToFirstScreen() {
    emit(0);
  }
}

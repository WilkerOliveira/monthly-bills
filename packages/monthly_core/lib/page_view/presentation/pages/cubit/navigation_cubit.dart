import 'package:monthly_core/page_view/presentation/pages/cubit/navigation_state.dart';
import 'package:monthly_dependencies/monthly_dependencies.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(0));

  void updateIndex(int index) {
    if (index != state.currentIndex) {
      emit(NavigationState(index));
    }
  }
}

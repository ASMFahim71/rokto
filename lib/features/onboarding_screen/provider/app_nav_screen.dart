import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_nav_screen.g.dart';

@riverpod
class AppNavScreen extends _$AppNavScreen {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}

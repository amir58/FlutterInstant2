import 'package:instant2/inheritance/base_screen.dart';
import 'package:instant2/inheritance/slider_mixin.dart';

main() {
  // final test = TestScreen();
  // test.showLoadingAnimation();

  final fav = FavScreen();
  fav.onSlideChange();
}

class FavScreen extends BaseScreen with SliderMixin{

  @override
  void getData() {
    // TODO: implement getData
  }

}

abstract class TestScreen extends BaseScreen {

  @override
  void showLoadingAnimation() {
    // super.showLoadingAnimation();
    print('show heart animation');
  }
}


abstract class SettingsScreen extends BaseScreen{




}

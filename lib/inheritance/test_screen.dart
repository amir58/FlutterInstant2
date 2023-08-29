import 'package:instant2/inheritance/base_screen.dart';
main() {
  final test = TestScreen();
  test.showLoadingAnimation();
}
class TestScreen extends BaseScreen{

  @override
  void showLoadingAnimation() {
    // super.showLoadingAnimation();
    print('show heart animation');
  }


}
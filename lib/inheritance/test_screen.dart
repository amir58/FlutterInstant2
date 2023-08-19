import 'package:instant2/inheritance/base_screen.dart';

class TestScreen extends BaseScreen{

  void test(){
    super.checkInternet();

    super.showLoadingAnimation();
  }

}
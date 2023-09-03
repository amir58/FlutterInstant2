import 'package:instant2/inheritance/base_screen.dart';
import 'package:instant2/main.dart';
import 'package:instant2/oop/interface.dart';

// Child class
// Sub class
class HomeScreen extends BaseScreen implements SliderInterface {
  void execute() {
    super.checkInternet();
    // false
    // super._showNoNetworkErrorMessage();
    // true
    super.showLoadingAnimation();

    getData();

    super.hideLoadingAnimation();

    _updateUi();
  }

  void _updateUi() {}

  @override
  void getData() {
    // TODO: implement getData
  }

  @override
  void onSlideChange() {
    // TODO: implement onSlideChange
  }
}

import 'package:instant2/inheritance/base_screen.dart';
// Child class
// Sub class
class HomeScreen extends BaseScreen {

  void execute(){
    super.checkInternet();
    // false
    // super._showNoNetworkErrorMessage();
    // true
    super.showLoadingAnimation();

    _getData();

    super.hideLoadingAnimation();

    _updateUi();
  }

  void _getData(){

  }

  void _updateUi(){

  }

}

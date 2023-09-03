// Parent class
// Super class
abstract class BaseScreen {

  void getData();

  void checkInternet() {
    _callGoogle();
    print('checkInternet');
  }

  void _callGoogle(){}

  void _showNoNetworkErrorMessage() {
    print('_showNoNetworkErrorMessage');
  }

  void showLoadingAnimation() {
    print('showCircleLoadingAnimation');
  }

  void hideLoadingAnimation() {
    print('hideLoadingAnimation');
  }
}

// Parent class
// Super class
class BaseScreen {
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

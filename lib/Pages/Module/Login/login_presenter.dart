import 'dart:async';
import 'package:project_f/Pages/instagram.dart' as insta;
import 'package:project_f/Pages/constants.dart';

abstract class LoginViewContract {
  void onLoginScuccess(insta.Token token);
  void onLoginError(String message);
}

class LoginPresenter {
  LoginViewContract _view;
  LoginPresenter(this._view);

  void perform_login() {
    assert(_view != null);
    insta.getToken(constants.APP_ID,
        constants.APP_SECRET).then((token)
    {
      if (token != null) {
        _view.onLoginScuccess(token);
      }
      else {
        _view.onLoginError('Error');
      }
    });
  }
}
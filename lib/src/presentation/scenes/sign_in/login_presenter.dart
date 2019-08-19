import 'package:kdayoff/src/domain/validation/email_validation.dart';
import 'package:kdayoff/src/domain/validation/password_validation.dart';
import 'package:kdayoff/src/domain/validation/validation.dart';
import 'package:rxdart/rxdart.dart';

import 'login_state.dart';

class LoginViewModel {
  BehaviorSubject<LoginState> _loginStateSubject;

  Observable<LoginState> get loginStateObservable => _loginStateSubject.stream;

  EmailValidation _emailValidation;
  PasswordValidation _passwordValidation;

  final _defaultTextInputState = ValidationResult(true, null);

  LoginViewModel() {
    this._loginStateSubject = BehaviorSubject<LoginState>.seeded(LoginState(
        LoginValidationsState(_defaultTextInputState, _defaultTextInputState),
        false,
        LoginResultState(false, null, false)));
    this._emailValidation = EmailValidation();
    this._passwordValidation = PasswordValidation();
  }

  void validate(String email, String password) {
    ValidationResult emailValid = this._emailValidation.validate(email);
    ValidationResult passwordValid =
        this._passwordValidation.validate(password);
    this._loginStateSubject.sink.add(LoginState(
        LoginValidationsState(
            email.isNotEmpty ? emailValid : _defaultTextInputState,
            password.isNotEmpty ? passwordValid : _defaultTextInputState),
        emailValid.isValid && passwordValid.isValid,
        LoginResultState(false, null, false)));
  }

  void login(String email, String password) {
    if (_emailValidation.validate(email).isValid &&
        _passwordValidation.validate(password).isValid) {
      //todo show loading
      // TODO LoginUseCase(email, password).login();
      bool successLogin = true;
      this._loginStateSubject.sink.add(LoginState(
          LoginValidationsState(_defaultTextInputState, _defaultTextInputState),
          true, LoginResultState(successLogin, null, false)));
    } else {
      // todo show error

    }
  }
}


class verifi_json{

  String _sts;
  String _message;
  bool _error;

  verifi_json(this._sts, this._message, this._error);

  bool get error => _error;

  set error(bool value) {
    _error = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  String get sts => _sts;

  set sts(String value) {
    _sts = value;
  }
}

class login_json{
  bool _error;
  String _message;

  login_json(this._error, this._message);

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  bool get error => _error;

  set error(bool value) {
    _error = value;
  }
}

class login_check{
  bool _error;
  bool _login;

  login_check(this._error, this._login);

  bool get login => _login;

  set login(bool value) {
    _login = value;
  }

  bool get error => _error;

  set error(bool value) {
    _error = value;
  }
}
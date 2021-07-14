class user_all {
  int id = 0;
  String mobile = "";
  String code = "";
  String send_date = "";

  user_all({data}) {
    id = data['id'];
    mobile = data['mobile'];
    code = data['code'];
    send_date = data['send_date'];
  }
}

class sms_json {
  int _id;

  String _username;

  String _password;

  String _url;

  String _bodyId;

  sms_json(this._id, this._username, this._password, this._url, this._bodyId);

  String get bodyId => _bodyId;

  set bodyId(String value) {
    _bodyId = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}

class setsms {
  String _message;

  setsms(this._message);

  String get message => _message;

  set message(String value) {
    _message = value;
  }
}

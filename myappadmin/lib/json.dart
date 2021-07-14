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

  String _from_send;

  String _url;

  sms_json(this._id, this._username, this._password, this._from_send, this._url);

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get from_send => _from_send;

  set from_send(String value) {
    _from_send = value;
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

class Shop {
  String _name;
  String _about;
  String _motto;

  String _coverUrl;
  String _logoUrl;

  String _administratorRef;

  Shop(this._name, this._about, this._motto, this._coverUrl, this._logoUrl,
      this._administratorRef);

  set administratorRef(String value) {
    _administratorRef = value;
  }

  set logoUrl(String value) {
    _logoUrl = value;
  }

  set coverUrl(String value) {
    _coverUrl = value;
  }

  set motto(String value) {
    _motto = value;
  }

  set about(String value) {
    _about = value;
  }

  set name(String value) {
    _name = value;
  }

  String get administratorRef => _administratorRef;

  String get logoUrl => _logoUrl;

  String get coverUrl => _coverUrl;

  String get motto => _motto;

  String get about => _about;

  String get name => _name;


}
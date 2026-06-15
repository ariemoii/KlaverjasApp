enum RoemValue {
  twenty,
  fifty;

  int get value => RoemConfig._resolve(this);
}

class RoemConfig {
  static late bool _metBieden;

  static void init(bool value) {
    _metBieden = value;
  }

  static int _resolve(RoemValue type) {
    switch (type) {
      case RoemValue.twenty:
        return _metBieden ? 2 : 20;
      case RoemValue.fifty:
        return _metBieden ? 5 : 50;
    }
  }
}

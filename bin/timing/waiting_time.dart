class BotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream kakoBotStream(int interval, [int? maxCount]) async* {
    int i = 1;

    while (i != maxCount) {
      await Future.delayed(Duration(seconds: interval));

      yield i++; // Entrega o valor gerado.
    }

    print('A Stream terminou.');
  }
}

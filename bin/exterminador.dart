void main() {
  Future exterminador = Future(() async {
    print('Venha comigo se quiser viver');

    // Interrompe a execução por 1 segundo.
    await Future.delayed(Duration(seconds: 1));
    print('.');

    // Interrompe a execução por 2 segundos.
    await Future.delayed(Duration(seconds: 2));
    print('.');

    // Interrompe a execução por 3 segundos.
    await Future.delayed(Duration(seconds: 3));
    print('.');

    // Interrompe a execução por 4 segundos.
    await Future.delayed(Duration(seconds: 4));
    print('.');

    // Interrompe a execução por 5 segundos.
    await Future.delayed(Duration(seconds: 5));
    print('.');

    return 'Hasta la vista, baby!';
  }).then((value) => print(value));
}

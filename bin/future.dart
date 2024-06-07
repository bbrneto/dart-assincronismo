/*
Future: objeto que só estará disponível no futuro.
Normalmente, o objeto do tipo Future precisa de um tempo para receber as informações,
então o próprio Dart coloca ele no final da fila de execução de tarefas,
a fim de esperar as informações chegarem e não atrasar objetos dependentes.
 */
void main() {
  print('Main - Início');

  // Objeto Future:
  // Future myFuture = Future(() {
  //   print('Future - Executa depois!');
  //
  //   return 21;
  // }).then((value) {
  //   // Quando o valor chegar, ...
  //   print('The value is: $value');
  // });

  // Escrita não recomendada:
  // myFutureFunction().then((value) {
  //   print('My future value is: $value');
  // }).onError((error, stackTrace) {
  //   // Exemplos: problemas de conexão, dados corrompidos...
  //   print('Error: $error');
  // }).whenComplete(() {
  //   // Executa independemente do que ocorreu antes.
  //   print('Função concluída!');
  // });

  // Escrita recomendada:
  otherFutureFunction(1, 2).then((value) {
    print('My future value is: $value');
  });

  print('Main - Término');
}

Future<int> myFutureFunction() async {
  print('myFutureFunction - Início');

  // Interrompe a execução pelo tempo indicado.
  await Future.delayed(Duration(seconds: 5));

  print('myFutureFunction - Término');

  return 12;
}

Future<int> otherFutureFunction(int a, int b) async {
  try {
    if (a > b) {
      throw Exception();
    }

    print('otherFutureFunction - Início');

    // Interrompe a execução pelo tempo indicado.
    await Future.delayed(Duration(seconds: 5));

    print('otherFutureFunction - Término');

    return 42;
  } catch (error) {
    print('Error: $error');

    return 42;
  } finally {
    print('Função concluída!');
  }
}

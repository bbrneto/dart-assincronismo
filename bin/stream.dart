// Stream é como uma lista de futures (objetos futuros)!
// Stream: objeto que recebe dados por um longo período de tempo.
// Os dados são entregues de forma espaçada, ou seja, em intervalos.
// Exemplo: frames entregues a cada 10 milissegundos por um canal no YouTube.
import 'dart:async';

void main() async {
  print('Main - Início');

  // Permite que vários telespectadores possam assistir ao mesmo stream.
  var kakoStream = myStream(1, 10).asBroadcastStream();

  // Objeto responsável por assistir/escutar (receber os dados) a stream.
  StreamSubscription mySubscriber = kakoStream.listen((event) {
    // 'event' é o valor gerado que foi entregue (dado recebido).
    if (event.isEven) {
      print('É número par!');
    }
  }, onError: (error) {
    print('Ocorreu um erro: $error');
  }, onDone: () {
    print('Stream finalizada.');
  });

  // Vários telespectadores para um mesmo stream.
  kakoStream
      .map((event) => 'Um segundo telespectador está assistindo: $event')
      .listen(print);

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.pause(); // Interrompe o fluxo de dados.
  print('Stream pausada.');

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.resume(); // Retoma o fluxo de dados.
  print('Stream retormada.');

  await Future.delayed(Duration(seconds: 3));
  mySubscriber.cancel(); // Cancela o recebimento dos dados.
  print('Stream cancelada.');

  print('Main - Término');
}

// O fluxo de dados permance aberto por tempo indeterminado.
Stream myStream(int interval, [int? maxCount]) async* {
  int i = 1;

  while (i != maxCount) {
    print('Counting: $i');

    await Future.delayed(Duration(seconds: interval));

    yield i++; // Entrega o valor gerado.
  }

  print('The Stream is finished');
}

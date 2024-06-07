void main() {
  sendMessage('João', 'Bom dia, grupo!').then((value) {
    if (value) {
      sendMessage('Mariana', 'Bom dia! Tudo bem?').then((value) {
        if (value) {
          sendMessage('João', 'Suave, e vc?').then((value) {
            if (value) {
              sendMessage('Mariana', 'Certinho.').then((value) {
                if (value) {
                  print('Mensagens enviadas!');
                }
              });
            }
          });
        }
      });
    }
  });
}

Future<bool> sendMessage(String usuario, String mensagem) async {
  try {
    await Future.delayed(Duration(seconds: 2));

    print('$usuario: $mensagem');

    return true;
  } catch (error) {
    print('Error: $error');

    return false;
  } finally {
    print('Função concluída!');
  }
}

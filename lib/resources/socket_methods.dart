import 'package:mp_tictactoe/resources/socket_client.dart';
import 'package:mp_tictactoe/screens/game_screen.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/material.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;

  //agregue esto de git
  //Socket get socketClient => _socketClient;

  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      print(room);
      Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
}

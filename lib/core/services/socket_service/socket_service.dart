import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '/core/_core.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  late IO.Socket _socket;
  final _storage = const FlutterSecureStorage();

  SocketService._internal() {
    initSocket();
  }

  Future<void> initSocket() async {
    final token = await _storage.read(key: 'token');
    _socket = IO.io(
      ApiClient.baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'Authorization': 'Bearer $token'})
          .build(),
    );

    _socket.connect();

    _socket.onConnect((_) {
      log('Connected to server ${_socket.id}');
    });

    _socket.onDisconnect((_) {
      log('Disconnected from server');
    });
  }

  IO.Socket get socket => _socket;
}

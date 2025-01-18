// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CartService extends CartService {
  _$CartService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CartService;

  @override
  Future<Response<dynamic>> getCart(int id) {
    final Uri $url = Uri.parse('/carts/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

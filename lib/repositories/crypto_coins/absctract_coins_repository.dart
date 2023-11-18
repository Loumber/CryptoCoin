import 'package:pop/repositories/crypto_coins/models/crypto_coin.dart';

abstract class AbstractCoinsRepository{
  Future<List<CryptoCoin>> getCoinsList();
}
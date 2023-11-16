import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pop/repositories/crypto_coins/models/crypto_coin.dart';


import '';
class CryptoCoinsRepository{
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,CAG,AID,DOV&tsyms=USD');
    debugPrint(response.toString());

    final data  =  response.data as Map<String,dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD']as Map<String, dynamic>;
      final price = usdData['PRICE'];
      final imageUrl = usdData['IMAGEURL'];
      return
           CryptoCoin(
             name: e.key,
             price: price,
             imageUrl: 'https://www.cryptocompare.com/$imageUrl'); }).toList();
    return cryptoCoinsList;
  }
}
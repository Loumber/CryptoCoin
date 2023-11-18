import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pop/crypto_coins_list_app.dart';
import 'package:get_it/get_it.dart';
import 'package:pop/repositories/crypto_coins/crypto_coins.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(()=>CryptoCoinsRepository(dio:Dio()));
  runApp(const CryptoCoinsListApp());
}







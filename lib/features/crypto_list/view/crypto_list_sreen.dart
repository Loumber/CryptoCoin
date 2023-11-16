
import 'package:flutter/material.dart';
import 'package:pop/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:pop/repositories/crypto_coins/models/crypto_coin.dart';
import '../widgets/widgets.dart';
class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState(){
    _loadCryptoCoins();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currencies'),
        centerTitle: true,
      ),
      body:
      (_cryptoCoinsList == null)
          ? Center(child: CircularProgressIndicator(color: Colors.white,),)
          :ListView.separated(
            separatorBuilder: (context,i)=>Divider(),
            itemCount: _cryptoCoinsList!.length,
            itemBuilder: (context,i){
              final coin = _cryptoCoinsList![i];
              return CryptoCoinTyle(coin: coin);
            }
          ),
    );
  }
  Future<void> _loadCryptoCoins() async{
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {});
  }
}



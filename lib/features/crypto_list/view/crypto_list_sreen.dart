import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pop/theme/theme.dart';
import '../../../repositories/crypto_coins/crypto_coins.dart';
import '../bloc/crypto_list_bloc.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());
  
  @override
  void initState(){
    _cryptoListBloc.add(LoadCryptoList());
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
          RefreshIndicator(
            onRefresh: ()async{
              _cryptoListBloc.add(LoadCryptoList());
            },
            child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc:_cryptoListBloc,
              builder: (context, state) {
                if(state is CryptoListLoaded){
                  return ListView.separated(
                      separatorBuilder: (context,i)=>Divider(),
                      itemCount: state.coinsList.length,
                      itemBuilder: (context,i){
                      final coin = state.coinsList[i];
                      return CryptoCoinTyle(coin: coin);
                    }
                  );
                }
                if(state is CryptoListLoadingFail){
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Something went wrong',
                          style: theme.textTheme.headlineMedium,),
                        Text('Please try again later',
                          style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),),
                        SizedBox(height: 30),
                        TextButton(
                            onPressed: (){
                              _cryptoListBloc.add(LoadCryptoList());
                            },
                            child: Text('Try again'))
                      ],
                    ),
                  );}

                return Center(child:  CircularProgressIndicator());
              },
            ),
          )

//      (_cryptoCoinsList == null)
//         ? Center(child: CircularProgressIndicator(color: Colors.white,),)
//        :
    );
  }

}



import 'package:flutter/material.dart';

class CryptoCoinsScreen extends StatefulWidget{
  const CryptoCoinsScreen({super.key});

  @override
  State<CryptoCoinsScreen> createState()=> _CryptoCoinsScreenState();
}

class _CryptoCoinsScreenState extends State<CryptoCoinsScreen>{
  String? coinName;
  @override
  void didChangeDependencies() {
    final arg = ModalRoute.of(context)?.settings.arguments;
    assert(arg != null && arg is String,'You must provide String args');
    coinName = arg as String;
    setState(() {});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '...'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
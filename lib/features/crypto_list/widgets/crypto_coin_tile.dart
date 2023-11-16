import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinTyle extends StatelessWidget{
  const CryptoCoinTyle ({
    Key? key,
    required this.coin,
  }):super(key: key);

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios_rounded,),
      leading: Image.network(coin.imageUrl),
      title: Text(
        coin.name,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text (
        '${coin.price.toStringAsFixed(2)}\$',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      onTap: (){Navigator.of(context).pushNamed('/coin',
        arguments: coin,);},
    );
  }
}
import 'package:bloc/bloc.dart';

import '../../../repositories/crypto_coins/crypto_coins.dart';
part 'crypto_list_event.dart';
part 'crypto_list_state.dart';


class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit)async{
      try{
      emit(CryptoListLoading());
      final coinsList = await coinsRepository.getCoinsList();
      emit(CryptoListLoaded(coinsList: coinsList));}
      catch(e){
        emit(CryptoListLoadingFail(exception: e));
      }
    });
  }

  final AbstractCoinsRepository coinsRepository;

}
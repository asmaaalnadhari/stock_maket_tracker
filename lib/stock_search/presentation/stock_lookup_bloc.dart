import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stock_lookup_event.dart';
part 'stock_lookup_state.dart';

class StockLookupBloc extends Bloc<StockLookupEvent, StockLookupState> {
  StockLookupBloc() : super(StockLookupInitial()) {
    on<StockLookupEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

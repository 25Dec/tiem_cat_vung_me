import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'purchase_order_event.dart';
part 'purchase_order_state.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  PurchaseOrderBloc() : super(PurchaseOrderInitial()) {
    on<PurchaseOrderEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

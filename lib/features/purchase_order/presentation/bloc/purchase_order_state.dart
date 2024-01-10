part of 'purchase_order_bloc.dart';

abstract class PurchaseOrderState extends Equatable {
  const PurchaseOrderState();  

  @override
  List<Object> get props => [];
}
class PurchaseOrderInitial extends PurchaseOrderState {}

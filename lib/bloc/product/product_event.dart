part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class ProductAddEvent extends ProductEvent{
  final ProductModel productModel;
  ProductAddEvent({required this.productModel});

  @override
  List<Object?> get props => [productModel];
}

class ProductCountUpdateEvent extends ProductEvent{
  final String qrCode;
  final int count;
  ProductCountUpdateEvent({required this.qrCode,required this.count});

  @override
  List<Object?> get props => [qrCode,count];
}
class ProductSellEvent extends ProductEvent{
  final String qrCode;
  ProductSellEvent({required this.qrCode,});

  @override
  List<Object?> get props => [qrCode];
}

class ProductUpdateEvent extends ProductEvent{
  final ProductModel newProduct;
  ProductUpdateEvent({required this.newProduct});

  @override
  List<Object?> get props => [newProduct];
}

class ProductGetEvent extends ProductEvent{
  final String qrCode;

  ProductGetEvent({required this.qrCode});
  @override
  List<Object?> get props => [qrCode];
}

class ProductQrCodeChange extends ProductEvent{
  final String qrCode;

  ProductQrCodeChange({required this.qrCode});
  @override
  List<Object?> get props => [qrCode];
}
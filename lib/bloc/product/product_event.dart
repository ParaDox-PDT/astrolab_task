part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {}

class ProductAddEvent extends ProductEvent{
  final ProductModel productModel;
  ProductAddEvent({required this.productModel});

  @override
  List<Object?> get props => [productModel];
}


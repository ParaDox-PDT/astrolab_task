part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductSuccessUpdate extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductErrorUpdate extends ProductState{
  @override
  List<Object?> get props => [];
}


class ProductSuccessGet extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductSuccessAdd extends ProductState{
  @override
  List<Object?> get props => [];
}

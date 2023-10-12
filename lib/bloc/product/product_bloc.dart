import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_defualt_project/data/local/db/local_database.dart';
import 'package:flutter_defualt_project/data/models/product/product_model.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductAddEvent>(_addProduct);
    on<ProductGetEvent>(_getProduct);
    on<ProductCountUpdateEvent>(_updateProductCount);
    on<ProductSellEvent>(_sellProduct);
    on<ProductQrCodeChange>(_changeQrCode);
  }

  late ProductModel productModel;
  String qrCode="";

  _changeQrCode(ProductQrCodeChange event, Emitter<ProductState> emit){
    qrCode = event.qrCode;
    emit(ProductSuccessUpdate());
    emit(ProductInitial());
  }

  _addProduct(ProductAddEvent event, Emitter<ProductState> emit) async {
    await LocalDatabase.insertProduct(event.productModel);
    emit(ProductSuccessAdd());
    emit(ProductInitial());
  }

  _sellProduct(ProductSellEvent event, Emitter<ProductState> emit) async {
    late ProductModel initialProduct;
    initialProduct = await LocalDatabase.getSingleProduct(event.qrCode);
    if (initialProduct.count >= 1) {
      await LocalDatabase.updateProductCount(
          qrCode: event.qrCode, count: initialProduct.count - 1);
      emit(ProductSuccessUpdate());
    } else {
      await LocalDatabase.updateProductCount(qrCode: event.qrCode, count: 0);
      emit(ProductErrorUpdate());
    }
    emit(ProductInitial());
  }

  _updateProductCount(
      ProductCountUpdateEvent event, Emitter<ProductState> emit) async {
    late ProductModel initialProduct;
    initialProduct = await LocalDatabase.getSingleProduct(event.qrCode);
    await LocalDatabase.updateProductCount(
        qrCode: event.qrCode, count: event.count);
    emit(ProductSuccessUpdate());
    emit(ProductInitial());
  }

  _getProduct(ProductGetEvent event, Emitter<ProductState> emit) async {
    productModel = await LocalDatabase.getSingleProduct(event.qrCode);
    emit(ProductSuccessGet());
    emit(ProductInitial());
  }
}

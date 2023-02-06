import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:vakinha_burguer_bloc/app/pages/home/home_state.dart';

import '../../dto/order_product_dto.dart';
import '../../repositories/products/products_repository.dart';

class HomeController extends Cubit<HomeState> {
  final ProductsRepository _productsRepository;
  HomeController(this._productsRepository) : super(const HomeState.initial());

  Future<void> loadProduct() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));

      final products = await _productsRepository.findAllProducts();
      emit(state.copyWith(
        status: HomeStateStatus.loaded,
        products: products,
      ));
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      emit(state.copyWith(status: HomeStateStatus.error, errorMessage: 'Erro ao buscar produtos'));
    }
  }

  void addOrUpdateBag({required OrderProductDto orderProduct}) {
    final shoppingBag = [...state.shoppingBag];
    final orderIndex = shoppingBag.indexWhere((p) => p.product == orderProduct.product);
    if (orderIndex > -1) {
      if (orderProduct.amount == 0) {
        shoppingBag.removeAt(orderIndex);
      } else {
        shoppingBag[orderIndex] = orderProduct;
      }
    } else {
      shoppingBag.add(orderProduct);
    }
    emit(state.copyWith(shoppingBag: shoppingBag));
  }
}

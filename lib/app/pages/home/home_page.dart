import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_bloc/app/pages/home/home_controller.dart';
import 'package:vakinha_burguer_bloc/app/pages/home/widgets/delivery_product_tile.dart';

import '../../core/ui/base_state/base_state.dart';
import '../../core/ui/widgets/shopping_bag_widget.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  void onReady() {
    controller.loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.errorMessage ?? 'Erro não informado');
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
          loading: () => false,
        ),
        builder: (context, state) {
          return Column(
            children: [
              Text(state.shoppingBag.length.toString()),
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    final orders = state.shoppingBag.where((order) => order.product == product);
                    return DeliveryProductTile(
                      product: product,
                      orderProduct: orders.isNotEmpty ? orders.first : null,
                    );
                  },
                ),
              ),
              Visibility(
                visible: state.shoppingBag.isNotEmpty,
                child: ShoppingBagWidget(bag: state.shoppingBag),
              ),
            ],
          );
        },
      ),
    );
  }
}

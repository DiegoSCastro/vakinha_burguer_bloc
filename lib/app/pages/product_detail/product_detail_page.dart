import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burguer_bloc/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/helpers/size_extension.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_text_styles.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_appbar.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/widgets/delivery_increment_button.dart';
import 'package:vakinha_burguer_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer_bloc/app/models/product_model.dart';
import 'package:vakinha_burguer_bloc/app/pages/product_detail/product_detail_controller.dart';

import '../../core/ui/base_state/base_state.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrderProductDto? order;

  const ProductDetailPage({
    super.key,
    required this.product,
    this.order,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  void _showConfirmDelete(int amount) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Deseja remover o produto?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancelar',
                    style: context.appTextStyles.textBold,
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop(
                      OrderProductDto(
                        product: widget.product,
                        amount: amount,
                      ),
                    );
                  },
                  child: Text(
                    'Remover',
                    style: context.appTextStyles.textBold.copyWith(color: Colors.red),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(0.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.product.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: context.appTextStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                  style: context.appTextStyles.textMedium,
                ),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return DeliveryIncrementButton(
                        amount: amount,
                        incrementTap: () {
                          controller.increment();
                        },
                        decrementTap: () {
                          controller.decrement();
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return ElevatedButton(
                        style: amount == 0
                            ? ElevatedButton.styleFrom(backgroundColor: Colors.red)
                            : null,
                        onPressed: () {
                          if (amount == 0) {
                            _showConfirmDelete(amount);
                          } else {
                            Navigator.of(context).pop(OrderProductDto(
                              product: widget.product,
                              amount: amount,
                            ));
                          }
                        },
                        child: Visibility(
                          visible: amount > 0,
                          replacement: Text(
                            'Remover Produto',
                            style: context.appTextStyles.textExtraBold,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Adicionar',
                                style: context.appTextStyles.textExtraBold.copyWith(fontSize: 13),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: AutoSizeText(
                                  (widget.product.price * amount).currencyPTBR,
                                  maxFontSize: 13,
                                  minFontSize: 5,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: context.appTextStyles.textExtraBold.copyWith(fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

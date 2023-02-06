import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burguer_bloc/app/core/extensions/formatter_extension.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_colors.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_text_styles.dart';
import 'package:vakinha_burguer_bloc/app/dto/order_product_dto.dart';
import 'package:vakinha_burguer_bloc/app/models/product_model.dart';
import 'package:vakinha_burguer_bloc/app/pages/home/home_controller.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrderProductDto? orderProduct;
  const DeliveryProductTile({
    super.key,
    required this.product,
    this.orderProduct,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final orderProductResult =
            await Navigator.of(context).pushNamed('/productDetail', arguments: {
          'product': product,
          'order': orderProduct,
        });
        if (orderProductResult != null) {
          controller.addOrUpdateBag(orderProduct: orderProductResult as OrderProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.name,
                      style: context.appTextStyles.textExtraBold.copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.description,
                      style: context.appTextStyles.textRegular.copyWith(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.appTextStyles.textMedium
                          .copyWith(fontSize: 12, color: context.appColors.secondary),
                    ),
                  ),
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}

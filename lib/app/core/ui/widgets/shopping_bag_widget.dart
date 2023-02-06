import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dto/order_product_dto.dart';
import '../../extensions/formatter_extension.dart';
import '../helpers/size_extension.dart';
import '../styles/app_text_styles.dart';

class ShoppingBagWidget extends StatelessWidget {
  final List<OrderProductDto> bag;
  const ShoppingBagWidget({super.key, required this.bag});

  Future<void> _goOrder(BuildContext context) async {
    final navigator = Navigator.of(context);

    final sp = await SharedPreferences.getInstance();
    if (!sp.containsKey('accessToken')) {
      final loginResult = await navigator.pushNamed('/auth/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    var totalBag = bag.fold<double>(0.0, (previousValue, element) {
      return previousValue += element.totalPrice;
    }).currencyPTBR;

    return Container(
      padding: EdgeInsets.all(16),
      width: context.screenWidth,
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          _goOrder(context);
        },
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.shopping_cart_outlined),
            ),
            Center(
              child: Text(
                'Ver Sacola',
                style: context.appTextStyles.textExtraBold.copyWith(fontSize: 14),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalBag,
                style: context.appTextStyles.textExtraBold.copyWith(fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}

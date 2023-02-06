import 'package:flutter/material.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_colors.dart';
import 'package:vakinha_burguer_bloc/app/core/ui/styles/app_text_styles.dart';

class DeliveryIncrementButton extends StatelessWidget {
  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;
  const DeliveryIncrementButton({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '-',
                style: context.appTextStyles.textMedium.copyWith(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.appTextStyles.textMedium.copyWith(
              fontSize: 17,
              color: context.appColors.secondary,
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '+',
                style: context.appTextStyles.textMedium.copyWith(
                  fontSize: 22,
                  color: context.appColors.secondary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MayaDeductedAmountText extends StatelessWidget {
  const MayaDeductedAmountText({
    required this.value,
    this.isBalanceHidden = false,
    this.color,
    super.key,
  });

  final double value;
  final bool isBalanceHidden;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    final balance = NumberFormat.currency(
      symbol: '₱',
      decimalDigits: 2,
    ).format(value);

    return Text('-$balance', style: TextStyle(color: color));
  }
}

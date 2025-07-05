import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MayaCurrencyText extends StatelessWidget {
  const MayaCurrencyText({
    required this.value,
    this.isBalanceHidden = false,
    super.key,
  });

  final double value;
  final bool isBalanceHidden;

  @override
  Widget build(final BuildContext context) {
    final balance = NumberFormat.currency(
      symbol: '₱',
      decimalDigits: 2,
    ).format(value);

    return Text(
      isBalanceHidden ? '₱ * * * *' : balance,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    );
  }
}

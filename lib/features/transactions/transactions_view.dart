import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Transactions'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Sample data
      itemBuilder: (final context, final index) {
        final transactionNo = index + 1000;

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: index.isEven ? Colors.green : Colors.red,
              child: Icon(
                index.isEven ? Icons.arrow_upward : Icons.arrow_downward,
                color: Colors.white,
              ),
            ),
            title: Text(
              index.isEven ? 'Money Sent' : 'Money Received',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Transaction #$transactionNo',
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  index.isEven
                      ? '-\$${(index + 1) * 10}.00'
                      : '+\$${(index + 1) * 15}.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                ),
                Text(
                  '${DateTime.now().subtract(Duration(days: index)).day}/${DateTime.now().subtract(Duration(days: index)).month}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

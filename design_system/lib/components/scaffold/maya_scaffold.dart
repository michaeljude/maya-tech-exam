import 'package:flutter/material.dart';

class MayaScaffold extends StatelessWidget {
  const MayaScaffold({
    required this.body,
    this.onLogout,
    this.isSigningOut = false,
    super.key,
  });

  final Widget body;
  final VoidCallback? onLogout;
  final bool isSigningOut;

  @override
  Widget build(final BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Image.asset('assets/images/maya.png', width: 150, height: 150),
      backgroundColor: Colors.white,
      actions: [
        if (onLogout != null)
          isSigningOut
              ? Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.only(right: 8),
                  child: const CircularProgressIndicator(color: Colors.black),
                )
              : IconButton(
                  onPressed: onLogout,
                  icon: const Icon(Icons.logout, color: Colors.black),
                ),
      ],
    ),
    body: body,
  );
}

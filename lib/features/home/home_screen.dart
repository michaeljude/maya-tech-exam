import 'package:auto_route/auto_route.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication/authentication_view_model.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(final BuildContext context) => MayaScaffold(
    onLogout: () async {
      await context.read<AuthenticationViewModel>().signOut();
    },
    isSigningOut: context.select<AuthenticationViewModel, bool>(
      (final vm) => vm.state.isSigningOut,
    ),
    body: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Welcome to Maya',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Your financial companion',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

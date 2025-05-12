import 'package:flutter/material.dart';
import 'package:magh/features/authentication/data/auth_repository.dart';
import 'package:magh/features/home/presentation/widgets/drawer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking App')),


      drawer: DrawerWidget()
    );
  }
}

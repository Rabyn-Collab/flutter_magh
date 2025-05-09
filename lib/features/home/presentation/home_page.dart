import 'package:flutter/material.dart';
import 'package:magh/features/authentication/data/auth_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking App')),


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),

            ListTile(
              onTap: (){
                AuthRepository.userSignOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
            ),

          ],
        ),
      ),
    );
  }
}

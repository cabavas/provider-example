import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/provider_page.dart';
import 'package:provider_example/provider/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        return UserModel(
            name: 'Caio Vasconcelos',
            imgAvatar:
                'https://upload.wikimedia.org/wikipedia/commons/c/ca/Bruce_Lee_1973.jpg',
            birthDate: '13/03/1989');
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {'/provider': (_) => const ProviderPage()},
        home: Builder(
          builder: (context) {
            return Scaffold(
                body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/Provider');
                    },
                    child: const Text('Provider')),
                ElevatedButton(
                    onPressed: () {}, child: const Text('Change Notifier')),
              ],
            ));
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/change_notifier/provider_controller.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 3));
      context.read<ProviderController>().alterarDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Selector<ProviderController, String>(
                  selector: (_, controller) => controller.imgAvatar,
                  builder: ((__, imgAvatar, _) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(imgAvatar),
                      radius: 60,
                    );
                  })),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.name,
                    builder: ((__, name, _) {
                      return Text(context.watch<ProviderController>().name);
                    }),
                  ),
                  Selector<ProviderController, String>(
                    selector: (_, controller) => controller.birthDate,
                    builder: ((__, birthDate, _) {
                      return Text(
                          ' (${context.watch<ProviderController>().birthDate})');
                    }),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ProviderController>().alterarDados();
                  },
                  child: const Text('Alterar Nome'))
            ],
          ),
        ),
      ),
    );
  }
}

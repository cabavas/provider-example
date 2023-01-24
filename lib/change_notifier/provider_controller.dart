import 'package:flutter/material.dart';

class ProviderController extends ChangeNotifier {
  String name = 'Nome';
  String imgAvatar =
      'https://www.einerd.com.br/wp-content/uploads/2014/05/bruce-lee-890x466.jpg';
  String birthDate = 'Data';

  void alterarDados() {
    name = 'Bruce Lee';
    imgAvatar =
        'https://www.einerd.com.br/wp-content/uploads/2014/05/bruce-lee-890x466.jpg';
    birthDate = '13/03/1989';
    notifyListeners();
  }
}

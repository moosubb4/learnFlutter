import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import './connected_products.dart';

class UserModel extends ConnectedProducts {
  void login(String email, String password) {
    authenticateUser = User(id: 'moosubb', email: email, password: password);
  }

}

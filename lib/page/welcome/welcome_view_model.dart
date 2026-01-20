import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inning/model/user.dart';

class WelcomeState {
  //
}

class WelcomeViewModel extends Notifier<User> {
  //
  @override
  User build() {
    return User(id: 'id'); //
  }
}

// final uuid = Uuid();

//   Future<void> registerUser() async {
//     if (formKey.currentState!.validate()) {
//       print('입력됨');
//       String id = uuid.v4();
//       String nickname = nameController.text;

//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString('user_id', id);
//     }
//   }

final welcomeProvider = NotifierProvider<WelcomeViewModel, User>(() {
  return WelcomeViewModel();
});

import 'package:hmelnaya_lavka_app/components/admin_panel.dart';
import 'package:hmelnaya_lavka_app/models/model.dart';
import 'package:hmelnaya_lavka_app/screens/basket_screen.dart';
import 'package:hmelnaya_lavka_app/screens/home_screen.dart';
import 'package:hmelnaya_lavka_app/screens/profile_screen.dart';

List bottomScreen = [HomeScreen(), BasketScreen(), ProfileScreen(), AdminPanel()];

User testUser = User(name: "Maxim", email: "test@test.su", numberPhone: "+78005553535", password: "aaa", basketList: []);

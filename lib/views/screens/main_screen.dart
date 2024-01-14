import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/categories_screen.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/orders_screen.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/products_screen.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/upload_banner_screen.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/vendors_screen.dart';
import 'package:multi_store_admin_01/views/screens/side_bar_screens/withdraw_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selectedScreen = DashboardScreen();

  screenSelector(item) {     //dinamico
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selectedScreen = DashboardScreen();
        });
        break;
      case VendorsScreen.routeName:
        setState(() {
          _selectedScreen = VendorsScreen();
        });
        break;
      case CategoriesScreen.routeName:
        setState(() {
          _selectedScreen = CategoriesScreen();
        });
        break;
      case OrdersScreen.routeName:
        setState(() {
          _selectedScreen = OrdersScreen();
        });
        break;
      case ProductsScreen.routeName:
        setState(() {
          _selectedScreen = ProductsScreen();
        });
        break;
      case UploadBannerScreen.routeName:
        setState(() {
          _selectedScreen = UploadBannerScreen();
        });
        break;
      case WithdrawScreen.routeName:
        setState(() {
          _selectedScreen = WithdrawScreen();
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        body: _selectedScreen,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Multi Store Admin Panel'),
        ),
        sideBar: SideBar(
          items: const [
            AdminMenuItem(
              title: 'Dashboard',
              route: DashboardScreen.routeName,
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: 'Vendors',
              route: VendorsScreen.routeName,
              icon: CupertinoIcons.person_3,
            ),
            AdminMenuItem(
              title: 'Categories',
              route: CategoriesScreen.routeName,
              icon: Icons.category,
            ),
            AdminMenuItem(
              title: 'Orders',
              route: OrdersScreen.routeName,
              icon: Icons.shopping_cart,
            ),
            AdminMenuItem(
              title: 'Products',
              route: ProductsScreen.routeName,
              icon: Icons.shopping_cart,
            ),
            AdminMenuItem(
              title: 'Upload Banner',
              route: UploadBannerScreen.routeName,
              icon: Icons.add,
            ),
            AdminMenuItem(
              title: 'Withdraw',
              route: WithdrawScreen.routeName,
              icon: CupertinoIcons.money_dollar,
            )
          ],
          selectedRoute: '',
          onSelected: (item) {
            screenSelector(item);
          },
          header: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xff444444),
            child: const Center(
              child: Text(
                'Multi Store Admin',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          footer: Container(
            height: 50,
            width: double.infinity,
            color: const Color(0xff444444),
            child: const Center(
              child: Text(
                'footer',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

    );
  }
}

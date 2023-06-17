import 'package:flutter/material.dart';
import 'package:foods/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createLinks(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotCondensed',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              color: Theme.of(context).colorScheme.secondary,
              alignment: Alignment.bottomRight,
              child: Text(
                "Vamos cozinhar",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            _createLinks(
              Icons.restaurant,
              'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
            _createLinks(
              Icons.settings,
              'Configurações',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.settings),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foods/components/main_drawer.dart';
import 'package:foods/models/settings.dart';

class SettingScreens extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingScreens({
    super.key,
    required this.settings,
    required this.onSettingsChanged,
  });

  @override
  State<SettingScreens> createState() => _SettingScreensState();
}

class _SettingScreensState extends State<SettingScreens> {
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (bool value) {
        onChanged(value);
        widget.onSettingsChanged(widget.settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          SizedBox(
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Só exibe refeições sem glutén',
                  widget.settings.isGluttenFree,
                  (value) => setState(
                    () => widget.settings.isGluttenFree = value,
                  ),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  widget.settings.isLactoseFree,
                  (value) => setState(
                    () => widget.settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  'Veganas',
                  'Só exibe refeições veganas',
                  widget.settings.isVegan,
                  (value) => setState(
                    () => widget.settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  'Vegetarianas',
                  'Só exibe refeições vegetarianas',
                  widget.settings.isVegetarian,
                  (value) => setState(
                    () => widget.settings.isVegetarian = value,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

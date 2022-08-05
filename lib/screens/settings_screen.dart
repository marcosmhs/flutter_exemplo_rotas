import 'package:flutter/material.dart';
import 'package:navegacao_telas/components/main_drawer.dart';
import 'package:navegacao_telas/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChange;
  final Settings mainSettings;

  // ignore: use_key_in_widget_constructors
  const SettingsScreen({required this.mainSettings, required this.onSettingsChange});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  // InitState é executado no início da tela.
  // o super.initState garante que o código da classe pai seja executado.
  // semelhante ao inhetited do Delphi.
  @override
  void initState() {
    super.initState();
    settings = widget.mainSettings;
  }

  SwitchListTile _createSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required Settings settings,
    required void Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        // faz a chamada do método que atualiza a lista de refeições no Main.dart.
        widget.onSettingsChange(this.settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurações")),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Filtros de refeições",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            // Não utiliza o builder do listview pois os itens são fixos.
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem Glutem',
                  subtitle: 'Apenas alimentos sem glutem',
                  value: settings.isGlutenFree,
                  settings: settings,
                  onChanged: (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Apenas alimentos sem lactose',
                  value: settings.isLactoseFree,
                  settings: settings,
                  onChanged: (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  title: 'Apenas alimentos veganos',
                  subtitle: 'Alimentos sem NENHUM ingrediente de origem animal',
                  value: settings.isVegan,
                  settings: settings,
                  onChanged: (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  title: 'Apenas alimentos vegetarianos',
                  subtitle: 'Apenas alimentos sem proteína de origem animal',
                  value: settings.isVegetarian,
                  settings: settings,
                  onChanged: (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

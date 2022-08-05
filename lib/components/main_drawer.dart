import 'package:flutter/material.dart';
import '../utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.bottomRight,
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              "Vamos Cozinhar?",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
            ),
          ),
          const SizedBox(height: 20),
          // pushReplacementNamed faz com que a tela aberta substitua a tela que foi aberta por último na pilha de telas
          _createItem(Icons.category, 'Categorias', () => Navigator.of(context).pushReplacementNamed(AppRoutes.home)),
          _createItem(Icons.settings, 'Configurações', () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings)),
          _createItem(Icons.question_mark, 'Tela não encontrada', () => Navigator.of(context).pushReplacementNamed("rota_tela_nao_existente")),
        ],
      ),
    );
  }
}

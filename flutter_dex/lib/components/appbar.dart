import 'package:flutter/material.dart';
import '../utils/colors.dart';

class UpAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Dex basics'),
      backgroundColor: AppColors.bar,
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu_rounded),
          constraints: BoxConstraints.expand(width: 200, height: 500),
          onSelected: _onTypeSelected,
          itemBuilder: (BuildContext context) => const [
            PopupMenuItem<String>(
                value: "Bug",
                child: ListTile(
                  leading: Icon(Icons.bug_report),
                  title: Text('Bug'),
                )),
            PopupMenuItem<String>(
                value: "dark",
                child: ListTile(
                  leading: Icon(Icons.dark_mode),
                  title: Text('Dark'),
                )),
            PopupMenuItem<String>(
                value: "dragon",
                child: ListTile(
                  title: Text('Dragon'),
                )),
            PopupMenuItem<String>(
                value: "eletric",
                child: ListTile(
                  leading: Icon(Icons.flash_on),
                  title: Text('Eletric'),
                )),
            PopupMenuItem<String>(
                value: "fairy",
                child: ListTile(
                  title: Text('Fairy'),
                )),
            PopupMenuItem<String>(
                value: "fighting",
                child: ListTile(
                  leading: Icon(Icons.sports_mma),
                  title: Text('Fighting'),
                )),
            PopupMenuItem<String>(
                value: "fire",
                child: ListTile(
                  leading: Icon(Icons.whatshot),
                  title: Text('Fire'),
                )),
            PopupMenuItem<String>(
              value: "flying",
              child: ListTile(
                leading: Icon(Icons.flight),
                title: Text('Flying'),
              ),
            ),
            PopupMenuItem<String>(
              value: "ghost",
              child: ListTile(
                title: Text('Ghost'),
              ),
            ),
            PopupMenuItem<String>(
              value: "grass",
              child: ListTile(
                leading: Icon(Icons.eco),
                title: Text('Grass'),
              ),
            ),
            PopupMenuItem<String>(
              value: "ground",
              child: ListTile(
                title: Text('Ground'),
              ),
            ),
            PopupMenuItem<String>(
              value: "ice",
              child: ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Ice'),
              ),
            ),
            PopupMenuItem<String>(
              value: "normal",
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text('Normal'),
              ),
            ),
            PopupMenuItem<String>(
              value: "poison",
              child: ListTile(
                title: Text('Poison'),
              ),
            ),
            PopupMenuItem<String>(
              value: "psychic",
              child: ListTile(
                leading: Icon(Icons.psychology),
                title: Text('Psychic'),
              ),
            ),
            PopupMenuItem<String>(
              value: "rock",
              child: ListTile(
                leading: Icon(Icons.terrain),
                title: Text('Rock'),
              ),
            ),
            PopupMenuItem<String>(
              value: "steel",
              child: ListTile(
                title: Text('Steel'),
              ),
            ),
            PopupMenuItem<String>(
              value: "water",
              child: ListTile(
                leading: Icon(Icons.water),
                title: Text('Water'),
              ),
            ),
            // Other menu items...
          ],
        ),
      ],
    );
  }

  void _onTypeSelected(String type) {
    // TODO: Implement filtering logic based on the selected type
  }
}

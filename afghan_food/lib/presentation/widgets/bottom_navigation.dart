import 'package:flutter/material.dart';

class MyBottomNavigationBarDetails extends StatelessWidget {
  const MyBottomNavigationBarDetails({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: 15,
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 4,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: Theme.of(context).colorScheme.surface,
          ),
          label: 'Favorie',
        ),
      ],
      currentIndex: currentIndex, // Set the initial selected index
      selectedItemColor: Theme.of(context)
          .colorScheme
          .surface, // Customize selected item color
      unselectedItemColor: Theme.of(context)
          .colorScheme
          .surface, // Customize unselected item color
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTap,
    );
  }
}

//

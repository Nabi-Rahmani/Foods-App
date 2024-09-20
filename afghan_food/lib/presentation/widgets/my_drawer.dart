import 'package:afghan_food/presentation/screens/home/fileter_sittings.dart';
import 'package:afghan_food/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.9),
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.food_bank_outlined,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Afghan Foods',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.restaurant,
                size: 24,
                color: Theme.of(context).colorScheme.surface,
              ),
              title: Text(
                'Filters',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, FilterScreen.id);
              },
            ),
            Consumer(builder: (context, snapshot, child) {
              final themeModel = snapshot.watch(themeProvider);

              ///
              return ListTile(
                leading: IconButton(
                  icon: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return RotationTransition(
                        turns: child.key == const ValueKey('light')
                            ? Tween<double>(begin: 1.0, end: 0.75)
                                .animate(animation)
                            : Tween<double>(begin: 0.75, end: 1.0)
                                .animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: themeModel.isDarkMode
                        ? Icon(
                            Icons.dark_mode,
                            key: const ValueKey('dark'),
                            color: Theme.of(context).colorScheme.surface,
                          )
                        : Icon(
                            Icons.light_mode,
                            key: const ValueKey('light'),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                  ),
                  onPressed: () {
                    snapshot.read(themeProvider).toggleTheme();
                  },
                ),
                title: Text(
                  'Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                onTap: () {},
              );
            })
          ],
        ));
  }
}

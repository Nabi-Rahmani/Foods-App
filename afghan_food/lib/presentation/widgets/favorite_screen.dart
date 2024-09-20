// ignore_for_file: unused_field

import 'package:afghan_food/presentation/screens/home/favorite_screen.dart';
import 'package:afghan_food/presentation/screens/home/hom_screen.dart';
import 'package:afghan_food/presentation/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatefulWidget {
  static const String id = '/';
  const FavoriteItem({super.key});

  @override
  State<FavoriteItem> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  ///
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const FavoriteScreen(),
  ];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _animationController.fling();
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (ctx, txt) => SlideTransition(
            position: _animationController.drive(
              Tween(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ),
            ),
            child: txt),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: MyBottomNavigationBarDetails(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}

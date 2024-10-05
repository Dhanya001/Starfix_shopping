import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavigation({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFdcb7b4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined),color: Colors.black87,
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(Icons.queue_outlined),color: Colors.black87,
            onPressed: () => onTap(1),
          ),
          IconButton(
            icon: Icon(Icons.star_border),color: Colors.black87,
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined),color: Colors.black87,
            onPressed: () => onTap(3),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school_rounded, Color(0xFF5A5A5A)),
  health(Icons.favorite_rounded, Color(0xFF5A5A5A)),
  home(Icons.home_rounded, Color(0xFF5A5A5A)),
  other(Icons.calendar_view_month_rounded, Color(0xFF5A5A5A)),
  personal(Icons.person_rounded, Color(0xFF5A5A5A)),
  shopping(Icons.shopping_bag_rounded, Color(0xFF5A5A5A)),
  social(Icons.people_rounded, Color(0xFF5A5A5A)),
  travel(Icons.flight_rounded, Color(0xFF5A5A5A)),
  work(Icons.work_rounded, Color(0xFF5A5A5A));

  static TaskCategories stringToCategory(String name) {
    try {
      return TaskCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return TaskCategories.other;
    }
  }

  final IconData icon;
  final Color color;
  const TaskCategories(this.icon, this.color);
}

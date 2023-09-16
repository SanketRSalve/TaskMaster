import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_master/config/routes/route_location.dart';
import 'package:task_master/config/routes/routes_provider.dart';
import 'package:task_master/screens/create_task_screen.dart';
import 'package:task_master/screens/home_screen.dart';

final appRoutes = [
  GoRoute(
    path: RouteLocation.home,
    parentNavigatorKey: navigationKey,
    builder: HomeScreen.builder,
  ),
  GoRoute(
      path: RouteLocation.createTask,
      parentNavigatorKey: navigationKey,
      builder: CreateTaskScreen.builder),
];

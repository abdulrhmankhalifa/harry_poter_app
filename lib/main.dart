import 'package:flutter/material.dart';
import 'package:harry_poter_app/Routing/app_route.dart';

void main() {
  runApp(HarryPoter(appRouter: AppRoute()));
}

class HarryPoter extends StatelessWidget {
  final AppRoute appRouter;

  const HarryPoter({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

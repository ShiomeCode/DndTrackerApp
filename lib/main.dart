import 'package:dndspelltrack/classpicker.dart';
import 'package:dndspelltrack/hive/artificer.dart';
import 'package:dndspelltrack/hive/barbarian.dart';
import 'package:dndspelltrack/hive/bard.dart';
import 'package:dndspelltrack/hive/cleric.dart';
import 'package:dndspelltrack/hive/druid.dart';
import 'package:dndspelltrack/hive/fighter.dart';
import 'package:dndspelltrack/hive/monk.dart';
import 'package:dndspelltrack/hive/paladin.dart';
import 'package:dndspelltrack/hive/ranger.dart';
import 'package:dndspelltrack/hive/rogue.dart';
import 'package:dndspelltrack/hive/sorcerer.dart';
import 'package:dndspelltrack/hive/warlock.dart';
import 'package:dndspelltrack/hive/wizard.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  Hive
    ..registerAdapter(ArtificerAdapter())
    ..registerAdapter(BarbarianAdapter())
    ..registerAdapter(BardAdapter())
    ..registerAdapter(ClericAdapter())
    ..registerAdapter(DruidAdapter())
    ..registerAdapter(FighterAdapter())
    ..registerAdapter(MonkAdapter())
    ..registerAdapter(PaladinAdapter())
    ..registerAdapter(RangerAdapter())
    ..registerAdapter(RogueAdapter())
    ..registerAdapter(SorcererAdapter())
    ..registerAdapter(WarlockAdapter())
    ..registerAdapter(WizardAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DnD Class Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scrollbarTheme: const ScrollbarThemeData(
          isAlwaysShown: true,
        ),
      ),
      home: const MyHomePage(title: 'Class Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const ClassPicker(),
    );
  }
}

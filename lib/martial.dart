import 'package:dndspelltrack/hive/barbarian.dart';
import 'package:dndspelltrack/hive/fighter.dart';
import 'package:dndspelltrack/hive/monk.dart';
import 'package:dndspelltrack/hive/rogue.dart';
import 'package:flutter/material.dart';
import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:dndspelltrack/helpers/styles.dart';
import 'package:hive/hive.dart';

class MartialClass extends StatefulWidget {
  final String? pc;
  const MartialClass({Key? key, this.pc}) : super(key: key);

  @override
  State<MartialClass> createState() => _MartialClassState();
}

class _MartialClassState extends State<MartialClass> {
  dynamic activeClass;

  int level = 1;
  int modi = -5;

  int rages = 2; // Rage
  int bc = 0; // Brutal Critical
  int sw = 1; // Second Wind
  int acs = 1; // Action Surge
  int ea = 0; // Extra Attack
  int ind = 1; // Indomitable
  int ki = 0; // Ki points
  int kidc = 0; // Ki point difficulty challenge
  int um = 0; // Unarmored Movement
  int sa = 1; // Sneak Attack
  int sol = 1; // Stroke of Luck

  void levelinc() async {
    Box box = await Hive.openBox(widget.pc ?? "");

    setState(() {
      level++;
      if (level >= 20) level = 20;
      if (widget.pc == "Rogue") box.put(2, (level / 2).ceil());
      sa = box.getAt(2);
      sol = box.getAt(3);
      box.put(0, level);

      rageperlevel();
      if (widget.pc == "Barbarian") box.put(1, rages);

      if (level >= 2) {
        if (widget.pc == "Fighter") box.put(2, 1);
        if (widget.pc == "Monk") {
          box.put(2, (8 + pb[level - 1] + modi));
          box.put(3, 10);
        }
      }

      if (widget.pc == "Barbarian") {
        if (level >= 9 && level < 13) box.put(2, 1);
        if (level >= 13 && level < 17) box.put(2, 2);
        if (level >= 17) box.put(2, 3);
        bc = box.getAt(2);
      }

      if (widget.pc == "Fighter") {
        if (level >= 5) box.put(3, 1);
        if (level >= 9) box.put(4, 1);
        if (level >= 11) box.put(3, 2);
        if (level >= 13) box.put(4, 2);
        if (level >= 17) box.put(4, 3);
        if (level >= 17) box.put(2, 2);
        if (level >= 20) box.put(3, 3);
        acs = box.getAt(2);
        ea = box.getAt(3);
        ind = box.getAt(4);
      }

      if (widget.pc == "Monk") {
        if (level >= 2) box.put(1, level);
        if (level >= 6) box.put(3, 15);
        if (level >= 10) box.put(3, 20);
        if (level >= 14) box.put(3, 25);
        if (level >= 18) box.put(3, 30);
        ki = box.getAt(1);
        kidc = box.getAt(2);
        um = box.getAt(3);
      }
    });
  }

  void leveldec() async {
    Box box = await Hive.openBox(widget.pc ?? "");

    setState(() {
      level--;
      sa = (level / 2).ceil();
      if (widget.pc == "Rogue") box.put(2, sa);
      if (level <= 1) {
        level = 1;
        if (widget.pc == "Fighter") box.put(2, 0);
        if (widget.pc == "Monk") box.put(1, 0);
        if (widget.pc == "Monk") box.put(3, 0);
      }
      box.put(0, level);
      rageperlevel();
      if (widget.pc == "Barbarian") {
        box.put(1, rages);
        if (level >= 9 && level < 13) box.put(2, 1);
        if (level >= 13 && level < 17) box.put(2, 2);
        if (level >= 17) box.put(2, 3);
        bc = box.getAt(2);
      }

      if (widget.pc == "Fighter") {
        if (level >= 2) box.put(2, 1);
        if (level >= 9) box.put(4, 1);
        if (level >= 13) box.put(4, 2);
        if (level >= 17) box.put(2, 2);
        if (level >= 17) box.put(4, 3);
        if (level < 20 && level >= 12) box.put(3, 2);
        if (level <= 11 && level >= 5) box.put(3, 1);
        if (level <= 4) box.put(3, 0);
        acs = box.getAt(2);
        ea = box.getAt(3);
        ind = box.getAt(4);
      }

      if (widget.pc == "Monk") {
        if (level >= 2) box.put(1, level);
        if (level >= 2) box.put(3, 10);
        if (level >= 6) box.put(3, 15);
        if (level >= 10) box.put(3, 20);
        if (level >= 14) box.put(3, 25);
        if (level >= 18) box.put(3, 30);
        ki = box.getAt(1);
        kidc = box.getAt(2);
        um = box.getAt(3);
      }
    });
  }

  void rageperlevel() {
    setState(() {
      rages = 2;
      if (level >= 3) rages = 3;
      if (level >= 6) rages = 4;
      if (level >= 12) rages = 5;
      if (level >= 17) rages = 6;
      if (level >= 20) rages = 999;
    });
  }

  void ragedec() async {
    Box box = await Hive.openBox("Barbarian");
    setState(() {
      rages--;
      if (rages <= 0) rages = 0;
      box.put(1, rages);
    });
  }

  void swdec() async {
    Box box = await Hive.openBox("Fighter");
    setState(() {
      sw--;
      if (sw <= 0) sw = 0;
      box.put(1, sw);
    });
  }

  void ascdec() async {
    Box box = await Hive.openBox("Fighter");
    setState(() {
      acs--;
      if (acs <= 0) acs = 0;
      box.put(2, acs);
    });
  }

  void inddec() async {
    Box box = await Hive.openBox("Fighter");
    setState(() {
      ind--;
      if (ind <= 0) ind = 0;
      box.put(4, ind);
    });
  }

  void kidec() async {
    Box box = await Hive.openBox("Monk");
    setState(() {
      ki--;
      if (ki <= 0) ki = 0;
      box.put(2, ki);
    });
  }

  void soldec() async {
    Box box = await Hive.openBox("Rogue");
    setState(() {
      sol--;
      if (sol <= 0) sol = 0;
      box.put(3, sol);
      sol = box.getAt(3);
    });
  }

  void martiallongrest() async {
    rageperlevel();
    Box box = await Hive.openBox("Barbarian");
    if (widget.pc == "Barbarian") box.put(1, rages);
    martialshortrest();
  }

  void martialshortrest() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      if (widget.pc == "Monk") box.put(1, level);
      if (widget.pc == "Monk") modi = (box.getAt(2) - 8 - pb[level - 1]);

      if (widget.pc == "Fighter") box.put(1, 1);
      if (level >= 2 && widget.pc == "Fighter") box.put(2, 1);
      if (level >= 9 && widget.pc == "Fighter") box.put(4, 1);
      if (level >= 13 && widget.pc == "Fighter") box.put(4, 2);
      if (level >= 17 && widget.pc == "Fighter") box.put(2, 2);
      if (level >= 17 && widget.pc == "Fighter") box.put(4, 3);
      if (level >= 20 && widget.pc == "Rogue") box.put(3, 1);

      boxRead();
    });
  }

  void modiinc() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      modi++;
      if (modi >= 10) modi = 10;
      box.put(1, modi);
      kidc = (8 + pb[level] + modi);
      if (widget.pc == "Monk") box.put(2, kidc);
      kidc = box.getAt(2);
      modi = (box.getAt(2) - 8 - pb[level - 1]);
    });
  }

  void modidec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      modi--;
      if (modi <= -5) modi = -5;
      box.put(1, modi);
      kidc = (8 + pb[level] + modi);
      if (widget.pc == "Monk") box.put(2, kidc);
      kidc = box.getAt(2);
      modi = (box.getAt(2) - 8 - pb[level - 1]);
    });
  }

  @override
  void initState() {
    super.initState();
    boxRead();
  }

  void boxRead() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    switch (widget.pc) {
      case "Barbarian":
        if (box.isEmpty) {
          Barbarian barb = Barbarian();
          await box.put(0, barb.level);
          await box.put(1, barb.rage);
          await box.put(2, barb.bc);
        }
        setState(() {
          level = box.getAt(0);
          rages = box.getAt(1);
          bc = box.getAt(2);
        });
        break;
      case "Fighter":
        if (box.isEmpty) {
          Fighter fighter = Fighter();
          await box.put(0, fighter.level);
          await box.put(1, fighter.sw);
          await box.put(2, fighter.acs);
          await box.put(3, fighter.ea);
          await box.put(4, fighter.ind);
        }
        setState(() {
          level = box.getAt(0);
          sw = box.getAt(1);
          acs = box.getAt(2);
          ea = box.getAt(3);
          ind = box.getAt(4);
        });
        break;
      case "Monk":
        if (box.isEmpty) {
          Monk monk = Monk();
          await box.put(0, monk.level);
          await box.put(1, monk.ki);
          await box.put(2, monk.kidc);
          await box.put(3, monk.um);
        }
        setState(() {
          level = box.getAt(0);
          ki = box.getAt(1);
          kidc = box.getAt(2);
          um = box.getAt(3);
          modi = (box.getAt(2) - 8 - pb[level - 1]);
        });
        break;
      case "Rogue":
        if (box.isEmpty) {
          Rogue rogue = Rogue();
          await box.put(0, rogue.level);
          await box.put(1, rogue.modi);
          await box.put(2, rogue.sa);
          await box.put(3, rogue.sol);
        }

        setState(() {
          level = box.getAt(0);
          modi = box.getAt(1);
          sa = box.getAt(2);
          sol = box.getAt(3);
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pc}"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const SizedBox(height: 30),
              if (widget.pc == "Monk") modBlock("Wisdom"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.pc == "Monk") roundButton(modidec, minus()),
                  if (widget.pc == "Monk") numberbetween(modi),
                  if (widget.pc == "Monk") roundButton(modiinc, plus()),
                ],
              ),
              const SizedBox(height: 30),
              levelBlock(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundButton(leveldec, minus()),
                  numberbetween(level),
                  roundButton(levelinc, plus()),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  martialFeature1("Proficiency\nBonus", () {}, pb[level - 1])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.pc == "Barbarian")
                    martialFeature1("Rages", ragedec, rages),
                  if (widget.pc == "Barbarian")
                    martialFeature1("Rage dmg", () {}, ragedmg[level]),
                  if (widget.pc == "Fighter")
                    martialFeature1("Second Wind", swdec, sw),
                  if (widget.pc == "Fighter" && level >= 2)
                    martialFeature1("Action Surge", ascdec, acs),
                  if (widget.pc == "Monk" && level >= 2)
                    martialFeature1("Ki DC", () {}, kidc),
                  if (widget.pc == "Monk" && level >= 2)
                    martialFeature1("Ki", kidec, ki),
                  if (widget.pc == "Monk" && level >= 2)
                    martialFeature1("+Speed", () {}, um),
                  if (widget.pc == "Rogue") martialFeature1("Sneak", () {}, sa),
                  if (widget.pc == "Rogue" && level >= 20)
                    martialFeature1("Stroke of Luck", soldec, sol),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (widget.pc == "Barbarian" && level >= 9)
                    martialFeature1("Brutal Critical", () {}, bc),
                  if (widget.pc == "Fighter" && level >= 5)
                    martialFeature1("Extra Attack", () {}, ea),
                  if (widget.pc == "Fighter" && level >= 9)
                    martialFeature1("Indomitable", inddec, ind),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  restButton("Long Rest", martiallongrest),
                  restButton("Short Rest", martialshortrest),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget martialFeature1(String title, function, int amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18)),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [shadow()],
                      color: Colors.lightBlue,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: function,
                        child: Text(
                          amount.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        )),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

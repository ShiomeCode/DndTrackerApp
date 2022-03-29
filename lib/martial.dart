import 'package:flutter/material.dart';
import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:dndspelltrack/helpers/styles.dart';

class MartialClass extends StatefulWidget {
  final String? pc;
  const MartialClass({Key? key, this.pc}) : super(key: key);

  @override
  State<MartialClass> createState() => _MartialClassState();
}

class _MartialClassState extends State<MartialClass> {
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

  void levelinc() {
    setState(() {
      level++;
      sa = (level / 2).ceil();
      if (level >= 20) level = 20;
      rageperlevel();

      if (level >= 2) {
        acs = 1;
        kidc = (8 + pb[level - 1] + modi);
        um = 10;
      }

      if (level > 2) ki = level;
      if (level >= 5) {
        ea = 1;
      }

      if (level >= 6) {
        um = 15;
      }

      if (level >= 9 && level < 13) {
        bc = 1;
      }

      if (level >= 10) {
        um = 20;
      }

      if (level >= 11) {
        ea = 2;
      }

      if (level >= 13 && level < 17) {
        bc = 2;
      }

      if (level >= 14) {
        um = 25;
      }

      if (level >= 17) {
        bc = 3;
        acs = 2;
      }

      if (level >= 18) {
        um = 30;
      }

      if (level >= 20) {
        ea = 3;
      }
    });
  }

  void leveldec() {
    setState(() {
      level--;
      sa = (level / 2).ceil();
      if (level <= 1) {
        level = 1;
        acs = 0;
        ki = 0;
        um = 0;
      }
      rageperlevel();
      if (level >= 2) ki = level;
      if (level >= 2) {
        acs = 1;
        um = 10;
      }

      if (level >= 6) {
        um = 15;
      }

      if (level >= 9 && level < 13) {
        bc = 1;
      }

      if (level >= 10) {
        um = 20;
      }

      if (level >= 13 && level < 17) {
        bc = 2;
      }

      if (level >= 14) {
        um = 25;
      }

      if (level >= 17) {
        bc = 3;
        acs = 2;
      }

      if (level >= 18) {
        um = 30;
      }

      if (level < 20 && level >= 12) ea = 2;
      if (level <= 11 && level >= 5) ea = 1;
      if (level <= 4) ea = 0;
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

  void ragedec() {
    setState(() {
      rages--;
      if (rages <= 0) rages = 0;
    });
  }

  void swdec() {
    setState(() {
      sw--;
      if (sw <= 0) sw = 0;
    });
  }

  void ascdec() {
    setState(() {
      acs--;
      if (acs <= 0) acs = 0;
    });
  }

  void inddec() {
    setState(() {
      ind--;
      if (ind <= 0) ind = 0;
    });
  }

  void kidec() {
    setState(() {
      ki--;
      if (ki <= 0) ki = 0;
    });
  }

  void soldec() {
    setState(() {
      sol--;
      if (sol <= 0) sol = 0;
    });
  }

  void martiallongrest() {
    rageperlevel();
    martialshortrest();
  }

  void martialshortrest() {
    setState(() {
      sw = 1;
      ki = level;
      if (level >= 2) acs = 1;
      if (level >= 17) acs = 2;
      if (level >= 20) sol = 1;
    });
  }

  void modiinc() {
    setState(() {
      modi++;
      if (modi >= 10) modi = 10;
      kidc = (8 + pb[level] + modi);
    });
  }

  void modidec() {
    setState(() {
      modi--;
      if (modi <= -5) modi = -5;
      kidc = (8 + pb[level] + modi);
    });
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
                    martialFeature1("Rage", ragedec, rages),
                  if (widget.pc == "Barbarian" && level >= 9)
                    martialFeature1("Brutal Critical", () {}, bc),
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

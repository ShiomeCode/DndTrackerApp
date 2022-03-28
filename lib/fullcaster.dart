import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:flutter/material.dart';

import 'helpers/styles.dart';

class FullCaster extends StatefulWidget {
  final String? pc;
  const FullCaster({Key? key, this.pc}) : super(key: key);

  @override
  State<FullCaster> createState() => _FullCasterState();
}

class _FullCasterState extends State<FullCaster> {
  int level = 1;

  int bi = 0; //Bardic Inspiration
  int cd = 1; //Channel Divinity
  int ws = 2; //Wild Shape
  int sp = 0; //Sorcerer Points
  int ar = 0; //Arcane Recovery

  FullCasterLevels slots = FullCasterLevels(fullcasterlevels);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pc}"),
      ),
      body: Center(child: spellslotTracker(widget.pc)),
    );
  }

  void levelinc() {
    setState(() {
      level++;
      if (level > 20) level = 20;

      // Cleric specific
      if (level >= 18) cd = 3;
      if (level >= 6 && level < 18) cd = 2;

      // Sorcerer specific
      if (level >= 2) sp = level;
    });
  }

  void leveldec() {
    setState(() {
      level--;
      if (level < 1) level = 1;

      // Cleric specific
      if (level <= 17) cd = 2;
      if (level <= 5) cd = 1;

      if (level <= 1) sp = 0;
    });
  }

  void biinc() {
    setState(() {
      bi++;
    });
  }

  void bidec() {
    setState(() {
      bi--;
      if (bi < 0) bi = 0;
    });
  }

  void cddec() {
    setState(() {
      cd--;
      if (cd < 0) cd = 0;
    });
  }

  void wsdec() {
    setState(() {
      ws--;
      if (ws < 0) ws = 0;
    });
  }

  void spdec() {
    setState(() {
      sp--;
      if (sp < 0) sp = 0;
    });
  }

  int arcalc() {
    if (level >= 2) ar = (level / 2).ceil();
    if (ar >= 6) ar = 6;
    if (level == 1) ar = 1;
    return ar;
  }

  void ardec() {
    setState(() {
      ar--;
      if (ar <= 0) ar = 0;
    });
  }

  void fclongrest() {
    FullCasterLevels _reset = FullCasterLevels.generate();
    for (var i = 0; i < 9; i++) {
      slots.spellSlots![level][i] = _reset.spellSlots![level][i];

      // Sorcerer specific
      if (level >= 2) sp = level;

      // Uses setstate to update view
      fcshortrest();
    }
  }

  void fcshortrest() {
    setState(() {
      // Cleric specific
      if (level >= 18) cd = 3;
      if (level >= 6 && level < 18) cd = 2;
      if (level <= 5) cd = 1;
      // Druid specific
      ws = 2;
    });
  }

  Widget spellslotTracker(String? pc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        levelBlock(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            roundButton(leveldec, minus()),
            numberbetween(level),
            roundButton(levelinc, plus())
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i = 0; i < 3; i++) spellbox(level, i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i = 3; i < 6; i++) spellbox(level, i),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var i = 6; i < 9; i++) spellbox(level, i),
          ],
        ),
        const SizedBox(height: 30),
        classFeature(pc ?? ""),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            restButton("Long Rest", fclongrest),
            const SizedBox(width: 30),
            restButton("Short Rest", fcshortrest),
          ],
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget spellbox(int _level, int _i) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(slotType[_i], style: const TextStyle(fontSize: 18)),
          Container(
            decoration: BoxDecoration(
                boxShadow: [shadow()],
                color: Colors.lightBlue,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      slots.spellSlots![_level][_i]--;
                      if (slots.spellSlots![_level][_i] < 0) {
                        slots.spellSlots![_level][_i] = 0;
                      }
                    });
                  },
                  child: Text(
                    slots.spellSlots![_level][_i].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget classFeature(String _pc) {
    if (_pc == "Bard") {
      return Column(
        children: [
          const Text(
            "Bardic Inspiration",
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              roundButton(bidec, minus()),
              numberbetween(bi),
              roundButton(biinc, plus()),
            ],
          ),
        ],
      );
    } else if (_pc == "Cleric") {
      return classSpecificBlock(cddec, cd, "Channel Divinity");
    } else if (_pc == "Druid") {
      return classSpecificBlock(wsdec, ws, "Wild Shape");
    } else if (_pc == "Sorcerer") {
      return classSpecificBlock(spdec, sp, "Sorcerer Points");
    } else if (_pc == "Wizard") {
      return classSpecificBlock(ardec, arcalc(), "Arcane Recovery 1/day");
    } else {
      return const Center(child: Text("Something Went Wrong :("));
    }
  }
}

Widget classSpecificBlock(_function, int _classResource, String _name) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          _name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          roundButton(_function, minus()),
          numberbetween(_classResource),
          if (_name == "Arcane Recovery 1/day")
            const Text(
              "Total\nSlots",
              style: TextStyle(fontSize: 20),
            ),
        ],
      ),
    ],
  );
}

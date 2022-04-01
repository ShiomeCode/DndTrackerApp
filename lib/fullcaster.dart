import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:dndspelltrack/hive/bard.dart';
import 'package:dndspelltrack/hive/cleric.dart';
import 'package:dndspelltrack/hive/druid.dart';
import 'package:dndspelltrack/hive/sorcerer.dart';
import 'package:dndspelltrack/hive/wizard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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

  List<int> slots = fullcasterlevels[0];
  FullCasterLevels maxSlots = FullCasterLevels.generate();

  @override
  void initState() {
    super.initState();
    boxRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.pc}"),
      ),
      body: Center(child: spellslotTracker(widget.pc)),
    );
  }

  void levelinc() async {
    Box box = await Hive.openBox(widget.pc ?? "");

    setState(() {
      level++;
      if (level > 20) level = 20;
      box.put(0, level);
      box.put(2, fullcasterlevels[level]);
      slots = fullcasterlevels[level];

      switch (widget.pc) {
        case "Cleric":
          if (level >= 18) cd = 3;
          if (level >= 6 && level < 18) cd = 2;
          box.put(1, cd);
          break;

        case "Sorcerer":
          if (level >= 2) {
            sp = level;
            box.put(1, sp);
          }
          break;
        default:
      }
    });
  }

  void leveldec() async {
    Box box = await Hive.openBox(widget.pc ?? "");

    setState(() {
      level--;
      if (level < 1) level = 1;
      box.put(0, level);
      box.put(2, fullcasterlevels[level]);
      slots = fullcasterlevels[level];

      // Cleric specific
      switch (widget.pc) {
        case "Cleric":
          if (level <= 17) cd = 2;
          if (level <= 5) cd = 1;
          box.put(1, cd);
          break;

        case "Sorcerer":
          if (level <= 1) sp = 0;
          box.put(1, sp);
          break;
      }
    });
  }

  void biinc() async {
    Box box = await Hive.openBox("Bard");
    setState(() {
      bi++;
      if (bi >= 7) bi = 7;
      box.put(1, bi);
    });
  }

  void bidec() async {
    Box box = await Hive.openBox("Bard");
    setState(() {
      bi--;
      if (bi < 0) bi = 0;
      box.put(1, bi);
    });
  }

  void cddec() async {
    Box box = await Hive.openBox("Cleric");

    setState(() {
      cd--;
      if (cd < 0) cd = 0;
      box.put(1, cd);
    });
  }

  void wsdec() async {
    Box box = await Hive.openBox("Druid");
    setState(() {
      ws--;
      if (ws < 0) ws = 0;
      box.put(1, ws);
    });
  }

  void spdec() async {
    Box box = await Hive.openBox("Sorcerer");
    setState(() {
      sp--;
      if (sp < 0) sp = 0;
      box.put(1, sp);
    });
  }

  int arcalc() {
    if (level >= 2) ar = (level / 2).ceil();
    if (ar >= 6) ar = 6;
    if (level == 1) ar = 1;
    return ar;
  }

  void fclongrest() async {
    FullCasterLevels _reset = FullCasterLevels.generate();
    Box box = await Hive.openBox(widget.pc ?? "");
    box.put(2, _reset.spellSlots![level]);
    slots = box.getAt(2);

    // Sorcerer specific
    if (level >= 2 && widget.pc == "Sorcerer") {
      sp = level;
      box.put(1, sp);
    }

    // Uses setstate to update view
    fcshortrest();
    boxRead();
  }

  void fcshortrest() async {
    Box box = await Hive.openBox(widget.pc ?? "");

    setState(() {
      if (widget.pc == "Cleric") {
        if (level >= 18) cd = 3;
        if (level >= 6 && level < 18) cd = 2;
        if (level <= 5) cd = 1;
        box.put(1, cd);
      }

      if (widget.pc == "Druid") {
        ws = 2;
        box.put(1, ws);
      }
    });
  }

  void boxRead() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    switch (widget.pc) {
      case "Bard":
        if (box.isEmpty) {
          Bard bard = Bard();
          await box.put(0, bard.level);
          await box.put(1, bard.bi);
          await box.put(2, bard.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          bi = box.getAt(1);
          slots = box.getAt(2);
        });
        break;
      case "Cleric":
        if (box.isEmpty) {
          Cleric cleric = Cleric();
          await box.put(0, cleric.level);
          await box.put(1, cleric.cd);
          await box.put(2, cleric.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          cd = box.getAt(1);
          slots = box.getAt(2);
        });
        break;

      case "Druid":
        if (box.isEmpty) {
          Druid druid = Druid();
          await box.put(0, druid.level);
          await box.put(1, druid.ws);
          await box.put(2, druid.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          ws = box.getAt(1);
          slots = box.getAt(2);
        });
        break;
      case "Sorcerer":
        if (box.isEmpty) {
          Sorcerer sorc = Sorcerer();
          await box.put(0, sorc.level);
          await box.put(1, sorc.sp);
          await box.put(2, sorc.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          sp = box.getAt(1);
          slots = box.getAt(2);
        });
        break;
      case "Wizard":
        if (box.isEmpty) {
          Wizard wizard = Wizard();
          await box.put(0, wizard.level);
          await box.put(1, wizard.ar);
          await box.put(2, wizard.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          ar = box.getAt(1);
          slots = box.getAt(2);
        });
        break;
      default:
        break;
    }
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
          Text(slotType[_i] + " (${maxSlots.spellSlots![_level][_i]})",
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
                  onPressed: () {
                    setState(() {
                      slots[_i]--;
                      if (slots[_i] < 0) {
                        slots[_i] = 0;
                      }
                      Hive.openBox(widget.pc ?? "")
                          .then((box) => box.put(2, slots));
                      fullcasterlevels =
                          FullCasterLevels.generate().spellSlots!;
                    });
                  },
                  child: Text(
                    slots[_i].toString(),
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
      return classSpecificBlock(() {}, arcalc(), "Arcane Recovery 1/day");
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
          if (_name != "Arcane Recovery 1/day") roundButton(_function, minus()),
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

import 'package:dndspelltrack/hive/artificer.dart';
import 'package:dndspelltrack/hive/paladin.dart';
import 'package:dndspelltrack/hive/ranger.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'helpers/listgenerators.dart';
import 'helpers/styles.dart';

class HalfCaster extends StatefulWidget {
  final String? pc;
  const HalfCaster({Key? key, this.pc}) : super(key: key);

  @override
  State<HalfCaster> createState() => _HalfCasterState();
}

class _HalfCasterState extends State<HalfCaster> {
  int level = 1;
  int castingMod = 0;

  int ik = 0; //Infusions Known
  int fog = 0; //Flash of Genius
  int cd = 1; //Channel Divinity
  int ds = 0; //Divine Sense
  int loh = 5; //Lay on Hands

  TextEditingController modinput = TextEditingController(text: "0");
  List<int> slots = halfcasterlevels[0];
  HalfCasterLevels maxSlots = HalfCasterLevels.generate();

  void hcleveldec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      level--;
      if (level <= 0) level = 0;
      if (widget.pc == "Paladin") {
        lohcalc();
        box.put(4, halfcasterlevels[level]);
        slots = box.getAt(4);
      }
      box.put(0, level);
      if (widget.pc == "Artificer") {
        box.put(2, infusionsKnown[level]);
        ik = box.getAt(2);
        box.put(4, halfcasterlevels[level]);
        slots = box.getAt(4);
      }
      if (widget.pc == "Ranger") {
        box.put(1, halfcasterlevels[level]);
        slots = box.getAt(1);
      }
    });
  }

  void hclevelinc() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      level++;
      if (level >= 20) level = 20;
      box.put(0, level);
      if (widget.pc == "Paladin") {
        lohcalc();
        box.put(4, halfcasterlevels[level]);
        slots = box.getAt(4);
      }
      if (widget.pc == "Artificer") {
        box.put(2, infusionsKnown[level]);
        ik = box.getAt(2);
        box.put(4, halfcasterlevels[level]);
        slots = box.getAt(4);
      }
      if (widget.pc == "Ranger") {
        box.put(1, halfcasterlevels[level]);
        slots = box.getAt(1);
      }
    });
  }

  void castingmodinc() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      castingMod++;
      ds = castingMod;
      if (widget.pc == "Paladin") box.put(2, ds);
      if (widget.pc == "Artificer") {
        box.put(1, castingMod);
        box.put(3, castingMod);
        fog = box.getAt(1);
      }
    });
  }

  void castingmoddec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      castingMod--;
      if (castingMod <= -5) {
        castingMod = -5;
        fog = 1;
      }
      ds = castingMod;
      if (widget.pc == "Paladin") box.put(2, ds);
      if (widget.pc == "Artificer") {
        box.put(1, castingMod);
        box.put(3, castingMod);
        fog = box.getAt(1);
      }
    });
  }

  void hclongrest() async {
    Box box = await Hive.openBox(widget.pc ?? "");

    HalfCasterLevels _reset = HalfCasterLevels.generate();
    if (widget.pc == "Ranger") {
      box.put(1, _reset.spellSlots);
      slots = box.getAt(1);
    } else {
      box.put(4, _reset.spellSlots);
      slots = box.getAt(4);
    }

    hcshortrest();
  }

  void hcshortrest() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      cd = 1;
      if (widget.pc == "Paladin") box.put(1, cd);
    });
  }

  void fogdec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      fog--;
      if (fog <= 0) fog = 0;
      box.put(3, fog);
    });
  }

  void cddec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      cd--;
      if (cd <= 0) cd = 0;
      box.put(1, cd);
    });
  }

  void dsdec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      ds--;
      if (ds <= 0) ds = 0;
      box.put(2, ds);
    });
  }

  void lohdec() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      loh--;
      box.put(3, loh);
    });
  }

  void lohcalc() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    setState(() {
      loh = level * 5;
      box.put(3, loh);
    });
  }

  void boxRead() async {
    Box box = await Hive.openBox(widget.pc ?? "");
    switch (widget.pc) {
      case "Artificer":
        if (box.isEmpty) {
          Artificer artificer = Artificer();
          await box.put(0, artificer.level);
          await box.put(1, artificer.castingMod);
          await box.put(2, artificer.ik);
          await box.put(3, artificer.fog);
          await box.put(4, artificer.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          castingMod = box.getAt(1);
          ik = box.getAt(2);
          fog = box.getAt(3);
          slots = box.getAt(4);

          print("$level, $castingMod, $ik, $fog, $slots");
        });
        break;
      case "Paladin":
        if (box.isEmpty) {
          Paladin paladin = Paladin();
          await box.put(0, paladin.level);
          await box.put(1, paladin.cd);
          await box.put(2, paladin.ds);
          await box.put(3, paladin.loh);
          await box.put(4, paladin.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          cd = box.getAt(1);
          ds = box.getAt(2);
          loh = box.getAt(3);
          slots = box.getAt(4);

          print("$level, $cd, $ds, $loh, $slots");
        });
        break;
      case "Ranger":
        if (box.isEmpty) {
          Ranger ranger = Ranger();
          await box.put(0, ranger.level);
          await box.put(1, ranger.spellSlots);
        }
        setState(() {
          level = box.getAt(0);
          slots = box.getAt(1);

          print("$level, $slots");
        });
        break;
      default:
        break;
    }
  }

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40),
              if (widget.pc == "Artificer" || widget.pc == "Paladin")
                castmodinput(),
              levelBlock(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  roundButton(hcleveldec, minus()),
                  numberbetween(level),
                  roundButton(hclevelinc, plus())
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
                  for (var i = 3; i < 5; i++) spellbox(level, i),
                ],
              ),
              const SizedBox(height: 30),

              // Class specific features goes here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (widget.pc == "Artificer" && level >= 7)
                    modbetween("Flash of Genius"),
                  if (widget.pc == "Artificer" && level >= 7)
                    const SizedBox(width: 30),
                  if (widget.pc == "Artificer") modbetween("Infusions"),
                  if (widget.pc == "Paladin")
                    hcClassFeature1(cddec, cd, "Channel Divinity"),
                  const SizedBox(width: 30),
                  if (widget.pc == "Paladin")
                    hcClassFeature1(dsdec, ds, "Divine Sense"),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.pc == "Paladin")
                    hcClassFeature1(lohdec, loh, "Lay on Hands")
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  restButton("Long Rest", hclongrest),
                  const SizedBox(width: 30),
                  restButton("Short Rest", hcshortrest),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget castmodinput() {
    return Column(
      children: [
        const Text("Spell Casting Mod", style: TextStyle(fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            roundButton(castingmoddec, minus()),
            Center(
                child:
                    Text("$castingMod", style: const TextStyle(fontSize: 24))),
            roundButton(castingmodinc, plus()),
          ],
        ),
        const SizedBox(height: 30),
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
                      Hive.openBox(widget.pc ?? "").then((box) {
                        if (widget.pc == "Ranger") {
                          box.put(1, slots);
                        } else {
                          box.put(4, slots);
                        }
                        halfcasterlevels =
                            HalfCasterLevels.generate().spellSlots!;
                      });
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

  Widget hcClassFeature1(_function, int _classResource, String _name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            _name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: roundButton(_function, minus()),
            ),
            numberbetween(_classResource),
          ],
        ),
      ],
    );
  }

  Widget modbetween(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title == "Flash of Genius" ? "$fog mod/LR" : "$ik",
              style: const TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}

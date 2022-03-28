import 'package:flutter/material.dart';

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
  HalfCasterLevels slots = HalfCasterLevels(halfcasterlevels);

  void hcleveldec() {
    setState(() {
      level--;
      if (widget.pc == "Paladin") lohcalc();
    });
  }

  void hclevelinc() {
    setState(() {
      level++;
      if (widget.pc == "Paladin") lohcalc();
    });
  }

  void castingmodinc() {
    setState(() {
      castingMod++;
      ds = castingMod;
    });
  }

  void castingmoddec() {
    setState(() {
      castingMod--;
      if (castingMod <= -5) castingMod = -5;
      ds = castingMod;
    });
  }

  void hclongrest() {
    HalfCasterLevels _reset = HalfCasterLevels.generate();
    for (var i = 0; i < 5; i++) {
      slots.spellSlots![level][i] = _reset.spellSlots![level][i];
    }
    hcshortrest();
  }

  void hcshortrest() {
    setState(() {
      cd = 1;
    });
  }

  void fogdec() {
    setState(() {
      fog--;
      if (fog <= 0) fog = 0;
    });
  }

  void cddec() {
    setState(() {
      cd--;
      if (cd <= 0) cd = 0;
    });
  }

  void dsdec() {
    setState(() {
      ds--;
      if (ds <= 0) ds = 0;
    });
  }

  void lohdec() {
    setState(() {
      loh--;
    });
  }

  void lohcalc() {
    setState(() {
      loh = level * 5;
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
                    modbetween("Int", "Flash of Genius"),
                  if (widget.pc == "Artificer" && level >= 7)
                    const SizedBox(width: 30),
                  if (widget.pc == "Artificer")
                    hcClassFeature1(() {}, ik, "Infusions"),
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
        //if (widget.pc == "Paladin" && _name == "Lay on Hands")
      ],
    );
  }

  Widget modbetween(String mod, String title) {
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
          child: Text("$fog mod/LR", style: const TextStyle(fontSize: 20)),
        )
      ],
    );
  }
}

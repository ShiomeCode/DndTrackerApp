import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:dndspelltrack/helpers/styles.dart';
import 'package:flutter/material.dart';

class SpecialCaster extends StatefulWidget {
  final String? pc;
  const SpecialCaster({Key? key, this.pc}) : super(key: key);

  @override
  State<SpecialCaster> createState() => _SpecialCasterState();
}

class _SpecialCasterState extends State<SpecialCaster> {
  int level = 1;
  String _wlSlotType = slotType[0];
  List<int> ma = [1, 1, 1, 1];
  WarlockSlots _spellslots = WarlockSlots.generate();

  void _wllongrest() {
    ma = [1, 1, 1, 1];
    //Uses setstate
    _wlshortrest();
  }

  void _wlshortrest() {
    WarlockSlots _reset = WarlockSlots.generate();
    setState(() {
      _spellslots = _reset;
    });
  }

  void _wllevelinc() {
    setState(() {
      level++;
      if (level >= 20) level = 20;
      if (level > 0) _wlSlotType = slotType[0];
      if (level > 2) _wlSlotType = slotType[1];
      if (level > 4) _wlSlotType = slotType[2];
      if (level > 6) _wlSlotType = slotType[3];
      if (level > 8) _wlSlotType = slotType[4];
    });
  }

  void _wlleveldec() {
    setState(() {
      level--;
      if (level <= 1) level = 1;
      if (level > 0) _wlSlotType = slotType[0];
      if (level > 2) _wlSlotType = slotType[1];
      if (level > 4) _wlSlotType = slotType[2];
      if (level > 6) _wlSlotType = slotType[3];
      if (level > 8) _wlSlotType = slotType[4];
    });
  }

  void _wlspellused() {
    setState(() {
      _spellslots.slots![level]--;
      if (_spellslots.slots![level] <= 0) _spellslots.slots![level];
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
            children: [
              const SizedBox(height: 10),
              // level
              const Center(
                  child: Text("Level", style: TextStyle(fontSize: 24))),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  roundButton(_wlleveldec, minus()),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: numberbetween(level),
                  ),
                  roundButton(_wllevelinc, plus()),
                ],
              ),
              const SizedBox(height: 30),
              const Center(
                  child: Text("Spell Slots", style: TextStyle(fontSize: 20))),
              _wlspellbox(level, _wlSlotType),

              if (level >= 11)
                const Padding(
                  padding: EdgeInsets.only(top: 28.0),
                  child: Center(
                    child: Text(
                      "Mystic Arcanum\nFree Uses",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              if (level >= 11)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mysticArcanum(0, 5),
                    if (level >= 13) mysticArcanum(1, 6),
                  ],
                ),
              if (level >= 15)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mysticArcanum(2, 7),
                    if (level >= 17) mysticArcanum(3, 8),
                  ],
                ),
              const SizedBox(height: 40),
              // rest
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  restButton("Long Rest", _wllongrest),
                  restButton("Short Rest", _wlshortrest),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _wlspellbox(int _level, String _type) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(_type, style: const TextStyle(fontSize: 18)),
          Container(
            decoration: BoxDecoration(
                boxShadow: [shadow()],
                color: Colors.lightBlue,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: _wlspellused,
                  child: Text(
                    _spellslots.slots![level].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget mysticArcanum(int index, int type) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(slotType[type], style: const TextStyle(fontSize: 18)),
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
                      ma[index]--;
                      if (ma[index] <= 0) ma[index] = 0;
                    });
                  },
                  child: Text(
                    ma[index].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

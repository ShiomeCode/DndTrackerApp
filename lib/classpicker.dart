import 'package:dndspelltrack/fullcaster.dart';
import 'package:dndspelltrack/halfcaster.dart';
import 'package:dndspelltrack/warlock.dart';
import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:dndspelltrack/martial.dart';
import 'package:flutter/material.dart';

class ClassPicker extends StatefulWidget {
  const ClassPicker({Key? key}) : super(key: key);

  @override
  State<ClassPicker> createState() => _ClassPickerState();
}

class _ClassPickerState extends State<ClassPicker> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      
      child: Center(
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              itemCount: classes.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton(
                        child: Text(classes[index],
                            style: const TextStyle(fontSize: 20)),
                        onPressed: () {
                          if (classes[index] == "Wizard" ||
                              classes[index] == "Bard" ||
                              classes[index] == "Cleric" ||
                              classes[index] == "Druid" ||
                              classes[index] == "Sorcerer") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        FullCaster(pc: classes[index]))));
                          } else if (classes[index] == "Artificer" ||
                              classes[index] == "Paladin" ||
                              classes[index] == "Ranger") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HalfCaster(pc: classes[index])));
                          } else if (classes[index] == "Warlock") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SpecialCaster(pc: classes[index])));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MartialClass(pc: classes[index])));
                          }
                        },
                      ),
                    ),
                  ),
                );
              }))),
    );
  }
}

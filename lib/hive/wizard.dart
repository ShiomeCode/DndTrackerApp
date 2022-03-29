import 'package:hive/hive.dart';

part 'wizard.g.dart';

@HiveType(typeId: 12)
class Wizard extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? ar;

  @HiveField(2)
  List<dynamic>? spellSlots;

  Wizard(int level, int ar, List<dynamic> spellSlots) {
    this.level = 1;
    this.ar = 0;
    this.spellSlots = [
      [0, 0, 0, 0, 0, 0, 0, 0, 0],
      [2, 0, 0, 0, 0, 0, 0, 0, 0], //1
      [3, 0, 0, 0, 0, 0, 0, 0, 0], //2
      [4, 2, 0, 0, 0, 0, 0, 0, 0], //3
      [4, 3, 0, 0, 0, 0, 0, 0, 0], //4
      [4, 3, 2, 0, 0, 0, 0, 0, 0], //5
      [4, 3, 3, 0, 0, 0, 0, 0, 0], //6
      [4, 3, 3, 1, 0, 0, 0, 0, 0], //7
      [4, 3, 3, 2, 0, 0, 0, 0, 0], //8
      [4, 3, 3, 3, 1, 0, 0, 0, 0], //9
      [4, 3, 3, 3, 2, 0, 0, 0, 0], //10
      [4, 3, 3, 3, 2, 1, 0, 0, 0], //11
      [4, 3, 3, 3, 3, 1, 0, 0, 0], //12
      [4, 3, 3, 3, 3, 1, 1, 0, 0], //13
      [4, 3, 3, 3, 3, 1, 1, 0, 0], //14
      [4, 3, 3, 3, 3, 1, 1, 1, 0], //15
      [4, 3, 3, 3, 3, 1, 1, 1, 0], //16
      [4, 3, 3, 3, 3, 1, 1, 1, 1], //17
      [4, 3, 3, 3, 3, 1, 1, 1, 1], //18
      [4, 3, 3, 3, 3, 2, 1, 1, 1], //19
      [4, 3, 3, 3, 3, 2, 2, 1, 1], //20
    ];
  }
}

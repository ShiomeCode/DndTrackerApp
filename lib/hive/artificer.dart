import 'package:hive/hive.dart';

part 'artificer.g.dart';

@HiveType(typeId: 0)
class Artificer extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? castingMod;

  @HiveField(2)
  int? ik;

  @HiveField(3)
  int? fog;

  @HiveField(4)
  List<dynamic>? spellSlots;

  Artificer(
      int level, int castingMod, int ik, int fog, List<dynamic> spellSlots) {
    this.level = 1;
    this.castingMod = -5;
    this.ik = 0;
    this.fog = 0;
    this.spellSlots = [
      [0, 0, 0, 0, 0],
      [2, 0, 0, 0, 0], //1
      [2, 0, 0, 0, 0], //2
      [3, 0, 0, 0, 0], //3
      [3, 0, 0, 0, 0], //4
      [4, 2, 0, 0, 0], //5
      [4, 2, 0, 0, 0], //6
      [4, 3, 0, 0, 0], //7
      [4, 3, 0, 0, 0], //8
      [4, 3, 2, 0, 0], //9
      [4, 3, 2, 0, 0], //10
      [4, 3, 3, 0, 0], //11
      [4, 3, 3, 0, 0], //12
      [4, 3, 3, 1, 0], //13
      [4, 3, 3, 1, 0], //14
      [4, 3, 3, 2, 0], //15
      [4, 3, 3, 2, 0], //16
      [4, 3, 3, 3, 1], //17
      [4, 3, 3, 3, 1], //18
      [4, 3, 3, 3, 1], //19
      [4, 3, 3, 3, 1], //20
    ];
  }
}

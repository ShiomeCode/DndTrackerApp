import 'package:hive/hive.dart';

part 'warlock.g.dart';

@HiveType(typeId: 11)
class Warlock extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  List<dynamic>? spellSlots;

  Warlock(int level, List<dynamic> spellSlots) {
    this.level = 1;
    this.spellSlots = [
      0,
      1,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      2,
      3,
      3,
      3,
      3,
      3,
      3,
      4,
      4,
      4,
      4
    ];
  }
}

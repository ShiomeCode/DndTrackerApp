import 'package:hive/hive.dart';

part 'barbarian.g.dart';

@HiveType(typeId: 1)
class Barbarian extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? rage;

  @HiveField(2)
  int? bc;

  @HiveField(3)
  int? ragedmg;

  Barbarian() {
    level = 1;
    rage = 2;
    bc = 0;
    ragedmg = 2;
  }
}

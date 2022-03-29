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

  Barbarian(int level, int rage, int bc) {
    this.level = 1;
    this.rage = 2;
    this.bc = 0;
  }
}

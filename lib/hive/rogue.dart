import 'package:hive/hive.dart';

part 'rogue.g.dart';

@HiveType(typeId: 9)
class Rogue extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? modi;

  @HiveField(2)
  int? sa;

  @HiveField(3)
  int? sol;

  Rogue(int level, int modi, int sa, int sol) {
    this.level = 1;
    this.modi = -5;
    this.sa = 1;
    this.sol = 1;
  }
}

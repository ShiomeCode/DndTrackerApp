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

  Rogue() {
    level = 1;
    modi = 0;
    sa = 1;
    sol = 1;
  }
}

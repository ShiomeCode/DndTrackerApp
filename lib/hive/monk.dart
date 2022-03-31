import 'package:hive/hive.dart';

part 'monk.g.dart';

@HiveType(typeId: 6)
class Monk extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? ki;

  @HiveField(2)
  int? kidc;

  @HiveField(3)
  int? um;

  Monk() {
    level = 1;
    ki = 0;
    kidc = 0;
    um = 0;
  }
}

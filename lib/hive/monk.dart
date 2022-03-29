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

  Monk(int level, int ki, int kidc, int um) {
    this.level = 1;
    this.ki = 0;
    this.kidc = 0;
    this.um = 0;
  }
}

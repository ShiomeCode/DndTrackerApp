import 'package:hive/hive.dart';

part 'fighter.g.dart';

@HiveType(typeId: 5)
class Fighter extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? sw;

  @HiveField(2)
  int? acs;

  @HiveField(3)
  int? ea;

  Fighter(int level, int sw, int acs, int ea) {
    this.level = 1;
    this.sw = 1;
    this.acs = 1;
    this.ea = 0;
  }
}

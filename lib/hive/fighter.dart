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

  @HiveField(4)
  int? ind;

  Fighter() {
    level = 1;
    sw = 1;
    acs = 1;
    ea = 0;
    ind = 1;
  }
}

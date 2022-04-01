import 'package:dndspelltrack/helpers/listgenerators.dart';
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
  List<int>? spellSlots;

  Artificer() {
    level = 1;
    castingMod = 0;
    ik = 0;
    fog = 1;
    spellSlots = halfcasterlevels[level ?? 0];
  }
}

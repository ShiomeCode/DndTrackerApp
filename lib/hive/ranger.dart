import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'ranger.g.dart';

@HiveType(typeId: 8)
class Ranger extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  List<int>? spellSlots;

  Ranger() {
    level = 1;
    spellSlots = halfcasterlevels[level ?? 0];
  }
}

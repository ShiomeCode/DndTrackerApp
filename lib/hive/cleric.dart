import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'cleric.g.dart';

@HiveType(typeId: 3)
class Cleric extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? cd;

  @HiveField(2)
  List<int>? spellSlots;

  Cleric() {
    level = 1;
    cd = 1;
    spellSlots = fullcasterlevels[level ?? 0];
  }
}

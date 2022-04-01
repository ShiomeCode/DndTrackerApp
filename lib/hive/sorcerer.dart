import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'sorcerer.g.dart';

@HiveType(typeId: 10)
class Sorcerer extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? sp;

  @HiveField(2)
  List<int>? spellSlots;

  Sorcerer() {
    level = 1;
    sp = 0;
    spellSlots = fullcasterlevels[level ?? 0];
  }
}

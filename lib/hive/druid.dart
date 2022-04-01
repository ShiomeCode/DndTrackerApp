import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'druid.g.dart';

@HiveType(typeId: 4)
class Druid extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? ws;

  @HiveField(2)
  List<int>? spellSlots;

  Druid() {
    level = 1;
    ws = 2;
    spellSlots = fullcasterlevels[level ?? 0];
  }
}

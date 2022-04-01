import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'wizard.g.dart';

@HiveType(typeId: 12)
class Wizard extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? ar;

  @HiveField(2)
  List<int>? spellSlots;

  Wizard() {
    level = 1;
    ar = 0;
    spellSlots = fullcasterlevels[level ?? 0];
  }
}

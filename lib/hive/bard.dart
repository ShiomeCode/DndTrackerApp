import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'bard.g.dart';

@HiveType(typeId: 2)
class Bard extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? bi;

  @HiveField(2)
  List<int>? spellSlots;

  Bard() {
    level = 1;
    bi = 0;
    spellSlots = fullcasterlevels[level ?? 0];
  }
}

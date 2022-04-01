import 'package:dndspelltrack/helpers/listgenerators.dart';
import 'package:hive/hive.dart';

part 'paladin.g.dart';

@HiveType(typeId: 7)
class Paladin extends HiveObject {
  @HiveField(0)
  int? level;

  @HiveField(1)
  int? cd;

  @HiveField(2)
  int? ds;

  @HiveField(3)
  int? loh;

  @HiveField(4)
  List<int>? spellSlots;

  Paladin() {
    level = 1;
    cd = 1;
    ds = 0;
    loh = 5;
    spellSlots = halfcasterlevels[level ?? 0];
  }
}

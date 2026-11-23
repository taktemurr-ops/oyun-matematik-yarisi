import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_matematik_yarisi/oyun_matematik_yarisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(matematikYarisiConfig.title.length, 33);
    expect(matematikYarisiConfig.tagline.length, 33);
    for (final s in matematikYarisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(matematikYarisiConfig.gameId, matematikYarisiId);
    expect(matematikYarisiRules.gameId, matematikYarisiId);
    expect(matematikYarisiConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(matematikYarisiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: matematikYarisiId, optionalMechanics: matematikYarisiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(matematikYarisiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pm_tugas_06_4243250005/main.dart';
import 'package:pm_tugas_06_4243250005/router/app_router.dart';
import 'package:pm_tugas_06_4243250005/state/favorite_store.dart';

void main() {
  testWidgets('list adapts its grid and navigation to screen width', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    favoriteStore.reset();
    appRouter.go('/');
    await tester.pumpWidget(const JelajahSumutApp());
    await tester.pumpAndSettle();

    expect(find.text('Cerita indah dimulai di sini'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    _expectGridColumns(tester, 1);

    appRouter.go('/destinasi/danau-toba');
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('detail-vertical')), findsOneWidget);

    appRouter.go('/');
    await tester.pumpAndSettle();
    tester.view.physicalSize = const Size(800, 1024);
    await tester.pumpAndSettle();
    _expectGridColumns(tester, 2);

    tester.view.physicalSize = const Size(1280, 900);
    await tester.pumpAndSettle();
    expect(find.byType(NavigationRail), findsOneWidget);
    _expectGridColumns(tester, 3);

    appRouter.go('/destinasi/danau-toba');
    await tester.pumpAndSettle();
    expect(find.text('Danau Toba'), findsOneWidget);
    expect(find.text('Tentang tempat ini'), findsOneWidget);
    expect(find.byKey(const ValueKey('detail-horizontal')), findsOneWidget);

    appRouter.go('/destinasi/id-tidak-ada');
    await tester.pumpAndSettle();
    expect(find.text('Destinasi tidak ditemukan'), findsOneWidget);
    expect(find.textContaining('id-tidak-ada'), findsOneWidget);
  });

  testWidgets('a destination can be saved and appears in favorites', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(390, 844);
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    favoriteStore.reset();
    appRouter.go('/destinasi/istana-maimun');
    await tester.pumpWidget(const JelajahSumutApp());
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Simpan ke favorit'));
    await tester.pumpAndSettle();
    expect(favoriteStore.contains('istana-maimun'), isTrue);

    await tester.tap(find.text('Favorit'));
    await tester.pumpAndSettle();
    expect(find.text('Destinasi favorit'), findsOneWidget);
    expect(find.text('Istana Maimun'), findsOneWidget);
  });
}

void _expectGridColumns(WidgetTester tester, int columns) {
  final grid = tester.widget<SliverGrid>(find.byType(SliverGrid).first);
  final delegate =
      grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
  expect(delegate.crossAxisCount, columns);
}

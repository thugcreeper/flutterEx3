import 'package:flutter/material.dart';
import '../model/site.dart';

//使用inheritedWidget讓widget tree可以共享資訊，避免不同頁面有不同行為與傳入參數的問題
class FavoriteProvider extends InheritedWidget {
  final List<Site> favoriteSites;
  final Function(Site) toggleFavorite;

  const FavoriteProvider({
    super.key,
    required this.favoriteSites,
    required this.toggleFavorite,
    required super.child,
  });

  static FavoriteProvider of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<FavoriteProvider>();
    assert(result != null, 'No FavoriteProvider found in context');
    return result!;
  }

  bool isFavorite(Site site) => favoriteSites.contains(site);

  @override
  bool updateShouldNotify(FavoriteProvider oldWidget) {
    return favoriteSites != oldWidget.favoriteSites;
  }
}

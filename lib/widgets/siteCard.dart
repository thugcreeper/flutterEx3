//景點卡片，外觀只包含圖片與名稱，點擊圖片會前往詳細頁面，收藏的景點也使用此widget
import 'package:flutter/material.dart';
import '../model/site.dart';
import '../pages/siteDetailPage.dart';

class SiteCard extends StatelessWidget {
  final Site site;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final bool Function(Site)? isFavoriteForSite;
  final Function(Site)? onToggleFavoriteForSite;
  final VoidCallback? onTap;

  const SiteCard({
    super.key,
    required this.site,
    required this.isFavorite,
    required this.onToggleFavorite,
    this.isFavoriteForSite,
    this.onToggleFavoriteForSite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            //收藏的景點可以點及圖片前往詳細葉面
            child: GestureDetector(
              onTap:
                  onTap ??
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        settings: const RouteSettings(name: '/site-detail'),
                        builder: (context) => SiteDetailPage(
                          site: site,
                          isFavorite: isFavorite,
                          onToggleFavorite: onToggleFavorite,
                          isFavoriteForSite: isFavoriteForSite,
                          onToggleFavoriteForSite: onToggleFavoriteForSite,
                        ),
                      ),
                    );
                  },
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                //找不到就用範例圖片
                child: Image.network(
                  site.imageUrl ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyjidfyUc5wxz5Wcy_gFcDHLiiALXblri48A&s',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            flex: 1,
            child: Text(
              site.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

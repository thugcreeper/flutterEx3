//儲存收藏景點，用gridView顯示 每個景點預覽只放圖片與名稱，點擊後顯示詳細資訊
import 'package:flutter/material.dart';
import '../model/site.dart';
import 'siteDetailPage.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteSite extends StatelessWidget {
  final List<Site> favoriteSites;

  const FavoriteSite({super.key, required this.favoriteSites});

  @override
  Widget build(BuildContext context) {
    if (favoriteSites.isEmpty) {
      return Center(
        child: InkWell(
          onTap: () {
            //maybeOf 取得最近的 DefaultTabController
            final tabController = DefaultTabController.maybeOf(context);
            if (tabController != null) {
              // 切到尋找更多分頁
              tabController.animateTo(0);
              return;
            }
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
          child: Column(
            mainAxisAlignment: .center,
            children: [
              SvgPicture.asset(
                'assets/icons/dead_face_emoji.svg',
                width: 100,
                height: 100,
              ),
              Text(
                '尚未加入任何收藏景點!',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 103, 103, 103),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: favoriteSites.length,
      itemBuilder: (context, index) {
        final site = favoriteSites[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                //收藏的景點可以點及圖片前往詳細葉面
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SiteDetailPage(
                          site: site,
                          isFavorite: true,
                          onToggleFavorite: () {},
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//儲存收藏景點，用gridView顯示 每個景點預覽只放圖片與名稱，點擊後顯示詳細資訊
import 'package:flutter/material.dart';
import '../model/site.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'siteCard.dart';

class FavoriteSite extends StatelessWidget {
  final List<Site> favoriteSites;
  final Function(Site) onToggleFavorite;
  final bool Function(Site) isFavorite;

  const FavoriteSite({
    super.key,
    required this.favoriteSites,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

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
          //沒有加入任何景點時顯示文字與svg
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
    //用gridVoew顯示景點卡片，每行兩個，卡片內容為圖片與名稱，點擊圖片可以前往詳細頁面
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
        return SiteCard(
          site: site,
          isFavorite: isFavorite(site),
          onToggleFavorite: () => onToggleFavorite(site),
          isFavoriteForSite: isFavorite,
          onToggleFavoriteForSite: onToggleFavorite,
        );
      },
    );
  }
}

//排行榜頁面
import 'package:flutter/material.dart';

import '../model/site.dart';
import 'siteDetailPage.dart';

// 第三個主頁籤：排行榜頁，內含「熱門」與「秘境」兩個子分頁。
class RankingPage extends StatelessWidget {
  final List<Site> popularSites;
  final List<Site> secretSites;
  final bool Function(Site) isFavorite;
  final Function(Site) onToggleFavorite;

  const RankingPage({
    super.key,
    required this.popularSites,
    required this.secretSites,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          // 子分頁標籤列。
          const Material(
            color: Colors.transparent,
            child: TabBar(
              tabs: [
                Tab(text: '熱門排行'),
                Tab(text: '秘境排行'),
              ],
            ),
          ),
          Expanded(
            // 兩個排行榜清單共用同一個列表元件，僅替換資料與分數文案。
            child: TabBarView(
              children: [
                _RankingList(
                  sites: popularSites,
                  scoreLabelBuilder: (site) => '人氣指數 ${site.famousLevel}',
                  isFavorite: isFavorite,
                  onToggleFavorite: onToggleFavorite,
                ),
                _RankingList(
                  sites: secretSites,
                  scoreLabelBuilder: (site) => '秘境指數 ${site.secretLevel}',
                  isFavorite: isFavorite,
                  onToggleFavorite: onToggleFavorite,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 排行清單的可重用元件，負責顯示名次、收藏切換與導頁。
class _RankingList extends StatelessWidget {
  final List<Site> sites;
  final String Function(Site) scoreLabelBuilder;
  final bool Function(Site) isFavorite;
  final Function(Site) onToggleFavorite;

  const _RankingList({
    required this.sites,
    required this.scoreLabelBuilder,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: sites.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final site = sites[index];
        final rank = index + 1;
        final favorite = isFavorite(site);

        return Card(
          elevation: 1,
          child: ListTile(
            leading: CircleAvatar(child: Text('$rank')),
            title: Text('${site.countryFlag} ${site.name}'),
            subtitle: Text(scoreLabelBuilder(site)),
            trailing: IconButton(
              onPressed: () => onToggleFavorite(site),
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: favorite ? Colors.red : null,
              ),
            ),
            // 點擊排行項目可直接進景點詳細頁，並沿用同一份收藏狀態來源。
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  settings: const RouteSettings(name: '/site-detail'),
                  builder: (_) => SiteDetailPage(
                    site: site,
                    isFavorite: favorite,
                    onToggleFavorite: () => onToggleFavorite(site),
                    isFavoriteForSite: isFavorite,
                    onToggleFavoriteForSite: onToggleFavorite,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

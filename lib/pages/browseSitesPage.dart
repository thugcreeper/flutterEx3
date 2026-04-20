//這是瀏覽景點的頁面
import 'package:flutter/material.dart';
import '../model/site.dart';
import '../widgets/siteTile.dart';

class BrowseSitesPage extends StatelessWidget {
  final List<String> allTags;
  final String? selectedTag;
  final Function(String?) onTagChanged;
  final List<Site> filteredSites;
  final List<Site> favoriteSites;
  final Function(Site) onToggleFavorite;

  const BrowseSitesPage({
    super.key,
    required this.allTags,
    required this.selectedTag,
    required this.onTagChanged,
    required this.filteredSites,
    required this.favoriteSites,
    required this.onToggleFavorite,
  });

  bool _isFavorite(Site site) => favoriteSites.contains(site);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //標籤篩選列（大洲、主題）
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: const Text('全部'),
                  selected: selectedTag == null,
                  onSelected: (_) {
                    onTagChanged(null);
                  },
                ),
                const SizedBox(width: 8),
                ...allTags.map((tag) {
                  final isSelected = selectedTag == tag;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(tag),
                      selected: isSelected,
                      onSelected: (_) {
                        onTagChanged(isSelected ? null : tag);
                      },
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
        //這裡是顯示篩選後景點的列表
        Expanded(
          child: filteredSites.isEmpty
              ? Center(
                  child: Text(
                    '沒有符合這個標籤的景點',
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: filteredSites.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4),
                  itemBuilder: (context, index) {
                    final site = filteredSites[index];
                    return SiteTile(
                      site: site,
                      isFavorite: _isFavorite(site),
                      onToggleFavorite: () => onToggleFavorite(site),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

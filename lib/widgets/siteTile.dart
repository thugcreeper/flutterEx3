import 'package:flutter/material.dart';
import '../model/site.dart';
import 'addSiteBtn.dart';
import '../pages/siteDetailPage.dart';

class SiteTile extends StatelessWidget {
  final Site site;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback? onTap;

  const SiteTile({
    super.key,
    required this.site,
    required this.isFavorite,
    required this.onToggleFavorite,
    this.onTap,
  });

  Widget _buildStars(int count) {
    final filled = count.clamp(0, 5);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(filled, (_) {
          return const Text(
            '⭐',
            style: TextStyle(fontSize: 16, color: Colors.amber),
          );
        }),
      ],
    );
  }

  //秘境程度，根據高低顯示對應的emoji，最多 9 級
  //低到高:😇 😏 😐 😰 😭 😵‍💫 💀 👻 👽
  Widget _buildFootprints(int value) {
    List<String> emojis = [
      '',
      '😇', //熱門景點、容易抵達，有多種交通方式
      '😏', //也是熱門景點
      '😐', //不算太熱門，但還算容易前往
      '😰', //可以抵達但位置較偏僻
      '😭', //不容易前往且位置非常偏僻
      '😵‍💫', //很難前往或是有管制，人煙稀少地區
      '💀', //更少人知道的地方且非常難抵達的冷門或是非常危險的地區
      '👻', //基本上一般人不會想去，或是地理條件的要求很高
      '👽', //只有極少數人才"有機會"能前往、環境本身非常嚴苛，且該地點非常冷門
    ];
    //clamp確保value在1到9之間
    final filled = value.clamp(1, 9);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Text(emojis[filled], style: const TextStyle(fontSize: 20))],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double tagTextSize = 18;
    final double titleFontSize = 24;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SiteDetailPage(
                site: site,
                isFavorite: isFavorite,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 163, 202, 226),
                Color.fromARGB(255, 112, 172, 209),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 國旗
                    Text(
                      site.countryFlag,
                      style: const TextStyle(fontSize: 50),
                    ),
                    const SizedBox(width: 12),
                    // 名稱
                    Expanded(
                      child: Text(
                        site.name,
                        style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // 星星 + 腳印靠右
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('人氣度', style: TextStyle(fontSize: 16)),
                            const SizedBox(width: 4),
                            _buildStars(site.famousLevel),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('秘境度', style: TextStyle(fontSize: 16)),
                            const SizedBox(width: 4),
                            _buildFootprints(site.secretLevel),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                if (site.tags.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: site.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCEFFC),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            '#$tag',
                            style: TextStyle(
                              fontSize: tagTextSize,
                              color: const Color(0xFF1F5F8B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],

                //加入收藏按鈕
                const SizedBox(height: 10),
                AddSiteBtn(isFavorite: isFavorite, onPressed: onToggleFavorite),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

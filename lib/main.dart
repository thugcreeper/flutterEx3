import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'model/site.dart';
import 'widgets/siteTile.dart';
import 'widgets/favoriteSite.dart';
import 'pages/landingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter hw3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF42A5F5)),
        //景點list後方背景顏色
        scaffoldBackgroundColor: const Color.fromARGB(255, 107, 198, 183),
        useMaterial3: true,
      ),
      // 在入口注入「開始使用」導頁行為，避免 LandingPage 與首頁互相匯入。
      home: LandingPage(
        //onStart是一個函式，當按下開始使用按鈕時會被呼叫
        onStart: (context) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const MyHomePage(title: '個人旅遊景點介紹'),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Site> _favoriteSites = [];
  String? _selectedTag;

  static const List<String> _continentTagOrder = [
    '亞洲',
    '歐洲',
    '北美洲',
    '南美洲',
    '大洋洲',
    '非洲',
    '南極洲',
  ];

  bool _isFavorite(Site site) => _favoriteSites.contains(site);
  //篩選tag
  List<String> get _allTags {
    final tags = <String>{};
    for (final site in Sites) {
      tags.addAll(site.tags);
    }
    final result = tags.toList();
    /*a b是兩個tag，先找出他們在_continentTagOrder裡面的index，如果有一個tag不在裡面，
    就把他排在後面，如果兩個tag都在裡面，就按照他們的index排序，如果兩個tag都不在裡面，就按照字母順序排序
    ，確保大洲的tag會按照亞洲、歐洲、北美洲、南美洲、大洋洲、非洲、南極洲的順序顯示，其他tag會按照字母順序顯示
    */
    result.sort((a, b) {
      final aIndex = _continentTagOrder.indexOf(a);
      final bIndex = _continentTagOrder.indexOf(b);

      if (aIndex != -1 || bIndex != -1) {
        if (aIndex == -1) return 1;
        if (bIndex == -1) return -1;
        return aIndex.compareTo(bIndex);
      }

      return a.compareTo(b);
    });
    return result;
  }

  List<Site> get _filteredSites {
    if (_selectedTag == null) {
      return Sites;
    }

    return Sites.where((site) => site.tags.contains(_selectedTag)).toList();
  }

  void _toggleFavorite(Site site) {
    final alreadyFavorite = _favoriteSites.contains(site);

    setState(() {
      if (alreadyFavorite) {
        _favoriteSites.remove(site);
      } else {
        _favoriteSites.add(site);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.primary,
            indicatorWeight: 3,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                icon: SvgPicture.asset(
                  'assets/icons/map_search.svg',
                  width: 20,
                  height: 20,
                ),
                text: '尋找更多',
              ),
              Tab(
                icon: SvgPicture.asset(
                  'assets/icons/map_pin_heart.svg',
                  width: 20,
                  height: 20,
                ),
                text: '已收藏',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        FilterChip(
                          label: const Text('全部'),
                          selected: _selectedTag == null,
                          onSelected: (_) {
                            setState(() {
                              _selectedTag = null;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                        ..._allTags.map((tag) {
                          final isSelected = _selectedTag == tag;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterChip(
                              label: Text(tag),
                              selected: isSelected,
                              onSelected: (_) {
                                setState(() {
                                  _selectedTag = isSelected ? null : tag;
                                });
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _filteredSites.isEmpty
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
                          itemCount: _filteredSites.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemBuilder: (context, index) {
                            final site = _filteredSites[index];
                            return SiteTile(
                              site: site,
                              isFavorite: _isFavorite(site),
                              onToggleFavorite: () => _toggleFavorite(site),
                            );
                          },
                        ),
                ),
              ],
            ),
            FavoriteSite(favoriteSites: _favoriteSites),
          ],
        ),
      ),
    );
  }
}

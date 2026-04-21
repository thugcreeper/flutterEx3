import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'model/site.dart';
import 'widgets/favoriteSite.dart';
import 'pages/landingPage.dart';
import 'pages/browseSitesPage.dart';
import 'pages/rankingPage.dart';
import 'service/playBGM.dart';
import '../data/siteData.dart';
import 'data/rankingData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //進入主頁面後開始撥放音樂
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    PlayBgmService.instance.start();
    // 啟動後補一次保險恢復，避免部分裝置首次啟動未出聲。
    PlayBgmService.instance.onAppResumed();
  }

  //當應用程式進入背景或回到前景時，暫停或繼續撥放音樂
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('AppLifecycle changed: $state');
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        PlayBgmService.instance.onAppPaused();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        PlayBgmService.instance.onAppResumed();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  //在應用程式結束前釋放資源，停止背景音樂
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    PlayBgmService.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //不要顯示debug標誌
      debugShowCheckedModeBanner: false,
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
              settings: const RouteSettings(name: MyHomePage.routeName),
              builder: (_) => const MyHomePage(title: '個人旅遊景點介紹'),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const String routeName = '/home';

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
    for (final site in siteForBrowse) {
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
      return siteForBrowse;
    }

    return siteForBrowse
        .where((site) => site.tags.contains(_selectedTag))
        .toList();
  }

  // 由資料層提供排序結果，首頁僅負責組裝畫面。
  List<Site> get _popularRanking => RankingData.popularRanking(siteForBrowse);

  List<Site> get _secretRanking => RankingData.secretRanking(siteForBrowse);

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
    //tabController是用來控制TabBar和TabBarView的，當我們在FavoriteSite頁面按下尋找更多按鈕時，
    //可以透過tabController切換到尋找更多頁面
    return DefaultTabController(
      length: 3,
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
              // 第三個主分頁：排行榜。
              const Tab(icon: Icon(Icons.leaderboard_outlined), text: '排行榜'),
            ],
          ),
        ),
        //TabBarView 對應上方 TabBar 的兩個頁籤（尋找更多、已收藏）
        //children[0] 是「尋找更多」頁面，顯示所有景點並支援篩選
        //children[1] 是「已收藏」頁面，顯示使用者收藏的景點
        body: TabBarView(
          children: [
            //第一個頁籤：尋找更多景點
            BrowseSitesPage(
              allTags: _allTags,
              selectedTag: _selectedTag,
              onTagChanged: (tag) {
                setState(() {
                  _selectedTag = tag;
                });
              },
              filteredSites: _filteredSites,
              favoriteSites: _favoriteSites,
              onToggleFavorite: _toggleFavorite,
            ),
            //第二個頁籤：已收藏的景點
            FavoriteSite(
              favoriteSites: _favoriteSites,
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
            RankingPage(
              popularSites: _popularRanking,
              secretSites: _secretRanking,
              isFavorite: _isFavorite,
              onToggleFavorite: _toggleFavorite,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';
import 'package:flutter_hw3/main.dart';

import '../data/siteData.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/site.dart';
import '../widgets/addSiteBtn.dart';
import '../widgets/siteCard.dart';

class SiteDetailPage extends StatefulWidget {
  final Site site;
  final double titleFontSize;
  final double tagFontSize;
  final double infoLabelFontSize;
  final double descriptionTitleFontSize;
  final double descriptionBodyFontSize;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final bool Function(Site)? isFavoriteForSite;
  final Function(Site)? onToggleFavoriteForSite;

  const SiteDetailPage({
    super.key,
    required this.site,
    required this.isFavorite,
    required this.onToggleFavorite,
    this.isFavoriteForSite,
    this.onToggleFavoriteForSite,
    this.titleFontSize = 30, //景點名稱的字體大小
    this.tagFontSize = 18, //hashtag的字體大小
    this.infoLabelFontSize = 20, //下方人氣程度、秘境程度、地點的字體大小
    this.descriptionTitleFontSize = 24, //景點簡介的字體大小
    this.descriptionBodyFontSize = 17, //景點簡介內容的字體大小
  });

  @override
  State<SiteDetailPage> createState() => _SiteDetailPageState();
}

class _SiteDetailPageState extends State<SiteDetailPage> {
  List<Site> _recommendedSites = const [];

  //每次進入詳細頁都會隨機推薦5個其他景點
  @override
  void initState() {
    super.initState();
    _recommendedSites = _pickRecommendedSites();
  }

  List<Site> _pickRecommendedSites() {
    //將當前景點以外的都先加入
    List<Site> candidates = siteForBrowse
        .where((site) => site != widget.site)
        .toList();
    //打亂
    candidates.shuffle(Random());
    //若長度大於5就抓5個，否則全抓
    return candidates.length > 5 ? candidates.sublist(0, 5) : candidates;
  }

  void _showImageDialog(BuildContext context) {
    if (widget.site.imageUrl == null) return;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        //景點圖片，點擊後會用ctrl+滑鼠可以縮放
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: InteractiveViewer(
            minScale: 0.8,
            maxScale: 5.0,
            boundaryMargin: const EdgeInsets.all(20),
            child: Image.network(
              widget.site.imageUrl!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  child: const Icon(Icons.broken_image_outlined, size: 64),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openMap(BuildContext context) async {
    final mapUris = _buildMapUris();
    if (mapUris.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('目前沒有可用的地圖連結或地址資訊')));
      return;
    }

    final uri = mapUris.first;
    final launchModes = [
      LaunchMode.externalApplication,
      LaunchMode.platformDefault,
      LaunchMode.inAppBrowserView,
    ];

    var launched = false;

    for (final mode in launchModes) {
      try {
        final canLaunch = await canLaunchUrl(uri);
        if (!canLaunch) {
          continue;
        }

        final result = await launchUrl(uri, mode: mode);
        if (result) {
          launched = true;
          break;
        }
      } catch (_) {
        continue;
      }
    }

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('無法開啟地圖')));
    }
  }

  List<Uri> _buildMapUris() {
    if (widget.site.mapUrl != null && widget.site.mapUrl!.trim().isNotEmpty) {
      try {
        return [Uri.parse(widget.site.mapUrl!)];
      } catch (_) {
        return const [];
      }
    }

    if (widget.site.address != null && widget.site.address!.trim().isNotEmpty) {
      final encodedAddress = Uri.encodeComponent(widget.site.address!.trim());
      return [
        Uri.parse(
          'https://www.google.com/maps/search/?api=1&query=$encodedAddress',
        ),
      ];
    }

    return const [];
  }

  @override
  Widget build(BuildContext context) {
    final effectiveIsFavorite =
        widget.isFavoriteForSite?.call(widget.site) ?? widget.isFavorite;

    final infoCardData = [
      {
        'title': '人氣程度',
        'value': '${widget.site.famousLevel}',
        'icon': Icons.local_fire_department_outlined,
      },
      {
        'title': '秘境程度',
        'value': '${widget.site.secretLevel}',
        'icon': Icons.hiking_outlined,
      },
      {
        'title': '地點',
        'value': widget.site.address ?? '尚未提供地址資訊',
        'icon': Icons.place_outlined,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        // leading 放返回按鈕
        leading: const BackButton(),
        //actions放在title後方，home 放到 actions
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              final navigator = Navigator.of(context);
              var foundHome = false;
              //popuntil會一直pop直到找到MyHomePage.routeName或者到達第一個route，
              //如果找到MyHomePage.routeName就停下來，如果沒找到就停在第一個route，
              //避免只用push導致已收藏景點狀態沒更新
              navigator.popUntil((route) {
                if (route.settings.name == MyHomePage.routeName) {
                  foundHome = true;
                  return true;
                }
                return route.isFirst;
              });

              if (!foundHome) {
                navigator.pushReplacement(
                  MaterialPageRoute(
                    settings: const RouteSettings(name: MyHomePage.routeName),
                    builder: (_) => const MyHomePage(title: '個人旅遊景點介紹'),
                  ),
                );
              }
            },
          ),
        ],
        title: Text('${widget.site.name}的詳細資訊'),
        backgroundColor: Color(0xFF42A5F5),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.site.countryFlag} ${widget.site.name}',
                    style: TextStyle(
                      fontSize: widget.titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (widget.site.tags.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.site.tags.map(_buildTagChip).toList(),
                    ),
                  ],
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => _showImageDialog(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: SizedBox(
                        height: 220,
                        width: double.infinity,
                        child: widget.site.imageUrl != null
                            ? Image.network(
                                widget.site.imageUrl!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return _buildImageFallback();
                                },
                              )
                            : _buildImageFallback(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildDescriptionSection(), //景點簡介
                  const SizedBox(height: 14),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: infoCardData.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final data = infoCardData[index];
                      return _buildInfoCard(
                        title: data['title'] as String,
                        value: data['value'] as String,
                        icon: data['icon'] as IconData,
                      );
                    },
                  ),
                  const SizedBox(height: 14),
                  AddSiteBtn(
                    isFavorite: effectiveIsFavorite,
                    onPressed: widget.onToggleFavoriteForSite != null
                        ? () => widget.onToggleFavoriteForSite!(widget.site)
                        : widget.onToggleFavorite,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    '您可能感興趣...',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _recommendedSites
                          .map(
                            (recommendedSite) => Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SizedBox(
                                width: 200,
                                height: 210,
                                child: SiteCard(
                                  site: recommendedSite,
                                  isFavorite:
                                      widget.isFavoriteForSite?.call(
                                        recommendedSite,
                                      ) ??
                                      false,
                                  onToggleFavorite: () {
                                    if (widget.onToggleFavoriteForSite !=
                                        null) {
                                      widget.onToggleFavoriteForSite!(
                                        recommendedSite,
                                      );
                                    }
                                  },
                                  isFavoriteForSite: widget.isFavoriteForSite,
                                  onToggleFavoriteForSite:
                                      widget.onToggleFavoriteForSite,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () => _openMap(context),
                icon: const Icon(Icons.map_outlined),
                label: const Text(
                  '在 Google Maps 開啟',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageFallback() {
    return Container(
      color: Colors.blueGrey.shade100,
      alignment: Alignment.center,
      child: Icon(
        Icons.photo_outlined,
        size: 64,
        color: Colors.blueGrey.shade400,
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: widget.infoLabelFontSize,
                      color: Colors.blueGrey.shade900,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: TextStyle(
                      color: Colors.blueGrey.shade800,
                      fontSize: widget.infoLabelFontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    final description = _normalizedDescription(
      widget.site.description ?? '目前沒有詳細介紹',
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFF5F8FC),
        border: Border.all(color: const Color(0xFFD9E4F2)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_stories_outlined, color: Color(0xFF315C8A)),
              const SizedBox(width: 8),
              Text(
                '景點簡介',
                style: TextStyle(
                  fontSize: widget.descriptionTitleFontSize,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E3A5F),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: widget.descriptionBodyFontSize,
              height: 1.6,
              color: const Color(0xFF2F445C),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // 將多行描述文本轉換為段落，並去除多餘的空白
  String _normalizedDescription(String text) {
    final paragraphs = text
        .replaceAll('\r\n', '\n')
        .trim()
        .split(RegExp(r'\n\s*\n+'))
        .map(
          (paragraph) => paragraph
              .split('\n')
              .map((line) => line.trim())
              .where((line) => line.isNotEmpty)
              .join(' '),
        )
        .where((paragraph) => paragraph.isNotEmpty)
        .toList();

    return paragraphs.join('\n\n');
  }

  Widget _buildTagChip(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFDCEFFC),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '#$tag',
        style: TextStyle(
          fontSize: widget.tagFontSize,
          color: Color(0xFF1F5F8B),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

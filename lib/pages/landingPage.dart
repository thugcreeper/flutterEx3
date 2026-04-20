//進入主頁面前的頁面
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final void Function(BuildContext context) onStart;

  const LandingPage({super.key, required this.onStart});

  void _showUsageGuide(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('使用說明'),
          content: const SingleChildScrollView(
            child: Text(
              '1. 點選「開始使用」進入景點清單。\n'
              '2. 可使用上方標籤篩選不同主題與洲別。\n'
              '3. 點景點可看詳細資訊，並可加入收藏。\n\n'
              '【秘境程度】\n'
              '😇:熱門景點、容易抵達\n'
              '😏:熱門但交通稍少\n'
              '😐:缺少大眾運輸，較不方便\n'
              '😰:偏僻，但還不算很難抵達\n'
              '😭:很偏僻，抵達難度較高\n'
              '😵‍💫:難以抵達，且不是想去就能去\n'
              '💀:極冷門/危險\n'
              '👻:幾乎沒人去\n'
              '👽:極端秘境，只給有緣人',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('了解'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.primary.withOpacity(0.9),
              color.secondary.withOpacity(0.7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.public, size: 64, color: Colors.white),
                const SizedBox(height: 16),

                Text(
                  'Site Explorer',
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '探索世界的隱藏角落',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => onStart(context),
                    label: const Text('開始探索'),
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showUsageGuide(context),
                    icon: const Icon(Icons.help_outline),
                    label: const Text('使用說明'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white70),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddSiteBtn extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isFavorite;

  const AddSiteBtn({Key? key, required this.onPressed, this.isFavorite = false})
    : super(key: key);

  @override
  State<AddSiteBtn> createState() => _AddSiteBtnState();
}

class _AddSiteBtnState extends State<AddSiteBtn> {
  late bool _localIsFavorite; //用late是因為在initState裡面才會給值，這樣就不會有null的問題
  final int snackBarTextSize = 24;
  @override
  void initState() {
    super.initState();
    _localIsFavorite = widget.isFavorite;
  }

  @override
  void didUpdateWidget(AddSiteBtn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isFavorite != widget.isFavorite) {
      _localIsFavorite = widget.isFavorite;
    }
  }

  void _handleToggle() {
    // 記錄這次操作是加入還是取消收藏
    final wasAdded = !_localIsFavorite;

    // 立即更新本地狀態，顯示 UI 變化
    setState(() {
      _localIsFavorite = !_localIsFavorite;
    });

    // 顯示 SnackBar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (wasAdded) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '已加入收藏',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: snackBarTextSize.toDouble(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red.shade400, Colors.red.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '已取消收藏',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: snackBarTextSize.toDouble(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
      );
    }

    // 調用上層回調，讓上層也更新狀態
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.tonalIcon(
        onPressed: _handleToggle,
        icon: Icon(
          _localIsFavorite ? Icons.favorite : Icons.favorite_border,
          size: 20,
        ),
        label: Text(
          _localIsFavorite ? '取消收藏' : '加入收藏',
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        style: FilledButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 212, 214, 255),
          foregroundColor: _localIsFavorite
              ? Colors.red.shade600
              : const Color.fromARGB(255, 55, 32, 123),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

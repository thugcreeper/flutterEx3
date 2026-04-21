import '../model/site.dart';

// 集中管理排行榜資料排序邏輯，避免 UI 頁面混入商業規則。
class RankingData {
  RankingData._();

  // 熱門排行：先依人氣，再以秘境分數作為同分時的次排序。
  //compareTo 會回傳負數、0、正數，分別代表 this 小於、等於、大於 other
  static List<Site> popularRanking(List<Site> sites) {
    final sorted = List<Site>.from(sites);
    sorted.sort((a, b) {
      final byFamous = b.famousLevel.compareTo(a.famousLevel);
      //人氣分數不同就直接排序，人氣分數相同才比較秘境程度
      if (byFamous != 0) {
        return byFamous;
      }
      //人氣分數相同，秘境程度低的排前面
      return a.secretLevel.compareTo(b.secretLevel);
    });
    return sorted;
  }

  // 秘境排行：先依秘境程度，再以人氣分數作為同分時的次排序。
  static List<Site> secretRanking(List<Site> sites) {
    final sorted = List<Site>.from(sites);
    sorted.sort((a, b) {
      final bySecret = b.secretLevel.compareTo(a.secretLevel);
      if (bySecret != 0) {
        return bySecret;
      }
      //熱門程度低的排更後面，因為同樣是秘境，人氣越高的代表越多人知道，就不算真正的秘境了
      return a.famousLevel.compareTo(b.famousLevel);
    });
    return sorted;
  }
}

//這裡存放景點資料
import '../model/site.dart';

//famousLevel最多 5 secretlevel最多9
const List<Site> siteForBrowse = [
  Site(
    name: '基隆嶼',
    countryFlag: '🇹🇼',
    secretLevel: 5,
    famousLevel: 5,
    tags: ['亞洲', '離島', '登島', '看海', '台灣'],
    description: '''基隆嶼（雞籠杙）是位於基隆東北方外海的無人火山島，有「臺灣龍珠」之美譽，
      以珍貴火成岩地質、火山景觀及每年4-10月（季節限定）的登島旅遊聞名。島上設
      有濱海及登山步道，可觀賞野百合（5-6月）與金花石蒜（8-9月）。需事先透過預
      約名額登島，每日限量1,200人''',
    imageUrl:
        'https://blog.tripbaa.com/wp-content/uploads/2025/06/%E5%9F%BA%E9%9A%86%E5%B6%BC%E7%87%88%E5%A1%94%E6%AD%A5%E9%81%93%EF%BC%8D%E7%99%BB%E9%A0%82%E6%88%90%E5%8A%9F.jpg',
    mapUrl: 'https://maps.app.goo.gl/9mzyZ87JEi21DKsdA',
    address: '基隆嶼, 基隆市, 台灣',
  ),
  Site(
    name: '谷關發電廠吊橋遺址',
    countryFlag: '🇹🇼',
    secretLevel: 4,
    famousLevel: 3,
    tags: ['亞洲', '遺址', '秘境', '山區', '台灣'],
    description: '''谷關發電廠吊橋遺址（又稱紅色牌樓遺跡）位於大甲溪畔，是日治時期（1931年）興建的發電廠舊址，
        因921地震與颱風沖毀而廢棄。其醒目的紅色中式牌樓屹立於山壁，現為前往馬陵溫泉的著名「秘境」打卡景點，
        屬枯水期限定的溯溪登山路線。 ''',
    imageUrl:
        'https://service.taipower.com.tw/Collection/media/aeqoyua1/2001%E5%B9%B4%E6%A1%83%E8%8A%9D%E9%A2%A8%E7%81%BD%E7%9A%84%E8%B0%B7%E9%97%9C%E7%99%BC%E9%9B%BB%E5%BB%A0%E5%BB%A0%E6%88%BF%E6%B4%9E%E5%8F%A3.jpg',
    mapUrl: 'https://maps.app.goo.gl/ERJsbC1gCur47Asy9',
    address: '台中市和平區中橫公路谷關管制站後',
  ),
  Site(
    name: '枋野火車站',
    countryFlag: '🇹🇼',
    secretLevel: 6,
    famousLevel: 1,
    tags: ['亞洲', '秘境', '車站', '鐵道', '台灣'],
    description: '''枋野車站（又稱枋野號誌站）位於屏東縣獅子鄉，是台鐵南迴線上極具神祕色彩的「祕境車站」。
        它雖然在台鐵編制中屬於三等站，但主要功能並非載客，而是確保南迴鐵路的行車安全。 ''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEShRjQ4VGY48nLZXjwi8-Yvn61fia9DsL7g&s',
    mapUrl: 'https://maps.app.goo.gl/i5JnrvSnDYYRwuYZA',
    address: '屏東縣獅子鄉屏147-1鄉道',
  ),
  Site(
    name: '澎湖',
    countryFlag: '🇹🇼',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '海島', '夏天', '台灣'],
    description: '''澎湖群島位於台灣西部外海，由90多個島嶼組成，以其獨特的玄武岩地形、清澈海水和豐富的海洋生態聞名。
        澎湖的熱門景點包括七美雙心石滬、吉貝沙尾、馬公市區的天后宮以及每年夏季舉辦的花火節。''',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/e/e9/Penghu_201506.jpg',
    mapUrl: 'https://maps.app.goo.gl/aLV5SBDmqLhLmLsC9',
    address: '澎湖縣, 台灣',
  ),
  Site(
    name: '后豐鐵馬道',
    countryFlag: '🇹🇼',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '單車', '休閒', '親子', '台灣'],
    description: '''后豐鐵馬道是台中市著名的自行車道，沿著舊鐵路路線建造，串聯了后里和豐原兩個地區。
        鐵馬道全長約4.5公里，沿途經過美麗的花海、綠樹成蔭的路段以及歷史悠久的鐵橋，是騎行和散步的絕佳選擇。''',
    imageUrl:
        'https://taichung.travel/content/images/articles/55183/1024x768_articles-image-yja5z65is0autvtyabbgsa.jpg',
    mapUrl: 'https://maps.app.goo.gl/GAdqgt8gA58j47Y9A',
    address: '臺中市豐原區國豐路三段',
  ),
  Site(
    name: '鯉魚潭',
    countryFlag: '🇹🇼',
    secretLevel: 3,
    famousLevel: 5,
    tags: ['亞洲', '自然景觀', '湖泊', '台灣'],
    description: '''位於花蓮壽豐，是東台灣最大的內陸湖泊，以優美的山色倒影聞名。
提供環潭自行車道、水上天鵝船及 SUP 立槳，是戶外休閒的熱門去處。
每年 4 至 5 月為賞螢勝地，夜晚可預約免費導覽，觀賞火金姑漫天飛舞。
''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWRleGcLSQZBFQbXdNTBTqR3laj9dZG8WdHw&s',
    mapUrl: 'https://maps.app.goo.gl/XfFKvwfLRcXg8ucz6',
    address: '花蓮縣壽豐鄉',
  ),
  Site(
    name: '多良車站',
    countryFlag: '🇹🇼',
    secretLevel: 3,
    famousLevel: 5,
    tags: ['亞洲', '鐵道', '熱門景點', '台灣'],
    description: '''位於台東太麻里的多良觀光車站被譽為「全台灣最美車站」，以其獨特的紅色欄杆對比湛藍太平洋的絕美海景聞名。
        雖然該站已於 2006 年結束旅客業務，但目前已轉型為熱門的觀光景點，吸引無數遊客前來拍攝火車穿越山海的壯麗畫面。''',
    imageUrl:
        'https://www.settour.com.tw/ss_img/info/location/TTT/T0/TTT0000125/TTT0000125_89468.jpg',
    mapUrl: 'https://maps.app.goo.gl/NkpgXEoXZotbrh5HA',
    address: '臺東縣太麻里鄉瀧溪路8-1號 ',
  ),
  Site(
    name: '太白海鮮舫',
    countryFlag: '🇭🇰',
    secretLevel: 4,
    famousLevel: 5,
    tags: ['亞洲', '食神', '歇業中', '餐廳', '香港'],
    description: '''太白海鮮舫是香港唯一留存的海上畫舫，更是電影《食神》的傳奇取景地。
    目前正分階段復業，預計 2026 年下半年重新開業並推出經典佛跳牆。
    這座海上皇宮將結合導賞與餐飲，再現香港仔避風塘昔日的輝煌情懷。''',
    imageUrl:
        'https://image.cache.storm.mg/styles/smg-800xauto-er/s3/media/image/2020/03/02/20200302-041951_U17017_M595710_61c4.jpg?itok=ELZrj80_',
    mapUrl: 'https://maps.app.goo.gl/AVbjSJsuPxHSQPJi9',
    address: '香港深灣鴨脷洲海傍道',
  ),
  Site(
    name: '星光大道',
    countryFlag: '🇭🇰',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '電影', '熱門景點', '維港', '香港'],
    description: '''香港星光大道位於尖沙咀海濱長廊，是為了表彰香港電影業的傑出貢獻而建造的。
        大道上有超過100位香港電影界名人的手印和雕像，包括成龍、李小龍、梅艷芳等巨星。
        這裡不僅是電影迷的朝聖地，也是欣賞維多利亞港美景的絕佳位置。''',
    imageUrl:
        'https://static.liontech.com.tw/DS/go_images/7303/8245/8807/8813/Q782876/Avenue_of_Stars_Hong_Kong_Bruce_Lee_Statue.webp',
    mapUrl: 'https://maps.app.goo.gl/J8YJa2bRZG6vGmSg9',
    address: '香港尖沙咀海濱長廊',
  ),
  Site(
    name: '端島',
    countryFlag: '🇯🇵',
    secretLevel: 6,
    famousLevel: 2,
    tags: ['亞洲', '廢墟', '遺址', '軍艦島', '日本'],
    description: '''端島（Hashima）是一座位於日本長崎縣的半人工島，因外形酷似「三菱」軍艦「土佐號」
        而被稱為軍艦島（Gunkanjima）。它在明治時代至昭和時代因高純度海底煤礦而繁榮，曾有超
        過5000人居住、人口密度世界第一。1974年煤礦關閉後成為廢墟，現為世界文化遺產，也是熱門的無人島觀光景點''',
    imageUrl:
        'https://www.nagasaki-tabinet.com/storage/tourism_attractions/51797/responsive_images/dXihGw9ULubWdMJ4TputJQenlks1MClkHf3Rt4mG__1639_1229.jpeg',
    mapUrl: 'https://maps.app.goo.gl/6dJ4JVxEK439FChk8',
    address: '日本長崎縣長崎市端島',
  ),
  Site(
    name: '犬鳴隧道',
    countryFlag: '🇯🇵',
    secretLevel: 7,
    famousLevel: 1,
    tags: ['亞洲', '都市傳說', '遺址', '隧道', '日本'],
    description: '''犬鳴隧道位於日本福岡縣宮若市與久山町之間，是日本最知名的靈異景點之一。它通常分為 1975 年通車的
        「新犬鳴隧道」以及早已廢棄封鎖的「舊犬鳴隧道」，後者正是無數都市傳說與恐怖電影《犬鳴村》的發源地。''',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/d/d8/Inunaki_old_tunnel.jpg',
    mapUrl: 'https://maps.app.goo.gl/89G42ZpQfBfix6Yd8',
    address: '日本福岡縣宮若市、久山町',
  ),
  Site(
    name: '坪野礦泉',
    countryFlag: '🇯🇵',
    secretLevel: 5,
    famousLevel: 2,
    tags: ['亞洲', '都市傳說', '廢墟', '靈異', '日本'],
    description: '''坪野礦泉（坪野鉱泉）位於日本富山縣魚津市，曾是一座極具規模的 8 層樓溫泉旅館（正式名稱為
        「坪野飯店」或「旅館坪野」）。該地因 1996 年發生的「少女二人試膽失蹤事件」而成為北陸地區著名的靈異景點。''',
    imageUrl:
        'https://today-obs.line-scdn.net/0h4iyj0Q8ja0ZEE0NdJWQUEX5FaCl3f3hFICU6RQd9NXI9JX4XKnYlKGdHMyNuJiwYLXQkKGgScHc6cCUYenUl/w644',
    mapUrl: 'https://maps.app.goo.gl/AZbwtNZbmu7mRYWL8',
    address: '日本富山縣魚津市',
  ),
  Site(
    name: '青之島',
    countryFlag: '🇯🇵',
    secretLevel: 8,
    famousLevel: 3,
    tags: ['亞洲', '離島', '秘境', '火山島', '日本'],
    description: '''又稱為青之島，是位於日本伊豆群島南部的一座火山島，也是伊豆群島有人定居的島嶼中，
        位置最南的一個；其距離日本本州最近的伊豆半島約250公里，距離最近的有人居住島嶼八丈島也有68公里之遠，
        全島的行政區劃屬於日本東京都八丈支廳青島村管轄''',
    imageUrl:
        'https://tabippo.net/wp-content/uploads/20211123155008/001_01_Tokyo_Aogashima_c.jpg',
    mapUrl: 'https://maps.app.goo.gl/KxmD2opMBjk275YE6',
    address: '日本東京都伊豆群島青之島',
  ),
  Site(
    name: '龜有公園',
    countryFlag: '🇯🇵',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '動漫', '烏龍派出所', '公園', '日本'],
    description: '''龜有公園位於日本東京都葛飾區，是人氣動漫《烏龍派出所》（こちら葛飾区亀有公園前派出所）
        的核心舞台，雖然現實中公園旁並沒有真正的派出所，但它是全球粉絲朝聖「兩津勘吉（阿兩）」的重要景點。''',
    imageUrl:
        'https://static.gltjp.com/glt/data/directory/12000/11183/20200918_040534_42924119_w1920.webp',
    mapUrl: 'https://maps.app.goo.gl/h65dn9B9eHF4RES4A',
    address: '日本東京都葛飾區',
  ),
  Site(
    name: '與那國島',
    countryFlag: '🇯🇵',
    secretLevel: 6,
    famousLevel: 3,
    tags: ['亞洲', '秘境', '離島', '日本'],
    description: '''與那國町是位於日本沖繩縣八重山郡的一個行政區劃，管轄範圍即為全日本最西端的領土——與那國島。 
        這座島嶼地理位置特殊，距離台灣宜蘭蘇澳僅約 108 至 111 公里，甚至比距離沖繩本島（約 509 公里）還要近。
        在天氣極佳的情況下，從台灣東岸肉眼即可遠眺與那國島''',
    imageUrl:
        'https://www.twreporter.org/images/20231004013248-0fbdeb6936b1303a0843f67a3d94d1f1-mobile.jpg',
    mapUrl: 'https://maps.app.goo.gl/kccd2grzGHUuWYMLA',
    address: '日本沖繩縣八重山郡',
  ),
  Site(
    name: '小幌車站',
    countryFlag: '🇯🇵',
    secretLevel: 8,
    famousLevel: 3,
    tags: ['亞洲', '秘境', '鐵道', '日本'],
    description: '''小幌車站（小幌駅）位於北海道豐浦町，是 JR 北海道室蘭本線上的無人車站。它因被兩座隧道夾在中間、
        四周皆為陡峭山壁且無任何聯外車道可達，而被公認為「日本第一秘境車站」。 ''',
    imageUrl: 'https://i.gzn.jp/img/2016/02/15/koboro-station/00-top.jpg',
    mapUrl: 'https://maps.app.goo.gl/StE7wU4jdPzPkB9WA',
    address: '豐浦町虻田郡北海道 日本',
  ),
  Site(
    name: '奧大井湖上車站',
    countryFlag: '🇯🇵',
    secretLevel: 5,
    famousLevel: 5,
    tags: ['亞洲', '秘境', '鐵道', '日本'],
    description: '''奧大井湖上站是位於日本靜岡縣的「秘境車站」，隸屬於大井川鐵道井川線。這座車站坐落於長島水壩回水區
    （接岨湖）的一個半島上，兩端由長達數百公尺的朱紅色鐵橋「奧大井彩虹橋」連接，從遠處眺望，整座車站彷彿漂浮在碧綠的湖面上
      ，因此有「日本唯一浮島車站」的美譽。 ''',
    imageUrl:
        'https://www.wowlavie.com/files/article/a1/11355/atl_m_170011355_711.jpg',
    mapUrl: 'https://maps.app.goo.gl/bDsMcKRbP1kDvFWM7',
    address: '川根本町榛原郡靜岡縣 日本',
  ),
  Site(
    name: '釧路濕原國立公園',
    countryFlag: '🇯🇵',
    secretLevel: 4,
    famousLevel: 5,
    tags: ['亞洲', '自然景觀', '國家公園', '日本'],
    description: '''釧路濕原國立公園位於北海道東部，佔地約 28,788 公頃，是日本最大的濕地景觀。這裡以蜿蜒的釧路川為中心，
        保留了原始的自然風貌，並於 1980 年成為日本首個登錄《拉姆薩公約》的濕地，是特別天然紀念物丹頂鶴的主要棲息地。 
''',
    imageUrl:
        'https://www.visit-hokkaido.jp/lsc/upfile/spot/0001/0244/10244_3_l.jpg',
    mapUrl: 'https://maps.app.goo.gl/m8wWYaAYDofs15bi6',
    address: '標茶町 日本北海道',
  ),
  Site(
    name: '花本站',
    countryFlag: '🇰🇷',
    secretLevel: 4,
    famousLevel: 5,
    tags: ['亞洲', '鐵道', '秘境', '韓國'],
    description: '''花本驛（화본역，Hwabon Station）位於韓國大邱廣域市軍威郡，是一座歷史悠久的鐵路車站。它以其充滿復
    古懷舊風情的木造站房而聞名，被許多韓國網友譽為「韓國最美小站」。 
''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZF1uq5xvzljEWTVbdTuhV3-D3Z864FEc8FA&s',
    mapUrl: 'https://maps.app.goo.gl/7vky5pt6VLQtoFeA6',
    address: '軍威郡 南韓慶尚北道',
  ),
  Site(
    name: '玉流館朝鮮料理',
    countryFlag: '🇰🇵',
    secretLevel: 9,
    famousLevel: 3,
    tags: ['亞洲', '美食', '秘境', '北韓'],
    description: '''玉流館（維基百科）是北韓最著名的國宴級餐廳，招牌菜為平壤冷麵。創立於 1960 年，坐落於平壤大同江畔
    的玉流岩上。  這間餐廳不僅是北韓官方招待外國元首與貴賓的首選場所，更是平壤市民引以為傲的飲食文化地標。''',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/8/85/Okryu_Restaurant_in_Pyongyang.jpg',
    mapUrl: 'https://maps.app.goo.gl/k9G2ynzF2HN6Q2my8',
    address: '平壤 中區域 朝鮮',
  ),
  Site(
    name: '孜珠寺',
    countryFlag: '🇨🇳',
    secretLevel: 9,
    famousLevel: 2,
    tags: ['亞洲', '仙境', '寺廟', '秘境', '中國'],
    description: '''孜珠寺坐落於西藏昌都市丁青縣的孜珠山上，海拔高達 4,800 米。它是西藏海拔最高的寺院之一，
        也是西藏本土宗教「雍仲苯教」最古老且最重要的寺廟，歷史可追溯至 3,000 多年前，雖然在文革期間曾遭受破壞
        ，但許多文物仍被妥善保存下來。''',
    imageUrl:
        'https://www.xizanglvyou.org/wp-content/uploads/2018/01/6512bd43d9caa6e-13.jpg',
    mapUrl: 'https://maps.app.goo.gl/9mt54rchKpviQe7b7',
    address: '西藏昌都市丁青縣孜珠山上',
  ),
  Site(
    name: '拉薩',
    countryFlag: '🇨🇳',
    secretLevel: 7,
    famousLevel: 5,
    tags: ['亞洲', '西藏', '布達拉宮', '秘境', '中國'],
    description: '''拉薩市（藏語：ལྷ་ས་）是中華人民共和國西藏自治區的首府，藏語意為「聖地」。這座城市擁有超過
         1300 年的歷史，因日照充足（每年超過 3000 小時）而享有「日光城」的美譽。''',
    imageUrl:
        'https://static.liontech.com.tw/DS/go_images/7303/8245/8300/8301/Potala.webp',
    mapUrl: 'https://maps.app.goo.gl/2Gg6tbC6GtCcFYuH6',
    address: '中國西藏自治區拉薩市',
  ),
  Site(
    name: '故宮',
    countryFlag: '🇨🇳',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '博物館', '歷史', '熱門景點', '中國'],
    description: '''北京故宮博物院（紫禁城）位於北京中軸線中心，是明清兩代的皇家宮殿，
    也是當今世界上規模最大、保存最完整的木質結構古建築群。''',
    imageUrl:
        'https://andyventure.com/wp-content/uploads/china/beijing_forbidden_city/20250423_DSC08055.webp',
    mapUrl: 'https://maps.app.goo.gl/pg5oBwgHXieaaqua6',
    address: '中國北京市東城區景山前街4號 ',
  ),
  Site(
    name: '萬里長城',
    countryFlag: '🇨🇳',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '古蹟', '歷史', '熱門景點', '中國'],
    description: '''萬里長城是中國明朝時期建造的大型防禦工程，橫跨中國北部，是世界七大奇蹟之一。
    它不僅是中華民族的象徵，也是人類歷史上最具代表性的建築之一。''',
    imageUrl:
        'https://i.epochtimes.com/assets/uploads/2020/06/shutterstock_275490581.jpg',
    mapUrl: 'https://maps.app.goo.gl/7bjugwF9L4b2LRKE7',
    address: '遍布中國多個省份',
  ),
  Site(
    name: '秦始皇兵馬俑',
    countryFlag: '🇨🇳',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '古蹟', '歷史', '熱門景點', '中國'],
    description: '''秦始皇帝陵博物院位於中國陝西省西安市臨潼區，是一座依託秦始皇兵馬俑博物館和秦始皇帝陵遺址公園（麗山園）
        建立的大型遺址博物院。它是中國規模最大、保存最完好的帝王陵寢之一，更被譽為「世界第八大奇蹟」，並於1987年
        被聯合國教科文組織列入《世界遺產名錄》。''',
    imageUrl:
        'https://dw-media.tkww.hk/dams/share/image/202511/06/690c56a0e4b08c07fcabb847.JPG',
    mapUrl: 'https://maps.app.goo.gl/3sSsWkJyAMXhdqcW7',
    address: '臨潼區 中國陝西省西安市',
  ),
  Site(
    name: '天門山',
    countryFlag: '🇨🇳',
    secretLevel: 4,
    famousLevel: 5,
    tags: ['亞洲', '自然景觀', '熱門景點', '中國'],
    description: '''天門山坐落於中國湖南省張家界市，海拔1518.6公尺，以高海拔穿山溶洞「天門洞」和世界上最長的高山索道（7455公尺）
        聞名，被譽為「湘西第一神山」。景區以斷層喀斯特地貌、懸崖峭壁上的盤山公路（99個彎）、玻璃棧道和山頂原始森林為特色。''',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/4/45/Tianmen_38330-Zhangjiajie_%2849047525877%29.jpg',
    mapUrl: 'https://maps.app.goo.gl/MW8gV3Cm1cv18wdD9',
    address: '大坪鎮 中國湖南省張家界市永定區',
  ),
  Site(
    name: '陽朔',
    countryFlag: '🇨🇳',
    secretLevel: 5,
    famousLevel: 5,
    tags: ['亞洲', '自然景觀', '熱門景點', '中國'],
    description: '''桂林與陽朔以「山水甲天下」聞名，陽朔更是精華所在，擁有灕江漂流、遇龍河竹筏、西街及十里畫廊等經典風景，
        適合安排3-5天深入體驗喀斯特地貌與鄉村田園風光。最佳旅遊季節為4月至11月，氣候宜人，適合戶外活動。''',
    imageUrl:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/11/a0/7e/03/sunset-on-laozhai-shan.jpg?w=900&h=500&s=1',
    mapUrl: 'https://maps.app.goo.gl/kPXCm1gnrcmWB8DZ7',
    address: '中國廣西壯族自治區桂林市陽朔縣',
  ),
  Site(
    name: '不丹',
    countryFlag: '🇧🇹',
    secretLevel: 7,
    famousLevel: 3,
    tags: ['亞洲', '秘境', '喜馬拉雅', '佛教', '不丹'],
    description: '''不丹是喜馬拉雅山脈下的神祕內陸國，以「國民幸福指數」取代經濟成長，致力保護藏傳佛教文化與自然景觀。
該國採「高價值、低流量」旅遊政策，遊客需由旅行社安排行程並支付永續發展費，虎穴寺是其最具代表性的景點。
政體已轉向君主立憲制，在現代化進程中仍堅持與世無爭的純樸步調，被譽為「最後的香格里拉」。''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYX8o66MU6KgNyVFQOQyRtrP-q0g7J_z9IlQ&s',
    mapUrl: 'https://maps.app.goo.gl/MVo1cJZrYcaJJvJW7',
    address: '不丹王國',
  ),
  Site(
    name: '下龍灣',
    countryFlag: '🇻🇳',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['亞洲', '海灣', '世界奇景', '熱門景點', '越南'],
    description: '''下龍灣（Ha Long Bay）位於越南東北部廣寧省，是聯合國教科文組織認可的「世界遺產」與
        「世界新七大自然奇觀」，素有「海上桂林」之稱。它以 1,969 座石灰岩島嶼、喀斯特地形及絕美的
        「海上桂林」風景聞名，是北越必去景點。遊客多從河內出發，安排一日跳島或二至三天的奢華過夜遊輪，
        體驗皮划艇、探訪洞穴及欣賞日出。''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeXazGjaPTk1AsIj99BpkfCZJmuc7KCv4RVg&s',
    mapUrl: 'https://maps.app.goo.gl/i3ieVkQKeBsAq7Cf7',
    address: '越南東北部廣寧省',
  ),
  Site(
    name: '曼谷',
    countryFlag: '🇹🇭',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '曼谷', '熱門景點', '泰國'],
    description: '''曼谷是泰國首都與最大城市，也是東南亞的金融、商業及旅遊樞紐。這座城市融合了古老寺廟（如大皇宮、鄭王廟）
        與現代摩天大樓、頂級百貨（如ICONSIAM、CentralWorld），並以充滿活力的街頭美食、熱鬧市集（如恰圖恰週末市集）
        及便利的公共運輸（BTS/MRT）聞名，素有「東方威尼斯」的美譽。''',
    imageUrl:
        'https://i0.wp.com/travo.guide/wp-content/uploads/2020/03/Bangkok-Wat-Phra-Kaew1.jpg?fit=1600%2C1068&ssl=1',
    mapUrl: 'https://maps.app.goo.gl/Cf7fL1pv67iX3e7AA',
    address: '泰國曼谷',
  ),
  Site(
    name: '曼谷大皇宮',
    countryFlag: '🇹🇭',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['亞洲', '古蹟', '熱門景點', '泰國'],
    description: '''曼谷大皇宮是泰國最具代表性的地標，自 1782 年落成以來，曾是泰國皇室的居所與政府行政中心。
        這裡以金碧輝煌的建築和精緻的工藝聞名，其中位於東北角的「玉佛寺」更是必看重點，供奉著由整塊翡翠雕成的玉佛。''',
    imageUrl:
        'https://res.klook.com/image/upload/fl_lossy.progressive,w_1200,h_630,c_fill,q_85/371ffdcb-0125-4d17-9c6f-ea1f5994115f_zu4zsr.jpg',
    mapUrl: 'https://maps.app.goo.gl/ZJjKM9xEphGgS3WE8',
    address: 'Phra Borom Maha Ratchawang, Phra Nakhon, 曼谷 泰國',
  ),
  Site(
    name: '仰光大金寺',
    countryFlag: '🇲🇲',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['亞洲', '古蹟', '寺廟', '熱門景點', '緬甸'],
    description: '''在緬甸仰光，「金寺廟」通常指的是聞名世界的 仰光大金寺（Shwedagon Pagoda，又稱大金塔）。
        它是緬甸最神聖的佛教建築，塔身鋪滿純金箔，塔尖鑲嵌著數千顆鑽石與寶石。 ''',
    imageUrl:
        'https://image.cdn-eztravel.com.tw/Pm0Vqo6eqnI-MTtVtfFFgZgZgVrEStkfjv6eYozWEc8/g:ce/aHR0cHM6Ly92YWNhdGlvbi5jZG4tZXp0cmF2ZWwuY29tLnR3L3BvaS9CVS9SR04vU2h3ZWRhZ29uUGFnb2RhL3NodXR0ZXJzdG9ja18zOTMyNjM4NDJjb21wcmVzcy5qcGc.jpg',
    mapUrl: 'https://maps.app.goo.gl/DTp45qvUVLLh64gJA',
    address: '仰光 緬甸',
  ),
  Site(
    name: '吳哥窟',
    countryFlag: '🇰🇭',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['亞洲', '古蹟', '寺廟', '熱門景點', '柬埔寨'],
    description:
        '''吳哥窟（Angkor Wat）位於柬埔寨暹粒省，是世界上最大的宗教建築。它建於 12 世紀，最初為高棉帝國國王蘇利耶跋摩二世
        為供奉印度教毗濕奴神而建，後來轉變為佛教寺廟。吳哥窟以宏偉的建築、精緻的浮雕及對稱的護城河聞名，是柬埔寨國旗上的標誌。 ''',
    imageUrl:
        'https://i3.wp.com/www.mr-angkor.com/wp-content/uploads/2013/11/Angkor-Wat.jpg?zoom=2.625&w=780',
    mapUrl: 'https://maps.app.goo.gl/yvkadrYp2x6ofcZH8',
    address: 'Krong Siem Reap, 柬埔寨',
  ),
  Site(
    name: '密蘇里號戰艦',
    countryFlag: '🇺🇸',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['北美洲', '軍艦', '博物館', '歷史', '美國'],
    description: '''位於夏威夷珍珠港的密蘇里號戰艦 (USS Missouri BB-63) 是美國歷史上極具代表性的
    軍事紀念館。它不僅是愛荷華級戰艦的三號艦，更是第二次世界大戰中，日本簽署無條件投降書的地點。''',
    imageUrl: 'https://i.redd.it/61x21n2gi5a11.jpg',
    mapUrl: 'https://maps.app.goo.gl/PzywXayphF7FC9r19',
    address: '63 Cowpens St 夏威夷 美國',
  ),
  Site(
    name: '拉斯維加斯',
    countryFlag: '🇺🇸',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['北美洲', '賭城', '娛樂', '夜生活', '美國'],
    description:
        '拉斯維加斯（Las Vegas）是美國內華達州最大的城市，坐落於莫哈維沙漠中，以其龐大的賭博業、購物、度假與娛樂產業聞名於世，被譽為「世界賭城」與「不夜城」。',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJXEGgrQLnVKat68DeAjcrsCgM-UTbevOofQ&s',
    mapUrl: 'https://maps.app.goo.gl/1Te4be5JxCNT7xo86',
    address: '內華達州 美國',
  ),
  Site(
    name: '冰川國家公園',
    countryFlag: '🇺🇸',
    secretLevel: 5,
    famousLevel: 4,
    tags: ['北美洲', '自然奇景', '國家公園', '美國'],
    description:
        '''位於美國蒙大拿州西北部的冰川國家公園 (Glacier National Park) 被譽為「大陸生態系統之冠」，擁有超過 100 萬英畝
        的壯麗山巒、原始湖泊與豐富野生動物。這裡不僅是聯合國教科文組織認定的世界遺產，更與加拿大的瓦特頓湖國家公園共同組成
        全球首座「國際和平公園」。''',
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Mountain_Goat_at_Hidden_Lake.jpg/1280px-Mountain_Goat_at_Hidden_Lake.jpg',
    mapUrl: 'https://maps.app.goo.gl/egwtVQXk9ZJ7AU9q8',
    address: '蒙大拿 美國',
  ),
  Site(
    name: '黃石國家公園',
    countryFlag: '🇺🇸',
    secretLevel: 3,
    famousLevel: 5,
    tags: ['北美洲', '自然奇景', '國家公園', '美國'],
    description:
        '''建立於 1872 年的黃石國家公園（Yellowstone National Park）是世界上第一座國家公園，主要位於美國懷俄明州，
        並延伸至蒙大拿州和愛達荷州。這座公園坐落在巨大的活火山之上，擁有全球約一半的地熱景觀，包括 300 多座間歇泉及色
        彩斑斕的熱泉。 ''',
    imageUrl:
        'https://image.kkday.com/v2/image/get/c_fill%2Cq_55%2Ct_webp%2Cw_960/s1.kkday.com/product_267858/20250218061514_XuH8B/png',
    mapUrl: 'https://maps.app.goo.gl/JcScGbLXJBvyPVVQ6',
    address: '懷俄明州 美國',
  ),
  Site(
    name: '小蔓越莓島',
    countryFlag: '🇺🇸',
    secretLevel: 6,
    famousLevel: 1,
    tags: ['北美洲', '小島', '秘境', '美國'],
    description: '''這座位於緬因州的小蔓越莓島面積約 200 英畝，。它位於阿卡迪亞國家公園附近，是一個安靜、獨特的島嶼，
    面積約 200 英畝，主要靠渡輪或私家船隻對外聯繫。 ''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsY_hJZstFUw8cPPSW8Q1z0edl4MOrBuXSwg&s',
    mapUrl: 'https://maps.app.goo.gl/zT8Hrqge7itaEd9o8',
    address: '緬因州 美國',
  ),
  Site(
    name: '阿拉斯加',
    countryFlag: '🇺🇸',
    secretLevel: 5,
    famousLevel: 4,
    tags: ['北美洲', '自然奇景', '荒野', '美國'],
    description: '''阿拉斯加州（Alaska）是美國面積最大的州，位於北美洲西北端，以絕美冰川、極光、野生動物及
        豐富的石油天然氣資源聞名。首府為朱諾，但最大城市為安克拉治。這裡適合夏季賞冰河（5-9月）及
        冬季追極光（10月-次年3月），擁有丹奈利國家公園、基奈峽灣等壯麗自然景觀。 ''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHKs4vcCjc18S4mLBQnf8S8iWlYwX3HL3wQw&s',
    mapUrl: 'https://maps.app.goo.gl/97vQyop5g7TVZSsn8',
    address: '阿拉斯加 美國',
  ),
  Site(
    name: '威尼斯',
    countryFlag: '🇮🇹',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '水都', '浪漫', '義大利'],
    description: '''威尼斯，通常也被音譯為韋內齊亞，是義大利東北部著名的旅遊與工業城市，也是威尼托地區的首府。
    威尼斯城由被運河分隔並由橋梁相連的121座小島組成。威尼斯以其優美的環境、建築和藝術品珍藏而聞名。''',
    imageUrl:
        'https://i0.wp.com/theartpressasia.com/wp-content/uploads/2022/07/HERO_Venice__FloatingCityBuilt_iStock-986940360.jpeg?fit=1800%2C1200&ssl=1',
    mapUrl: 'https://maps.app.goo.gl/LPprcTDjHNK1Rb9LA',
    address: '威尼斯省 義大利',
  ),
  Site(
    name: '羅馬',
    countryFlag: '🇮🇹',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '古蹟', '歷史', '熱門景點', '義大利'],
    description: '''羅馬是義大利首都及羅馬首都廣域市首府，為義大利全國的政治、經濟、文化和交通中心，
    位於義大利半島中部的拉吉歐大區，台伯河下游平原地，建城初期在七座小山丘上，故又名「七丘之城」。''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCV0Aachxp_nrE58udadEKrQhR6ZqD6-Dlqw&s',
    mapUrl: 'https://maps.app.goo.gl/6V4Z6FxtoK7ZMejD7',
    address: '羅馬 義大利',
  ),
  Site(
    name: '科隆大教堂',
    countryFlag: '🇩🇪',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '古蹟', '建築', '熱門景點', '德國'],
    description: '''科隆主教座堂（Kölner Dom）是德國科隆市的標誌性建築，也是世界第三大的哥德式教堂。它以 
 公尺高的雙塔聞名，曾於 1880 年完工時短暫成為世界最高建築。''',
    imageUrl:
        'https://image.cdn-eztravel.com.tw/147Bga7Mq0Jz8VVUqDbrnSDJoE4YL8kLfF8L9WjU9iw/g:ce/aHR0cHM6Ly92YWNhdGlvbi5jZG4tZXp0cmF2ZWwuY29tLnR3L2ltZy9WRFIvREVfMTM2MDg2NTYzMy5qcGc.jpg',
    mapUrl: 'https://maps.app.goo.gl/6cVjqL8Ni2c7KHve7',
    address: '科隆 德國',
  ),
  Site(
    name: '柏林圍牆紀念館',
    countryFlag: '🇩🇪',
    secretLevel: 1,
    famousLevel: 4,
    tags: ['歐洲', '古蹟', '歷史', '熱門景點', '德國'],
    description:
        '''柏林圍牆紀念館 (Gedenkstätte Berliner Mauer) 是柏林唯一一處能見到最完整、包含「死亡地帶」與觀測塔之圍牆
        防禦工事的紀念地。它坐落於具歷史意義的 伯瑙爾大街 (Bernauer Straße)，這條街在冷戰時期曾是柏林牆最慘烈的逃亡
        與對峙現場之一。''',
    imageUrl:
        'https://carolblog.tw/wp-content/uploads/2023/11/%E6%9F%8F%E6%9E%97%E5%9C%8D%E7%89%86%E7%B4%80%E5%BF%B5%E9%A4%A8_1.jpg',
    mapUrl: 'https://maps.app.goo.gl/JKrmyMa47paKfaRD8',
    address: '柏林 德國',
  ),
  Site(
    name: '聖母院',
    countryFlag: '🇫🇷',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '古蹟', '歷史', '熱門景點', '法國'],
    description: '''位於法國巴黎的哥德式建築傑作，以玫瑰花窗與石像鬼雕像聞名世界。
經歷 2019 年大火重創，已於 2024 年底修復完成，目前教堂內部已全面對外開放。
遊客現可再次進入這座世界遺產，欣賞清潔後明亮的石牆，並預約登上鐘樓俯瞰塞納河景。
''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaV4CNBA72zukbsdMFmNemOfWRKOy3ZMvRdA&s',
    mapUrl: 'https://maps.app.goo.gl/VWfXZ8KMn89Xq2NG8',
    address: '6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, 法國',
  ),
  Site(
    name: '羅浮宮',
    countryFlag: '🇫🇷',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '古蹟', '博物館', '熱門景點', '法國'],
    description: '''羅浮宮（Musée du Louvre）位於法國巴黎塞納河畔，是世界規模最大且參訪人數最多的藝術博物館。這座宮殿曾是
        法國王室的居所，自 1793 年起正式對外開放，目前館藏超過 3.5 萬件藝術珍寶，涵蓋古文明至 19 世紀中葉的傑作。 
''',
    imageUrl:
        'https://static.wealth.com.tw/5a70c4a620d7fc562a5d983946df090bdafdffc5.jpg',
    mapUrl: 'https://maps.app.goo.gl/cuoxnAKkB6dicort6',
    address: '法國巴黎',
  ),
  Site(
    name: '蔚藍海岸',
    countryFlag: '🇫🇷',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '自然景觀', '熱門景點', '法國'],
    description:
        '''蔚藍海岸（Côte d'Azur / French Riviera）位於法國東南部地中海沿岸，從土倫延伸至義大利邊境的芒通。
        它是世界著名的奢華度假勝地，擁有溫暖氣候、湛藍海水及豐富的歷史小鎮，精華城市包含尼斯（Nice）、坎城（Cannes）
        、摩納哥（Monaco）與聖特羅佩。 
''',
    imageUrl:
        'https://french-nautilus.b-cdn.net/wp-content/uploads/2024/11/La-Colline-du-Chateau_01.jpg',
    mapUrl: 'https://maps.app.goo.gl/7iphq33fgq1essGD6',
    address: '法國東南部',
  ),
  Site(
    name: '大英博物館',
    countryFlag: '🇬🇧',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '博物館', '熱門景點', '英國'],
    description: '''大英博物館 (British Museum) 是位於倫敦布盧姆茨貝里的世界級博物館，擁有超過 800 萬件涵蓋人類歷史、
        藝術與文化的館藏。 ''',
    imageUrl:
        'https://res.cloudinary.com/dtljonz0f/image/upload/c_auto,ar_4:3,w_3840,g_auto/f_auto/q_auto/v1/shutterstock_2476048819_ss_non-editorial_vcahpp?_a=BAVAZGDY0',
    mapUrl: 'https://maps.app.goo.gl/zbqm58zesZiL2USY8',
    address: 'Great Russell St, London WC1B 3DG英國',
  ),
  Site(
    name: '白金漢宮',
    countryFlag: '🇬🇧',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '古蹟', '熱門景點', '英國'],
    description:
        '''白金漢宮 (Buckingham Palace) 是英國君主在倫敦的官方居所，也是英國王室的象徵之一。宮殿建於 1703 年，
    經過多次改建和擴建，現今的外觀呈現典型的英式建築風格。''',
    imageUrl:
        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/d6/a1/6b/buckingham-palace.jpg?w=800&h=500&s=1',
    mapUrl: 'https://maps.app.goo.gl/85DyWdKwLU9MQkCf9',
    address: '英國倫敦',
  ),
  Site(
    name: '愛丁堡城堡',
    countryFlag: '🇬🇧',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['歐洲', '古蹟', '熱門景點', '英國'],
    description: '''愛丁堡城堡是蘇格蘭的重要象徵，座落於愛丁堡市中心的死火山岩頂端，海拔約 120 公尺。這座跨越千年的建築曾作為皇室居所
        、軍事要塞與監獄，如今則是蘇格蘭最受歡迎的付費旅遊景點之一。''',
    imageUrl:
        'https://sundaytour.com.tw/upfiles/chinese/attractions/tw_attractions_caty1552466682.jpg',
    mapUrl: 'https://maps.app.goo.gl/dqAWxo78Tji8f9zh9',
    address: 'Castlehill, Edinburgh EH1 2NG英國',
  ),
  Site(
    name: '丹麥樂高之家',
    countryFlag: '🇩🇰',
    secretLevel: 1,
    famousLevel: 5,
    tags: ['歐洲', '樂高', '親子', '熱門景點', '丹麥'],
    description: '''丹麥樂高之家 (LEGO House) 位於樂高的發源地——丹麥比隆，被譽為積木之家。 這座由知名建築師
         Bjarke Ingels 設計的建築，外觀如同 21 塊巨大的樂高積木堆疊而成，內部則使用了超過 2,500 萬
         顆樂高積木打造出充滿創意的互動空間。''',
    imageUrl:
        'https://mookblog-aws.hmgcdn.com/public/article/2019/atl_20200303144442_649.jpg',
    mapUrl: 'https://maps.app.goo.gl/oSKf9PEFoz5dzEUq7',
    address: 'Ole Kirks Plads 1, 7190 比隆, 丹麥',
  ),
  Site(
    name: '斯瓦爾巴全球種子庫',
    countryFlag: '🇳🇴',
    secretLevel: 9,
    famousLevel: 3,
    tags: ['歐洲', '北極圈', '科學', '秘境', '挪威'],
    description: '''斯瓦爾巴全球種子庫座落於北極圈內的挪威斯瓦爾巴群島，被譽為人類農業的「諾亞方舟」或
        「末日種子庫」。其核心目的是為全球農作物種子提供「備份」，以防因戰爭、自然災害、氣候變遷
        或疾病導致的基因多樣性遺失。''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmScR4hz6HCJvOgkc_kjF27XU4y_D_gHjYtA&s',
    mapUrl: 'https://maps.app.goo.gl/sdqbbunRZnrXkd7L6',
    address: '斯瓦爾巴群島 挪威',
  ),
  Site(
    name: '冬宮',
    countryFlag: '🇷🇺',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['歐洲', '博物館', '藝術', '歷史', '俄羅斯'],
    description: '''冬宮位於俄羅斯聖彼得堡，曾是俄羅斯帝國沙皇的正式官邸，現在則是國立艾米塔吉博物館的主樓。
    這座宏偉的建築由義大利建築師巴托洛米歐·拉斯特雷利設計，是 18 世紀中葉俄國巴洛克建築的巔峰之作。''',
    imageUrl:
        'https://hac.ntust.edu.tw/var/file/73/1073/img/2855/1800px-Winter_Palace_Panorama_3_c.jpg',
    mapUrl: 'https://maps.app.goo.gl/oLqC1XG94L8DD1jn9',
    address: 'Palace Embankment, 32, 聖彼得堡, 俄羅斯',
  ),
  Site(
    name: '科拉超深鑽孔',
    countryFlag: '🇷🇺',
    secretLevel: 8,
    famousLevel: 1,
    tags: ['歐洲', '蘇聯', '科學', '遺址', '俄羅斯'],
    description: '''科拉超深鑽孔是蘇聯於 1970 年代在科拉半島進行的一項科學鑽探計畫。
    它是人類史上對地球內部進行過最深的垂直鑽探，也是當今世界上最深的垂直鑽孔之一。''',
    imageUrl:
        'https://pic1.zhimg.com/v2-51a8fb98deb43bd638bedcbd67463889_720w.jpg?source=172ae18b',
    mapUrl: 'https://maps.app.goo.gl/EkqP8wTUw5VKYWM27',
    address: '摩爾曼斯克 俄羅斯',
  ),
  Site(
    name: '阿尼瓦（中知床岬）燈塔',
    countryFlag: '🇷🇺',
    secretLevel: 7,
    famousLevel: 1,
    tags: ['亞洲', '俄羅斯', '秘境', '燈塔'],
    description: '''阿尼瓦燈塔（俄語：Анива，日語：中知床岬燈台）是一座位於俄羅斯薩哈林州薩哈林島（庫頁島）南端中知床岬的
        廢棄混凝土燈塔，建於1939年。該燈塔由日本工程師三浦忍設計，9層樓高31公尺，曾用作核能發電站，2006年停用。
        現為著名的觀光遺跡，可乘船從諾維科沃村出發遊覽。''',
    imageUrl: 'https://photos.wikimapia.org/p/00/04/26/78/80_big.jpg',
    mapUrl: 'https://maps.app.goo.gl/mRabXBq58KPfrkxj8',
    address: '庫頁島南方 俄羅斯',
  ),
  Site(
    name: '伊斯坦堡',
    countryFlag: '🇹🇷',
    secretLevel: 1,
    famousLevel: 1,
    tags: ['亞洲', '歐亞交界', '熱門景點', '歷史', '土耳其'],
    description: '''伊斯坦堡（Istanbul）是土耳其最大的城市與經濟中心，也是世界上唯一橫跨歐亞兩大洲的城市。
    這座城市融合了兩千年的輝煌歷史與現代活力，曾先後作為羅馬帝國、拜占庭帝國及鄂圖曼帝國的首都。''',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0MVni-01cGxpu-C3567namptBewiFCLqnuA&s',
    mapUrl: 'https://maps.app.goo.gl/6ZdkVDp7PhZqbWsa6',
    address: '伊斯坦堡 土耳其',
  ),
  Site(
    name: '復活節島',
    countryFlag: '🇨🇱',
    secretLevel: 8,
    famousLevel: 5,
    tags: ['南美洲', '智利', '太平洋小島', '遺跡', '自然奇觀'],
    description: '''是南太平洋中的一個島嶼，位於智利以西外海約3600到3700公里處，為智利的特殊領地。
        復活節島是世界上最與世隔絕的島嶼之一，離其最近有人定居的皮特肯群島也有2,075公里遠。
        為瓦爾帕萊索大區瓦爾帕萊索省的一個特別行政區域。''',
    imageUrl: 'https://u.golatin.com/images/others/27wk3pap.jpg',
    mapUrl: 'https://maps.app.goo.gl/A23AuQundQTxpaUe9',
    address: '智利瓦爾帕萊索復活節島',
  ),
  Site(
    name: '瓦爾帕萊索',
    countryFlag: '🇨🇱',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['南美洲', '智利', '港口城市', '藝術', '文化'],
    description: '''瓦爾帕萊索（Valparaíso）是智利重要的港口城市與文化中心。它位於首都聖地牙哥西北方約 120 公里處，
        以其色彩斑斕的建築、陡峭的山丘和充滿藝術氣息的街頭壁畫聞名於世。 這座城市在 2003 年被聯合國教科
        文組織列為世界文化遺產，被譽為「太平洋的寶石」''',
    imageUrl:
        'https://isep-prod.s3.amazonaws.com/image/543/original.jpg?1468524556',
    mapUrl: 'https://maps.app.goo.gl/MZyiVqHS1tEJsyXK8',
    address: '瓦爾帕萊索 智利',
  ),
  Site(
    name: '象島',
    countryFlag: '🇦🇶',
    secretLevel: 9,
    famousLevel: 4,
    tags: ['南極洲', '秘境', '孤島', '企鵝'],
    description: '''南極象島是位於南極半島東北方、南設得蘭群島外圍的無人荒島。該島因曾作為象海豹棲息地而得名，
    最著名的事件是 1916 年沙克爾頓（Shackleton）「堅忍號」船員在冰封中脫險的求生聖地。此地以惡劣天氣、冰封地貌
    和豐富的海豹與企鵝生態聞名，是南極航線上的熱門標誌景點。''',
    imageUrl:
        'https://images.eu.ctfassets.net/vy34d8u43l9r/4tTC9WlpFF1zInDF9vA4sd/333b8d531a3f984ddd6b3e76332d163b/Penguins_Elephant_Island_Antarctica_HX_12628.jpg',
    mapUrl: 'https://maps.app.goo.gl/pmyzeYgzFZotWvuz8',
    address: '南極洲 象島',
  ),
  Site(
    name: '聖赫勒拿島',
    countryFlag: '🇬🇧',
    secretLevel: 8,
    famousLevel: 4,
    tags: ['非洲', '英國', '秘境', '孤島', '拿破崙'],
    description: '''聖赫勒拿島是位於南大西洋的英國海外領土，以身為拿破崙終老流放地而聞名於世。
它是地球上最偏遠的島嶼之一，現存世界最長壽生物——200歲巨龜喬納森也居住於此。
島上風景雄偉且生態獨特，近年因開通商業航班，讓這座孤島逐漸揭開神祕面紗。''',
    imageUrl:
        'https://cc.tvbs.com.tw/img/_data/i/upload/2017/03/16/20170316202728-c3cf77e9-me.jpg',
    mapUrl: 'https://maps.app.goo.gl/AWt1kxA8v7HVU1cP7',
    address: '大西洋 聖赫勒拿島 英國',
  ),
  Site(
    name: '吉薩金字塔',
    countryFlag: '🇪🇬',
    secretLevel: 2,
    famousLevel: 5,
    tags: ['非洲', '埃及', '遺跡', '世界奇觀', '金字塔'],
    description: '''吉薩金字塔是位於埃及吉薩的一組古代建築群，包括胡夫金字塔、哈夫拉金字塔和門卡烏拉金字塔。
    這三座金字塔是古代世界七大奇蹟中唯一保存至今的建築，也是人類歷史上最具代表性的建築之一。''',
    imageUrl:
        'https://media-cdn.tripadvisor.com/media/attractions-splice-spp-674x446/09/50/23/73.jpg',
    mapUrl: 'https://maps.app.goo.gl/robEE963XXMGTXNj7',
    address: 'Al Haram, Giza Governorate 埃及',
  ),
];

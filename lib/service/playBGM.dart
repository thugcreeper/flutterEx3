import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class PlayBgmService {
  PlayBgmService._();

  static final PlayBgmService instance = PlayBgmService._();

  final AudioPlayer _player = AudioPlayer();

  static const List<String> _playlist = [
    'audios/Sweden.mp3',
    'audios/DryHands.mp3',
    'audios/Mice_on_Venus.mp3',
    'audios/Minecraft.mp3',
    'audios/WetHands.mp3',
  ];

  StreamSubscription<void>? _completeSubscription;
  int _currentIndex = 0;
  bool _started = false;
  //future是dart裡面用來處理非同步操作的類型，表示一個可能在未來某個時間點完成的操作，
  //並且可以返回一個值或拋出一個錯誤。當你調用一個返回Future的方法時，你可以使用await關鍵字來
  //等待它完成，或者使用then方法來註冊一個回調函數，在Future完成時執行。
  Future<void> start() async {
    if (_started || _playlist.isEmpty) {
      return;
    }

    _started = true;
    //設置播放模式為停止，這樣當一首歌結束時不會自動重複播放，而是觸發onPlayerComplete事件，
    //讓我們可以在事件處理器中決定下一步要播放哪首歌。
    await _player.setReleaseMode(ReleaseMode.stop);

    _completeSubscription = _player.onPlayerComplete.listen((_) {
      _playNext();
    });

    await _playCurrent();
  }

  Future<void> _playCurrent() async {
    final path = _playlist[_currentIndex];
    print('BGM playing: $path');
    await _player.play(AssetSource(path));
  }

  Future<void> _playNext() async {
    if (_playlist.isEmpty) {
      return;
    }

    _currentIndex = (_currentIndex + 1) % _playlist.length;
    await _playCurrent();
  }

  Future<void> stop() async {
    _started = false;
    await _player.stop();
  }

  //釋放資源
  Future<void> dispose() async {
    await _completeSubscription?.cancel();
    await _player.dispose();
  }
}

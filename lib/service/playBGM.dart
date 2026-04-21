//播放音樂的service，這個資料夾我本來取utils，但AI說utils是放小工具用的，
//有業務邏輯應該叫service比較好
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
  bool _pausedByLifecycle = false;
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

  // App 進到背景時先暫停，避免被系統回收焦點後狀態不一致。
  Future<void> onAppPaused() async {
    if (!_started) {
      return;
    }

    _pausedByLifecycle = true;
    print('BGM lifecycle paused, playerState=${_player.state}');
    if (_player.state == PlayerState.playing) {
      await _player.pause();
    }
  }

  // 回到前景後嘗試恢復播放；若恢復失敗則重播目前曲目。
  Future<void> onAppResumed() async {
    if (!_started) {
      return;
    }

    final pausedByLifecycle = _pausedByLifecycle;
    _pausedByLifecycle = false;

    print(
      'BGM lifecycle resumed, pausedByLifecycle=$pausedByLifecycle, playerState=${_player.state}',
    );

    if (_player.state == PlayerState.playing) {
      return;
    }

    try {
      await _player.resume();
      print('BGM resume() called, playerState=${_player.state}');
    } catch (e) {
      print('BGM resume failed: $e');
    }

    // 某些裝置從外部 App 返回後 resume 可能成功呼叫但仍未實際出聲，這裡做保底重播。
    if (_player.state != PlayerState.playing) {
      print('BGM fallback to replay current track');
      await _playCurrent();
    }
  }

  Future<void> stop() async {
    _started = false;
    _pausedByLifecycle = false;
    await _player.stop();
  }

  //釋放資源
  Future<void> dispose() async {
    await _completeSubscription?.cancel();
    await _player.dispose();
  }
}

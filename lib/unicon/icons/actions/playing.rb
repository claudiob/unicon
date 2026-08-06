module Unicon
  # Running a recording, and how it repeats
  PLAYING = {
    play: { bootstrap: 'play', ios: 'play', android: 'play_arrow' },
    pause: { bootstrap: 'pause', ios: 'pause', android: 'pause' },
    stop: { bootstrap: 'stop', ios: 'stop', android: 'stop' },
    skip_next: { bootstrap: 'skip-forward', ios: 'forward.end', android: 'skip_next' },
    shuffle: { bootstrap: 'shuffle', ios: 'shuffle', android: 'shuffle' },
    repeat: { bootstrap: 'repeat', ios: 'repeat', android: 'repeat' },
  }.freeze
end

module Unicon
  # Pictures and sound, and the tools that make them
  MEDIA = {
    camera: { bootstrap: 'camera', ios: 'camera', android: 'photo_camera' },
    image: { bootstrap: 'image', ios: 'photo', android: 'image' },
    video: { bootstrap: 'camera-video', ios: 'video', android: 'videocam' },
    microphone: { bootstrap: 'mic', ios: 'mic', android: 'mic' },
    playlist: { bootstrap: 'collection-play', ios: 'play.square.stack', android: 'video_library' },
    waveform: { bootstrap: 'soundwave', ios: 'waveform', android: 'graphic_eq' },
    music: { bootstrap: 'music-note', ios: 'music.note', android: 'music_note' },
    volume: { bootstrap: 'volume-up', ios: 'speaker.wave.2', android: 'volume_up' },
    headphones: { bootstrap: 'headphones', ios: 'headphones', android: 'headphones' },
    palette: { bootstrap: 'palette', ios: 'paintpalette', android: 'palette' },
    brush: { bootstrap: 'brush', ios: 'paintbrush', android: 'brush' },
  }.freeze
end

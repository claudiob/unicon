module Unicon
  # Moving something out of the app, or into it
  SENDING = {
    send: { bootstrap: 'send', ios: 'paperplane', android: 'send' },
    share: { bootstrap: 'share', ios: 'square.and.arrow.up', android: 'share' },
    download: { bootstrap: 'download', ios: 'arrow.down.circle', android: 'download' },
    upload: { bootstrap: 'upload', ios: 'arrow.up.circle', android: 'upload' },
    print: { bootstrap: 'printer', ios: 'printer', android: 'print' },
  }.freeze
end

module Unicon
  # Reaching somebody, and hearing back from them
  COMMUNICATION = {
    phone: { bootstrap: :telephone, ios: :phone, android: :call },
    mobile: { bootstrap: :phone, ios: :iphone, android: :mobile },
    envelope: { bootstrap: :envelope, ios: :envelope, android: :mail },
    chat: { bootstrap: :chat, ios: :message, android: :chat },
    bell: { bootstrap: :bell, ios: :bell, android: :notifications },
    megaphone: { bootstrap: :megaphone, ios: :megaphone, android: :campaign },
    send: { bootstrap: :send, ios: :paperplane, android: :send },
    inbox: { bootstrap: :inbox, ios: :tray, android: :inbox },
    reply: { bootstrap: :reply, ios: :'arrowshape.turn.up.left', android: :reply },
  }.freeze
end

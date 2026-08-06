module Unicon
  # Money asked for, money paid, and the goods behind it
  COMMERCE = {
    cart: { bootstrap: :cart, ios: :cart, android: :shopping_cart },
    bag: { bootstrap: :bag, ios: :bag, android: :shopping_bag },
    tag: { bootstrap: :tag, ios: :tag, android: :sell },
    credit_card: { bootstrap: :'credit-card', ios: :creditcard, android: :credit_card },
    cash: { bootstrap: :cash, ios: :banknote, android: :payments },
    wallet: { bootstrap: :wallet, ios: :'wallet.pass', android: :wallet },
    gift: { bootstrap: :gift, ios: :gift, android: :redeem },
    percent: { bootstrap: :percent, ios: :percent, android: :percent },
    ticket: { bootstrap: :ticket, ios: :ticket, android: :confirmation_number },
    barcode: { bootstrap: :upc, ios: :barcode, android: :barcode },
    qr_code: { bootstrap: :'qr-code', ios: :qrcode, android: :qr_code },
    invoice: { bootstrap: :'file-earmark-text', ios: :'doc.text', android: :receipt_long },
  }.freeze
end

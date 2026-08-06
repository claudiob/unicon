module Unicon
  # How a record stands, and what the reader should make of it
  STATUS = {
    warning: {
      bootstrap: :'exclamation-triangle', ios: :'exclamationmark.triangle', android: :warning,
    },
    info: { bootstrap: :'info-circle', ios: :'info.circle', android: :info },
    question: { bootstrap: :'question-circle', ios: :'questionmark.circle', android: :help },
    check_circle: { bootstrap: :'check-circle', ios: :'checkmark.circle', android: :check_circle },
    close_circle: { bootstrap: :'x-circle', ios: :'xmark.circle', android: :cancel },
    circle: { bootstrap: :circle, ios: :circle, android: :circle },
    square: { bootstrap: :square, ios: :square, android: :square },
    star: { bootstrap: :star, ios: :star, android: :star },
    heart: { bootstrap: :heart, ios: :heart, android: :favorite },
    bookmark: { bootstrap: :bookmark, ios: :bookmark, android: :bookmark },
    thumbs_up: { bootstrap: :'hand-thumbs-up', ios: :'hand.thumbsup', android: :thumb_up },
    thumbs_down: { bootstrap: :'hand-thumbs-down', ios: :'hand.thumbsdown', android: :thumb_down },
    trophy: { bootstrap: :trophy, ios: :trophy, android: :trophy },
    lightbulb: { bootstrap: :lightbulb, ios: :lightbulb, android: :lightbulb },
    smiley: { bootstrap: :'emoji-smile', ios: :'face.smiling', android: :sentiment_satisfied },
    award: { bootstrap: :award, ios: :rosette, android: :workspace_premium },
    infinity: { bootstrap: :infinity, ios: :infinity, android: :all_inclusive },
  }.freeze
end

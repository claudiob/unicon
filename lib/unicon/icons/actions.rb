module Unicon
  # What a person does to a record
  ACTIONS = {
    search: { bootstrap: :search, ios: :magnifyingglass, android: :search },
    plus: { bootstrap: :plus, ios: :plus, android: :add },
    minus: { bootstrap: :dash, ios: :minus, android: :remove },
    check: { bootstrap: :check, ios: :checkmark, android: :check },
    close: { bootstrap: :x, ios: :xmark, android: :close },
    pencil: { bootstrap: :pencil, ios: :pencil, android: :edit },
    trash: { bootstrap: :trash, ios: :trash, android: :delete },
    filter: { bootstrap: :funnel, ios: :'line.3.horizontal.decrease', android: :filter_alt },
    sort: { bootstrap: :'sort-down', ios: :'arrow.up.arrow.down', android: :sort },
    download: { bootstrap: :download, ios: :'arrow.down.circle', android: :download },
    upload: { bootstrap: :upload, ios: :'arrow.up.circle', android: :upload },
    share: { bootstrap: :share, ios: :'square.and.arrow.up', android: :share },
    link: { bootstrap: :link, ios: :link, android: :link },
    copy: { bootstrap: :copy, ios: :'doc.on.doc', android: :content_copy },
    printer: { bootstrap: :printer, ios: :printer, android: :print },
    refresh: { bootstrap: :'arrow-clockwise', ios: :'arrow.clockwise', android: :refresh },
    undo: { bootstrap: :'arrow-counterclockwise', ios: :'arrow.uturn.backward', android: :undo },
    zoom_in: { bootstrap: :'zoom-in', ios: :'plus.magnifyingglass', android: :zoom_in },
    zoom_out: { bootstrap: :'zoom-out', ios: :'minus.magnifyingglass', android: :zoom_out },
    scissors: { bootstrap: :scissors, ios: :scissors, android: :content_cut },
    shuffle: { bootstrap: :shuffle, ios: :shuffle, android: :shuffle },
    repeat: { bootstrap: :repeat, ios: :repeat, android: :repeat },
    task: { bootstrap: :'check2-square', ios: :checklist, android: :task_alt },
  }.freeze
end

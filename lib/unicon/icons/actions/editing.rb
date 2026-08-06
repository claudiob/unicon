module Unicon
  # Changing a record, or what is shown of it
  EDITING = {
    plus: { bootstrap: 'plus', ios: 'plus', android: 'add' },
    minus: { bootstrap: 'dash', ios: 'minus', android: 'remove' },
    check: { bootstrap: 'check', ios: 'checkmark', android: 'check' },
    close: { bootstrap: 'x', ios: 'xmark', android: 'close' },
    pencil: { bootstrap: 'pencil', ios: 'pencil', android: 'edit' },
    trash: { bootstrap: 'trash', ios: 'trash', android: 'delete' },
    copy: { bootstrap: 'copy', ios: 'doc.on.doc', android: 'content_copy' },
    scissors: { bootstrap: 'scissors', ios: 'scissors', android: 'content_cut' },
    undo: { bootstrap: 'arrow-counterclockwise', ios: 'arrow.uturn.backward', android: 'undo' },
    refresh: { bootstrap: 'arrow-clockwise', ios: 'arrow.clockwise', android: 'refresh' },
    sort: { bootstrap: 'sort-down', ios: 'arrow.up.arrow.down', android: 'sort' },
    zoom_in: { bootstrap: 'zoom-in', ios: 'plus.magnifyingglass', android: 'zoom_in' },
    zoom_out: { bootstrap: 'zoom-out', ios: 'minus.magnifyingglass', android: 'zoom_out' },
    person_add: { bootstrap: 'person-plus', ios: 'person.badge.plus', android: 'person_add' },
    person_remove: {
      bootstrap: 'person-dash', ios: 'person.badge.minus', android: 'person_remove',
    },
  }.freeze
end

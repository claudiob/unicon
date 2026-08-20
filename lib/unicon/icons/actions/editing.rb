module Unicon
  # Changing a record, or what is shown of it
  EDITING = {
    add: { bootstrap: 'plus', ios: 'plus', android: 'add' },
    subtract: { bootstrap: 'dash', ios: 'minus', android: 'remove' },
    confirm: { bootstrap: 'check', ios: 'checkmark', android: 'check' },
    close: { bootstrap: 'x', ios: 'xmark', android: 'close' },
    edit: { bootstrap: 'pencil', ios: 'pencil', android: 'edit' },
    delete: { bootstrap: 'trash', ios: 'trash', android: 'delete' },
    copy: { bootstrap: 'copy', ios: 'doc.on.doc', android: 'content_copy' },
    cut: { bootstrap: 'scissors', ios: 'scissors', android: 'content_cut' },
    undo: { bootstrap: 'arrow-counterclockwise', ios: 'arrow.uturn.backward', android: 'undo' },
    refresh: { bootstrap: 'arrow-clockwise', ios: 'arrow.clockwise', android: 'refresh' },
    sort: { bootstrap: 'sort-down', ios: 'arrow.up.arrow.down', android: 'sort' },
    drag: { bootstrap: 'grip-vertical', ios: 'line.3.horizontal', android: 'drag_indicator' },
    zoom_in: { bootstrap: 'zoom-in', ios: 'plus.magnifyingglass', android: 'zoom_in' },
    zoom_out: { bootstrap: 'zoom-out', ios: 'minus.magnifyingglass', android: 'zoom_out' },
    add_member: { bootstrap: 'person-plus', ios: 'person.badge.plus', android: 'person_add' },
    remove_member: {
      bootstrap: 'person-dash', ios: 'person.badge.minus', android: 'person_remove',
    },
  }.freeze
end

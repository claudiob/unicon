module Unicon
  # Where a control leads, and what it opens
  POINTING = {
    move_up: { bootstrap: 'chevron-up', ios: 'chevron.up', android: 'keyboard_arrow_up' },
    move_down: {
      bootstrap: 'chevron-down', ios: 'chevron.down', android: 'keyboard_arrow_down',
    },
    move_left: {
      bootstrap: 'chevron-left', ios: 'chevron.left', android: 'keyboard_arrow_left',
    },
    move_right: {
      bootstrap: 'chevron-right', ios: 'chevron.right', android: 'keyboard_arrow_right',
    },
    point_up: { bootstrap: 'arrow-up', ios: 'arrow.up', android: 'arrow_upward' },
    point_down: { bootstrap: 'arrow-down', ios: 'arrow.down', android: 'arrow_downward' },
    point_left: { bootstrap: 'arrow-left', ios: 'arrow.left', android: 'arrow_back' },
    point_right: { bootstrap: 'arrow-right', ios: 'arrow.right', android: 'arrow_forward' },
    open_menu: { bootstrap: 'list', ios: 'line.3.horizontal', android: 'menu' },
    truncate: { bootstrap: 'three-dots', ios: 'ellipsis', android: 'more_horiz' },
    toggle_sidebar: { bootstrap: 'layout-sidebar', ios: 'sidebar.left', android: 'view_sidebar' },
  }.freeze
end

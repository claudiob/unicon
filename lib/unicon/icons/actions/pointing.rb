module Unicon
  # Where a control leads, and what it opens
  POINTING = {
    chevron_up: { bootstrap: 'chevron-up', ios: 'chevron.up', android: 'keyboard_arrow_up' },
    chevron_down: {
      bootstrap: 'chevron-down', ios: 'chevron.down', android: 'keyboard_arrow_down',
    },
    chevron_left: {
      bootstrap: 'chevron-left', ios: 'chevron.left', android: 'keyboard_arrow_left',
    },
    chevron_right: {
      bootstrap: 'chevron-right', ios: 'chevron.right', android: 'keyboard_arrow_right',
    },
    arrow_up: { bootstrap: 'arrow-up', ios: 'arrow.up', android: 'arrow_upward' },
    arrow_down: { bootstrap: 'arrow-down', ios: 'arrow.down', android: 'arrow_downward' },
    arrow_left: { bootstrap: 'arrow-left', ios: 'arrow.left', android: 'arrow_back' },
    arrow_right: { bootstrap: 'arrow-right', ios: 'arrow.right', android: 'arrow_forward' },
    menu: { bootstrap: 'list', ios: 'line.3.horizontal', android: 'menu' },
    ellipsis: { bootstrap: 'three-dots', ios: 'ellipsis', android: 'more_horiz' },
    sidebar: { bootstrap: 'layout-sidebar', ios: 'sidebar.left', android: 'view_sidebar' },
  }.freeze
end

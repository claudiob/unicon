module Unicon
  # How a page arranges what it shows
  LAYOUT = {
    table: { bootstrap: :table, ios: :tablecells, android: :table_chart },
    list: { bootstrap: :'list-ul', ios: :'list.bullet', android: :list },
    grid: { bootstrap: :grid, ios: :'square.grid.2x2', android: :grid_view },
    menu: { bootstrap: :list, ios: :'line.3.horizontal', android: :menu },
    window: { bootstrap: :window, ios: :macwindow, android: :web_asset },
    sidebar: { bootstrap: :'layout-sidebar', ios: :'sidebar.left', android: :view_sidebar },
    ellipsis: { bootstrap: :'three-dots', ios: :ellipsis, android: :more_horiz },
  }.freeze
end

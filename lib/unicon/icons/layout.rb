module Unicon
  # How a page shows a set of records, and how a reader narrows it
  LAYOUT = {
    table: { bootstrap: 'table', ios: 'tablecells', android: 'table_chart' },
    list: { bootstrap: 'list-ul', ios: 'list.bullet', android: 'list' },
    grid: { bootstrap: 'grid', ios: 'square.grid.2x2', android: 'grid_view' },
    window: { bootstrap: 'window', ios: 'macwindow', android: 'web_asset' },
    search: { bootstrap: 'search', ios: 'magnifyingglass', android: 'search' },
    filter: { bootstrap: 'funnel', ios: 'line.3.horizontal.decrease', android: 'filter_alt' },
  }.freeze
end

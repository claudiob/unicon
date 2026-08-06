module Unicon
  # Numbers drawn rather than listed
  CHARTS = {
    bar_chart: { bootstrap: :'bar-chart', ios: :'chart.bar', android: :bar_chart },
    pie_chart: { bootstrap: :'pie-chart', ios: :'chart.pie', android: :pie_chart },
    trending_up: {
      bootstrap: :'graph-up', ios: :'chart.line.uptrend.xyaxis', android: :trending_up,
    },
    speedometer: { bootstrap: :speedometer, ios: :gauge, android: :speed },
  }.freeze
end

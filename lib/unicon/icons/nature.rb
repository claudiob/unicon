module Unicon
  # Weather, daylight and the world outside the window
  NATURE = {
    sun: { bootstrap: 'sun', ios: 'sun.max', android: 'light_mode' },
    moon: { bootstrap: 'moon', ios: 'moon', android: 'dark_mode' },
    rain: { bootstrap: 'cloud-rain', ios: 'cloud.rain', android: 'rainy' },
    snow: { bootstrap: 'snow', ios: 'snowflake', android: 'weather_snowy' },
    fire: { bootstrap: 'fire', ios: 'flame', android: 'local_fire_department' },
    droplet: { bootstrap: 'droplet', ios: 'drop', android: 'water_drop' },
    bolt: { bootstrap: 'lightning', ios: 'bolt', android: 'bolt' },
    tree: { bootstrap: 'tree', ios: 'tree', android: 'park' },
  }.freeze
end

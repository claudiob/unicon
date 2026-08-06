module Unicon
  # The hardware an app runs on and talks to
  DEVICES = {
    laptop: { bootstrap: 'laptop', ios: 'laptopcomputer', android: 'computer' },
    keyboard: { bootstrap: 'keyboard', ios: 'keyboard', android: 'keyboard' },
    display: { bootstrap: 'display', ios: 'display', android: 'monitor' },
    server: { bootstrap: 'hdd-rack', ios: 'server.rack', android: 'dns' },
    cloud: { bootstrap: 'cloud', ios: 'cloud', android: 'cloud' },
    wifi: { bootstrap: 'wifi', ios: 'wifi', android: 'wifi' },
    battery: { bootstrap: 'battery', ios: 'battery.100', android: 'battery_full' },
    terminal: { bootstrap: 'terminal', ios: 'terminal', android: 'terminal' },
  }.freeze
end

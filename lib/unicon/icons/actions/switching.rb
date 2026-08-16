module Unicon
  # Turning something on, off, or open
  SWITCHING = {
    login: {
      bootstrap: 'box-arrow-in-right',
      ios: 'rectangle.portrait.and.arrow.forward',
      android: 'login',
    },
    logout: {
      bootstrap: 'box-arrow-right', ios: 'rectangle.portrait.and.arrow.right', android: 'logout',
    },
    unlock: { bootstrap: 'unlock', ios: 'lock.open', android: 'lock_open' },
    hide: { bootstrap: 'eye-slash', ios: 'eye.slash', android: 'visibility_off' },
    power: { bootstrap: 'power', ios: 'power', android: 'power_settings_new' },
  }.freeze
end

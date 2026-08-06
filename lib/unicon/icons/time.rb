module Unicon
  # A moment, a duration, and the calendar around them
  TIME = {
    calendar: { bootstrap: 'calendar', ios: 'calendar', android: 'calendar_month' },
    calendar_check: {
      bootstrap: 'calendar-check', ios: 'calendar.badge.checkmark', android: 'event_available',
    },
    clock: { bootstrap: 'clock', ios: 'clock', android: 'schedule' },
    alarm: { bootstrap: 'alarm', ios: 'alarm', android: 'alarm' },
    hourglass: { bootstrap: 'hourglass', ios: 'hourglass', android: 'hourglass_empty' },
    stopwatch: { bootstrap: 'stopwatch', ios: 'stopwatch', android: 'timer' },
  }.freeze
end

module Unicon
  # The trade a job belongs to, and the settings behind an app
  TOOLS = {
    gear: { bootstrap: 'gear', ios: 'gearshape', android: 'settings' },
    sliders: { bootstrap: 'sliders', ios: 'slider.horizontal.3', android: 'tune' },
    toolbox: { bootstrap: 'tools', ios: 'wrench.and.screwdriver', android: 'handyman' },
    hammer: { bootstrap: 'hammer', ios: 'hammer', android: 'hardware' },
    wrench: { bootstrap: 'wrench', ios: 'wrench', android: 'build' },
    ruler: { bootstrap: 'rulers', ios: 'ruler', android: 'straighten' },
    wand: { bootstrap: 'magic', ios: 'wand.and.stars', android: 'wand_stars' },
    puzzle: { bootstrap: 'puzzle', ios: 'puzzlepiece', android: 'extension' },
    briefcase: { bootstrap: 'briefcase', ios: 'briefcase', android: 'work' },
    task: { bootstrap: 'check2-square', ios: 'checklist', android: 'task_alt' },
  }.freeze
end

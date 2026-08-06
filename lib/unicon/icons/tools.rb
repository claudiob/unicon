module Unicon
  # The trade a job belongs to, and the settings behind an app
  TOOLS = {
    gear: { bootstrap: :gear, ios: :gearshape, android: :settings },
    sliders: { bootstrap: :sliders, ios: :'slider.horizontal.3', android: :tune },
    toolbox: { bootstrap: :tools, ios: :'wrench.and.screwdriver', android: :handyman },
    hammer: { bootstrap: :hammer, ios: :hammer, android: :hardware },
    wrench: { bootstrap: :wrench, ios: :wrench, android: :build },
    power: { bootstrap: :power, ios: :power, android: :power_settings_new },
    ruler: { bootstrap: :rulers, ios: :ruler, android: :straighten },
    puzzle: { bootstrap: :puzzle, ios: :puzzlepiece, android: :extension },
    briefcase: { bootstrap: :briefcase, ios: :briefcase, android: :work },
  }.freeze
end

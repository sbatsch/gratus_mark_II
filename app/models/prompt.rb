class Prompt < ApplicationRecord
  enum topic: {
                nature: 0,
                health: 1,
                people: 2,
                yourself: 3
              }
end

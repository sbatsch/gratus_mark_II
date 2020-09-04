class Prompt < ApplicationRecord
  validates :topic, presence: true
  validates :topic, numericality:  { only_integer: true }
  validates :content, presence: true
  validates :content, length: { maximum: 1000 }

  enum topic: {
                nature: 0,
                health: 1,
                people: 2,
                yourself: 3
              }
end

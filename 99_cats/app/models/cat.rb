class Cat < ApplicationRecord
    COLORS = [
        'Orange',
        'Black',
        'Ali',
        'White',
        'Sam',
        'Red',
        'Pumpernickle',
        'Blue'
    ].freeze
    
    validates :sex, :inclusion => {in: %w(M F), message:'invalid sex'} 
    validates :color, :inclusion => {in: COLORS, message:'invalid color'} 
    
    def age
        birth_date = self.birth_date
        today = Time.now.year
        today - birth_date.year
    end
end
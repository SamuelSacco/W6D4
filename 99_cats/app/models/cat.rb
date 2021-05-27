# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  name        :string           not null
#  sex         :string(1)
#  color       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
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


    has_many :requests,
        foreign_key: :cat_id,
        class_name: :Cat,
        dependent: :destroy


end

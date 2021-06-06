# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  # def characters
  #   my_id = self.id

  #   matching_characters = Character.where({ :actor_id => my_id })

  #   return matching_characters
  # end

  def filmography
    array_of_movies = Array.new

    self.characters.each do |a_character|
     array_of_movies.push(a_character.movie)
    end

    return array_of_movies
  end

  has_many(:characters, {:class_name => "Character", :foreign_key => "actor_id" })

  has_many(:filmography, {:through => "Character", :source => :movie })
end

require'pry'
class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        name = "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        roles = []
        character_names = self.characters.map {|character| character.name}
        show_names = self.shows.map {|shows| shows.name}
        role = character_names.concat show_names
        roles << role.join(" - ")
        roles
    end
end
class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

  def actors_list
    full_name = []
    first_name = self.actors.map {|actor| actor.first_name}
    last_name = self.actors.map {|actor| actor.last_name}
    actor_name = first_name.concat last_name
    full_name << actor_name.join(" ")
    full_name
  end
end
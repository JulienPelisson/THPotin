class CityController < ApplicationController
	def show
		@city = City.find(params[:id])
  # Je récupère les users_id liés à la ville en params[:id]
    @array_of_gossips = []
    user_ids = User.where(city_id:params[:id]).ids
    # print user_ids

    # Je récupère les gossips liés aux users de la ville
    $gossips_ids = []
    user_ids.each do |id|
      $gossips_ids << Potin.where(user_id:id).ids
    end
    # print $gossips_ids

    # J'aplatie
    $gossips_ids = $gossips_ids.flatten

    $gossips_ids.each do |gossip_id|
      @array_of_gossips << Potin.find(gossip_id)
    end
    print @array_of_gossips
  end

end

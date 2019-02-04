# frozen_string_literal: true

class IndexController < ApplicationController
  def home 
  	@potin = Potin.all
  end
end

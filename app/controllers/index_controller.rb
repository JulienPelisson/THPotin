# frozen_string_literal: true

class IndexController < ApplicationController
  def home 
  	@potin = Potin.all
  end

  def potin
    @potin = Potin.all
  end

  def profile
    @potin = Potin.all
  end
end

class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @pets = Pet.all
  end
end

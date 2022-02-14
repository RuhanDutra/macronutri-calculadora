class HomeController < ApplicationController
  def index
    @produtos = params[:produtos] unless params[:produtos].blank?
  end
end

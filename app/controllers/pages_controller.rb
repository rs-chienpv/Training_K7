class PagesController < ApplicationController
  def home
    @notice = flash[:success] if flash[:success].present?
    flash.delete(:notice)
    @pagy, @listFootballPitches = pagy(FootballField.all, items: 5)
  end
end

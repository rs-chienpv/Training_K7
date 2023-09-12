class PagesController < ApplicationController
  def home
    @notice = flash[:success] if flash[:success].present?
    flash.delete(:notice)
  end
end

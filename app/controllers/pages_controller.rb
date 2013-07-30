class PagesController < ApplicationController
  def home
  end

  def about
  end

  private

  def safe_page_params
  	params.require(:page).permit(:email, :password, :password_confirmation, :remember_me, :name )
  end
  
end

class PagesController < ApplicationController
	# The below can be used to block all pages except those that are explicitly
	# allowed in the ability.rb file
	# authorize_resource :class => :pages
  def home
  end

  def about
  end

  def contact
  end
end

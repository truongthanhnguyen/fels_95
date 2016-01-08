class StaticPagesController < ApplicationController
  def home
    @feed_items = Activity.feed(current_user.id).paginate page: params[:page],
      per_page: Settings.perpage if logged_in?
  end
end


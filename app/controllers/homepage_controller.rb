class HomepageController < ApplicationController
  

  def index
    @feed_materials = Material.all
    @feed_courses = Course.all.order('created_at desc')
  end

  
end

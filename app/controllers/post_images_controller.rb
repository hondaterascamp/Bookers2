class PostImagesController < ApplicationController

  def index
    @post_images = PostImage.all
    @post_image = PostImage.new
  end
  
end

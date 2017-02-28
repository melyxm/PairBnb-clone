module UsersHelper
  def image_for(user, options = {size: 300})
    size = options[:size]
      if user.image? == true
          image_tag(user.image.url, width: size, height: size)
      else
          image_tag '/images/default-avatar.jpg', width: size, height: size
    end
  end
end

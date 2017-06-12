module ApplicationHelper
  def profile_pic_for(user)
    picture_id = user.id * rand(5..30)
    picture_url = "https://unsplash.it/200/?image=#{picture_id}"
    image_tag(picture_url, alt: user.first_name, class: "img-circle")
  end
end

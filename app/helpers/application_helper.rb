module ApplicationHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/#{gravatar_id}"
    image_tag("https://organicthemes.com/demo/profile/files/2012/12/profile_img.png", alt: user.first_name, class: "img-circle")
  end
end

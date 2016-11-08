class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :api_token, :avatar, :following


  def following
    if current_user
      object.followed_by?(current_user)
    else
      false
    end
  end


  def avatar
    if @avatar == nil
      "https://robohash.org/" + "#{object.name}"
    else
      Refile.attachment_url(object, :avatar, :fit, 100, 100, format: "jpg")
    end

  end
end

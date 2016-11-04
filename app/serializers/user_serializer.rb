class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :api_token, :avatar, :following


  def following
    if current_user
      object.followed_by?(current_user)
    else
      false
    end
  end
end

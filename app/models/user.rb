class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    #as this is, it will not update the data for the user
    #if user has updated their info on github it will not be up to date in our db
    # where(uid: auth_info[:uid]).first_or_create do |new_user|
    #   new_user.uid                = auth_info.uid
    #   new_user.nickname           = auth_info.info.nickname
    #   new_user.profile_pic        = auth_info.info.image
    #   new_user.oauth_token        = auth_info.credentials.token
    # end

    user = User.find_or_create_by(uid: auth_info[:uid])
    user.update_attributes(
      uid:         auth_info.uid,
      nickname:    auth_info.nickname,
      profile_pic: auth_info.profile_pic,
      oauth_token: auth_info.credentials.token
    )
    user
  end
end

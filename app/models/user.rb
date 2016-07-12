class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)

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

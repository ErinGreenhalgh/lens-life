class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    user = User.find_or_create_by(uid: auth_info[:uid])
    user.update_attributes(
      uid:         auth_info.uid,
      nickname:    auth_info.info.nickname,
      profile_pic: auth_info.info.image,
      oauth_token: auth_info.credentials.token
      
    )
    user
  end

  def starred_count(user)
    UsersService.new.get_starred_repos(user).count
  end

  def
end

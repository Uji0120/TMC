class User::HomesController < ApplicationController

  def top
  end

  def about
  end
  
  def guest_sign_in
    user = User.find_or_create_by!(first_name: 'guest', last_name: 'guest', first_name_kana: 'guest', last_name_kana: 'guest', introduction: 'guest user',email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to posts_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
end

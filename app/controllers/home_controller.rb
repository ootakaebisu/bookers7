class HomeController < ApplicationController
  def show
    # @user = User.find(current_user.id)
  end

  def about
  end

  # def show
  #   if @user.update(user_params) #（）内の指定の意味はprivate内のuser_paramsのpermit内を引き出している
  #       @user = User.find(current_user.id)
  #   else
  #       redirect_to user_path(@user)
  #   end
  # end


end

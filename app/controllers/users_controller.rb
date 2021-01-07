class UsersController < ApplicationController
    skip_before_action :login_required

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            UserMailer.creation_email(@user).deliver_now
            logger.debug "user: #{@user.attributes.inspect}"
            session[:user_id] = @user.id #セッションに:user_idをセットしてログイン状態を作る
            redirect_to tasks_path, notice: "ユーザー「#{@user.name}」を登録しました。"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

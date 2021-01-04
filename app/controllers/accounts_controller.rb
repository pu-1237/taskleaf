class AccountsController < ApplicationController

    def show
        @user = current_user
    end
    def edit
        @user = current_user
    end

    def update
        @user = current_user

        if @user.update(user_params)
            redirect_to account_path, notice: "アカウント情報を更新しました。"
        else
            render :edit
        end
    end

    def destroy
        @user= current_user
        @user.destroy
        redirect_to root_path, notice: "アカウントを削除しました。"
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

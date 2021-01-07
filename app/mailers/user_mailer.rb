class UserMailer < ApplicationMailer
    default from: 'puchiko1237@gmail.com'

    def creation_email(user)
        @user = user
        mail(
            subject: 'アカウント作成完了メール',
            to: @user.email,
        )
    end
end

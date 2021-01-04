class ApplicationController < ActionController::Base
    helper_method :current_user
    before_action :login_required
    before_action :set_locale

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to login_path unless current_user
    end

    # アプリの設定へ反映する
    def set_locale
        I18n.locale = locale
    end

    # パラメータへ渡ってきた言語をインスタンス変数へセットする
    # パラメータがない場合はデフォルトの言語を使用する
    def locale
        @locale ||= params[:locale] ||= I18n.default_locale
    end

    # 画面遷移したときに言語の設定が消えないようにする
    def default_url_options(options={})
        options.merge(locale: locale)
    end
end

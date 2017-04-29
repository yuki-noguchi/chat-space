class MessagesController < ApplicationController
  def index
    @flash = {}
    @flash[:sign_in] = "ログインに成功しました"
    @flash[:sign_in_error] = "ログインに失敗しました"
    @flash[:sign_up] = "ユーザー情報を登録しました"
    @flash[:sign_up_error] = "ユーザー情報の登録に失敗しました"
    @flash[:sign_out] = "ログアウトしました"
    @flash[:edit] = "ユーザー情報を編集しました"
  end
end

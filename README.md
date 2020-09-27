# NAGANO CAKE

このサイトは、「長野県にある小さな洋菓子店　ながのCAKE の商品を通販するためのECサイト」というテーマのもとDMMWEBCAMP2ヶ月目のチーム製作学習で作成したサイトです。

# nagano_cake1実行方法

$ git clone https://github.com/katashisu/nagano_cake1.git
$ cd nagano-cake
$ rails db:migrate
$ rails s -b 0.0.0.0

[管理者サイト](http://localhost:3000/owners/sign_in)よりジャンル登録、商品登録等行えます。
ログインには下記情報を入力してください。
メールアドレス：
パスワード：

# 実装機能

### 会員専用サイト(customer)
・会員登録/編集/退会
・商品ジャンル検索
・商品の閲覧/カート追加/注文
・配送先登録/編集
・注文履歴の確認

### 管理者専用サイト(owner)
・商品ジャンル登録/編集/表示設定
・商品の登録/編集/削除/表示設定
・注文履歴の確認/注文ステータス変更/製作ステータス変更
・会員情報の確認/編集

# 開発環境

・Ruby 2.5.7
・rails 5.2.4.4
・sqlite3
・Gem
devies
refile
Bootstrap 3.3.6
jQuery-rails
kaminari



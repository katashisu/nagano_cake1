# NAGANO CAKE

このサイトは、「長野県にある小さな洋菓子店[ながのCAKE]の商品を通販するためのECサイト」<br>
というテーマのもとDMMWEBCAMP2ヶ月目のチーム製作学習で作成したサイトです。

# nagano_cake1実行方法
```
$ git clone https://github.com/katashisu/nagano_cake1.git

$ cd nagano_cake1

$ rails db:seed

$ rails s -b 0.0.0.0
```
[管理者サイト](http://localhost:3000/owners/sign_in)よりジャンル登録、商品登録等行えます。<br>
ログインには下記情報を入力してください。<br>
メールアドレス：owner-test@mail<br>
パスワード：owner-test

会員サイトへのアクセスは[こちら](http://localhost:3000/customers/sign_up)から。

# 実装機能

### 会員専用サイト(customer)
・会員登録/編集/退会<br>
・商品ジャンル検索<br>
・商品の閲覧/カート追加/注文<br>
・配送先登録/編集<br>
・注文履歴の確認

### 管理者専用サイト(owner)
・商品ジャンル登録/編集/表示設定<br>
・商品の登録/編集/削除/表示設定<br>
・注文履歴の確認/注文ステータス変更/製作ステータス変更<br>
・会員情報の確認/編集

# 開発環境

・Ruby 2.5.7

・rails 5.2.4.4

・sqlite3

・Gem<br>
devies<br>
refile<br>
Bootstrap 3.3.6<br>
jQuery-rails<br>
kaminari<br>
Enum



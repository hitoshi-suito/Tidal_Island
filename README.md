# アプリ名
# Tidal_Island

# 製品概要
コミュニティが成立するには、人がその場に居合わせるための「空間」と「時間」が必要です。  
今や空間は、オンラインで世界中に作り出されています。  
このアプリでは「時間」に着目しました。  
〜早朝・朝・昼・夕方・夜・深夜〜  
毎日決まった時間に30分間だけ、空間が開かれます。  
生活リズムが合っているという共通点のある人と、ほんの少しの間だけ、コミュニケーションを取ってみましょう。

# バージョン
Ruby 2.6.5  
Ruby on Rails 5.2.5

# 機能一覧
### (カッコ書きの機能は卒業後or余裕があれば実装予定)
* ユーザ登録機能
  * 名前、メールアドレス、パスワードは必須
* ログイン機能
* ブログ投稿機能
* ブログ検索機能
* コメント機能
  * コメント作成、編集、削除
  * （絵文字でリアクションする機能）
* （画像投稿機能）

# カタログ設計
https://docs.google.com/spreadsheets/d/143_CDMvaEfA8WPaw5_a8et3M08ASK0MCpAebaPGfZNw/edit?usp=sharing

# テーブル定義
https://docs.google.com/spreadsheets/d/1HRwydUl8zAT_lhfB8SVTXQYSk6tXvSyYoXU8_729M64/edit?usp=sharing

# ER図
https://cacoo.com/diagrams/noDW3ewyebxQzbFo/FDA2A

# 画面遷移図
https://cacoo.com/diagrams/JWC1jAY7L6NPC7KI/F0313

# ワイヤーフレーム
https://cacoo.com/diagrams/Aq0bVb0Sgl4fJ9br/1635F

# 使用予定Gem
### (カッコ書きのGemは余裕があれば使用予定)
* bcrypt
* device
* ransack
* rspec-rails
* factory_bot_rails
* capybara
* webdrivers
* (carrierwave)
* (mini_magic)

# 就業タームから使用する技術
* コメント機能（編集や削除もできること。投稿失敗時にエラーメッセージをAjaxで出力すること）
* devise

# カリキュラム外から使用する技術
* ransack
# Let's Enjoy Hawaii

ハワイ諸島の人気アクティビティや人気店等の情報を日本語で掲載し、口コミや評価を手軽に投稿できるサイトです。

# アプリURL
https://www.lets-enjoy-hawaii.com/
# アプリ概要
 - ハワイ諸島にある様々な店舗・観光名所やホテル等の検索ができます。
 - お店や、観光場所等の口コミを点数付きで投稿する機能を実装予定
 - いったことのある場所・気になる場所を登録し、自身のマイページで管理できる機能を実装予定

Ruby on Railsで制作指しています。

# アプリ機能
Ruby on Railsで制作したアプリです。
 - 登録済みメールアドレスお知らせ機能 : 会員登録時に、既に登録されているメールアドレスを入力するとその旨を表示して知らせます。
 - ゲストユーザーログイン機能 : 会員登録をしなくても全機能を試すことができます。
 - キーワード検索(あいまい) : 店舗名や地名等、入力したキーワードに合致する場所を曖昧検索できます。
 - 場所検索機能(地図/目的) : 地図上や探す目的から場所を検索できます。
 - マイページ機能 : 口コミ投稿した場所、お気に入り登録した場所を一覧で確認することができます。
 - 口コミ投稿・評価機能 : コメントをつけて場所の評価を5段階で行えます。

# 使い方(各機能の動画を下に纏めてあります)

## 登録済みメールアドレス表示機能
1. 画面右上の『会員登録』をクリック
2. 入力フォーム`メールアドレス欄`に`登録済みメールアドレス`を入力してフォーム部以外をクリック

※動画ではゲストユーザー用のメールアドレスを入力しています。(guest@sample.com)

## ゲストユーザーログイン機能
1. 画面右上の『ログイン』 or 『会員登録』をクリック
2. 入力フォーム下部の`※アカウント登録せず、ユーザー機能を試したい方は こちら`をクリック

※ゲストユーザーは`ユーザー情報編集`をすることができません。

## 場所検索
1. トップページの検索欄に任意のキーワードを入力 or 地図上・島名からいきたい場所を選択 or 目的別のボタンからやりたいことを選択
2. 検索条件に該当する場所をクリック

## 口コミ投稿
1. アクティビティ詳細ページの`口コミ投稿する`ボタンをクリック
2. 口コミ投稿フォームに`タイトル`等の必要項目を入力
3. 画像を添付する場合は`画像を追加する`ボタンをクリックし、画像を選択
4. ページ下部の`投稿する`ボタンをクリックし投稿完了

※画像を添付した場合はプレビューが表示され、`写真削除`ボタンをクリックすると添付画像を削除できます。<br>
※口コミ投稿後は、アクティビティの評価点や★での5段階評価・詳細ページの評価分布が更新されます。

## お気に入り登録
1. 検索ページから任意のアクティビティをクリック
2. アクティビティの詳細ページ上部の`口コミ投稿`や`シェアする`ボタン下部にある`☆`ボタンをクリック

※ `★`ボタンに変化していれば、再度クリックすることでお気に入り登録の解除ができます。

## アクティビティへの訪問記録登録
1. 検索ページから任意のアクティビティをクリック
2. アクティビティの詳細ページ上部の`口コミ投稿`や`シェアする`ボタン下部にある`行った`ボタンをクリック

※ `行った`ボタンのアイコンが足跡マークからチェックマークに変化していれば、再度クリックすることで訪問記録の消去ができます。
<br>
<br>

## ※登録済みメールアドレスお知らせ機能※
<img src="https://i.gyazo.com/431906588bf28ae4e5d35af527a55c05.gif" alt="Image from Gyazo" width="500">

## ※ゲストユーザーログイン※
<img src="https://i.gyazo.com/c0241ece8f5a87d5ac51c84aefd4e03e.gif" alt="Image from Gyazo" width="500">

## ※ゲストユーザー情報更新時の注意画面※
<img src="https://i.gyazo.com/61fc30de5e2d53b6089375e3aa0b51a9.gif" alt="Image from Gyazo" width="500">

## ※口コミページレイアウト※
<img src="https://i.gyazo.com/0aaabddb458fbfb5ef94433bf9de457f.gif" alt="Image from Gyazo" width="500">

## ※口コミ写真添付画面※
<img src="https://i.gyazo.com/de5372a1130883f2943c1db38cfe2818.gif" alt="Image from Gyazo" width="500">

## ※お気に入り・訪問記録登録※
<img src="https://i.gyazo.com/6d00f23b23f7226f6eacaa8b80d7f3c6.gif" alt="Image from Gyazo" width="500">

## ※お気に入り・訪問記録登録解除※
<img src="https://i.gyazo.com/582f4aff95ab9098043f86693f22a1fc.gif" alt="Image from Gyazo" width="500">

<br>
<br>

# ローカル環境へのインストール方法
```
$ git clone https://github.com/Yasunori-aloha/lets-enjoy-hawaii.git
$ cd lets-enjoy-hawaii
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

# ER図
[![Image from Gyazo](https://i.gyazo.com/df54895268d0fbfee3f13d7f0f7b3e3f.png)](https://gyazo.com/df54895268d0fbfee3f13d7f0f7b3e3f)

# 使用技術
## フロントエンド
* HTML
* CSS
* JavaScript
* Vue.js
* Vuex
* Axios
* Vue Router
<br>

※ Vue.js導入に伴い使用中止
* ~~Haml~~
* ~~SCSS~~
* ~~jQuery~~

## バックエンド
* Ruby
* Ruby on Rails

## データベース
* MySQL

## テスト
* RSpec
* FactoryBot
* faker
* rubocop

## 開発環境
* Visual Studio Code

## 本番環境
* AWS (VPC, EC2, S3, RDS, Route53, ACM, ALB)
* https化
* Nginx, Unicorn
# その他
順次機能を実装しております。

実装予定の機能については、Issuesからご確認いただけます。

https://github.com/Yasunori-aloha/lets-enjoy-hawaii/issues

# 作者
### 山崎 泰則
Twitter : https://twitter.com/yasunori_aloha

Qiita : https://qiita.com/yasunori_aloha

メールはこちらへ : t26.yasunori.yamasaki@gmail.com

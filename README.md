# Let's Enjoy Hawaii

ハワイ諸島の人気アクティビティや人気店等の情報を日本語で掲載し、口コミや評価を手軽に投稿できるサイトです。

## アプリ概要
 - ハワイ諸島にある様々な店舗・観光名所やホテル等の検索ができます。
 - お店や、観光場所等の口コミを点数付きで投稿する機能を実装予定
 - いったことのある場所・気になる場所を登録し、自身のマイページで管理できる機能を実装予定

Ruby on Railsで制作指しています。

## アプリ機能
Ruby on Railsで制作したアプリです。
 - キーワード検索(あいまい) :店舗名や地名等、入力したキーワードに合致する場所を曖昧検索できます。
 - 場所検索機能(地図/目的) :地図上や探す目的から場所を検索できます。
 - マイページ機能 :口コミ投稿した場所、お気に入り登録した場所を一覧で確認することができます。
 - 口コミ投稿・評価機能 :コメントをつけて場所の評価を5段階で行えます。

## 使い方
### 場所検索
1. トップページの検索欄に任意のキーワードを入力 or 地図上・島名からいきたい場所を選択 or 目的別のボタンからやりたいことを選択
2. 検索条件に該当する場所をクリック

### 口コミ投稿
 - 実装予定
### お気に入り登録
 - 実装予定

## ローカル環境へのインストール方法
```
$ git clone https://github.com/Yasunori-aloha/lets-enjoy-hawaii.git
$cd lets-enjoy-hawaii
$bundle install
$rails db:create
$ rails db:migrate
```
## ER図
https://i.gyazo.com/47094ab8833f94f8dfd865dbe43699e9.png

## その他
順次機能を実装しております。

実装予定の機能については、Issuesからご確認いただけます。

https://github.com/Yasunori-aloha/lets-enjoy-hawaii/issues

## 作者
### 山崎 泰則
Twitter : https://twitter.com/yasunori_aloha

Qiita : https://qiita.com/yasunori_aloha

メールはこちらへ : t26.yasunori.yamasaki@gmail.com
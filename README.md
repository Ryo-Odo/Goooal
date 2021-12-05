# README
## 製品名
目標共有、達成応援SNS「Goooal」

## 製品概要
同じ目標を持っている人達と繋がる、またみんなの目標達成を応援するアプリケーション。
目標を投稿し、その目標についての努力や進捗をつぶやき、そのつぶやきに対して他のユーザーから励ましやアドバイスのコメントを貰う事ができる。

なぜこのアプリが必要か
目標の達成には大きな障害や継続的な努力がつきものであり、精神的に挫けてしまう事がある。
一人では達成困難な目標も、このアプリを通してお互いに励ましアドバイスし合うことで達成へ近づくことができる。

## 開発言語
- Ruby 3.0.1
- Ruby on Rails 6.0.3

## 就職Termで学んだ技術
- devise
- フォロー機能

## カリキュラム外の技術
- Vue.js(タグの選択や検索時のサジェスト入力に使用を想定)

## 実行手順
```
$ git clone git@github.com:Ryo-Odo/Goooal.git
$ cd goooal
$ bundle install
$ rails webpacker:install
$ rails db:create
$ rails db:migrate
$ rails s (rails server -b 0.0.0.0)
```

## チェックシート/カタログ設計/テーブル定義書
https://docs.google.com/spreadsheets/d/1MUHJiozWa66eLxQJp7RyoGq7b6MEhRlGyZ7nO93uK6w/edit?usp=sharing

## ER図
https://drive.google.com/file/d/16mJ4lZvopg8O3_j6u4JuBeGZEbyuzVNA/view?usp=sharing
![ER図](https://user-images.githubusercontent.com/89906223/144711382-0d3c6851-e756-4fba-8514-49e1435ead11.png)

## 画面遷移図
https://drive.google.com/file/d/1Y0d7Z5AY8q6HWnXkcUq_sAVENIA_SDit/view?usp=sharing
![画面遷移図](https://user-images.githubusercontent.com/89906223/144708210-557a5b08-db72-498c-9b33-7f50aebcfb43.png)


## ワイヤーフレーム
https://drive.google.com/file/d/161i4PLBFFuV9YIeWE-rEF4AFMfdVnTPb/view?usp=sharing
![ワイヤーフレーム](https://user-images.githubusercontent.com/89906223/144708208-3fb2053b-507a-498e-a0f9-5cf80c01fbbd.png)

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
- ransack

## 実行手順
```
$ git clone git@github.com:Ryo-Odo/Goooal.git
$ cd Goooal
$ bundle install
$ rails webpacker:install
  Overwrite ...Goooal/config/webpack/environment.js? (enter "h" for help) [Ynaqdhm]
  「n」を入力してエンター(上書きしない)
$ rails db:create
$ rails webpacker:install
  Overwrite ...Goooal/config/webpack/environment.js? (enter "h" for help) [Ynaqdhm]
  「n」を入力してエンター(上書きしない)
$ rails db:migrate
$ rails db:seed
$ rails s (rails server -b 0.0.0.0)
```

## チェックシート/カタログ設計/テーブル定義書
https://docs.google.com/spreadsheets/d/1MUHJiozWa66eLxQJp7RyoGq7b6MEhRlGyZ7nO93uK6w/edit?usp=sharing

## ER図
https://drive.google.com/file/d/16mJ4lZvopg8O3_j6u4JuBeGZEbyuzVNA/view?usp=sharing
![ER図](https://user-images.githubusercontent.com/89906223/145669486-9d414cdd-461f-4a5b-ad99-f1db0491c57c.png)

## 画面遷移図
https://drive.google.com/file/d/1Y0d7Z5AY8q6HWnXkcUq_sAVENIA_SDit/view?usp=sharing
![画面遷移図](https://user-images.githubusercontent.com/89906223/145669489-da1e9d3b-95f4-4a38-9762-ed472985094f.png)


## ワイヤーフレーム
https://drive.google.com/file/d/161i4PLBFFuV9YIeWE-rEF4AFMfdVnTPb/view?usp=sharing
![ワイヤーフレーム](https://user-images.githubusercontent.com/89906223/145669488-28e7f5af-e9e4-4537-9a52-43ba8cc25722.png)

## アプリケーション名
CANLEY

## アプリケーション概要
取扱説明書を管理、共有することができる。  
保証期限を登録しておくと期限１ヶ月前に通知メールが届く。  
また、漫画やその他のアイテムも管理、共有することができる。  
漫画には、次巻発売日を登録しておくと前日に通知メールが届く。

## URL
https://kanriapp.onrender.com

## テスト用アカウント
Basic認証ID：admin  
Basic認証パスワード：2222  
ニックネーム：tester  
メールアドレス：test@test.com  
パスワード：a11111  

## 利用方法

### ログイン・新規登録する
1.ログイン画面から、ログインまたは、新規登録を行う  

### ルームに入る
1.ルーム一覧ページに表示されているルームを選択しクリックする  
2.ルーム未作成の場合、ルーム作成ページに移動し「ルーム名」「パスコード」を入力しルームを作成する  
3.他のユーザーが管理しているルームに参加する場合、ルーム参加ページから、ルーム名、パスコードを入力し、一致すればルームに参加できる

### 取扱説明書を管理・共有する
1.取説一覧ページに移動し、登録ボタンから取扱説明書を登録する  
2.一覧ページに表示されている、登録アイテムをクリックし登録内容の詳細の確認、編集、削除を行う  
3.保証期限を登録した場合は、期限一ヶ月前にメール通知が届く

### 漫画を管理・共有する
1.漫画一覧ページに移動し、登録ボタンから漫画を登録する  
2.一覧ページに表示されている、登録アイテムをクリックし登録内容の詳細の確認、編集、削除を行う  
3.次巻発売予定日を登録した場合は、予定日前日にメール通知が届く

### その他のアイテムを管理・共有する
1.その他アイテム一覧ページに移動し、登録ボタンからアイテムを登録する  
2.一覧ページに表示されている、登録アイテムをクリックし登録内容の詳細の確認、編集、削除を行う  



## アプリケーションを作成した背景
自分自身が身近に感じていた課題として、取扱説明書の管理があった。なんとなく捨てれずにファイルに入れ保管していたが、どんどんかさばってしまい、必要なときは必要としている取扱説明書を探すのも一苦労だった。家族や友人にヒヤリングしたところ、同じような課題を抱えていることが判明した。また、既存のアプリケーションでは、登録した内容を他のユーザーと共有することができないため使用しなかったとの意見があった。  
同様の問題を抱えている方も多いと推測し、課題を解決するために、取扱説明書をベースとしたアイテム管理、共有アプリケーションを開発することにした。



## データベース設計
[![Image from Gyazo](https://i.gyazo.com/1178c8c1b5353f8ebb60ea25ac001836.png)](https://gyazo.com/1178c8c1b5353f8ebb60ea25ac001836)



## 工夫したポイント
ユーザーごとのアイテム管理ではなく、ルームごとでのアイテム管理にすることで、ルームに参加することで簡単にデータ共有できるようにした。  
保証期限一ヶ月前にメールで通知することで、ユーザーに保証期限をリマインドすることができるようにした　　　。  
一覧ページに検索機能を実装したことで、アイテムを探す手間を削減した。












# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :manuals
- has_many :books
- has_many :items

## rooms テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| room_name       | string | null: false |
| room_password   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :manuals
- has_many :books
- has_many :items

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## manuals テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |
| manual_name  | string     | null: false                    |
| model_number | string     |                                |
| manual_url   | string     |                                |
| assurance    | date       |                                |
| manual_date  | date       |                                |
| price        | integer    |                                |
| manual_memo  | text       |                                |

### Association

- belongs_to :room
- belongs_to :user

## books テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |
| book_name    | string     | null: false                    |
| book_number  | integer    | null: false                    |
| release_date | date       |                                |
| book_memo    | text       |                                |

### Association

- belongs_to :room
- belongs_to :user

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| room         | references | null: false, foreign_key: true |
| item_name    | string     | null: false                    |
| item_memo    | text       |                                |

### Association

- belongs_to :room
- belongs_to :user

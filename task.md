# Miniblogアプリケーション作成タスク

## モデルの作成 完了
- Postモデル
  - `rails generate model Post content:text user:references`
  - ユーザーとポストの関連付けを設定
- Userモデル
  - `rails generate devise:install`
  - `rails generate devise User`
  - Deviseを使用して新規登録と認証を実装
- Relationshipモデル
  - `rails generate model Relationship follower:references followed:references`
  - ユーザー同士のフォロー機能を実装するための関連付けを設定

## モデルの関連付け 完了
- Postモデル
  - Userモデルと`belongs_to`で関連付け
- Userモデル
  - Postモデルと`has_many`で関連付け
  - Relationshipモデルと`has_many`でフォロー・フォロワーの関連付けを設定
- Relationshipモデル
  - Userモデルと`belongs_to`で関連付け

## フォロー機能の実装 完了
- コントローラーを作成
  - `rails generate controller Relationships create destroy`
- ルーティングを設定
  - `config/routes.rb`にフォロー・フォロワーのルートを追加
- ビューを作成
  - フォロー・フォロワーのボタンとリストを表示

## テストの追加 完了
- モデルの単体テスト
  - Post, User, Relationshipモデルのバリデーションと関連付けをテスト
- システムテスト
  - ユーザー登録、ログイン、フォロー機能の動作をテスト

## PostコントローラのCRUD機能 完了
- Postコントローラに以下のアクションを実装
  - `index`: 全てのポストを表示
  - `show`: 特定のポストを表示
  - `new`: 新しいポストを作成するフォームを表示
  - `create`: 新しいポストを保存
  - `edit`: 既存のポストを編集するフォームを表示
  - `update`: 既存のポストを更新
  - `destroy`: ポストを削除
- ビューを作成
  - 各アクションに対応するビューを`app/views/posts/`に作成
- ルーティングを設定
  - `config/routes.rb`に`resources :posts`を追加

## Postコントローラのテスト 完了
- コントローラテスト
  - 各アクションの動作を確認するテストを作成
- システムテスト
  - ポストの作成、編集、削除の一連の操作をテスト

## UserコントローラのCRUD機能 完了
- Userコントローラに以下のアクションを実装
  - `index`: 全てのユーザーを表示
  - `show`: 特定のユーザーを表示
  - `edit`: 既存のユーザーを編集するフォームを表示
  - `update`: 既存のユーザーを更新

## ビューを作成 完了
- 各アクションに対応するビューを`app/views/users/`に作成

## ルーティングを設定 完了
- `config/routes.rb`に`resources :users, only: [:index, :show, :edit, :update]`を追加

・他人のポストは編集、削除不可能
・自身はフォロー不可能
・他人のユーザー情報は編集不可能
## 他ユーザーの投稿に「いいね」できるようにする 完了
- いいねの総数が表示される
  - model favorite
    - userとpostをつなぐ中間テーブル
    - user_id,post_idを持つ、組み合わせをuniqueにする
  - show いいねしたユーザー表示
    - いいねをしたユーザーが確認できる,has_manyからcountで取得
  - create,destroy いいねする、または取り消しするアクション
    - 重複していいねが出来ないようにする
## 他ユーザーの投稿にコメントできるようにする 完了
- 各投稿にコメントができるように
  - model comment
    - post_id(コメント対象のポスト),content,user_id(commenter)をもつ
    - create,destroy,postのshow画面で遷移するリンクを表示
- コメントされたら投稿主にメール通知されるように
  - 実装方法を調べる(ActionMailer Previewを利用するらしい)
## 画像を投稿できるようにする 完了
- 投稿内容に画像を含められるようにする
  - ActiveStrogeで実装
  - 参考：https://zenn.dev/code_journey_ys/articles/6416601c56b203#active-storage%E3%81%A8%E3%81%AF
  - activeStrageのインストール
  - マイグレーションの作成
  - モデルとの紐づけ
  - フォームを作成してアップロードできるようにする
  - コントローラを編集して、imageを受け取れるようにする
- タイムラインに表示される画像はサムネイルの状態で表示されるようにする（オリジナルの画像よりもファイルサイズの小さいものが表示されるようにする）
  - 150×150くらいで表示？

## 前日の「いいね」数ランキングが10位までの投稿が通知される
- 前日の「いいね」数ランキングが10位までの投稿がメール通知されるようにする
- メール内に投稿内容も記載されるようにする
- メールはHTMLメールである程度見栄えがデザインされたものであること

## コメントされたら投稿主にメール送信されるようにする
- 開発環境でメール文面を確認する際はActionMailer Previewを利用すること

## ヘッダーの修正
- 右上にユーザー情報、画面へのリンク集約
- 左上にログイン、新規登録機能集約

## 一覧画面の無限スクロール追加

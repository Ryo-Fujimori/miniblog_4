# Miniblogアプリケーション作成タスク

## モデルの作成
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

## モデルの関連付け
- Postモデル
  - Userモデルと`belongs_to`で関連付け
- Userモデル
  - Postモデルと`has_many`で関連付け
  - Relationshipモデルと`has_many`でフォロー・フォロワーの関連付けを設定
- Relationshipモデル
  - Userモデルと`belongs_to`で関連付け

## フォロー機能の実装
- コントローラーを作成
  - `rails generate controller Relationships create destroy`
- ルーティングを設定
  - `config/routes.rb`にフォロー・フォロワーのルートを追加
- ビューを作成
  - フォロー・フォロワーのボタンとリストを表示

## テストの追加
- モデルの単体テスト
  - Post, User, Relationshipモデルのバリデーションと関連付けをテスト
- システムテスト
  - ユーザー登録、ログイン、フォロー機能の動作をテスト

## PostコントローラのCRUD機能
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

## Postコントローラのテスト
- コントローラテスト
  - 各アクションの動作を確認するテストを作成
- システムテスト
  - ポストの作成、編集、削除の一連の操作をテスト


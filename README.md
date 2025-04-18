# WordPress プラグイン開発テンプレート

このリポジトリは、WordPress プラグイン開発のためのスケルトンプロジェクトです。AI 支援による開発がスムーズに行えるように設計されています。

## プロジェクト構造

### リンティング

#### PHPリンティング

このプロジェクトでは、WordPress Coding Standardsに準拠したPHP_CodeSniffer（PHPCS）を使用してPHPコードのリンティングを行っています。

##### 設定

- **設定ファイル**: `phpcs.xml.dist`
- **スタンダード**: WordPress Coding Standards
- **除外ルール**:
  - `WordPress.Files.FileName.NotHyphenatedLowercase` - ハイフン区切りでない小文字のファイル名を許可
  - `WordPress.Files.FileName.InvalidClassFileName` - クラス名と一致しないクラスファイル名を許可
  - `WordPress.WP.I18n.MissingTranslatorsComment` - 翻訳者コメントの省略を許可
  - `WordPress.WP.I18n.NoHtmlWrappedStrings` - HTMLでラップされていない文字列を許可
  - `Generic.CodeAnalysis.UnusedFunctionParameter.Found` - 未使用の関数パラメータを許可
  - `Generic.CodeAnalysis.UnusedFunctionParameter.FoundAfterLastUsed` - 最後に使用されたパラメータの後の未使用パラメータを許可
  - `Generic.Commenting.DocComment.MissingShort` - docコメントでの短い説明の省略を許可
  - `Squiz.Commenting.FunctionComment.ParamCommentFullStop` - 句点で終わらないパラメータコメントを許可
  - `Squiz.Commenting.InlineComment.InvalidEndChar` - 無効な終了文字を持つインラインコメントを許可
  - `Squiz.Commenting.FunctionCommentThrowTag.Missing` - 関数コメントでのthrowタグの省略を許可

##### 除外ディレクトリ

- `vendor/`
- `node_modules/`
- `tests/`

##### コマンド

- **PHPリンティング**: `npm run lint:php` - PHPCSを実行して、コードが標準に準拠しているかをチェック
- **PHPフォーマット**: `npm run format:php` - PHPCBFを実行して、コードスタイルの問題を自動修正

### テスト

#### PHPユニットテスト

このプロジェクトでは、PHPユニットテストにPHPUnitを使用しています。

##### 設定

- **設定ファイル**: `phpunit.xml.dist`
- **ブートストラップファイル**: `tests/php/bootstrap.php`
- **テストディレクトリ**: `tests/php/`
- **テストファイルパターン**: 接頭辞が`test-`で接尾辞が`.php`のファイル

##### 依存関係

- **PHPUnit Polyfills**: 異なるPHPUnitバージョン間の互換性のためにYoast PHPUnit Polyfillsを使用

##### テスト構造

- テストは`WP_UnitTestCase`クラスを継承する
- テストメソッドには接頭辞`test_`を付ける

##### コマンド

- **PHPテスト実行**: `npm run test:phpunit` - testdoxと詳細出力でPHPUnitテストを実行

#### エンドツーエンド（E2E）テスト

このプロジェクトでは、エンドツーエンドテストにPlaywrightを使用しています。

##### 設定

- **設定ファイル**: `playwright.config.js`
- **基本設定**: `@wordpress/scripts/config/playwright.config.js`を拡張
- **テストディレクトリ**: `tests/e2e/`

##### 依存関係

- **WordPress E2Eテストユーティリティ**: WordPress固有のテストユーティリティとして`@wordpress/e2e-test-utils-playwright`を使用

##### テスト構造

- テストでは`@wordpress/e2e-test-utils-playwright`から`test`と`expect`関数を使用
- テストには通常以下が含まれます:
  - プラグインをアクティブ化する`beforeAll`フック
  - プラグインを非アクティブ化する`afterAll`フック
  - アサーションを含むテストケース

##### コマンド

- **E2Eテスト実行**: `npm run test:e2e` - Playwrightテストを実行
- **E2Eテストデバッグ**: `npm run test:e2e:debug` - デバッグモードでPlaywrightテストを実行

### 複合テスト

- **全テスト実行**: `npm run test` - PHPUnitとE2Eテストの両方を実行

## WordPress環境

このプロジェクトでは、ローカルWordPress環境のセットアップに`@wordpress/env`を使用しています。

##### 設定

- **設定ファイル**: `.wp-env.json`
- **WordPressコア**: デフォルトのWordPressコアを使用
- **プラグイン**: 現在のディレクトリをプラグインとして含む

##### コマンド

- **WordPress環境でのComposer**: `npm run composer` - WordPress環境でComposerを実行
- **テスト環境でのComposer**: `npm run composer:test` - テスト環境でComposerを実行

## テンプレートの使い方

このリポジトリは、WordPress プラグイン開発のためのテンプレートとして設計されています。以下のステップでプラグイン開発を始めることができます。

### 開始方法

1. **リポジトリのクローン**:

   ```bash
   git clone https://github.com/mt8/wp-plugin-template.git [プラグインディレクトリ名]
   cd [プラグインディレクトリ名]
   ```

2. **セットアップスクリプトを実行**:

   ```bash
   # 実行権限を付与
   chmod +x init.sh
   
   # スクリプトを実行して新しいプラグインを設定
   ./init.sh   
   ```
   
   このスクリプトは以下の処理を自動的に行います：
   - Gitリポジトリのリセット
   - package.json内のパス更新
   - 依存関係のインストール

3. **WordPress環境の起動**:

   ```bash
   # wp-envでローカル環境を起動
   npx wp-env start

   # wp-envのコンテナ内に依存関係をインストール
   npm run composer install
   ```

4. **初回テストの実行**

   ```bash
   npm run test
   ```

5. **セットアップスクリプトの削除**

   ```bash
   rm init.sh
   ```

### プラグイン実装のヒント

1. **ディレクトリ構造**:
   - `includes/` - 機能ごとのPHPクラスファイル
     - 各機能は独自のクラスとして実装し、このディレクトリに配置してください
     - 命名規則: `class-[機能名].php`（例: `class-admin.php`, `class-api.php`）
   - `tests/` - テストコード

2. **ビルドプロセス**:
   - `npm run build` - プロジェクトをビルド
   - `npm run start` - 開発モードで起動（ウォッチモード）

3. **テスト**:
   - PHPユニットテストを`tests/php/`に追加
   - E2Eテストを`tests/e2e/`に追加

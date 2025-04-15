# WordPress Plugin Template

このリポジトリは、WordPressプラグイン開発を効率化するためのテンプレートです。開発者がすぐに利用できるように、必要なツールや設定があらかじめ構成されています。

## 特徴

- **PHPUnit** を使用したPHPユニットテストのサポート
- **Playwright** を使用したE2Eテストのサポート
- WordPress公式の開発ツール（`@wordpress/scripts`）を活用
- wp-envで簡単にセットアップ可能なローカル開発環境

## セットアップ

1. 必要な依存関係をインストールします。

   ```bash
   npm install
   ```

2. WordPressローカル環境を起動します。

   ```bash
   wp-env start
   ```

3. ローカル環境のコンテナ内で依存関係をインストールします。

    ```bash
    npm run composer install
    ```

## スクリプト

以下のスクリプトを使用して、開発やテストを実行できます。

### テスト

- **`npm run test:phpunit`**  
  PHPUnitを使用してPHPのユニットテストを実行します。

- **`npm run test:e2e`**  
  Playwrightを使用してE2Eテストを実行します。

- **`npm run test:e2e:debug`**  
  デバッグモードでE2Eテストを実行します。

- **`npm run test`**  
  PHPUnitとE2Eテストをすべて実行します。

### コード品質チェック

- **`npm run lint:php`**  
  PHP CodeSniffer（`phpcs`）を使用してPHPコードの静的解析を行い、コーディング規約に違反している箇所を検出します。

- **`npm run format:php`**  
  PHP Code Beautifier and Fixer（`phpcbf`）を使用して、コーディング規約に違反している箇所を自動修正します。

## ディレクトリ構成

```
wp-plugin-template/
├── wp-content/
│   └── plugins/
│       └── wp-plugin-template/  # プラグインのソースコード
├── tests/                       # テスト関連ファイル
├── package.json                 # npmスクリプトと依存関係
├── wp-env.json                  # wp-env設定ファイル
└── README.md                    # このファイル
```

## 必要条件

- Node.js 16以上
- Docker（`wp-env` の実行に必要）
- Composer（PHP依存関係の管理に必要）

## ライセンス

このプロジェクトは [GPL-2.0-or-later](https://www.gnu.org/licenses/gpl-2.0.html) ライセンスの下で提供されています。

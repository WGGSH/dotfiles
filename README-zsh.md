# Enhanced Zsh Configuration
Written by Claude
高度にカスタマイズされたZsh設定ファイルと新環境への移行ツールです。

## ✨ 機能

- **豊富なプラグイン**: 20+のプラグインで生産性向上
- **美しいテーマ**: Powerlevel10kによる高速で美しいプロンプト
- **便利なエイリアス**: Git、Docker、開発作業用の50+のエイリアス  
- **カスタム関数**: ディレクトリ操作、ファイル検索、プロセス管理など
- **最適化された履歴**: 50,000履歴、重複除去、セッション間共有
- **クロスプラットフォーム対応**: Linux、macOS、WSL対応

## 🚀 クイックスタート

### 自動セットアップ（推奨）

```bash
./zsh-setup.sh
```

### 手動セットアップ

詳細な手順は [`zsh-setup.md`](./zsh-setup.md) を参照してください。

## 📁 ファイル構成

- `.zshrc` - メイン設定ファイル
- `zsh-setup.sh` - 自動セットアップスクリプト
- `zsh-setup.md` - 詳細なセットアップ手順
- `.zshrc.backup` - 元の設定のバックアップ

## 🎯 主要なエイリアス

### Git
- `gs` → `git status`
- `ga` → `git add`
- `gc` → `git commit`
- `gp` → `git push`
- `glog` → `git log --oneline --graph --decorate`

### ファイル操作
- `ll` → `ls -alF`
- `..` → `cd ..`
- `md` → `mkdir -p`

### 開発
- `d` → `docker`
- `dc` → `docker-compose`
- `ni` → `npm install`
- `nr` → `npm run`

## 🛠️ カスタム関数

- `mkcd <dir>` - ディレクトリ作成と移動
- `ff <pattern>` - ファイル検索
- `psgrep <process>` - プロセス検索
- `port <number>` - ポート使用状況確認
- `backup <file>` - ファイルのタイムスタンプ付きバックアップ
- `weather [city]` - 天気予報表示

## 🔧 カスタマイズ

### ローカル設定
`~/.zshrc.local` ファイルでローカル固有の設定を追加できます。

### 追加スクリプト
`~/.config/zsh/` ディレクトリに `.zsh` 拡張子のファイルを置くと自動読み込みされます。

## 🐛 トラブルシューティング

### よくある問題

1. **プラグインが動作しない**
   - 新しいシェルセッションを開始
   - プラグインが正しくインストールされているか確認

2. **テーマが表示されない**
   - Nerd Fontsをインストール
   - ターミナルのフォント設定を確認

3. **動作が重い**
   - 不要なプラグインを無効化
   - `~/.zcompdump` を削除

### サポート

問題が発生した場合は、以下を試してください：
1. `source ~/.zshrc` で設定を再読み込み
2. 新しいターミナルセッションを開始
3. バックアップから元の設定に戻す: `mv ~/.zshrc.backup-* ~/.zshrc`

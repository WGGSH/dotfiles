# CLAUDE.md

このファイルは、Claude Code (claude.ai/code) がこのリポジトリでコードを扱う際のガイダンスを提供します。

## リポジトリ構造

これは、さまざまなデスクトップ環境とアプリケーションの設定ファイルを含む包括的なdotfilesリポジトリで、NixOSシステム設定とスタンドアロンdotfilesの両方を含んでいます。

### 2つの設定レイヤー

**NixOS設定 (`nixos/`):**
- flakeを使用した完全なNixOSシステムとHome Manager設定
- ハードウェア固有の設定を持つマルチマシンサポート
- システムレベルとユーザーレベルの設定管理の分離
- NixOS固有の詳細なガイダンスは `nixos/CLAUDE.md` を参照

**スタンドアロンDotfiles (ルートレベル):**
- 様々なアプリケーション用の従来のdotfiles
- ターミナル、デスクトップ環境、開発ツールの設定ファイル
- シェルスクリプトを使用したシンボリックリンクベースのインストール

## よく使うコマンド

### NixOSシステム管理
```bash
# システムの再構築 (rebuild -> rebuild-a.sh シンボリックリンクを使用)
./nixos/rebuild

# 特定のシステムの再構築
./nixos/rebuild-a.sh    # pc-a設定
./nixos/rebuild-b.sh    # pc-b設定  
./nixos/rebuild-c.sh    # pc-c設定
./nixos/rebuild-wsl.sh  # WSL設定

# flake入力の更新
./nixos/update.sh
# または手動で: nix flake update

# NixOS Home Manager用のdotfilesをプリフェッチ
./nixos/prefetch-dotfiles.sh
```

### 手動Dotfile管理
```bash
# Neovim設定をリンク
./vimlink.sh

# Rofiテーマをインストール
./rofi/basic/install.sh

# Polybarを起動
./i3/polybar/launch.sh

# tmuxテーマを適用
./tmux_themes/default.sh
```

## アプリケーション設定

### デスクトップ環境
- **Hyprland**: `hypr/hyprland.conf` - Waylandコンポジター設定
- **i3**: `i3/` - polybar、rofiテーマ付きのi3ウィンドウマネージャー
- **Waybar**: `waybar/` - Waylandコンポジター用ステータスバー

### ターミナルとシェル
- **Zsh**: `.zshrc` カスタム設定とテーマ付き
- **Tmux**: `.tmux.conf` カスタムキーバインドとテーマ付き
- **Alacritty**: `.alacritty.yml` と `alacritty/` ターミナルエミュレーター用
- **Ghostty**: `ghostty/config` - ターミナルエミュレーター設定
- **Hyper.js**: `.hyper.js` と `.hyper_ubuntu.js` - Electronターミナル

### 開発ツール
- **Neovim**: `nvim/` - deinパッケージマネージャー付き完全なNeovim設定
- **Git submodules**: 外部依存関係を `.gitmodules` で管理

### システム統合
- **X11**: `.Xmodmap`, `.xprofile` X11セッション設定用
- **Lite XL**: `lite/` - 軽量テキストエディター設定
- **Oni**: `oni/` - モダンモーダルエディター設定

## アーキテクチャのハイライト

### マルチマシンサポート
NixOS設定は、flakeを通じて複数のハードウェア構成をサポートします：
- `nixos/hardware-configuration-pc-[a|b|c].nix` のハードウェア固有モジュール
- `nixos/configuration-pc.nix` の共有システム設定
- `nixos/configuration-wsl.nix` のWSL固有設定

### 外部依存関係
- **Ghostty**: `github:ghostty-org/ghostty` からのターミナル
- **Claude Desktop**: `github:k3d3/claude-desktop-linux-flake` からのLinuxクライアント
- **Home Manager**: `github:nix-community/home-manager` からのユーザー環境管理

### 設定の同期
- NixOS Home Managerがこのdotfilesリポジトリにリンク
- `prefetch-dotfiles.sh` がリポジトリの変更を追跡するためにNixOS参照を更新
- NixOS外での手動インストール用の従来のシンボリックリンクスクリプト

## ファイル管理

設定を変更する際：
- システム全体の変更: `nixos/` のファイルを編集して再構築
- ユーザー固有の変更: dotfilesを変更してNixOSを再構築するか手動リンクを使用
- 新しいアプリケーション: 柔軟性のためにNixOSモジュールとスタンドアロンdotfilesの両方に追加
- ハードウェア変更: 適切な `hardware-configuration-pc-*.nix` ファイルを更新

## 開発ワークフロー

- リポジトリ内で設定ファイルを直接編集
- NixOS再構築スクリプトまたは手動シンボリックリンクスクリプトを使用して変更をテスト
- 設定の進化を追跡するために変更をコミット
- 必要に応じて `prefetch-dotfiles.sh` を使用してNixOS参照を更新
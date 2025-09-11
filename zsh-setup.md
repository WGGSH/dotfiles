# Zsh環境セットアップ手順
Written by Claude
このドキュメントは、カスタマイズされた.zshrcファイルを新しい環境で使用するためのセットアップ手順を説明します。

## 📋 前提条件

- Zsh 5.0以上
- Git
- curl または wget
- インターネット接続

## 🚀 セットアップ手順

### 1. Zshのインストール（必要に応じて）

**Ubuntu/Debian:**
```bash
sudo apt update && sudo apt install zsh
```

**CentOS/RHEL/Fedora:**
```bash
sudo dnf install zsh
# または
sudo yum install zsh
```

**macOS:**
```bash
# Homebrewを使用
brew install zsh
```

**Arch Linux:**
```bash
sudo pacman -S zsh
```

### 2. Oh My Zshのインストール

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

または、curlが無い場合：
```bash
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

### 3. 追加プラグインのインストール

#### 3.1 zsh-autosuggestions（自動補完）
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### 3.2 zsh-syntax-highlighting（シンタックスハイライト）
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### 3.3 zsh-completions（追加の補完）
```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### 4. Powerlevel10kテーマのインストール

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### 5. .zshrcファイルの配置

```bash
# 現在の.zshrcをバックアップ（存在する場合）
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.backup-$(date +%Y%m%d-%H%M%S)

# 新しい.zshrcをコピー
cp /path/to/your/.zshrc ~/.zshrc
```

### 6. デフォルトシェルをZshに変更

```bash
chsh -s $(which zsh)
```

### 7. 新しいターミナルセッションを開始

ログアウト・ログインするか、新しいターミナルウィンドウを開きます。

### 8. Powerlevel10k設定（初回のみ）

初回起動時にPowerlevel10kの設定ウィザードが表示されます。
お好みに合わせて設定してください。

## 🛠️ 一括セットアップスクリプト

以下のスクリプトで自動セットアップが可能です：

```bash
#!/bin/bash
# zsh-setup.sh - Zsh環境自動セットアップスクリプト

set -e

echo "🚀 Zsh環境のセットアップを開始します..."

# Oh My Zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "📦 Oh My Zshをインストール中..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# プラグインのインストール
echo "🔌 プラグインをインストール中..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# zsh-completions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

# powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "🎨 Powerlevel10kテーマをインストール中..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# .zshrcのバックアップ
if [ -f "$HOME/.zshrc" ]; then
    echo "💾 既存の.zshrcをバックアップ中..."
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup-$(date +%Y%m%d-%H%M%S)"
fi

# 新しい.zshrcをコピー（このスクリプトと同じディレクトリにあると仮定）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$SCRIPT_DIR/.zshrc" ]; then
    cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
    echo "✅ .zshrcを配置しました"
else
    echo "❌ エラー: .zshrcファイルが見つかりません"
    exit 1
fi

echo "🎉 セットアップ完了！"
echo "💡 次の手順:"
echo "   1. 新しいターミナルを開く、またはログアウト・ログインする"
echo "   2. Powerlevel10k設定ウィザードで好みの設定を選択する"
echo "   3. 'alias' コマンドで利用可能なエイリアスを確認する"
```

## 🔍 動作確認

セットアップ後、以下のコマンドで動作を確認してください：

```bash
# エイリアスの確認
alias | head -10

# プラグインの動作確認
echo "test" # 自動補完候補が表示されるはず

# カスタム関数のテスト
mkcd test-dir  # ディレクトリ作成と移動
cd ..
rmdir test-dir
```

## ⚠️ トラブルシューティング

### プラグインが動作しない場合
1. プラグインディレクトリが正しくインストールされているか確認
2. .zshrcのプラグインリストに正しく記載されているか確認
3. 新しいシェルセッションを開始

### テーマが適用されない場合
1. Powerlevel10kが正しくインストールされているか確認
2. フォントの問題の場合、Nerd Fontsをインストール

### パフォーマンスが遅い場合
1. 不要なプラグインを無効化
2. `zsh-completions`の再構築: `rm ~/.zcompdump && compinit`

## 📚 参考リンク

- [Oh My Zsh公式サイト](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

---

このドキュメントに従ってセットアップすれば、すべての機能が新しい環境でも動作します。

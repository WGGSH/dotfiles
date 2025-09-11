#!/bin/bash
# zsh-setup.sh - Zsh環境自動セットアップスクリプト
# 使用方法: ./zsh-setup.sh

set -e

# カラー出力用
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ログ関数
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# 必要なコマンドの存在確認
check_dependencies() {
    local deps=("git" "curl" "zsh")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            missing+=("$dep")
        fi
    done
    
    if [ ${#missing[@]} -ne 0 ]; then
        log_error "以下のコマンドが見つかりません: ${missing[*]}"
        log_info "必要な依存関係をインストールしてから再実行してください"
        exit 1
    fi
}

echo "🚀 Enhanced Zsh環境のセットアップを開始します..."

# 依存関係チェック
log_info "依存関係を確認中..."
check_dependencies
log_success "依存関係の確認完了"

# Oh My Zshのインストール
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log_info "Oh My Zshをインストール中..."
    export RUNZSH=no  # インストール後に自動でzshを起動しない
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_success "Oh My Zshのインストール完了"
else
    log_info "Oh My Zshは既にインストール済みです"
fi

# プラグインのインストール
log_info "プラグインをインストール中..."

# zsh-autosuggestions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    log_info "zsh-autosuggestions をインストール中..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    log_success "zsh-autosuggestions インストール完了"
else
    log_info "zsh-autosuggestions は既にインストール済みです"
fi

# zsh-syntax-highlighting
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    log_info "zsh-syntax-highlighting をインストール中..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    log_success "zsh-syntax-highlighting インストール完了"
else
    log_info "zsh-syntax-highlighting は既にインストール済みです"
fi

# zsh-completions
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-completions" ]; then
    log_info "zsh-completions をインストール中..."
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
    log_success "zsh-completions インストール完了"
else
    log_info "zsh-completions は既にインストール済みです"
fi

# powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    log_info "Powerlevel10kテーマをインストール中..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    log_success "Powerlevel10k インストール完了"
else
    log_info "Powerlevel10k は既にインストール済みです"
fi

# .zshrcのバックアップと配置
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$HOME/.zshrc" ]; then
    backup_name="$HOME/.zshrc.backup-$(date +%Y%m%d-%H%M%S)"
    log_info "既存の.zshrcを $backup_name にバックアップ中..."
    mv "$HOME/.zshrc" "$backup_name"
    log_success "バックアップ完了"
fi

# 新しい.zshrcをコピー
if [ -f "$SCRIPT_DIR/.zshrc" ]; then
    log_info "新しい.zshrcを配置中..."
    cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
    log_success ".zshrcの配置完了"
else
    log_error ".zshrcファイルが見つかりません (期待場所: $SCRIPT_DIR/.zshrc)"
    exit 1
fi

# 権限設定
chmod 644 "$HOME/.zshrc"

# デフォルトシェルの変更（オプション）
current_shell=$(echo $SHELL)
zsh_path=$(which zsh)

if [ "$current_shell" != "$zsh_path" ]; then
    log_warning "現在のデフォルトシェルは $current_shell です"
    echo -n "デフォルトシェルをZshに変更しますか？ [y/N]: "
    read -r response
    case "$response" in
        [yY][eE][sS]|[yY])
            log_info "デフォルトシェルをZshに変更中..."
            chsh -s "$zsh_path"
            log_success "デフォルトシェルをZshに変更しました"
            ;;
        *)
            log_info "デフォルトシェルの変更をスキップしました"
            ;;
    esac
else
    log_info "デフォルトシェルは既にZshに設定されています"
fi

# 完了メッセージ
echo ""
echo "🎉 セットアップ完了！"
echo ""
log_success "次の手順:"
echo "   1. 新しいターミナルを開くか、次のコマンドを実行:"
echo "      exec zsh"
echo ""
echo "   2. 初回起動時にPowerlevel10k設定ウィザードが表示されます"
echo "      お好みの設定を選択してください"
echo ""
echo "   3. 設定後、以下のコマンドで動作確認:"
echo "      alias | head -10"
echo "      mkcd test && cd .. && rmdir test"
echo ""
log_info "エイリアス、関数、プラグインがすべて利用可能になります！"
echo ""
log_warning "注意: 一部の機能（Docker、npm等）は対応するソフトウェアがインストールされている場合のみ動作します"
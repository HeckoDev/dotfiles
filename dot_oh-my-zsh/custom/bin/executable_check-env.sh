#!/bin/bash

# Script de vérification de l'environnement
# Vérifie que tous les outils sont correctement installés

set +e  # Ne pas arrêter sur erreur

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🔍 Vérification de l'environnement..."
echo ""

ERRORS=0
WARNINGS=0

# Fonction pour vérifier une commande
check_command() {
    local cmd=$1
    local name=$2
    local required=${3:-true}
    
    if command -v "$cmd" &> /dev/null; then
        echo -e "${GREEN}✓${NC} $name installé"
        if [ "$4" = "version" ]; then
            local version=$("$cmd" --version 2>&1 | head -n1)
            echo "  └─ $version"
        fi
    else
        if [ "$required" = "true" ]; then
            echo -e "${RED}✗${NC} $name NON installé"
            ((ERRORS++))
        else
            echo -e "${YELLOW}⚠${NC} $name NON installé (optionnel)"
            ((WARNINGS++))
        fi
    fi
}

# Fonction pour vérifier un fichier/dossier
check_path() {
    local path=$1
    local name=$2
    local required=${3:-true}
    
    if [ -e "$path" ]; then
        echo -e "${GREEN}✓${NC} $name existe"
    else
        if [ "$required" = "true" ]; then
            echo -e "${RED}✗${NC} $name NON trouvé"
            ((ERRORS++))
        else
            echo -e "${YELLOW}⚠${NC} $name NON trouvé (optionnel)"
            ((WARNINGS++))
        fi
    fi
}

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Shell & Framework"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "zsh" "Zsh"
check_path "$HOME/.oh-my-zsh" "Oh-My-Zsh"
check_path "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" "Powerlevel10k"
check_path "$HOME/.p10k.zsh" "Config Powerlevel10k"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Plugins Zsh"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_path "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" "zsh-autosuggestions"
check_path "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" "zsh-syntax-highlighting"
check_path "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" "zsh-completions"
check_path "$HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search" "zsh-history-substring-search"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Gestionnaires de paquets"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "brew" "Homebrew" true version
check_command "chezmoi" "Chezmoi" true version

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Outils CLI modernes"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "eza" "eza (ls moderne)"
check_command "bat" "bat (cat moderne)"
check_command "delta" "delta (git diff)"
check_command "fzf" "fzf (fuzzy finder)"
check_command "rg" "ripgrep" false
check_command "fd" "fd (find moderne)" false
check_command "zoxide" "zoxide (cd intelligent)" false

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Développement"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "git" "Git" true version
check_command "go" "Go" true version
check_command "node" "Node.js" true version
check_command "npm" "npm" true version
check_command "python3" "Python3" true version
check_command "ng" "Angular CLI" false version

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Outils Go"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "dlv" "Delve (debugger Go)" false
check_command "gopls" "gopls (Go language server)" false
check_command "staticcheck" "staticcheck (Go linter)" false

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Gestionnaires de versions"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_path "$HOME/.sdkman" "SDKMAN" false
check_path "$HOME/.asdf" "asdf" false
check_command "atuin" "Atuin (shell history)" false

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Utilitaires"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_command "curl" "curl"
check_command "wget" "wget"
check_command "jq" "jq (JSON processor)" false
check_command "htop" "htop" false
check_command "tmux" "tmux" false
check_command "autojump" "autojump" false

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Répertoires"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_path "$HOME/bin" "~/bin"
check_path "$HOME/go/bin" "~/go/bin"
check_path "$HOME/.local/bin" "~/.local/bin"
check_path "$HOME/projects" "~/projects" false
check_path "$HOME/my_projects" "~/my_projects" false

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Configuration"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
check_path "$HOME/.zshrc" ".zshrc"
check_path "$HOME/.oh-my-zsh/custom/alias.zsh" "alias.zsh"

# Vérifier le shell par défaut
if [ "$SHELL" = "$(which zsh)" ]; then
    echo -e "${GREEN}✓${NC} Zsh est le shell par défaut"
else
    echo -e "${YELLOW}⚠${NC} Zsh n'est pas le shell par défaut"
    echo "  └─ Exécutez: chsh -s \$(which zsh)"
    ((WARNINGS++))
fi

# Résumé
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Résumé"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ $ERRORS -eq 0 ] && [ $WARNINGS -eq 0 ]; then
    echo -e "${GREEN}✓ Tout est installé correctement ! 🎉${NC}"
    exit 0
elif [ $ERRORS -eq 0 ]; then
    echo -e "${YELLOW}⚠ $WARNINGS avertissement(s) - Certains outils optionnels manquent${NC}"
    exit 0
else
    echo -e "${RED}✗ $ERRORS erreur(s) trouvée(s)${NC}"
    if [ $WARNINGS -gt 0 ]; then
        echo -e "${YELLOW}⚠ $WARNINGS avertissement(s)${NC}"
    fi
    echo ""
    echo "Réexécutez le script d'installation :"
    echo "  chezmoi state delete-bucket --bucket=scriptState && chezmoi apply -v"
    exit 1
fi

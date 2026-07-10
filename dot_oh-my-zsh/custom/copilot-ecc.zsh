# ==========================================
# GitHub Copilot CLI Configuration
# ==========================================

# Copilot CLI instructions personnalisées
export COPILOT_CUSTOM_INSTRUCTIONS_DIRS="$HOME/.copilot"

# Alias pour GitHub Copilot CLI
if command -v gh &>/dev/null && gh extension list | grep -q "github/gh-copilot"; then
    # Alias courts pour Copilot
    alias ghcs='gh copilot suggest'
    alias ghce='gh copilot explain'
    
    # Fonction helper pour suggestions rapides
    function cop() {
        if [[ -z "$1" ]]; then
            echo "Usage: cop <description de la commande>"
            echo "Exemple: cop 'trouver tous les fichiers modifiés dans les 7 derniers jours'"
        else
            gh copilot suggest "$*"
        fi
    }
    
    # Fonction helper pour explications
    function cope() {
        if [[ -z "$1" ]]; then
            echo "Usage: cope <commande à expliquer>"
            echo "Exemple: cope 'git rebase -i HEAD~3'"
        else
            gh copilot explain "$*"
        fi
    }
fi

# ==========================================
# ECC (Error Code Checker) Configuration
# ==========================================

# Alias ECC
if command -v ecc &>/dev/null; then
    alias ecccheck='ecc check'
    alias eccfix='ecc fix'
    alias ecclist='ecc list'
    alias ecchelp='ecc --help'
    
    # Fonction pour vérifier le code actuel
    function eccrun() {
        local target="${1:-.}"
        echo "🔍 Analyse ECC sur: $target"
        ecc check "$target"
    }
fi

# Configuration ECC pour différents langages
export ECC_CONFIG_PATH="$HOME/.config/ecc"
export ECC_AUTO_FIX=false  # Désactivé par défaut pour sécurité

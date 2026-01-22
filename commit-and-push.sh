#!/bin/bash

# Script rapide pour commiter et pousser les changements

cd ~/.local/share/chezmoi || exit 1

echo "📦 Fichiers modifiés :"
git status --short

echo ""
read -p "❓ Voulez-vous commiter ces changements ? (o/N) " -n 1 -r
echo

if [[ $REPLY =~ ^[Oo]$ ]]; then
    git add .
    
    echo ""
    echo "💬 Message de commit par défaut :"
    echo "feat: Ajout du système d'installation automatique"
    echo ""
    read -p "❓ Utiliser ce message ? (o/N) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Oo]$ ]]; then
        git commit -m "feat: Ajout du système d'installation automatique

- Script d'installation complet de tous les outils (Homebrew, Oh-My-Zsh, etc.)
- Configuration Git automatique avec Delta
- Scripts de vérification (check-env.sh)
- Documentation complète (README, QUICKSTART, CHEATSHEET, etc.)
- Support Linux et macOS
- Template pour variables sensibles (work.zsh)
- Installation en une ligne sur nouveau PC"
    else
        echo ""
        read -p "💬 Entrez votre message de commit : " commit_msg
        git commit -m "$commit_msg"
    fi
    
    echo ""
    read -p "🚀 Voulez-vous pousser sur GitHub ? (o/N) " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Oo]$ ]]; then
        git push
        echo ""
        echo "✅ Changements poussés avec succès !"
        echo ""
        echo "📝 Prochaines étapes :"
        echo "   1. Testez sur un nouveau PC :"
        echo "      sh -c \"\$(curl -fsLS get.chezmoi.io)\" -- init --apply <VOTRE-USERNAME>"
        echo ""
        echo "   2. Ou testez avec Docker (voir TESTING.md)"
    else
        echo "⏸️  Changements commitées mais pas poussés"
    fi
else
    echo "❌ Annulé"
fi

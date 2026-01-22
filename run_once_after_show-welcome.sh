#!/bin/bash

cat << 'EOF'

╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║  🎉  Installation terminée avec succès !                    ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝

📝 PROCHAINES ÉTAPES :

1️⃣  Redémarrer le terminal
   $ exec zsh

2️⃣  Configurer Powerlevel10k (si première installation)
   $ p10k configure

3️⃣  Vérifier que tout fonctionne
   $ command -v eza bat delta fzf go node

4️⃣  [OPTIONNEL] Sur machine de travail - Créer work.zsh
   $ touch ~/.oh-my-zsh/custom/work.zsh
   Puis ajoutez-y vos variables d'environnement sensibles

5️⃣  [OPTIONNEL] Configurer Atuin pour la synchronisation de l'historique
   $ atuin register
   $ atuin login
   $ atuin sync

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🔧 OUTILS INSTALLÉS :

Shell & Terminal:
  • zsh (shell)
  • oh-my-zsh (framework)
  • powerlevel10k (thème)
  • fzf (fuzzy finder)
  • atuin (historique shell magique)

Outils CLI modernes:
  • eza (alternative à ls)
  • bat (alternative à cat)
  • delta (git diff viewer)
  • ripgrep (alternative à grep)
  • fd (alternative à find)
  • zoxide (alternative à cd)

Développement:
  • go (langage Go)
  • node & npm (JavaScript)
  • python3
  • Angular CLI
  
Gestionnaires de versions:
  • asdf (gestionnaire de versions universel)
  • sdkman (Java, Kotlin, etc.)
  • Homebrew (gestionnaire de paquets)

Git:
  • git avec delta configuré
  • Configuration personnalisée

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📚 COMMANDES UTILES :

Chezmoi:
  cm           → chezmoi
  cme <file>   → éditer un fichier
  cma          → appliquer les changements
  cmd          → voir les différences
  cms          → voir le statut

Alias personnalisés:
  l            → eza -1 -F -l --git
  cat          → bat -p
  path         → afficher le PATH ligne par ligne
  zshrc        → éditer et recharger .zshrc

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

📖 DOCUMENTATION :

  • Chezmoi:      https://www.chezmoi.io/
  • Oh-My-Zsh:    https://ohmyz.sh/
  • Powerlevel10k: https://github.com/romkatv/powerlevel10k
  • Atuin:        https://atuin.sh/

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

💡 ASTUCE : Pour voir ce message à nouveau, exécutez:
   $ cat ~/.local/share/chezmoi/.welcome

EOF

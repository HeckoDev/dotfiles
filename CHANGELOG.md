# Changelog

Toutes les modifications notables de ce projet seront documentées dans ce fichier.

## [1.0.0] - 2026-01-22

### ✨ Ajouté
- **Installation automatique complète** : Script `run_once_install-packages.sh.tmpl` qui installe :
  - Homebrew (Linux/macOS)
  - Oh-My-Zsh avec tous les plugins (autosuggestions, syntax-highlighting, completions, history-substring-search)
  - Powerlevel10k
  - Outils CLI modernes (eza, bat, delta, fzf, ripgrep, fd, zoxide)
  - Go et outils Go (dlv, gopls, staticcheck)
  - Node.js et Angular CLI
  - SDKMAN, asdf, atuin
  - Python 3
  - Zsh comme shell par défaut

- **Configuration Git automatique** : Script `run_once_configure-git.sh.tmpl` qui configure :
  - Email et nom depuis `.chezmoi.yaml.tmpl`
  - Delta comme pager Git
  - Paramètres recommandés

- **Message de bienvenue** : Script `run_once_after_show-welcome.sh` qui affiche un guide après l'installation

- **Script de vérification** : `check-env.sh` pour vérifier que tout est installé correctement

- **Documentation complète** :
  - `README.md` - Documentation principale mise à jour
  - `QUICKSTART.md` - Guide d'installation rapide
  - `CHEZMOI_CHEATSHEET.md` - Aide-mémoire des commandes chezmoi
  - `TESTING.md` - Guide de test de l'installation
  - `CUSTOMIZATION.md` - Guide de personnalisation
  - `CHANGELOG.md` - Ce fichier

- **Templates** :
  - `.chezmoi.yaml.tmpl` - Demande email et nom lors de l'installation
  - `work.zsh.template` - Template pour variables d'environnement sensibles

- **Fichier .welcome** : Message informatif affiché après l'installation

### 📝 Structure du projet

```
.
├── README.md                              # Documentation principale
├── QUICKSTART.md                          # Guide rapide
├── CHEZMOI_CHEATSHEET.md                  # Commandes chezmoi
├── TESTING.md                             # Guide de test
├── CUSTOMIZATION.md                       # Guide de personnalisation
├── CHANGELOG.md                           # Ce fichier
├── .chezmoi.yaml.tmpl                     # Config chezmoi
├── .chezmoiignore                         # Fichiers ignorés
├── .welcome                               # Message de bienvenue
├── run_once_install-packages.sh.tmpl      # Installation automatique
├── run_once_configure-git.sh.tmpl         # Config Git
├── run_once_after_show-welcome.sh         # Affichage bienvenue
├── dot_zshrc                              # Config Zsh
├── dot_p10k.zsh                           # Config Powerlevel10k
└── dot_oh-my-zsh/
    └── custom/
        ├── alias.zsh                      # Alias
        ├── work.zsh.template              # Template variables travail
        └── bin/
            └── executable_check-env.sh    # Vérification environnement
```

### 🎯 Fonctionnalités principales

1. **Installation en une ligne** : `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <username>`
2. **Installation automatique de tous les outils** nécessaires
3. **Configuration Git personnalisée** avec vos informations
4. **Scripts de vérification** pour valider l'installation
5. **Documentation extensive** pour tous les cas d'usage
6. **Support Linux et macOS** avec détection automatique
7. **Gestion des fichiers sensibles** via work.zsh (non versionné)

### 🔧 Outils installés automatiquement

#### Shell & Terminal
- zsh
- oh-my-zsh
- powerlevel10k
- fzf
- atuin

#### Plugins Zsh
- zsh-autosuggestions
- zsh-syntax-highlighting
- zsh-completions
- zsh-history-substring-search

#### Outils CLI modernes
- eza (ls moderne)
- bat (cat avec syntax highlighting)
- delta (git diff viewer)
- ripgrep (grep rapide)
- fd (find moderne)
- zoxide (cd intelligent)

#### Développement
- go
- node & npm
- python3
- Angular CLI
- Git avec delta

#### Outils Go
- dlv (debugger)
- gopls (language server)
- staticcheck (linter)

#### Gestionnaires de versions
- Homebrew
- SDKMAN
- asdf

### 📚 Workflow d'utilisation

1. **Nouveau PC** : Exécuter la commande d'installation en une ligne
2. **Modifications** : Utiliser `chezmoi edit` pour modifier les fichiers
3. **Synchronisation** : `git push` depuis `~/.local/share/chezmoi`
4. **Mise à jour** : `chezmoi update` sur les autres machines
5. **Vérification** : Exécuter `check-env.sh`

### 🎨 Personnalisation

Voir [CUSTOMIZATION.md](CUSTOMIZATION.md) pour :
- Ajouter de nouveaux outils
- Modifier les alias
- Créer des fonctions personnalisées
- Configuration spécifique par machine
- Et plus encore...

### 🧪 Tests

Voir [TESTING.md](TESTING.md) pour :
- Tester localement
- Tester avec Docker
- Tester avec une VM
- Vérifications à effectuer

---

**Note** : Ce changelog suit le format [Keep a Changelog](https://keepachangelog.com/fr/1.0.0/)

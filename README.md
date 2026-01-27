# Dotfiles

Mes fichiers de configuration personnels, gérés avec [chezmoi](https://www.chezmoi.io/).

## 📁 Structure

Ce dépôt contient :
- `.zshrc` - Configuration principale de Zsh
- `.vimrc` - Configuration Vim pour le développement
- `.oh-my-zsh/custom/alias.zsh` - Alias personnels
- `.p10k.zsh` - Configuration Powerlevel10k
- `run_once_install-packages.sh.tmpl` - Script d'installation automatique de tous les outils
- `run_once_configure-git.sh.tmpl` - Configuration Git automatique
- `run_once_after_show-welcome.sh` - Affiche un message de bienvenue après l'installation
- `.chezmoi.yaml.tmpl` - Configuration de chezmoi (demande email et nom)
- **EXCLUS** : `work.zsh` - Fichier local non versionné contenant les variables d'environnement sensibles liées au travail

### Scripts d'installation automatique

Les scripts `run_once_*` sont exécutés automatiquement par chezmoi lors du premier `chezmoi apply` :
- **run_once** = Exécuté une seule fois (chezmoi garde une trace)
- **run_once_after** = Exécuté après l'application des fichiers
- **.tmpl** = Template chezmoi avec accès aux variables

## 🚀 Installation sur une nouvelle machine

### Installation automatique complète

Une seule commande pour tout installer ! Cette commande :
1. Installe chezmoi
2. Clone votre dépôt de dotfiles
3. Exécute automatiquement le script d'installation
4. Configure tout votre environnement

```bash
# Remplacez <votre-username> par votre nom d'utilisateur GitHub
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <votre-username>
```

Le script d'installation va automatiquement installer :
- ✅ Homebrew (Linux/macOS)
- ✅ Vim avec configuration optimisée pour le développement
- ✅ Oh-My-Zsh avec tous les plugins
- ✅ Powerlevel10k
- ✅ Outils CLI modernes (eza, bat, delta, fzf, ripgrep, etc.)
- ✅ Go et outils Go (dlv, gopls, staticcheck)
- ✅ Node.js et Angular CLI
- ✅ SDKMAN, asdf, atuin
- ✅ Python 3
- ✅ Zsh comme shell par défaut

### Installation manuelle (étape par étape)

Si vous préférez contrôler chaque étape :

#### 1. Installer chezmoi

```bash
# Avec curl
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

# Ou avec wget
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin
```

#### 2. Initialiser avec votre dépôt

```bash
# Remplacez <votre-username> par votre nom d'utilisateur GitHub
chezmoi init https://github.com/<votre-username>/dotfiles.git

# Vérifier les changements avant d'appliquer
chezmoi diff

# Appliquer les dotfiles (cela exécutera automatiquement le script d'installation)
chezmoi apply -v
```

#### 3. Créer le fichier work.zsh local (si nécessaire)

Sur votre machine de travail, créez manuellement le fichier :

```bash
touch ~/.oh-my-zsh/custom/work.zsh
```

Puis ajoutez vos variables d'environnement sensibles dans ce fichier. Il ne sera **jamais** versionné grâce à `.chezmoiignore`.

## 🔄 Utilisation quotidienne

### Ajouter un nouveau fichier

```bash
chezmoi add ~/.nouveaufichier
```

### Modifier un fichier

```bash
# Éditer avec votre éditeur par défaut
chezmoi edit ~/.zshrc

# Ou éditer directement puis l'ajouter à nouveau
vim ~/.zshrc
chezmoi add ~/.zshrc
```

### Synchroniser les changements

```bash
# Vérifier les différences
chezmoi diff

# Commiter les changements
cd ~/.local/share/chezmoi
git add .
git commit -m "Description des changements"
git push
```

### Mettre à jour depuis le dépôt

```bash
# Sur une autre machine
chezmoi update
```

### Réexécuter le script d'installation

Si vous voulez réinstaller tous les outils (après un problème ou sur une mise à jour) :

```bash
# Forcer la réexécution du script d'installation
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply -v

# Ou réexécuter manuellement le script
bash ~/.local/share/chezmoi/run_once_install-packages.sh.tmpl
```

## 🔧 Prérequis

- Zsh
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Plugins recommandés :
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-completions
  - zsh-history-substring-search

## 🎨 Configuration Vim

Le fichier `.vimrc` contient une configuration complète pour le développement :

### Fonctionnalités principales
- **Interface** : Numéros de ligne relatifs, barre de statut personnalisée, coloration syntaxique
- **Édition intelligente** : Auto-paires (parenthèses, accolades), indentation automatique
- **Pliage de code** : `Espace` pour plier/déplier, `,z` pour tout déplier
- **Commentaires** : `,c` pour commenter, `,u` pour décommenter (adapté au langage)
- **Support multi-langages** : Python, Go, JavaScript, TypeScript, Rust, etc.

### Raccourcis clavier (Leader = `,`)
- **Fichiers** : `,w` sauvegarder, `,q` quitter, `,e` éditer .vimrc
- **Exécution** : `F5` exécuter, `F6` compiler, `F7` tester
- **Git** : `,gs` status, `,gd` diff, `,gb` blame, `,gl` log
- **Navigation** : `Ctrl+h/j/k/l` naviguer entre splits, `,n/p` buffer suivant/précédent
- **Édition** : `,k` dupliquer ligne, `,s` chercher/remplacer, `,ss` supprimer espaces
- **Templates** : `,tm` template principal, `,tf` template fonction, `,tc` template classe

Consultez le fichier `.vimrc` pour la liste complète des fonctionnalités et raccourcis.

## 📝 Notes

- Les fichiers sensibles (clés SSH, tokens, credentials) sont explicitement exclus via `.chezmoiignore`
- Le fichier `work.zsh` reste local à chaque machine et n'est jamais synchronisé
- Chezmoi gère automatiquement les différences entre machines via son système de templates (si besoin)

## 🔗 Liens utiles

- [Documentation chezmoi](https://www.chezmoi.io/)
- [Aide-mémoire Chezmoi](CHEZMOI_CHEATSHEET.md) - Toutes les commandes utiles
- [Guide de test](TESTING.md) - Comment tester l'installation
- [dotfiles.github.io](https://dotfiles.github.io/)
- [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)

## 🆘 Dépannage

### Vérifier l'environnement
```bash
check-env.sh
```

### Réexécuter l'installation
```bash
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply -v
```

### Problème de shell
```bash
chsh -s $(which zsh)
exec zsh
```

### Mise à jour
```bash
chezmoi update
```

## 📦 Contenu du dépôt

```
.
├── README.md                              # Ce fichier
├── CHEZMOI_CHEATSHEET.md                  # Aide-mémoire des commandes chezmoi
├── TESTING.md                             # Guide de test de l'installation
├── .chezmoi.yaml.tmpl                     # Config chezmoi (demande email/nom)
├── .chezmoiignore                         # Fichiers à ignorer
├── .welcome                               # Message de bienvenue
├── run_once_install-packages.sh.tmpl      # Script d'installation principal
├── run_once_configure-git.sh.tmpl         # Configuration Git automatique
├── run_once_after_show-welcome.sh         # Affichage du message de bienvenue
├── dot_zshrc                              # Configuration Zsh
├── dot_vimrc                              # Configuration Vim pour développement
├── dot_p10k.zsh                           # Configuration Powerlevel10k
└── dot_oh-my-zsh/
    └── custom/
        ├── alias.zsh                      # Alias personnalisés
        └── bin/
            └── executable_check-env.sh    # Script de vérification
```

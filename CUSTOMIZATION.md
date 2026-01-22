# 🎨 Personnalisation

Ce guide explique comment personnaliser votre configuration après l'installation.

## Ajouter de nouveaux outils à installer automatiquement

### 1. Éditer le script d'installation

```bash
chezmoi edit ~/.local/share/chezmoi/run_once_install-packages.sh.tmpl
```

### 2. Ajouter le package dans la liste

Trouvez la section `PACKAGES` et ajoutez votre outil :

```bash
PACKAGES=(
    # ... packages existants ...
    "votre-nouveau-package"
)
```

### 3. Ou ajouter une section personnalisée

Pour des installations plus complexes :

```bash
# ==================== VOTRE OUTIL ====================
log_info "Installation de votre-outil..."
if ! command -v votre-outil &> /dev/null; then
    # Votre logique d'installation
    brew install votre-outil
    log_info "votre-outil installé"
else
    log_info "votre-outil déjà installé"
fi
```

## Personnaliser Oh-My-Zsh

### Changer le thème

Éditez [dot_zshrc](dot_zshrc) :

```bash
chezmoi edit ~/.zshrc
```

Changez la ligne :
```bash
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Ajouter des plugins

Dans [dot_zshrc](dot_zshrc), modifiez la section plugins :

```bash
plugins=(
    git
    z
    # Ajoutez vos plugins ici
    kubectl
    terraform
)
```

Plugins populaires :
- `kubectl` - Autocomplétion Kubernetes
- `terraform` - Autocomplétion Terraform
- `docker-compose` - Autocomplétion Docker Compose
- `aws` - Autocomplétion AWS CLI

### Créer vos propres plugins

```bash
# Créer un nouveau fichier de plugin
touch ~/.oh-my-zsh/custom/plugins/mon-plugin/mon-plugin.plugin.zsh

# Ajouter le plugin à chezmoi
chezmoi add --recursive ~/.oh-my-zsh/custom/plugins/mon-plugin
```

## Personnaliser les alias

### Éditer les alias existants

```bash
chezmoi edit ~/.oh-my-zsh/custom/alias.zsh
```

### Ajouter de nouveaux alias

Dans [dot_oh-my-zsh/custom/alias.zsh](dot_oh-my-zsh/custom/alias.zsh) :

```bash
# Mes alias personnalisés
alias gs='git status'
alias gp='git push'
alias gc='git commit -m'
alias k='kubectl'
alias tf='terraform'
```

### Créer des alias spécifiques à une machine

Utilisez `work.zsh` pour les alias locaux :

```bash
# Dans ~/.oh-my-zsh/custom/work.zsh
alias vpn-connect='sudo openvpn ~/company.ovpn'
alias ssh-work='ssh user@work-server'
```

## Personnaliser Powerlevel10k

### Reconfigurer le thème

```bash
p10k configure
```

### Éditer la configuration

```bash
chezmoi edit ~/.p10k.zsh
```

Options populaires à modifier :
- Icônes (nerd fonts required)
- Couleurs
- Segments affichés (git, node, python, etc.)
- Style du prompt

## Ajouter des fonctions personnalisées

### Dans .zshrc

Éditez [dot_zshrc](dot_zshrc) et ajoutez vos fonctions :

```bash
# Fonction pour créer et entrer dans un dossier
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Fonction pour extraire n'importe quel archive
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
```

### Dans un fichier séparé

Créez un nouveau fichier :

```bash
touch ~/.oh-my-zsh/custom/functions.zsh
chezmoi add ~/.oh-my-zsh/custom/functions.zsh
```

## Configurer Git

### Éditer la configuration Git

```bash
chezmoi edit ~/.local/share/chezmoi/run_once_configure-git.sh.tmpl
```

### Ajouter des alias Git

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'
```

## Variables d'environnement

### Variables globales

Dans [dot_zshrc](dot_zshrc) :

```bash
export EDITOR=vim
export VISUAL=vim
export LANG=en_US.UTF-8
```

### Variables sensibles (locales)

Dans `~/.oh-my-zsh/custom/work.zsh` (non versionné) :

```bash
export MY_API_KEY="secret-key"
export DB_PASSWORD="secret-password"
```

## Ajouter des scripts personnalisés

### Scripts dans ~/bin

```bash
# Créer un script
cat > ~/bin/mon-script.sh << 'EOF'
#!/bin/bash
echo "Mon script personnalisé"
EOF

# Rendre exécutable
chmod +x ~/bin/mon-script.sh

# Ajouter à chezmoi
chezmoi add ~/bin/mon-script.sh
```

### Scripts dans .oh-my-zsh/custom/bin

```bash
# Créer un script
touch ~/.oh-my-zsh/custom/bin/mon-script
chmod +x ~/.oh-my-zsh/custom/bin/mon-script

# Ajouter à chezmoi avec le préfixe executable_
chezmoi add --template ~/.oh-my-zsh/custom/bin/mon-script
```

Le fichier devient : `dot_oh-my-zsh/custom/bin/executable_mon-script`

## Configuration spécifique par machine

### Utiliser les templates chezmoi

Dans un fichier `.tmpl`, vous pouvez utiliser :

```bash
{{- if eq .chezmoi.hostname "laptop-perso" }}
# Configuration pour le laptop perso
export WORK_MODE="false"
{{- else if eq .chezmoi.hostname "laptop-work" }}
# Configuration pour le laptop de travail
export WORK_MODE="true"
{{- end }}
```

### Variables chezmoi disponibles

- `.chezmoi.os` - Système d'exploitation (linux, darwin)
- `.chezmoi.hostname` - Nom de la machine
- `.chezmoi.username` - Nom d'utilisateur
- `.email` - Email (défini dans .chezmoi.yaml.tmpl)
- `.name` - Nom complet (défini dans .chezmoi.yaml.tmpl)

## Personnaliser les couleurs du terminal

### LS_COLORS (avec eza)

```bash
# Dans .zshrc
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
```

### Couleurs pour bat

```bash
# Changer le thème de bat
export BAT_THEME="Dracula"
```

Thèmes disponibles : `bat --list-themes`

## Tester vos modifications

### Localement

```bash
# Voir les changements
chezmoi diff

# Appliquer
chezmoi apply -v

# Recharger le shell
exec zsh
```

### Sur une nouvelle machine (Docker)

Voir [TESTING.md](TESTING.md) pour les détails.

## Partager vos personnalisations

### Commiter et pousser

```bash
cd ~/.local/share/chezmoi
git add .
git commit -m "Ajout de mes personnalisations"
git push
```

### Sur d'autres machines

```bash
chezmoi update
```

## Exemples de personnalisations populaires

### 1. Ajouter Neovim

```bash
# Dans run_once_install-packages.sh.tmpl
PACKAGES=(
    # ...
    "neovim"
)
```

### 2. Ajouter Docker desktop

```bash
# Dans run_once_install-packages.sh.tmpl
if [[ "$OS" == "macos" ]]; then
    brew install --cask docker
fi
```

### 3. Ajouter kubectl et tools Kubernetes

```bash
PACKAGES=(
    # ...
    "kubectl"
    "helm"
    "k9s"
)
```

### 4. Ajouter Rust

```bash
# Dans run_once_install-packages.sh.tmpl
if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
```

## Ressources

- [Oh-My-Zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
- [Awesome Zsh plugins](https://github.com/unixorn/awesome-zsh-plugins)
- [Chezmoi templating](https://www.chezmoi.io/user-guide/templating/)
- [Nerd Fonts](https://www.nerdfonts.com/) (pour Powerlevel10k)

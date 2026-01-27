# Guide de test de l'installation

Ce guide vous permet de tester l'installation automatique sur un nouveau PC.

## Test en local (sans réinstaller)

Vérifier que tout est bien configuré :

```bash
# Vérifier l'environnement
check-env.sh

# Tester les alias
l         # Liste avec eza
cat ~/.zshrc | head  # Devrait utiliser bat
```

## Test sur une nouvelle machine

### Option 1: Installation complète en une ligne

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <votre-username>
```

Cette commande va :
1. Installer chezmoi
2. Cloner votre dépôt dotfiles
3. Appliquer tous les fichiers
4. Exécuter automatiquement les scripts d'installation
5. Afficher un message de bienvenue

### Option 2: Test avec Docker (recommandé)

Créez un fichier `test-install.dockerfile` :

```dockerfile
FROM ubuntu:22.04

# Éviter les prompts interactifs
ENV DEBIAN_FRONTEND=noninteractive

# Installer les dépendances de base
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Créer un utilisateur de test
RUN useradd -m -s /bin/bash testuser && \
    echo "testuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER testuser
WORKDIR /home/testuser

# Installer chezmoi et appliquer les dotfiles
RUN sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <votre-username>

# Vérifier l'installation
RUN /home/testuser/.oh-my-zsh/custom/bin/check-env.sh

CMD ["/bin/zsh"]
```

Construire et tester :

```bash
docker build -f test-install.dockerfile -t dotfiles-test .
docker run -it dotfiles-test
```

### Option 3: Test avec une VM

1. Créer une nouvelle VM Ubuntu/Debian
2. Exécuter :
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <votre-username>
   ```
3. Redémarrer le terminal : `exec zsh`
4. Vérifier : `check-env.sh`

## Que vérifier après l'installation

### 1. Shell et thème
```bash
echo $SHELL  # Devrait être /usr/bin/zsh ou similaire
echo $ZSH_THEME  # Devrait afficher powerlevel10k/powerlevel10k
```

### 2. Outils CLI
```bash
command -v eza bat delta fzf
```

### 3. Langages de programmation
```bash
go version
node --version
python3 --version
```

### 4. Alias personnalisés
```bash
alias | grep "^l="
alias | grep "^cat="
```

### 5. Plugins Zsh
```bash
ls ~/.oh-my-zsh/custom/plugins/
```

### 6. Configuration Git
```bash
git config --global user.email
git config --global user.name
git config --global core.pager  # Devrait être 'delta'
```

## Résolution de problèmes

### Le script d'installation ne s'exécute pas

```bash
# Forcer la réexécution
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply -v
```

### Homebrew n'est pas dans le PATH

```bash
# Ajouter manuellement
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### Zsh n'est pas le shell par défaut

```bash
chsh -s $(which zsh)
# Puis redémarrer la session
```

### Certains outils ne sont pas installés

```bash
# Réinstaller manuellement avec Homebrew
brew install eza bat delta fzf ripgrep fd
```

## Personnalisation après installation

### 1. Configurer Powerlevel10k
```bash
p10k configure
```

### 2. Configurer Atuin (historique shell)
```bash
atuin register
atuin login
atuin sync
```

### 3. Ajouter des variables de travail (optionnel)
```bash
touch ~/.oh-my-zsh/custom/work.zsh
# Éditer le fichier avec vos variables sensibles
```

### 4. Tester la configuration Vim
```bash
# Ouvrir vim
vim

# Tester quelques raccourcis :
# - Leader key = ','
# - ,e pour éditer .vimrc
# - ,w pour sauvegarder
# - Espace pour plier/déplier le code
# - F5 pour exécuter (selon le type de fichier)

# Tester avec un fichier Python
vim test.py
# En mode insertion, taper: def test():
# Observer l'auto-complétion des parenthèses et l'indentation automatique
# ,c pour commenter la ligne
# ,u pour décommenter
```

## Mise à jour de l'environnement

Sur une machine déjà configurée, pour récupérer les dernières modifications :

```bash
# Mettre à jour les dotfiles
chezmoi update

# Ou manuellement
cd ~/.local/share/chezmoi
git pull
chezmoi apply -v
```

## Ajout de nouveaux outils

Pour ajouter un nouvel outil à installer automatiquement :

1. Éditez le script d'installation :
   ```bash
   chezmoi edit ~/.local/share/chezmoi/run_once_install-packages.sh.tmpl
   ```

2. Ajoutez le package dans la liste `PACKAGES`

3. Commitez et pushez :
   ```bash
   cd ~/.local/share/chezmoi
   git add .
   git commit -m "Ajout de nouveaux outils"
   git push
   ```

4. Sur d'autres machines, mettez à jour :
   ```bash
   chezmoi update
   ```

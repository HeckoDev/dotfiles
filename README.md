# Dotfiles

Mes fichiers de configuration personnels, gérés avec [chezmoi](https://www.chezmoi.io/).

## 📁 Structure

Ce dépôt contient :
- `.zshrc` - Configuration principale de Zsh
- `.oh-my-zsh/custom/alias.zsh` - Alias personnels
- `.p10k.zsh` - Configuration Powerlevel10k
- **EXCLUS** : `work.zsh` - Fichier local non versionné contenant les variables d'environnement sensibles liées au travail

## 🚀 Installation sur une nouvelle machine

### 1. Installer chezmoi

```bash
# Télécharger chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

# Ou avec wget
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin
```

### 2. Initialiser avec votre dépôt

```bash
# Remplacez <votre-username> par votre nom d'utilisateur GitHub
chezmoi init https://github.com/<votre-username>/dotfiles.git

# Vérifier les changements avant d'appliquer
chezmoi diff

# Appliquer les dotfiles
chezmoi apply -v
```

### 3. Créer le fichier work.zsh local (si nécessaire)

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

## 🔧 Prérequis

- Zsh
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- Plugins recommandés :
  - zsh-autosuggestions
  - zsh-syntax-highlighting
  - zsh-completions
  - zsh-history-substring-search

## 📝 Notes

- Les fichiers sensibles (clés SSH, tokens, credentials) sont explicitement exclus via `.chezmoiignore`
- Le fichier `work.zsh` reste local à chaque machine et n'est jamais synchronisé
- Chezmoi gère automatiquement les différences entre machines via son système de templates (si besoin)

## 🔗 Liens utiles

- [Documentation chezmoi](https://www.chezmoi.io/)
- [dotfiles.github.io](https://dotfiles.github.io/)
- [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)

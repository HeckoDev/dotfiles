# 🎯 Guide rapide - Dotfiles avec Chezmoi

## 📍 Localisation importante
- **Dépôt dotfiles** : `~/.local/share/chezmoi/`
- **Fichier travail local** : `~/.oh-my-zsh/custom/work.zsh` (NON versionné)
- **Fichier alias personnel** : `~/.oh-my-zsh/custom/alias.zsh` (versionné)

## 🔧 Commandes essentielles

### Voir l'état de vos dotfiles
```bash
chezmoi status          # Voir les fichiers modifiés
chezmoi diff            # Voir les différences
chezmoi managed         # Lister tous les fichiers gérés
```

### Ajouter un nouveau fichier
```bash
chezmoi add ~/.gitconfig
chezmoi add ~/.vimrc
```

### Éditer un fichier
```bash
# Option 1: Éditer via chezmoi (recommandé)
chezmoi edit ~/.zshrc

# Option 2: Éditer directement puis synchroniser
vim ~/.zshrc
chezmoi add ~/.zshrc
```

### Synchroniser les changements
```bash
cd ~/.local/share/chezmoi
git add .
git commit -m "Descriptif de vos changements"
git push
```

### Appliquer les changements
```bash
chezmoi apply           # Appliquer tous les changements
chezmoi apply ~/.zshrc  # Appliquer un fichier spécifique
```

## 🚀 Prochaines étapes

### 1. Créer un dépôt GitHub
```bash
# Sur GitHub, créez un nouveau dépôt nommé "dotfiles"
# Puis configurez le remote :
cd ~/.local/share/chezmoi
git remote add origin https://github.com/<votre-username>/dotfiles.git
git branch -M main
git push -u origin main
```

### 2. Sur une nouvelle machine
```bash
# Installer chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)"

# Cloner et appliquer vos dotfiles
chezmoi init https://github.com/<votre-username>/dotfiles.git
chezmoi apply -v

# Créer le fichier work.zsh local (si besoin)
touch ~/.oh-my-zsh/custom/work.zsh
# Puis remplissez-le avec vos variables de travail
```

## 📝 Astuces

### Ajouter un alias au PATH pour faciliter l'usage
Ajoutez dans votre `~/.zshrc` ou `~/.oh-my-zsh/custom/alias.zsh` :
```bash
alias cm='chezmoi'
alias cme='chezmoi edit'
alias cma='chezmoi apply'
alias cmd='chezmoi diff'
```

### Vérifier avant de pousser
```bash
cd ~/.local/share/chezmoi
git status
git diff
# Si tout est bon :
git add . && git commit -m "Update config" && git push
```

### Ignorer d'autres fichiers sensibles
Éditez `~/.local/share/chezmoi/.chezmoiignore` pour ajouter des patterns :
```
.ssh/
.gnupg/
.aws/
*.key
*.pem
```

## ⚠️ Rappels importants

1. **work.zsh n'est JAMAIS versionné** - Il reste local à chaque machine
2. Toujours vérifier avec `chezmoi diff` avant `chezmoi apply`
3. Faire des commits atomiques avec des messages clairs
4. Ne jamais commiter de secrets ou credentials

## 🔗 Ressources
- [Chezmoi docs](https://www.chezmoi.io/)
- [Votre README](~/.local/share/chezmoi/README.md)

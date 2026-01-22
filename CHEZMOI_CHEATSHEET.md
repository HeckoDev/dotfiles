# Aide-mémoire Chezmoi

## Installation initiale

### Sur un nouveau PC

```bash
# Installation en une seule commande (recommandé)
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <votre-username>

# Ou en plusieurs étapes
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin
chezmoi init https://github.com/<votre-username>/dotfiles.git
chezmoi diff  # Prévisualiser les changements
chezmoi apply -v  # Appliquer les dotfiles
```

## Utilisation quotidienne

### Commandes de base

```bash
# Alias disponibles (définis dans .oh-my-zsh/custom/alias.zsh)
cm           # chezmoi
cme <file>   # chezmoi edit <file>
cma          # chezmoi apply
cmd          # chezmoi diff
cms          # chezmoi status
```

### Ajouter un nouveau fichier

```bash
# Ajouter un fichier à chezmoi
chezmoi add ~/.nouveaufichier

# Ajouter un fichier exécutable
chezmoi add --template ~/.local/bin/mon-script

# Ajouter un dossier entier
chezmoi add --recursive ~/.config/nvim
```

### Modifier un fichier

```bash
# Méthode 1 : Éditer via chezmoi (recommandé)
chezmoi edit ~/.zshrc
chezmoi apply

# Méthode 2 : Éditer directement puis réimporter
vim ~/.zshrc
chezmoi add ~/.zshrc

# Voir les différences avant d'appliquer
chezmoi diff
```

### Synchroniser avec Git

```bash
# Commiter les changements
cd ~/.local/share/chezmoi
git add .
git commit -m "Description des changements"
git push

# Mettre à jour depuis GitHub
chezmoi update  # = git pull + chezmoi apply
```

## Gestion des templates

### Créer un template

```bash
# Ajouter un fichier comme template
chezmoi add --template ~/.gitconfig

# Le fichier devient: dot_gitconfig.tmpl
```

### Variables dans les templates

```tmpl
# Utiliser des variables de .chezmoi.yaml.tmpl
{{ .email }}
{{ .name }}

# Conditions
{{- if eq .chezmoi.os "linux" }}
# Configuration Linux
{{- else if eq .chezmoi.os "darwin" }}
# Configuration macOS
{{- end }}
```

## Scripts d'exécution

### Types de scripts

```bash
# run_once_*.sh - Exécuté une seule fois
run_once_install-packages.sh

# run_onchange_*.sh - Réexécuté si le script change
run_onchange_install-fonts.sh

# run_before_*.sh - Avant l'application des fichiers
run_before_backup.sh

# run_after_*.sh - Après l'application des fichiers
run_after_setup-links.sh
```

### Forcer la réexécution d'un script

```bash
# Supprimer l'état des scripts
chezmoi state delete-bucket --bucket=scriptState

# Réappliquer (réexécutera tous les scripts)
chezmoi apply -v
```

## Gestion des fichiers sensibles

### Ignorer des fichiers

Éditez `.chezmoiignore` :

```
# Fichiers de travail sensibles
.oh-my-zsh/custom/work.zsh

# Clés SSH
.ssh/
.gnupg/

# Credentials
.aws/
.kube/config
```

### Fichiers privés (chiffrés)

```bash
# Utiliser age pour chiffrer (optionnel)
chezmoi age decrypt ~/.ssh/id_rsa.age
chezmoi age encrypt ~/.ssh/id_rsa
```

## Commandes avancées

### Inspecter l'état

```bash
# Voir le statut
chezmoi status

# Voir tous les fichiers gérés
chezmoi managed

# Voir les données chezmoi
chezmoi data

# Vérifier la configuration
chezmoi doctor
```

### Réinitialiser

```bash
# Supprimer tous les fichiers gérés (ATTENTION!)
chezmoi purge

# Réinitialiser chezmoi
rm -rf ~/.local/share/chezmoi
chezmoi init https://github.com/<votre-username>/dotfiles.git
```

### Résolution de problèmes

```bash
# Mode verbeux
chezmoi apply -v

# Dry-run (ne fait rien, montre ce qui serait fait)
chezmoi apply --dry-run

# Forcer l'application
chezmoi apply --force

# Vérifier les différences
chezmoi diff

# Source d'un fichier spécifique
chezmoi cat ~/.zshrc
```

## Workflow recommandé

### 1. Modifier la configuration

```bash
# Sur votre machine principale
cme ~/.zshrc          # Éditer
cmd                   # Vérifier les changements
cma                   # Appliquer localement
```

### 2. Tester

```bash
# Vérifier que tout fonctionne
exec zsh
check-env.sh
```

### 3. Commiter et pousser

```bash
cd ~/.local/share/chezmoi
git add .
git commit -m "Update: description des changements"
git push
```

### 4. Synchroniser sur d'autres machines

```bash
# Sur une autre machine
chezmoi update
exec zsh
```

## Scripts personnalisés utiles

### Vérifier l'environnement
```bash
check-env.sh
```

### Backup avant gros changements
```bash
# Créer un script run_before_backup.sh
#!/bin/bash
tar -czf ~/dotfiles-backup-$(date +%Y%m%d).tar.gz \
  ~/.zshrc ~/.oh-my-zsh/custom ~/.p10k.zsh
```

## Ressources

- [Documentation officielle](https://www.chezmoi.io/)
- [Guide de référence](https://www.chezmoi.io/reference/)
- [Templates Go](https://pkg.go.dev/text/template)
- [Exemples de dotfiles](https://dotfiles.github.io/)

## Astuces

1. **Toujours tester avec `chezmoi diff` avant d'appliquer**
2. **Utiliser des alias pour gagner du temps** (cm, cme, cma, etc.)
3. **Commiter souvent, pousser régulièrement**
4. **Documenter les changements importants** dans les commits
5. **Garder work.zsh pour les variables sensibles** (jamais versionné)
6. **Tester sur une nouvelle machine** avant de déployer partout

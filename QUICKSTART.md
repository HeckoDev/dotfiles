# 🚀 Quick Start - Installation Dotfiles

## Sur un NOUVEAU PC

### Option 1 : Installation automatique (RECOMMANDÉ)

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <VOTRE-USERNAME-GITHUB>
```

**C'est tout !** Cette commande va :
- ✅ Installer chezmoi
- ✅ Cloner vos dotfiles depuis GitHub
- ✅ Installer automatiquement tous les outils (Homebrew, Oh-My-Zsh, etc.)
- ✅ Configurer votre environnement complet

### Option 2 : Installation manuelle

```bash
# 1. Installer chezmoi
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

# 2. Initialiser et appliquer
chezmoi init https://github.com/<VOTRE-USERNAME>/dotfiles.git
chezmoi apply -v
```

## Après l'installation

```bash
# 1. Redémarrer le terminal
exec zsh

# 2. Vérifier que tout est OK
check-env.sh

# 3. Configurer Powerlevel10k (si demandé)
p10k configure
```

## Mettre à jour sur une machine existante

```bash
chezmoi update
```

## Besoin d'aide ?

- 📖 Voir [README.md](README.md) pour la documentation complète
- 📝 Voir [CHEZMOI_CHEATSHEET.md](CHEZMOI_CHEATSHEET.md) pour toutes les commandes
- 🧪 Voir [TESTING.md](TESTING.md) pour tester l'installation

---

**Remplacez `<VOTRE-USERNAME-GITHUB>` par votre nom d'utilisateur GitHub dans toutes les commandes !**

# Aide-mémoire Neovim - Configuration Kanagawa

Guide rapide pour Neovim avec thème Kanagawa et plugins modernes.

## 🎨 Thème : Kanagawa

Thème inspiré des peintures japonaises avec trois variantes :
- **wave** (défaut) - Sombre et apaisant
- **dragon** - Plus de contraste
- **lotus** - Thème clair

## 🔑 Leader Key = `,` (virgule)

## Fichiers & Configuration

```
,w    Sauvegarder
,q    Quitter
,x    Sauvegarder et quitter
,e    Éditer init.lua
,r    Recharger la config
```

## Navigation

```
H              Début de ligne
L              Fin de ligne
,n             Buffer suivant
,p             Buffer précédent
,d             Supprimer buffer
Ctrl+h/j/k/l   Naviguer entre splits
```

## Explorateur de fichiers (NvimTree)

```
,t    Toggle NvimTree (ouvrir/fermer)
,f    Focus sur NvimTree
```

**Dans NvimTree :**
```
a        Créer fichier/dossier
d        Supprimer
r        Renommer
x        Couper
c        Copier
p        Coller
R        Rafraîchir
H        Toggle fichiers cachés
Enter    Ouvrir fichier
```

## Recherche (Telescope)

```
,ff    Chercher fichiers
,fg    Grep dans le projet
,fb    Liste des buffers
,fh    Aide Neovim
```

**Dans Telescope :**
```
Ctrl+n/p    Navigation
Enter       Ouvrir
Esc         Fermer
```

## Édition

```
,k        Dupliquer ligne
,a        Sélectionner tout
,ss       Supprimer espaces fin de ligne
Alt+j     Déplacer ligne vers le bas
Alt+k     Déplacer ligne vers le haut
```

## Commentaires (Comment.nvim)

```
gcc       Commenter/décommenter ligne
gc        Commenter sélection (mode visuel)
gbc       Commenter bloc
```

## Splits

```
,h    Split horizontal
,v    Split vertical
```

## Recherche

```
,<espace>    Désactiver surlignage
/mot         Chercher
n            Occurrence suivante
N            Occurrence précédente
```

## Git (GitSigns)

```
,gs    Git status
,gd    Git diff du fichier
,gl    Git log du fichier
```

**Dans le fichier (GitSigns) :**
```
]c    Changement suivant
[c    Changement précédent
```

## Développement (F-keys)

```
F5    Exécuter (Python, JS, Go, Rust)
F6    Compiler (Go, Rust)
F7    Tests (pytest, go test, cargo test, npm test)
```

## Plugins installés

- **lazy.nvim** - Gestionnaire de plugins
- **kanagawa** - Thème coloré
- **treesitter** - Coloration syntaxique avancée
- **nvim-autopairs** - Auto-fermeture parenthèses
- **Comment.nvim** - Commentaires intelligents
- **lualine** - Barre de statut
- **nvim-tree** - Explorateur de fichiers
- **telescope** - Recherche floue
- **gitsigns** - Intégration Git
- **indent-blankline** - Guides d'indentation

## Commandes plugins

```
:Lazy            Gérer les plugins
:Lazy update     Mettre à jour les plugins
:Lazy sync       Synchroniser les plugins
:Lazy clean      Nettoyer les plugins non utilisés
:TSUpdate        Mettre à jour Treesitter
:checkhealth     Diagnostics Neovim
```

## Modes Neovim

```
Esc       Mode normal
i         Insertion (avant curseur)
a         Insertion (après curseur)
v         Mode visuel
V         Visuel par ligne
Ctrl+v    Visuel par bloc
:         Mode commande
```

## Commandes natives utiles

```
gg        Début du fichier
G         Fin du fichier
:123      Aller ligne 123
w         Mot suivant
b         Mot précédent
dd        Supprimer ligne
yy        Copier ligne
p         Coller
u         Annuler
Ctrl+r    Refaire
.         Répéter
```

## Configuration par langage

| Langage | Indentation | Exécution | Compilation | Tests |
|---------|-------------|-----------|-------------|-------|
| Python | 4 espaces | F5 | - | F7 |
| Go | Tabs | F5 | F6 | F7 |
| JS/TS | 2 espaces | F5 | - | F7 |
| Rust | 4 espaces | F5 | F6 | F7 |
| HTML/CSS | 2 espaces | - | - | - |
| YAML | 2 espaces | - | - | - |

## Workflow recommandé

```
nvim fichier.py     Ouvrir fichier
,t                  Toggle explorateur
,ff                 Rechercher fichiers
,fg                 Rechercher dans projet
gcc                 Commenter
,w                  Sauvegarder
F5                  Exécuter
```

## Personnalisation du thème

Éditer `init.lua` et changer le thème :

```lua
theme = "wave"    -- wave, dragon, ou lotus
```

Variantes de couleurs :
- **wave** : Sombre, palette inspirée de la Grande Vague
- **dragon** : Sombre avec plus de contraste
- **lotus** : Clair, inspiré du lotus

## Astuces

💡 **Installation automatique**
- Les plugins s'installent automatiquement au premier lancement
- Patience lors de la première ouverture

💡 **Explorer le projet**
- `,t` pour ouvrir NvimTree
- `,ff` pour recherche rapide de fichiers

💡 **Recherche dans le code**
- `,fg` pour chercher du texte dans tout le projet
- Nécessite `ripgrep` (déjà installé)

💡 **Mise à jour**
- `:Lazy` puis `U` pour tout mettre à jour
- `:TSUpdate` pour Treesitter

## Ressources

- Config : `~/.config/nvim/init.lua`
- Kanagawa : https://github.com/rebelot/kanagawa.nvim
- Lazy.nvim : https://github.com/folke/lazy.nvim
- Neovim docs : https://neovim.io/doc/

## Dépannage

**Plugins ne s'installent pas**
```
:Lazy sync
```

**Erreurs Treesitter**
```
:TSUpdate
```

**Diagnostics complets**
```
:checkhealth
```

**Revenir à vim classique**
```
vim fichier.txt  (au lieu de nvim)
```

## Alias zsh

```
nvim          Lancer Neovim
nvimhelp      Afficher cet aide-mémoire
nv            Raccourci pour nvim
```

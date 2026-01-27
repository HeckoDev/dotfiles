# Configuration Vim - Guide complet

Configuration Vim optimisée pour le développement, intégrée aux dotfiles.

## 🎯 Objectif

Fournir un environnement Vim productif et agréable pour le développement, sans nécessiter de plugins externes (configuration vanilla).

## 📦 Installation

### Installation automatique (nouvelle machine)

La configuration Vim est automatiquement installée avec les dotfiles :

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply HeckoDev
```

### Installation manuelle

```bash
# Installer vim via Homebrew
brew install vim

# Appliquer la configuration
chezmoi apply ~/.vimrc
```

## 🎨 Fonctionnalités

### Interface utilisateur
- ✅ Numéros de ligne (absolus + relatifs)
- ✅ Ligne courante surlignée
- ✅ Barre de statut personnalisée complète
- ✅ Caractères invisibles visibles (tabs, espaces)
- ✅ Colonnes guides (80, 120 caractères)
- ✅ Thème sombre (desert)
- ✅ Support des vraies couleurs (termguicolors)

### Édition intelligente
- ✅ Indentation automatique selon le langage
- ✅ Auto-paires pour parenthèses, crochets, accolades, guillemets
- ✅ Pliage de code basé sur l'indentation
- ✅ Commentaires rapides adaptés au langage
- ✅ Recherche améliorée (incrémentale, case-smart)
- ✅ Presse-papier système intégré

### Support multi-langages

#### Python
- Indentation : 4 espaces
- Colonne limite : 80 caractères
- Templates : module, fonction, classe
- Exécution : `F5` pour run, `F7` pour pytest

#### Go
- Indentation : tabs (4 espaces)
- Exécution : `F5` pour run, `F6` pour build, `F7` pour tests

#### JavaScript/TypeScript
- Indentation : 2 espaces
- Exécution : `F5` pour node, `F7` pour npm test

#### Rust
- Indentation : 4 espaces
- Compilation : `F6` pour cargo build, `F7` pour cargo test

#### C/C++
- Compilation : `F6` pour gcc/g++

#### Autres
- HTML, CSS, YAML : 2 espaces
- Markdown : mode wrap, correction orthographique (fr/en)

### Highlight automatique
- ✅ TODO
- ✅ FIXME
- ✅ NOTE
- ✅ BUG
- ✅ HACK
- ✅ XXX

## ⌨️ Raccourcis clavier

### Leader key
Le leader est configuré sur `,` (virgule)

### Gestion des fichiers
| Raccourci | Action |
|-----------|--------|
| `,w` | Sauvegarder |
| `,q` | Quitter |
| `,x` | Sauvegarder et quitter |
| `,e` | Éditer .vimrc |
| `,r` | Recharger .vimrc |

### Navigation
| Raccourci | Action |
|-----------|--------|
| `,n` | Buffer suivant |
| `,p` | Buffer précédent |
| `,d` | Supprimer le buffer |
| `,b` | Liste des buffers |
| `Ctrl+h/j/k/l` | Naviguer entre les splits |
| `H` | Début de ligne |
| `L` | Fin de ligne |

### Splits et fenêtres
| Raccourci | Action |
|-----------|--------|
| `,h` | Split horizontal |
| `,v` | Split vertical |

### Édition
| Raccourci | Action |
|-----------|--------|
| `,k` | Dupliquer la ligne courante |
| `,a` | Sélectionner tout le fichier |
| `,ss` | Supprimer les espaces en fin de ligne |
| `Alt+j` | Déplacer la ligne vers le bas |
| `Alt+k` | Déplacer la ligne vers le haut |

### Pliage de code
| Raccourci | Action |
|-----------|--------|
| `Espace` | Plier/déplier le bloc sous le curseur |
| `,z` | Déplier tout |
| `,Z` | Plier tout |

### Commentaires
| Raccourci | Action |
|-----------|--------|
| `,c` | Commenter ligne/bloc |
| `,u` | Décommenter ligne/bloc |

### Recherche et remplacement
| Raccourci | Action |
|-----------|--------|
| `,<espace>` | Désactiver le surlignage de recherche |
| `,s` | Chercher/remplacer le mot sous le curseur |

### Copier/coller système
| Raccourci | Action |
|-----------|--------|
| `,y` | Copier dans le presse-papier système |
| `,p` | Coller depuis le presse-papier système |

### Développement (F-keys)
| Raccourci | Action | Langages |
|-----------|--------|----------|
| `F5` | Exécuter le fichier | Python, JS, Go, Rust, Bash |
| `F6` | Compiler | Go, Rust, C, C++, Java |
| `F7` | Lancer les tests | Python (pytest), Go, Rust, JS (npm) |

### Git
| Raccourci | Action |
|-----------|--------|
| `,gs` | Git status |
| `,gd` | Git diff du fichier courant |
| `,gb` | Git blame de la ligne courante |
| `,gl` | Git log du fichier courant |

### Gestion des erreurs (quickfix)
| Raccourci | Action |
|-----------|--------|
| `,cn` | Erreur suivante |
| `,cp` | Erreur précédente |
| `,co` | Ouvrir la liste d'erreurs |
| `,cc` | Fermer la liste d'erreurs |

### Templates
| Raccourci | Action | Langage |
|-----------|--------|---------|
| `,tm` | Template principal | Python, Go |
| `,tf` | Template fonction | Python, Go |
| `,tc` | Template classe | Python |

### Complétion
| Raccourci | Action |
|-----------|--------|
| `Tab` | Item suivant dans le menu de complétion |
| `Shift+Tab` | Item précédent dans le menu de complétion |

## 🔧 Personnalisation

### Modifier la configuration

```bash
# Ouvrir .vimrc avec vim
vim ~/.vimrc

# Ou utiliser le raccourci dans vim
,e

# Recharger après modification
,r
```

### Ajouter à chezmoi

```bash
# Éditer la configuration
chezmoi edit ~/.vimrc

# Voir les différences
chezmoi diff ~/.vimrc

# Appliquer les changements
chezmoi apply ~/.vimrc
```

### Commiter les modifications

```bash
cd ~/.local/share/chezmoi
git add dot_vimrc
git commit -m "🎨 Mise à jour configuration Vim"
git push
```

## 💡 Astuces

### Auto-paires intelligentes
Lorsque vous tapez `(`, `)` est automatiquement ajouté et le curseur est placé entre les deux.
Si vous tapez `)` alors que vous êtes déjà devant un `)`, le curseur passe simplement au caractère suivant.

### Pliage de code
Le code est automatiquement plié selon l'indentation. Utilisez `Espace` pour plier/déplier rapidement.

### Recherche et remplacement rapide
Placez votre curseur sur un mot et tapez `,s` pour lancer une recherche/remplacement dans tout le fichier.

### Exécution rapide
Sauvegardez avec `,w` puis appuyez sur `F5` pour exécuter directement votre code selon le langage.

### Templates
Pour créer rapidement une fonction Python : tapez `,tf` en mode normal.

### Commentaires par bloc
En mode visuel, sélectionnez plusieurs lignes puis tapez `,c` pour les commenter toutes.

## 🚀 Workflow recommandé

1. Ouvrir un fichier : `vim fichier.py`
2. Leader `,` pour accéder aux commandes personnalisées
3. `F5` pour exécuter
4. `,s` pour rechercher/remplacer
5. `,c` pour commenter
6. `Espace` pour plier le code
7. `,w` pour sauvegarder

## 🔗 Ressources

- [Vim documentation officielle](https://www.vim.org/docs.php)
- [Vim Cheat Sheet](https://vim.rtorr.com/)
- [Learn Vim](https://github.com/iggredible/Learn-Vim)

## 📝 Notes

- Configuration vanilla (sans plugins) pour éviter les dépendances
- Compatible avec tous les systèmes Linux/macOS
- Optimisé pour les terminaux modernes avec support de vraies couleurs
- Désactivation automatique de certaines fonctionnalités pour les fichiers >1MB

## 🐛 Dépannage

### Vim n'est pas installé
```bash
brew install vim
```

### Les couleurs ne s'affichent pas correctement
Vérifiez que votre terminal supporte les vraies couleurs (termguicolors).

### Le presse-papier système ne fonctionne pas
Vérifiez que vim a été compilé avec le support du presse-papier :
```bash
vim --version | grep clipboard
# Devrait afficher +clipboard
```

### La configuration n'est pas chargée
```bash
# Vérifier que .vimrc existe
ls -la ~/.vimrc

# Recharger manuellement
:source ~/.vimrc
```

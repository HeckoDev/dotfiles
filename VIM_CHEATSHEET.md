# Aide-mémoire Vim - Configuration personnalisée

Guide de référence rapide pour la configuration Vim personnalisée.

## 🔑 Leader Key = `,` (virgule)

## Commandes essentielles

### Fichiers
```
,w    Sauvegarder
,q    Quitter
,x    Sauvegarder et quitter
,e    Éditer .vimrc
,r    Recharger .vimrc
```

### Navigation rapide
```
H     Début de ligne
L     Fin de ligne
,n    Buffer suivant
,p    Buffer précédent
,b    Liste des buffers
```

### Splits
```
,h              Split horizontal
,v              Split vertical
Ctrl+h/j/k/l    Naviguer entre splits
```

## Édition productive

### Manipulation de lignes
```
,k        Dupliquer ligne
Alt+j     Déplacer ligne vers le bas
Alt+k     Déplacer ligne vers le haut
,a        Sélectionner tout
,ss       Supprimer espaces en fin de ligne
```

### Commentaires (adapté au langage)
```
,c    Commenter ligne ou bloc sélectionné
,u    Décommenter
```

### Pliage de code
```
Espace    Plier/déplier
,z        Déplier tout
,Z        Plier tout
```

### Copier/Coller système
```
,y    Copier vers presse-papier système
,p    Coller depuis presse-papier système
```

## Développement

### Exécution et tests (F-keys)
```
F5    Exécuter (Python, JS, Go, Rust, Bash)
F6    Compiler (Go, Rust, C, C++, Java)
F7    Lancer tests (pytest, go test, cargo test, npm test)
```

### Recherche et remplacement
```
,<espace>    Désactiver surlignage recherche
,s           Chercher/remplacer mot sous curseur
*            Chercher mot suivant
#            Chercher mot précédent
```

### Templates
```
,tm    Template principal (Python: shebang, Go: package main)
,tf    Template fonction
,tc    Template classe (Python)
```

## Git intégré

```
,gs    Git status
,gd    Git diff du fichier
,gb    Git blame de la ligne courante
,gl    Git log du fichier
```

## Gestion des erreurs

```
,cn    Erreur suivante
,cp    Erreur précédente
,co    Ouvrir liste erreurs
,cc    Fermer liste erreurs
```

## Complétion

```
Tab         Item suivant (menu complétion)
Shift+Tab   Item précédent
```

## Auto-paires

Parenthèses, crochets, accolades et guillemets se ferment automatiquement :
```
(    →  ()   avec curseur au milieu
{    →  {}
[    →  []
"    →  ""
```

Tape `)`, `}`, `]`, `"` pour passer au caractère suivant sans créer de doublon.

## Modes Vim (rappel)

```
Esc       Mode normal
i         Mode insertion (avant curseur)
a         Mode insertion (après curseur)
v         Mode visuel
:         Mode commande
```

## Commandes Vim natives utiles

### Navigation
```
gg        Début du fichier
G         Fin du fichier
:123      Aller ligne 123
w         Mot suivant
b         Mot précédent
```

### Édition
```
dd        Supprimer ligne
yy        Copier ligne
p         Coller
u         Annuler (undo)
Ctrl+r    Refaire (redo)
.         Répéter dernière action
```

### Recherche
```
/mot      Chercher "mot"
n         Occurrence suivante
N         Occurrence précédente
```

### Visuel
```
v         Sélection caractères
V         Sélection lignes
Ctrl+v    Sélection bloc
```

## Support multi-langages

| Langage | Indentation | Exécution | Compilation | Tests |
|---------|-------------|-----------|-------------|-------|
| Python | 4 espaces | F5 | - | F7 (pytest) |
| Go | Tabs | F5 | F6 | F7 |
| JavaScript | 2 espaces | F5 | - | F7 (npm) |
| TypeScript | 2 espaces | F5 | - | F7 |
| Rust | 4 espaces | F5 | F6 | F7 |
| C/C++ | 4 espaces | - | F6 | - |
| HTML/CSS | 2 espaces | - | - | - |
| YAML | 2 espaces | - | - | - |

## Astuces

💡 **Workflow rapide**
```
vim fichier.py
,w          Sauvegarder
F5          Exécuter
,s          Chercher/remplacer
Espace      Plier code
,c          Commenter
```

💡 **Recherche/remplacement rapide**
- Place curseur sur un mot
- Tape `,s`
- Entre le remplacement
- Valide avec Enter

💡 **Commentaire de bloc**
- Mode visuel avec `V`
- Sélectionne lignes
- Tape `,c`

💡 **Aide intégrée**
```
:help         Aide générale
:help ,w      Aide sur un raccourci
:help fold    Aide sur le pliage
```

## Ressources

- Fichier config: `~/.vimrc`
- Doc complète: `VIM_CONFIG.md`
- Vim officiel: https://www.vim.org/docs.php
- Cheat sheet: https://vim.rtorr.com/

## Dépannage rapide

**Sortir de Vim** : `Esc` puis `:q!` (quitter sans sauver) ou `:wq` (sauver et quitter)

**Annuler modification** : `u` en mode normal

**Recharger config** : `,r` ou `:source ~/.vimrc`

**Ouvrir config** : `,e`

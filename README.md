# git-mnz
A custom plugin for Oh My Zsh to extend the git plugin.

## Prerequisites

- Install zsh and ohmyzsh https://github.com/ohmyzsh/ohmyzsh
- Add git plugin https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git/

## Install git-mnz custom plugin

```
git clone https://github.com/manzapanza/git-mnz.git $ZSH_CUSTOM/plugins/git-mnz
```

and to o use it, add `git-mnz` to the plugins array in your ~/.zshrc file:

```zsh
plugins=(... git-mnz)
```

## Auto update

If you'd like to upgrade the plugin automatically during Oh My Zsh updates you just need to install [autoupdate-zsh-plugin](https://github.com/TamCore/autoupdate-oh-my-zsh-plugins).

## Aliases

| Alias                | Command                                                                     | Description                                                                 |
|:---------------------|:----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| gmnzv                |                                                                             | Get git-mnz version                                                         |
| gmnzu                |                                                                             | Update git-mnz                                                              |
| gcfix                | git commit -v --fixup                                                       | Commit with fixup                                                           |
| grbia                | git rebase -i --autosquash                                                  | Interactive rebase with autosquash (fixup)                                  |
| grbiaa               | git rebase -i --autosquash --autostash                                      | Interactive rebase with autosquash and autostash (fixup)                    |
| grbma                | git rebase master --autostash                                               | Rebase master with autostash                                                |
| grbca                | git rebase canary --autostash                                               | Rebase canary with autostash                                                |
| grbda                | git rebase develop --autostash                                              | Rebase develop with autostash                                               |
| gpt                  | git push && git push --tags                                                 | Push branch and tags                                                        |
| gcca                 | git checkout canary                                                         | Checkout canary                                                             |
| gai                  | git add -i                                                                  | Interactive add                                                             |
| gpf?                 | gf && glol HEAD..$(git rev-parse --abbrev-ref $(current_branch)@{upstream}) | Shows remotes commits not in the same local branch (can I push with --force?)|
| gtd                  | git tag --delete ${1}                                                       | Delete local tag                                                            |
| gtD                  | git push --delete origin ${1}                                               | Delete remote tag                                                           |
| gsfm                 | git reset --soft $(git merge-base --fork-point master) && gc                | Squash commits feature branched from master                                 |
| gsfd                 | git reset --soft $(git merge-base --fork-point develop) && gc               | Squash commits feature branched from develop                                |

## Functions

| Function             | Description
|:---------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------|
| gcfixa               | Commit with fixup and Interactive rebase with autosquash                                                                                                  |
| gcfixaa              | Commit with fixup and Interactive rebase with autosquash and autostash                                                                                    |
| gtdD                 | Delete local and remote tag                                                                                                                               |
| gchl                 | Shows formatted log next or specific tag                                                                                                                  |
| gchfeat              | Shows formatted log next or specific tag only feat                                                                                                        |
| gchrefactor          | Shows formatted log next or specific tag only refactor                                                                                                    |
| gchchore             | Shows formatted log next or specific tag only chore                                                                                                       |
| gchfix               | Shows formatted log next or specific tag only fix                                                                                                         |
| gchstyle             | Shows formatted log next or specific tag only style                                                                                                       |
| gchperf              | Shows formatted log next or specific tag only perf                                                                                                        |
| gchdocs              | Shows formatted log next or specific tag only docs                                                                                                        |
| gchtest              | Shows formatted log next or specific tag only test                                                                                                        |
| gch                  | Shows changelog next or specific tag                                                                                                                      |

## How to use

### Fixup & Rebase Autosquash

```
gcfix da178fb          // Add Fixup
grbia da178fb~1        // Autosquash fixup

# or

grbiaa da178fb~1       // Autosquash fixup with autostash
```
or

```
gcfixa da178fb         // Add Fixup & Autosquash fixup

# or

gcfixaa da178fb        // Add Fixup & Autosquash fixup with autostash
```

### Gpf?

Show remote commits not in the same local branch (can I push with --force?)

```
gpf?

* 08596a91 - refactor(custom-modal): Add checkbox to select/unselect all variables (7 days ago) <Author2>
* 671d8b22 - fix(app): Fix list group hover & styles (7 days ago) <Author2>
```

### Delete local and remote tags

Delete Local tag

```
gtd 2.1.0
```

Delete remote tag (origin)

```
gtD 2.1.0
```

Delete local and remote tag

```
gtdD 2.1.0
```

### Gch & Co (Changelog)

Show the log of the next or specific tag.
The commands `gchfeat`, ` gchrefactor `, `gchchore`,  `gchfix`, `gchstyle`,  `gchperf`, ` gchdocs`, ` gchtest` follow the [commit type angular convention](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#type)

Let's compare `glods` and `gchl`.

Show me the full log:

```
glods

* 1eabcba6 - (HEAD -> canary) chore(app): update submodules (2020-07-21) <Author1>
* c63f6de0 - refactor(chat): Route names as constants, Chat connect resolve (2020-07-20) <Author2>
* 34b72de0 - feat(app): Add chat button on card and list-item (2020-07-20) <Author1>
* 05f27a92 - chore(app): update submodules (2020-07-20) <Author1>
* 68a5df9b - feat(panels): Show chats on panels (2020-07-13) <Author1>
* c5e41612 - fix(context-menu): change key for chat (2020-07-13) <Author1>
* 3cce3918 - fix(app): chat elements on main view (2020-07-13) <Author1>
* 0a09a7c8 - (tag: 2.32.1, master) fix(context-menu): Fix disabled instance open associate responder (2020-07-24) <Author2>
* ecf47b1a - (tag: 2.32.0) fix(list-item): Fix color pending registration (2020-07-23) <Author2>
* 46506440 - chore(production): Fix client secred production (2020-07-23) <Author2>
* d808ae76 - fix(list-pw): Refresh list after invite (2020-07-23) <Author2>
* 9454b397 - fix(context-menu): Hide option when not enabled (2020-07-23) <Author2>
* 76f7903b - fix(main): Show main menu specific routes (2020-07-22) <Author2>
.....
```

Show me the log of next version/tag:

```
gchl

* chore(app): update submodules (1eabcba6)
* refactor(chat): Route names as constants, Chat connect resolve (c63f6de0)
* feat(app): Add chat button on card and list-item (34b72de0)
* chore(app): update submodules (05f27a92)
* feat(panels): Show chats on panels (68a5df9b)
* fix(context-menu): change key for chat (c5e41612)
* fix(app): chat elements on main view (3cce3918)
```

Show me the log of version 2.32.1:

```
gchl 2.32.1
 
* 0a09a7c8 - (tag: 2.32.1, master) fix(context-menu): Fix disabled instance open associate responder (2020-07-24) <Author2>
```

Show me the log of version 2.32.0:

```
gchl 2.32.0
 
* fix(list-item): Fix color pending registration (ecf47b1a)
* chore(production): Fix client secred production (46506440)
* fix(list-pw): Refresh list after invite (d808ae76)
* fix(context-menu): Hide option when not enabled (9454b397)
* fix(main): Show main menu specific routes (76f7903b)
.....
```

Show me the features of the next version:

```
gchfeat

* app: Add chat button on card and list-item (34b72de0)
* panels: Show chats on panels (68a5df9b)
```

Show me the features of the version 2.32.1:

```
gchfeat 2.3 2.1

** NO OUTPUT **
```
No feature has been implemented in this version.

Show me the fixes of the version 2.32.1:

```
gchfix 2.32 .1

* context-menu: Fix disabled instance open associate responder (0a09a7c8)
```

The others commands `gchchore`,  `gchfix`, `g lchstyle`,  `gchperf`, ` gchdocs`, ` gchtest` ha s the same behavior.

Show me the full changelog of the next version:

```
gch

FEATURES:

* app: Add chat button on card and list-item (34b72de0)
* panels: Show chats on panels (68a5df9b)

REFACTOR:

* chat: Route names as constants, Chat connect resolve (c63f6de0)

CHORE:

* app: update submodules (1eabcba6)
* app: update submodules (05f27a92)

FIXES:

* context-menu: change key for chat (c5e41612)
* app: chat elements on main view (3cce3918)
```

Show me the full changelog of the version 2.32.1:

```
gch 2.32.1

FIXES:

* context-menu: Fix disabled instance open associate responder (0a09a7c8)
```
### Squash branch feature

Squash all commits of the current/feature branch starting from the first commit after branch creation from master.

For example the `feature/feature-a` was created from `aefdf5e` on `master` and has 3 new commits:

```
glol

* 1bd09b4 - (HEAD -> feature/feature-a) feat(a): clean code (2 minutes ago) <Author1>
* d1383d6 - feat(a): Apply new feature on other components (3 minutes ago) <Author1>
* ac04a96 - feat(a): Start feature a (4 minutes ago) <Author1>
* aefdf5e - (origin/master, master) fix(chain-text): Select country by current language (5 days ago) <Author1>
* 1edfe5c - fix(app): Fix font size and color (5 days ago) <Author1>
* 7c6ecc4 - fix(authentication): logout after request 401 (13 days ago) <Author1>
...
```

With `gsfm` you can squash these 3 new commits in a new commit with `gc`:

```
gsfm

1 feat(a): Squashed feature A
2 # Please enter the commit message for your changes. Lines starting
3 # with '#' will be ignored, and an empty message aborts the commit.
...

:x

glol

* 30284ca - (HEAD -> feature/feature-a) feat(a): Squashed feature A (3 seconds ago) <Author1>
* aefdf5e - (origin/master, origin/HEAD, master) fix(chain-text): Select country by current language (5 days ago) <Author1>
* 1edfe5c - fix(app): Fix font size and color (5 days ago) <Author1>
* 7c6ecc4 - fix(authentication): logout after request 401 (13 days ago) <Author1>
```

...or if you prefere passing the commit message as parameter:

```
gsfm -m "feat(a): Squashed feature A"

glol

* 30284ca - (HEAD -> feature/feature-a) feat(a): Squashed feature A (3 seconds ago) <Author1>
* aefdf5e - (origin/master, origin/HEAD, master) fix(chain-text): Select country by current language (5 days ago) <Author1>
* 1edfe5c - fix(app): Fix font size and color (5 days ago) <Author1>
* 7c6ecc4 - fix(authentication): logout after request 401 (13 days ago) <Author1>
...
```



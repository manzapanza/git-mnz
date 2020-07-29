# git-mnz
A custom plugin for ohmyzsh to extend the git plugin

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

## Functions

| Function             | Description
|:---------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------|
| gcfixa               | Commit with fixup and Interactive rebase with autosquash                                                                                                  |
| gcfixaa              | Commit with fixup and Interactive rebase with autosquash and autostash                                                                                    |
| gtdD                 | Delete local and remote tag                                                                                                                               |
| glolc                | Shows formatted log next or specific tag                                                                                                                  |
| glolcfeat            | Shows formatted log next or specific tag only feat                                                                                                        |
| glolcrefactor        | Shows formatted log next or specific tag only refactor                                                                                                    |
| glolcchore           | Shows formatted log next or specific tag only chore                                                                                                       |
| glolcfix             | Shows formatted log next or specific tag only fix                                                                                                         |
| glolcstyle           | Shows formatted log next or specific tag only style                                                                                                       |
| glolcperf            | Shows formatted log next or specific tag only perf                                                                                                        |
| glolcdocs            | Shows formatted log next or specific tag only docs                                                                                                        |
| glolctest            | Shows formatted log next or specific tag only test                                                                                                        |
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

### Glolc & Co (Changelog)

Show the log (using [glods](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git/)) of the next or specific tag.
The commands `glolcfeat`, `glolcrefactor`, `glolcchore`, `glolcfix`, `glolcstyle`, `glolcperf`, `glolcdocs`, `glolctest` follow the [commit type angular convention](https://github.com/angular/angular.js/blob/master/DEVELOPERS.md#type)

Let's compare `glods` and `glolc`.

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
glolc

* 1eabcba6 - (HEAD -> canary) chore(app): update submodules (2020-07-21) <Author1>
* c63f6de0 - refactor(chat): Route names as constants, Chat connect resolve (2020-07-20) <Author2>
* 34b72de0 - feat(app): Add chat button on card and list-item (2020-07-20) <Author1>
* 05f27a92 - chore(app): update submodules (2020-07-20) <Author1>
* 68a5df9b - feat(panels): Show chats on panels (2020-07-13) <Author1>
* c5e41612 - fix(context-menu): change key for chat (2020-07-13) <Author1>
* 3cce3918 - fix(app): chat elements on main view (2020-07-13) <Author1>
```

Show me the log of version 2.32.1:

```
glolc 2.32.1

* 0a09a7c8 - (tag: 2.32.1, master) fix(context-menu): Fix disabled instance open associate responder (2020-07-24) <Author2>
```

Show me the log of version 2.32.0:

```
glolc 2.32.0

* ecf47b1a - (tag: 2.32.0) fix(list-item): Fix color pending registration (2020-07-23) <Author2>
* 46506440 - chore(production): Fix client secred production (2020-07-23) <Author2>
* d808ae76 - fix(list-pw): Refresh list after invite (2020-07-23) <Author2>
* 9454b397 - fix(context-menu): Hide option when not enabled (2020-07-23) <Author2>
* 76f7903b - fix(main): Show main menu specific routes (2020-07-22) <Author2>
.....
```

Show me the features of the next version:

```
glolcfeat

* 34b72de0 - feat(app): Add chat button on card and list-item (2020-07-20) <Author1>
* 68a5df9b - feat(panels): Show chats on panels (2020-07-13) <Author1>
```

Show me the features of the version 2.32.1:

```
glolcfeat 2.32.1

** NO OUTPUT **
```
No feature has been implemented in this version.

Show me the fixes of the version 2.32.1:

```
glolcfix 2.32.1

* 0a09a7c8 - (tag: 2.32.1, master) fix(context-menu): Fix disabled instance open associate responder (2020-07-24) <Author2>
```

The others commands `glolcchore`, `glolcfix`, `glolcstyle`, `glolcperf`, `glolcdocs`, `glolctest` has the same behavior.

Show me the full changelog of the next version:

```
gch

FEATURES:

* 34b72de0 - feat(app): Add chat button on card and list-item (2020-07-20) <Author1>
* 68a5df9b - feat(panels): Show chats on panels (2020-07-13) <Author1>

REFACTOR:

* c63f6de0 - refactor(chat): Route names as constants, Chat connect resolve (2020-07-20) <Author2>

CHORE:

* 1eabcba6 - (HEAD -> canary) chore(app): update submodules (2020-07-21) <Author1>
* 05f27a92 - chore(app): update submodules (2020-07-20) <Author1>

FIXES:

* c5e41612 - fix(context-menu): change key for chat (2020-07-13) <Author1>
* 3cce3918 - fix(app): chat elements on main view (2020-07-13) <Author1>
```

Show me the full changelog of the version 2.32.1:

```
gch 2.32.1

FIXES:

* 0a09a7c8 - (tag: 2.32.1, master) fix(context-menu): Fix disabled instance open associate responder (2020-07-24) <Author2>
```

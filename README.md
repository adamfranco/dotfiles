# dotfiles
Included in this repository a set of dotfiles I use to set up my unix environment. Feel free to use them as the basis for your own.
The only personal info you definitely want to change is the `.gitconfig`'s setting for name and email address.

## Usage ##

1. Clone this repository to your home directory
2. Make backups of any of the dot-files in this directory in case you want to retain existing settings.
3. `cd dotfiles/`
4. Create a `.bashrc.local` file to hold any personal/override settings.
5. Edit `.gitconfig` and replace my name and email with yours.
6. `./create_symlinks`

## Features ##

### `screen` and `X11` helpers

This config is set up to assist with a workflow based on reconnecting to long-running
[`screen`](https://www.gnu.org/software/screen/) sessions on a remote machine,
with these dotfiles installed on that remote machine.

#### `.screenrc` ####
Included in `.screenrc` are [a configuration of a tabbed view](https://github.com/adamfranco/dotfiles/blob/master/.screenrc#L15-L17) of the
current screen sessions, which makes screen much easier to use than the default
mode which doesn't show any context.

#### `Attach` and `fixssh` ####
While it is easy to ssh to a remote machine and reconnect to a screen session
with `screen -r` after a network disconnection or changing workstations, the
screen sessions don't know anything about your new X11 window server's address,
so trying to start a graphical program will fail unless you tell each screen shell
about the address in it's `DISPLAY` environmental variable.

This config provides an [`Attach` command](https://github.com/adamfranco/dotfiles/blob/master/.bashrc#L10-L14) that grabs the `DISPLAY` from the new
parent shell and saves it before starting screen, then tries to set the `DISPLAY`
for all shells in the `screen` session. There is also a `fixssh` command that will
import the parent `DISPLAY` information into the current shell.

Example:

```
[user@workstation]$ ssh remotemachine
Password:
[user@remotemachine]$ Attach
(starting screen)
[user@remotemachine]$ git gui &
```

#### Graphical Git support ####
The `Attach` and `fixssh` commands work hand in hand with some [additional shortcuts](https://github.com/adamfranco/dotfiles/blob/master/.bashrc#L15-L17)
that help launch graphical Git programs from within screen sessions, fixing the
`DISPLAY` settings along the way.

- `gg` is a shortcut for `git gui &` (with `fixssh`)
- `gk` is a shortcut for `gitk --all &` (with `fixssh`)
- `ga` is a shortcut for launching both.

#### Git tweaks ####
This config provides a few other handy tweaks to help with Git workflows:

- It sets up command completion in bash. so that you can type part of a command
  then hit tab to offer command suggestions.

- It sets up git-prompt so that your command-prompt will show the current branch
  information when in a Git working directory. Example: ```[afranco@saw wordpress (master)]$```

- It adds a `git lol` command which is an alias of `git log` with some [extra formatting
  parameters](https://github.com/adamfranco/dotfiles/blob/master/.gitconfig#L11) that allow it to show color-coded branching details in a shell. Example:
  ```
  [afranco@saw miis8 (master)]$ git lol

  * 14fdd1f - (HEAD, origin/master, origin/HEAD, master) middlebury_institute: Add a link on the node edit form which allows
  * 3ff119f - institute_theme: Correct an additional reference to the non-https version of maps in the event test page. (6 da
  *   66e6570 - Merge branch 'master' of github.com:middlebury/drupal8 (6 days ago) <Ian McBride>
  |\  
  | *   1510b4f - Merge branch 'master' of github.com:middlebury/drupal8 (7 days ago) <Ian McBride>
  | |\  
  | * | 4e57459 - offices: Update samlauth settings. (7 days ago) <Ian McBride>
  * | | 7472f17 - institute_theme: Update the test event page to use the https version of the map URL. (6 days ago) <Ian McBr
  | |/  
  |/|   
  * | 3d876a7 - institute_theme: Check to ensure the entity reference in the profile list paragraph is valid. For #409. (7 da
  |/  
  * fc8ba98 - servicecatalog #406: Update lifecycle styling to reflect new terms (8 days ago) <Adam Franco>
  * e292427 - servicecatalog #406: Rename "Level of Support" to "Support Level" (8 days ago) <Adam Franco>
  * bbc1deb - servicecatalog #406: "Add Level of Support" and "Availability" to taxonomy views. (8 days ago) <Adam Franco>
  * 192c90f - servicecatalog #406: "Add Level of Support" and "Availability" fields. (8 days ago) <Adam Franco>
   ```

- It adds some useful two-letter aliases:
  - `git co` for `checkout`
  - `git cp` for `cherry-pick`
  - `git su` for `submodule update --init --recursive`

- It adds a command that will allow you to cherry-pick a range of commits: [`git-multi-cherry-pick`](https://github.com/adamfranco/dotfiles/blob/master/bin/git-multi-cherry-pick)

#### BASH tweaks ####
- Sets up ls-colors
- Sets the default editor to `vim`
- Fixes a backspace issue when running `vim` inside a `screen` session.

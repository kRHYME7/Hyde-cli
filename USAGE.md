```
 ══════════════════════
║Hyde-cli: Manual Page ║
 ══════════════════════
Usage: Hyde [Function] [options]

 
[man]                       ↪️ Show Manual

 
[version]                   ↪️ Hyde-cli version

 
[systeminfo]                ↪️ System information

 
[check]                     ↪️ Information about Hyde and its components

			 [Config]  ↪️  [*] Hyde Config File & Directory status

						[--mismatch] ↪️    Diff mismatched dotfiles
						[--preserve] ↪️    Diff preserved dotfiles
						[--less] ↪️    Pipes STDOUT to less

			 [Package]  ↪️  Hyde core Package status
 
[control]                   ↪️ Interactive control file

			 [Config]  ↪️  Manage users restore control list
 
[branch]                    ↪️ Set preavailable Hyde branch

 
[update]                    ↪️ Pull updates from Hyde repository

 
[upgrade]                   ↪️ Upgrades dots from the repository

 
[restore]                   ↪️ Restore dots

			 [Config]  ↪️  Only restores dots from default '/home/khing/HyDE/Configs'

			 [Clone]  ↪️  Restores dots from a clone repository 
  			                  💡 Provide ~/path/to/clone/directory

			 [BackUp]  ↪️  Restores dots from previous backup
  			                  !! Files might not be complete
  			                  💡 You can cherry pick a file/dir from a backup

			 [Link]  ↪️  Links a clone directory. Useful if you want to change your CloneDir
 
[backup]                    ↪️ Backing up commands

			 [all]  ↪️  Backs up the current configuration

			 [revert]  ↪️  Revert to a previous backup run by 'Hyde backup all'. 
  			                  💡 different from 'Hyde restore Backup', this command will restore the explicit backups like a snapshot

			 [list]  ↪️  List the backup

			 [clean]  ↪️  Clear some storage by deleting old backups
 
[override]                  ↪️ Overwrite current dots from the preferred user dir 
			 💡 see upstream for more info 
			 💡 add 'userPrefsDir=path/to/user/pref/directory' in
			'/home/khing/.config/hyde/hyde.conf' for custom user path

 
[cache]                     ↪️ Manages Hyde's cache

			 [reload]  ↪️  Reload wallpaper cache

			 [rebuild]  ↪️  Force rebuild cache
 
[cursor]                    ↪️ Cursor setting

			 [theme]  ↪️  Set cursor theme

			 [size]  ↪️  Set cursor size

			 [reload]  ↪️  Reload cursors

			 [info]  ↪️  Check active cursor status (only gsettings)
 
[theme]                     ↪️ Theme commands

			 [set]  ↪️  Set theme

			 [next]  ↪️  Next theme

			 [prev]  ↪️  Previous theme

			 [select]  ↪️  Theme selector

			 [patch]  ↪️ 

			 [import]  ↪️  [*] Import a theme from different repository.
  			                 💡Invoking without args will launch a menu from Hyde-gallery DB

						[	<PATH>] ↪️ 
 
[wallpaper]                 ↪️ Wallpaper commands

			 [set]  ↪️  [*] Set /Path/to/Wallpaper

						[	<PATH>] ↪️ 

			 [next]  ↪️  Next wallppaer

			 [prev]  ↪️  Previous wallpaper

			 [select]  ↪️  Wallpaper selector

			 [variety]  ↪️  [*] Use variety package to manage wallpapers
  			                 💡Add 'exec-once=Hyde wallpaper variety' in ./userprfs.conf

						[--reset] ↪️  reset hyde profile
 
[wallbash]                  ↪️ Toggle to use wallpaper accent themes

			 [toggle]  ↪️  Cycles wallbash [0] off [1] auto [2] dark [3] light

			 [mode]  ↪️  [*] Set wallbash mode. [0] [1] [2] [3] 
  			                 💡no args spawns a menu

						[0] ↪️  wallbash disabled
						[1] ↪️  wallbash auto
						[2] ↪️  wallbash dark mode
						[3] ↪️  wallbash light mode
 
[waybar]                    ↪️ Waybar commands

			 [control]  ↪️  Edit waybar control file

			 [next]  ↪️  Next waybar layout

			 [prev]  ↪️  Previous waybar layout

			 [reload]  ↪️  Reloads waybar

			 [size]  ↪️  [*] Set waybar size
  			                 💡e.g 'waybar size 30' (range 1-100)

						[--all] ↪️  Change all the pre-set sizes
 
[sddm]                      ↪️ Sddm commands

			 [install]  ↪️  Install and set sddm theme from HyDE clone Repo

			 [list]  ↪️  List all local sddm themes

			 [set]  ↪️  Set Sddm theme from the list

			 [unset]  ↪️  Unset a theme set by 'set' command

			 [test]  ↪️  Test a theme

			 [info]  ↪️  Check sddm theme status
 
[shell]                     ↪️ Shell commands

			 [select]  ↪️  Shell selector
 
[power]                     ↪️ Power Options

			 [reset]  ↪️  Reset changes

			 [save]  ↪️  [*] Save power by disabling features

						[--animations] ↪️  Disable animations
						[--borderangle] ↪️  Disable border angle animation
						[--blur] ↪️  Disable blur
						[--opacity] ↪️  Disable tranparency
						[--all	] ↪️  Disable all to save more power
						[on				] ↪️  Disable all fancy things to save more power
						[off				] ↪️  Disables the power saving mode

			 [toggle]  ↪️  Toggle 💡 Set/unset current changes'

			 [unset]  ↪️  [*] Unset specific changes

						[--animations] ↪️  Default animations
						[--borderangle] ↪️  Default border angle animation
						[--blur] ↪️  Default blur
						[--opacity] ↪️  Default tranparency
						[--all] ↪️  Remove power saving mode

			 [game]  ↪️  Toggle game mode
 
[code]                      ↪️ Code editor related commands

			 [theme]  ↪️  set the code theme
 
[show]                      ↪️ Useful GUI util

			 [binds]  ↪️  [*] Show keybind hints
  			                  💡 Click to execute

						[-j] ↪️   Show the JSON format
						[-p] ↪️   Show the pretty format
						[-d] ↪️   Add custom delimiter symbol (default '>')
						[-f	<PATH>] ↪️   Add custom .conf file
						[-h] ↪️   Display this help message

			 [bookmarks]  ↪️  [*] Bookmark selector
  			                 💡append 'bookmark_file=("/path/to/bookmarks.lst")' line inside '/home/khing/.config/hyde/hyde.conf'

						[--browser	<PACKAGE>] ↪️    Set Browser can also set 'BROWSER' env
						[--no-custom] ↪️     run without custom '.lst' bookmark files
						[--persist	] ↪️ 	Saves bookmark file list to ~/.cache.So no re-caching after reboot
						[--rasi	<PATH>] ↪️ 	set rofi configuration
						[--rebuild] ↪️    force rebuild cached bookmark paths
						[	--deps] ↪️  check and resolve dependencies

			 [calc]  ↪️  [*] Calculator (libqalculate)

						[--rasi	<PATH>] ↪️  set rofi configuration
						[--reset] ↪️ 	Reset cache
						[	--deps] ↪️  check and resolve dependencies

			 [emoji]  ↪️  [*] Emoji selector
  			                 💡Add 'emoji_style=2'
  			                 	1 = list
  			                 	2 = grid

						[--style] ↪️    use style [ 1 | 2 ]
						[--rasi	<PATH>] ↪️ 	set rofi configuration
						[	--deps] ↪️  check and resolve dependencies	

			 [glyph]  ↪️  [*] Glyph selector

						[--deps] ↪️  check and resolve dependencies

			 [pastebin]  ↪️  [*] Pastebin manager 
  			                  💡 pass [only once] '--ignore=initialclass' to disable autopaste

						[--copy] ↪️  list and copy selected
						[--delete] ↪️ 	list and delete selected
						[--wipe] ↪️ 	wipe database
						[--option] ↪️ 	options
						[--deps] ↪️  check and resolve dependencies

			 [screencap]  ↪️  Use rofi to select screenshot options 
  			                  !!  kills another rofi session

			 [search]  ↪️  [*] Web Search
  			                 💡supports shorthand e.g 'g: some thing' (this uses google.com to search for 'some thing')
  			                 💡':' is use as delimiter
  			                 💡Custom search-engines should be in 'search.lst' and be declared inside ./hyde.conf ( e.g search_file="$HOME/.config/hyde/search.lst" )

						[--reset] ↪️ 	Reset cache
						[--browser] ↪️  Browser to use
						[--site] ↪️  Search engine to use
						[--rasi	<PATH>] ↪️  set rofi configuration
 
[run]                       ↪️ Executable utilities

			 [airplane_mode]  ↪️  Toggle airplane mode
  			                 	💡Toggles wifi

			 [audio_idle]  ↪️  Inhibits idle when player status: 'Playing

			 [screencap]  ↪️  [*] Screenshot and screenrecord tool

						[--print-all] ↪️   Print all outputs
						[--record-focus] ↪️   Record focused monitor
						[--print-snip] ↪️   Drag to manually snip an area
						[--record-snip] ↪️   Drag to manually snip an area to screen record it
						[--freeze] ↪️   Frozen screen, drag to manually snip an area
						[--print-monitor] ↪️   Print focused monitor
						[--scan] ↪️   Use 'tesseract' to scan image then add to clipboard
						[--stop] ↪️   Stop every instance of Screencap
						[--reset] ↪️   Reinitialize screencap

			 [events]  ↪️  Watches hyprland events and executes actions
 
[inject]                    ↪️ User/Device specific scripts that might be useful

			 [asus_patch]  ↪️  Fixes issues for asus devices

			 [chaotic_aur]  ↪️  [*] Add chaotic aur to you mirror

						[--install] ↪️  Setup Chaotic Aur, append [fresh] to run in fresh install mode
						[--uninstall] ↪️  Removes Chaotic Aur
						[--revert] ↪️  Converts chaotic aur packages to AUR

			 [flatpak]  ↪️  Flatpak setup for HyDE
 
[reload]                    ↪️ Just reload
====================================================================================================================================================================

Descriptions with [*] can be expanded to show more information. Append [--help]

Check for dependencies by appending '--deps' flag. eg ' Hyde show pastebin --deps ' 

Regenerate this 'man' page by appending '--reload' flag. 'Hyde man --reload' 




 ════════════════════════════
║Hyde-cli: Tools Manual Page ║
 ════════════════════════════
Usage: Hyde-tool [Function] [options]

 
[man]                       ↪️ Show Manual

 
[zoom]                      ↪️ Zoom in/out Hyprland

			 [in]  ↪️  Zoom in

			 [out]  ↪️  Zoom out

			 [reset]  ↪️  Reset Zoom
====================================================================================================================================================================

Descriptions with [*] can be expanded to show more information. Append [--help]

Regenerate this 'man' page by appending '--reload' flag. 'Hyde-tool man --reload' 
```

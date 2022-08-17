# Xournal++ Fly-Pie Plugin

*A plugin and set of basic resources to help with interfacing [Fly-Pie](https://github.com/Schneegans/Fly-Pie) and [Xournal++](https://github.com/xournalpp/xournalpp)*


## Installation
Currently, installation is a very manual process. I plan on automating this in the future, but for the sake of this initial release I am going to leave it like this.

#

Clone the git directory as follows
```
$ git clone https://github.com/baf57/Xournalpp_FlyPie.git
$ cd Xournalpp_FlyPie
```

Next, move the plugin files into the Xournal++ `plugins` directory.
```
# cp src/{plugin.ini,main.lua} ~/.config/xournalpp/plugins/FlyPie/
```
After this, open the Fly-Pie settings and import the `./src/menu.json` file. This can differ depending on your GNOME version:
* **< GNOME 40:** use [`gnome-tweaks`](https://github.com/GNOME/gnome-tweaks) and go to `extensions -> Fly-Pie -> Settings`
* **GNOME 40+:** use the prepackaged `gnome-shell-extension-prefs` and go to `Fly-Pie -> Settings`
  
Note that the following instructions **WILL OVERRIDE YOUR CURRENT MENUS!** If you want to preserve your current menus, then first select the *"Export all menus to JSON file"* options and merge that generated JSON file with the `src/menu.json` file before preceeding.

Once in the Fly-Pie settings, go to the `Menu Editor` tab and select the *"Restore menus from a JSON file"* option. Select the either the `src/menu.json` file, or your merged JSON file if you merged it prior to this.

The menu will pop-up, however none of the custom icons will be set properly. To do this, click the menu item and select the three vertical dots on the `Icon` bar. Navigate to `./resources` folder and select the appropriate icon. **This will need to be done for every menu item missing an icon**.
#
To get this working with a stylus button, you will likely have to do the following:

Install [Input Remapper](https://github.com/sezanzeb/input-remapper) and bind `Shift + Ctrl + Super + plusminus` to one of the buttons.


## TODO
* Make a more concise installation method
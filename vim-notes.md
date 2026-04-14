Hare Krishna,
-

# Introdution to vim:

1. vi: 
    * Visual editor made for unix and linux. Keyboard based, modal, lightweight and fast.
1. vim:
    * Visual editor improved, introduced vim script and plugin system and vim script along with many new features such as text highlighting, multilevel undo.
1. neovim:
    * Fork of vim and open source community driven and introduced lua as a scripting language and inherited all good things from vim.

# Using vim:
*In terminal typing vim opens "vim" editor and "vim ." will open vim in the directory you are in currently.*

**Three important components of vim experience:vim motions, vim the editor and configuring vim as the editor**.

## Vim Motions:

*Vim is modal i.e. same keys act differently in different modes.*

### Vim modes: 
    Normal, Insert, Visual and Command

#### Normal Mode: mode to just view and use vim motions.
    *initiated by typing esc.*

    h j k l : motion for left, down, up and right respectively characterwise.
    w , b : takes forward words wise and backwards respectively. 
    dd:deletes one line and also copies it.
    p: pastes in vim only, you can paste over content and also copies the content you pasted over.
    yy: copy line in vim only.
    u: undo
    ctrl + r : redo what was undoed.
    '*': typing asterisk over any word will search it throughout the file.
    'ZZ': quits vim like write and save and if nothing to write then just quit.
    'ZQ': quits vim like ':q!'.
    gcc: comments out the current line.





####  Insert mode: mode for typing and actually writing.
    i: insert at the cursor place.(left)
    a: append at cursor place.(right)
    o: inserts cursor below the current line.
    O: inserts cursor above the current line.


#### Visual mode:for selecting text.
    v: for character wise selection.
    V: for line wise selection.
    ctrl + v: block wise selection for vertical and as well as horizontal at the same time this is awesome.
    y:copy in vim only.
    d:delete and also copies what it deletes.
    <:indent left.
    >:indent right.
    =:auto corrects indentation.
    gc: comments out the selected part


#### Command mode:
    initiates from typing ":"
    ":w" : used for saving file content.
    ":q" : used for exiting.
    ":wq" : used for saving and exit. 'ZZ' is shortcut for this command.
    ":q!" : used for for exiting without saving your changes.
    ":! <command>" : used for writing commands on the terminal from within vim.
    ":retab" : changes tabs to spaces in the entire files helpful in dealing with python files throughout the usage case in various editors.
    ":Ex" : used to enter the file explorer mode of vim.
    ":term" : opens terminal within vim.
    "/<word>" : is used to search in a file and 'N' takes cursor to upper occrences and 'n' lower occurrences.(do type enter after search)
    ":noh": used to stop the highlighting of searched term.
    "q:" : opens the history of commands written.In command history pressing enter over a command executes it.
    ":%s/old_text/new_text/g": % -> entire file, s -> substitute(find and replace),g->global ie replace all.


### Anatomy of a motion:
    Motion is anything that moves a cursor.
    Command Count Motion:
    d,c,y,v  no    h,j,k,l,w,b,f,F 

    what this means is you can join these factors to use vim to edit text.
    That is use d4j to delete four lines below or d4w delete four words forward and you can use this as per your own creativity.

    Therefore you need relative line numbers feature turned on.


### In line travelling:
    $: goes to the end of the line
    0: goes to the start character of the line
    _: goes to the start of the line
    f <any char> : jumps on to the  <any char> forward
    F <any char> : jumps on to the  <any char> backward
    t <any char> : jumps to the  <any char> forward.
    T <any char> : jumps to the  <any char> backward.
    after using f or F to find anything you can use "," and ";" to go search further for the same thing.
    (that is you don't have to f<char> again.just use',' or':')
    Note ';' is for direction of the search and ',' is for oposite direction of the search.
    I:goes into insert mode at start of the line.
    A:goes into insert mode at the end of the line.

### Vertical travelling:
    "gg":takes cursor to the begining of the file.
    "G": takes the cursor to the end of the file.
    "ctrl+d": takes you half page down in the view. 
    "ctrl+u": takes you half page up in the view. 
    ":<line number>" : takes you that particular numbered line.
    "{": takes cursor to upwards paragraph.
    "}": takes cursor to backwards paragraph.
    "zz": takes cursor to middle of the screen.



### Advanced motions:
#### In and Arround: i and a
    *bound will the characters which are used to bound other characters example: "" , '', (), {},[],<>.*

    vi<bound>:selects all that which is in the bound.
    va<bound>:selects all that which is in the bound and bound.

    di<bound>:deletes all that which is in the bound.
    da<bound>:deletes all that which is in the bound and bound.

    yi<bound>:yanks all that which is in the bound.
    ya<bound>:yanks all that which is in the bound and bound.

#### change:

    c: deletes the character cursor is on and waits for any character to be clicked then enters insert mode and only then what character types is placed. 
    cc: deletes entire line and enters insert mode.
    cw: deletes the word forward and enters insert mode.
    cb: deletes the word backward and enters insert mode.
    ci<bound>:deletes all that which is in the bound and enters insert mode.
    ca<bound>:deletes all that which is in the bound and bound itself and enters insert mode.

#### Macros:

    Macros is a neovim feature that records sequence of normal mode commands and repeat them for faster editing experience.

    q<a-z or A-Z or 0-9>; starts recording the key strokes of normal mode.
    q; stops recording the key strokes of normal mode.

    @<a-z or A-Z or 0-9>; plays the recorder keystorkes once

    <numberr>@<a-z or A-Z or 0-9>; plays the recorder keystorkes numbered times. 

    macros are powerful hence should be used with responsibility.




## writing text using neovim :

    ":set spell" ; starts checking spelling in neovim.
    ":set nospell" ; stops checking spelling in neovim.
    "z=" ; checks spelling suggestions for the word specific.
    "zg" ;  adds the word in the dictionary.
    ":echo wordcount.words()" ;shows the no of words in the text file.




## Vim The Editor
    "-" : goes back a directory.
    'i' : in netrw file explorer is the way to manage layout or the file explorer is showing the files.
    "%" : creates a file in the directory you  are in  and opens it.
    "d" : creates a new directory.
    "<Enter>: opens the file you have cursor is.
    "o" : opens the file you have cursor over above the file explorer.
    "D" : will delete the file you have your cursor on.
    "R" : will rename the file you have your cursor on.
    "x" : will open the file you have your cursor on in the default software similar to xdg-open.
    "ctrl+z" : it suspends it (sends Vim to the background). To properly quit, you use :q.
    "ctrl+z" : it suspends it (sends Vim to the background). To properly quit, you use :q.
    You can yank the file path from the file explorer using yy and paste it using ctrl+V for command line.

### Using multiples windows in neovim:
    "ctrl+w v" : creates a new vertical window of vim in the same buffer(buffer has windows).
    "ctrl+w s" : creates a new horizontal window of vim in the same buffer(buffer has windows).
    "ctrl+w w" : lets you choose among different windows.
    "ctrl+w h" : shifts from current window to left.
    "ctrl+w j" : shifts from current window to down.
    "ctrl+w k" : shifts from current window to up .
    "ctrl+w l" : shifts from current window to right.
    "ctrl+w o" : Removes all other windows except one which you are on.

#### manipulating windows:
    "Ctrl-w =": Make all windows equal size. 
    "Ctrl-w +": Increase height. 
    "Ctrl-w -": Decrease height.             
    "Ctrl-w >": Increase width.             
    "Ctrl-w <": Decrease width.              

### using vim as terminal;
    Neovim terminal; type in vim ":term" enter terminal.
    It works as normal terminal.
    Also you can access vim motions in there as well.
    You type command in insert mode and use motions in normal mode which is entered using "ctrl + \ ctrl + n".
    Exit terminal by typing exit and you will enter neovim.



## Configuring Neovim: PDE
*Configuring neovim is part of the wider concept known as personal development environment.*

*It means that how you code and entire workflow should be personalized to your needs and nature.*

*Neovim is not the only PDE, emacs and vim also exist.*

*What neovim itself offers is community, lua based configuration, distributions(nvchad, lazy), plugins and vim motions*

### Q.What can you configure ?
* One can configure alot in neovim all it depends on interest, skill and how much energy one can put in configuring.

* Point above should be noted as there is no particular type of configuration for everyone.Neither there is any list that will
contain all the customization that 'you' need nor is there any of customization that is 'customary'.

* One can configure to one's taste in one's way.More customization if that suits you or less customization if that suits you.

* Currently there is a trend of shifting from propriety IDE(interactive development environment) to Neovim.
Therefore in the community there is more focus on IDE like configuration. It suits well to those coming from VS-code.
While offering most modern coding features.

* Advantage of the IDE like Neovim configuration is that it makes Neovim accessible for mainstream users.While also giving options
to users to remove any fluff of modern IDEs they don't like or add some features or customization which they just not offer.

*Following configuration notes are for this modern IDE like experience of Neovim.*

### PDE;
Upon installation vim is bare metal text editor.One adds rest.

#### Features for IDE like Neovim experience:
*Customization of: appearance, shortcuts, plugins(extended capabilities), auto-completion, documentations, Language server protocol support, tree-sitter and  how editor acts for certain things.*

1. Appearance: nvim themes, icons, lualine, greeting screens, color choices and overrides for UI elements.

1. Short cuts: custom keybindings vim related and also for plugins. 

1. Auto-completion: auto-completion is that feature which offers to complete what we are typing; by buffers, snippets, lsp or syntax.

1. LSP:Stands for language server protocol; the way of communication among any language server and text editor; developed by Microsoft.
Essentially every language has a server for syntax and definition to which if connected the editor can send requests for queries
regarding code written to aid the developer.(gives information for definition, documentations and error types and more)
logical error reporting.

1. Tree-sitter: Parser for code written, intelligently parses the code to provide proper highlights and incremental 
selection(logic based), intelligent indentation and syntax aware folding and structural error reporting(where error is or structural error)

1. Custom workflow: One can create personalized customizations for workflow like; global clipboard, terminal or window arrangements or even have relative numbers for netrw file explorer and more.This depends more on user on how they want their Neovim experience to be.

1. Plugins:
Plugins are essentially extensions for neovim which extend neovim's capabilities.Most of modern IDE feautes are actually integrated via plugins.
Ex;  themes, lsp, autocompletion, workflow tools and tree sitter.

#### Q.How to configure?
*In noevim we configure using lua or vimscript. Of course lua is the preference.*

    To initialize the configuration.Create directory ~/.config/nvim if it does not exist.
    
    Create a file and name it "init.lua".
    Upon start there will no file in this directory you create files and folders.
    Recommendation is to create one init file and lua folder and in lua folder have two folders
    one plugins and another configuration.Their purposes are explained below.

    The ideal .config/nvim file tree should like this.

    User@Device:~/.config/nvim$ tree
    .
    ├── init.lua
    ├── lua
    │   ├── configuration
    │   │   ├── specific1.lua
    │   │   └── specific2.lua
    │   └── plugins
    │       ├── plugin1.lua
    │       ├── plugin2.lua
    │       └── plugin3.lua
    └── Notes_about_config.md

    Init.lua is the file that initiates your configuration.
    
    In lua/plugins each file gets executed upon opening neovim.

    lua/configuration need not be there but here one can put files for customizing specifics.
    Files of this directory must be imported in the init.lua file.






##### Plugins installation
*we understood that most of the customization is done via extensions just like in any editor.*
**here's how to install them**

* Plugin manager: 
    is itself a plugin to manage plugins i.e. install update load and delete them etc.
    This modern IDE config is based on the plugin manager named 'lazy'.

To install a plugins first one must install the plugin manager and acc to syntax and requirements of that plugin manager install them.Ex of plugin managers : 'Packer' and 'Lazy'

Installation process and documentation on how to use the plugin manager, are given on the website and github of the respective plugin manager.

*Recommendation; create a file separately in lua/configuration to install plugin_manager only and name it 'plugin_manager.lua'.*

Lazy has its specific syntax and requirements for installation and configuration of plugins.
1. Modular plugin configuration. It means you can create multiple files to manage your config.This is very beneficial for easy to manage config.
 It ensures each plugin has its own file for its specific config.
1. Each file must return i.e. each file should return something for each plugin.
1. Format of syntax should be lua tables.

*   To intall a plugin go to the plugin's github or website and follow the installation process and configure it accordingly.
    Don't hesitate to read to the documentation or least installation process and for stuff that you want to configure.

###### Basic pattern:
1. *The basic pattern of installing plugins is to copy lua table of the github or website of the plugin.*

1. *Create a lua file in lua/plugins named after the plugin.*

1. *Paste the lua table in  "lua/plugin/plugin_name.lua".*

1. *Ensure the link of the dependency of the plugin is also present in the table*

1. *Lazy sync*

1. *If there is any configuration for the plugin that should be done; be done in "plugin_name.lua" file for that particular plugin.*

1. *Again **read** the documentation of the plugins whenever confused or just read introduction before installing a plugin.*


#### Plugins Reccomendations; 
```
{

Parsing ; tree-sitter.nvim,

Language server protocal ;{ 

lsp server installer: 'mason', 
lsp_server_integrator_with_neovim : 'nvim-lspconfig',
bridge_b/w_integrating_and_downloading_lsp_servers : 'mason-lspconfig',

},

auto-completion ; blink.cmp,

looks; {
theme;'onedark/dracula/rosepine etc',
icons; 'webdevicons',
line; 'lualine',
dashboard; 'alpha',
},

Navigation; {
fuzzy_find_files ; 'telescope', 
quick_some_files_navigation ; 'harpoon',
},

Aid_while_configuring_lazy; 'lazydev.nvim 0.8ms  nvim-lspconfig',

Practice_vim_motions; 'vim-be-good',

}

```

## Keymappings;

```
leader = ' '
'i','jk','<Esc>',{desc ="jk for entering normal mode"}
'n','r','<C-r>',{desc="r for redoing undo just works good"})
'n',"<leader>fe",vim.cmd.Ex,{desc="for opening explorer"})
'n',"<leader>t",vim.cmd.term,{desc="for opening terminal in vim"})
'n',"nh",vim.cmd.noh,{desc="stops highlighting of searched text"})
't',"<A-k>",[[<C-\><C-n>]],{desc="for entering the normal mode in neovim terminal"})


--keybindigins for lsp

'n', '<leader>w', vim.diagnostic.open_float, { desc = "mapping for checking errors in diagnostics from lsp" })
'n', '<leader>ca', vim.lsp.buf.code_action, { desc = "mapping for code actions" })
'n', 'gd', vim.lsp.buf.definition, { desc = "mapping for go deffinition of stuf on which cursor is on" })
'n', 'K', vim.lsp.buf.hover, { desc = "mapping for hover information about stuff on which cursor is on" })--lsp request for documentation


--copies the file path of the file currenlty opened or the path of the directory will work as  :!pwd when a file is not opened.

"n", "<leader>p", 


'n', '<A-Left>',  '<C-w><', { desc = 'Decrease window width' })
'n', '<A-Right>', '<C-w>>', { desc = 'Increase window width' })
'n', '<A-Up>',    '<C-w>+', { desc = 'Increase window height' })
'n', '<A-Down>',  '<C-w>-', { desc = 'Decrease window height' })
'n', '<leader>r', ':%s///gc<Left><Left><Left>', { desc = 'Search & replace in file (confirm each)' })
'n','<C-d>','<C-d>zz',{desc="for centering the view after half page down"})
'n','<C-u>','<C-u>zz',{desc="for centering the view after half page up"})

-- Split windows
"n", "<leader>wv", "<C-w>v", {desc="<leader>+v → vertical split"})
"n", "<leader>ws", "<C-w>s", {desc="<leader>+s → horizontal split"})

-- Window navigation
"n", "<leader>wh", "<C-w>h", {desc="<leader>+h → left"})
"n", "<leader>wj", "<C-w>j", {desc="<leader>+j → down"})
"n", "<leader>wk", "<C-w>k", {desc="<leader>+k → up"})
"n", "<leader>wl", "<C-w>l", {desc="<leader>+l → right"})
"n", "<leader>ww", "<C-w>w", {desc="<leader>+w → cycle windows"})
"n", "<leader>wo", "<C-w>o", {desc="<leader>+o → keep only current window"})

-- Telescope keybindings

'n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
'n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
'n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
'n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
'n', '<leader>gf', builtin.git_files, { desc = 'Telescope git files' })

-- Blink completion keybindings

['<A-k>'] = { 'select_prev' },
['<A-j>'] = { 'select_next'},
['<A-x>'] = {'cancel'},
['<A-f>'] = {'show'},
['<A-c>'] = {'accept'},
['<C-h>'] = {'hide_signature'},

-- Harpoon

"n", "<leader>a",harpoon:list():add()

"n", "<leader>e",harpoon.ui:toggle_quick_menu(harpoon:list())

"n", "<leader>1",harpoon:list():select(1)

"n", "<leader>2",harpoon:list():select(2)

"n", "<leader>3",harpoon:list():select(3)

"n", "<leader>4",harpoon:list():select(4)

"n", "<leader>5",harpoon:list():select(5)

-- live server

"n", "<leader>ls", starts live server 
"n", "<leader>lx", stops live server 


```

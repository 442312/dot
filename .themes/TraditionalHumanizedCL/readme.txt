TraditionalHumanized and TraditionalHumanizedCL themes for Ubuntu Mate 18.04

Ubuntu 10.04 Human Clearlooks theme was virtually perfect. It became hands down
comfortable for my eyes when I managed to reduce saturation of its colours a bit.

Since then eye-killing mainstream themes regularly ruin my comfort as soon as
new distribution major release proves incompatible with my beloved theme.

Now I am at Ubuntu Mate 18.04 and tweaking themes again. Here are notes on what
has been done and how.

*** Install Human theme:
# apt install human-theme humanity-icon-theme

You get gtk-2 Human, Human-Clearlooks themes and Humanity icon set.

Download https://github.com/GlassGhost/pwf python widget factory for gtk2 & 3
to compare original gtk2 version and one's tweaks and leverage difference.

*** Prepare basis
copy /usr/share/themes/TraditionalOk theme folder into ~/.themes
Rename copied folder to <name> and cd into it
delete ./metacity-1 folder
copy /usr/share/themes/human/metacity-1 folder into your folder
edit ./metacity-1/metacity-theme-1.xml
    substitute TraditionalOk name occurences with <name>

edit ./index.theme
    substitute TraditionalOk name occurences with <name>
    set IconTheme to 'Humanity'
    set CursorTheme to 'default'
    
*** Migrate <source> Human or Human-Clearlooks GTK2 settings
Open /usr/share/themes/<source>/gtk-2.0/gtkrs and ~/.themes/<name>/gtk-2.0/gtkrs and
~/.themes/<name>/gtk-3.0/settings.ini side by side

copy 'gtk-color-scheme' color values from source gtkrc to targets

Open ./gtk-3.0/gtk.css

fill obvious color definitions in 'color scheme' section with gtk2 color values

Replace 'core_color_a' value with of 'theme_selected_bg_color' value
Replace 'core_color_b' value with of 'theme_bg_color' value

Adjust button_default_border_color and button_default_box_shadow_color

Open ~./themes/<name>/gtk-3.0/gtk-widgets.css

Adjust color values in 'rgba(...)' functions to your palette

In themes/<name>/gtk-3.0/img adjust colours in border-focused*.svg files.

*** Personal tweaks (basic colors changed in all files)
* Window background is too bright 
theme_base_color #ffffff -> #EDE4DC

* Selection bar colour could be less bright
theme_selected_bg_color #8F5F4A -> #C79C89

* Scroll bar is too bright
core_color_a #a4c2e8 -> #C79C89

* I like rounded scrollbars...
open ./gtk-3.0/gtk-widgets.css
find 'scrollbar slider' around line #2370
change parameter 'border-radius: 0;' -> 'border-radius: 20;'

Cheers!

EOF
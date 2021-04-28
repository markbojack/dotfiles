# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html


# NOTES
# e         spawn nvim
# m         quickmark save (not recommended bc it breaks link)
# M         spawn mpv
# pd        download prompt
# w         session-save
# yi        download image
# yo        yank inline (pretty site url/title)
# Y         spawn youtube-dl

# MOAR https://www.shortcutfoo.com/app/dojos/qutebrowser/cheatsheet
# ;b          open in background tab
# ;f          open in foreground tab

# OPEN URL
# pp          Open URL from clipboard
# pP          Open URL from selection
# Pp          Open URL from clipboard in new tab
# PP          Open URL from selection in new tab
# wp          Open URL from clipboard in new window
# wP          Open URL from selection in new window

# NAV
# [[          Click "previous"-link on page
# ]]          Click "next"-link on page
# {{          Click "preious"-link on page in new tab
# }}          Click "next"-link on page in new tab

# MISC
# Ss          :set
# gd          Download page
# ad          Cancel download
# Ctrl+s      stop loading tab or <NUM> tab

# TABS
# Ctrl+p      pin tab (tabs not persistent!)
# <NUM>gm     move tab to <NUMBER> position
# gC          clone tab
# co          close all tabs but current
# <NUM>T      move to <NUM> tab
# <NUM>J,K    move <NUM> tabs forward/back
# th          restore previously closed tab

# HOMEPAGE
# <Space>     search google (can configure in homepage.html)


# https://gist.github.com/Gavinok/f9c310a66576dc00329dd7bef2b122a1
# qute-pass for password manangement (if you care)
import subprocess
import os
from qutebrowser.api import interceptor

"""
qutebrowser settings for video
for more settings check out
https://qutebrowser.org/doc/help/settings.html
"""

# ================== Youtube Add Blocking ======================= {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
    ):
        info.block()


interceptor.register(filter_yt)
# }}}

# Moar ad blocking
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt", 
    "https://easylist.to/easylist/easyprivacy.txt"]

# default zoom
# zoom.levels (Current: ["25%", "33%", "50%", "67%", "75%", "90%", "100%", "110%", "125%", "150%", "175%", "200%",...)  
c.zoom.default = "75%"

## The page(s) to open at the start.
c.url.start_pages = 'file:///home/mark/p-dot-script/qutebrowser/html/homepage.html'

# Setting default page for when opening new tabs or new windows with
# commands like :open -t and :open -w .
c.url.default_page = 'file:///home/mark/p-dot-script/qutebrowser/html/homepage.html'

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()
# Or uncomment this line to load settings from config.py
config.load_autoconfig(False)

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}

# Setting dark mode
config.set("colors.webpage.darkmode.enabled", True)

# Hide statusbar/tabs by default
c.statusbar.show = "never"
#c.tabs.show = "never"
#config.set("statusbar.show", "never")
#config.set("tabs.show", "never")

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', True, 'https://www.reddit.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.notifications.enabled', True, 'https://www.youtube.com')

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/Downloads'

# When to show the tab bar.
# Type: String
# Valid values:
#   - always: Always show the tab bar.
#   - never: Always hide the tab bar.
#   - multiple: Hide the tab bar if only one tab is open.
#   - switching: Show the tab bar when switching tabs.
#c.tabs.show = 'always'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`).  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'goog': 'https://www.google.com/search?q={}', 'yt': 'https://www.youtube.com/results?search_query={}'}

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = ['#9cc4ff', 'white', 'white']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#1c1f24'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#232429'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#e1acff'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #000000, stop:1 #232429)'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#3f4147'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#3f4147'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#282c34'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#ecbe7b'

# Foreground color of the matched text in the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.match.fg = '#c678dd'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#c678dd'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = 'white'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = '#282c34'

# Background color for downloads with errors.
# Type: QtColor
c.colors.downloads.error.bg = '#ff6c6b'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#282c34'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#98be65'

# Background color of an info message.
# Type: QssColor
c.colors.messages.info.bg = '#282c34'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#282c34'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = 'white'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#497920'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#34426f'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#282c34'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = 'yellow'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#1c1f34'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#282c34'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#282c34'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#595959'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#595959'

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = 'seagreen'

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = 'darkseagreen'

# Background color of pinned selected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.odd.bg = '#282c34'

# Background color of pinned selected even tabs.
# Type: QtColor
c.colors.tabs.pinned.selected.even.bg = '#282c34'

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = '"Roboto Mono Nerd Font"'

# Default font size to use. Whenever "default_size" is used in a font
# setting, it's replaced with the size listed here. Valid values are
# either a float value with a "pt" suffix, or an integer value with a
# "px" suffix.
# Type: String
c.fonts.default_size = '8pt'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '8pt "Roboto Mono Nerd Font"'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = '8pt "Roboto Mono Nerd Font"'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'default_size sans-serif'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '8pt "Roboto Mono Nerd Font"'

# Bindings to use dmenu rather than qutebrowser's builtin search.
config.bind('o', 'spawn --userscript dmenu-open')
config.bind('O', 'spawn --userscript dmenu-open -t')

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('Y', 'hint links spawn alacritty -e youtube-dl {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')

config.bind('yo', 'yank inline [[{url}]][[{title}]]')
config.bind(',ss', 'session-save default')
config.bind(',sl', 'session-load default')
config.bind('ZZ', 'quit --save')

# hint images download; hint images yank
# cd to remove downloadbar; :download to see other options
config.bind('yi', 'hint images download')
# prompt download
config.bind('pd', 'config-cycle downloads.location.prompt True False')
# open stuff in nvim
config.bind('e', 'hint links spawn alacritty -e nvim {hint-url}')

# Redline insert mode like BASH
config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
#config.bind("<Ctrl-x><Ctrl-e>", "open-editor", "insert")


# Bindings for cycling through CSS stylesheets from Solarized Everything CSS:
# https://github.com/alphapapa/solarized-everything-css
#config.bind(',ap', 'config-cycle content.user_stylesheets ~/solarized-everything-css/css/apprentice/apprentice-all-sites.css ""')
#config.bind(',dr', 'config-cycle content.user_stylesheets ~/solarized-everything-css/css/darculized/darculized-all-sites.css ""')
#config.bind(',gr', 'config-cycle content.user_stylesheets ~/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css ""')
#config.bind(',sd', 'config-cycle content.user_stylesheets ~/solarized-everything-css/css/solarized-dark/solarized-dark-all-sites.css ""')
#config.bind(',sl', 'config-cycle content.user_stylesheets ~/solarized-everything-css/css/solarized-light/solarized-light-all-sites.css ""')

# some rando's config.py ======================================================================
# nah actually he's cool
# https://gist.github.com/Ape/d0c48b3f7ec9c8efaecf48eaa1e75d0d
#import setproctitle
#setproctitle.setproctitle("qutebrowser")
#
## Bindings
#config.bind("gi", "hint inputs")
#config.bind("<f12>", "inspector")
#
#config.unbind("+")
#config.unbind("-")
#config.unbind("=")
#config.bind("z+", "zoom-in")
#config.bind("z-", "zoom-out")
#config.bind("zz", "zoom")
#
#config.unbind("O")
#config.unbind("T")
#config.unbind("th")
#config.unbind("tl")
#config.bind("O", "set-cmd-text :open {url:pretty}")
#config.bind("T", "set-cmd-text :open -t {url:pretty}")
#config.bind("t", "set-cmd-text -s :open -t")
#
#config.unbind("<ctrl+tab>")
#config.bind("<ctrl+tab>", "tab-next")
#config.bind("<ctrl+shift+tab>", "tab-prev")
#
#config.unbind("ZQ")
#config.unbind("ZZ")
#config.unbind("<ctrl+q>")
#config.bind("<ctrl+q>", "wq")
#
## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
#c.aliases = {
    #"w": "session-save",
    #"wq": "quit --save",
    #"mpv": "spawn -d mpv --force-window=immediate {url}",
    #"nicehash": "spawn --userscript nicehash",
    #"pass": "spawn -d pass -c",
#}
#
## Always restore open sites when qutebrowser is reopened.
#c.auto_save.session = True
#
## Foreground color of the URL in the statusbar on successful load
## (https).
#c.colors.statusbar.url.success.https.fg = "white"
#
## Background color of unselected tabs.
#c.colors.tabs.even.bg = "silver"
#c.colors.tabs.odd.bg = "gainsboro"
#
## Foreground color of unselected tabs.
#c.colors.tabs.even.fg = "#666666"
#c.colors.tabs.odd.fg = c.colors.tabs.even.fg
#
## The height of the completion, in px or as percentage of the window.
#c.completion.height = "20%"
#
## Move on to the next part when there's only one possible completion
## left.
#c.completion.quick = False
#
## When to show the autocompletion window.
## Valid values:
##   - always: Whenever a completion is available.
##   - auto: Whenever a completion is requested.
##   - never: Never.
#c.completion.show = "auto"
#
## Whether quitting the application requires a confirmation.
## Valid values:
##   - always: Always show a confirmation.
##   - multiple-tabs: Show a confirmation if multiple tabs are opened.
##   - downloads: Show a confirmation if downloads are running
##   - never: Never show a confirmation.
#c.confirm_quit = ["downloads"]
#
## Value to send in the `Accept-Language` header.
#c.content.headers.accept_language = "en-US,en;q=0.8,fi;q=0.6"
#
## The proxy to use. In addition to the listed values, you can use a
## `socks://...` or `http://...` URL.
## Valid values:
##   - system: Use the system wide proxy.
##   - none: Don"t use any proxy
#c.content.proxy = "none"
#
## Validate SSL handshakes.
## Valid values:
##   - true
##   - false
##   - ask
#c.content.ssl_strict = True
#
## A list of user stylesheet filenames to use.
#c.content.user_stylesheets = "user.css"
#
## Prompt the user for the download location. If set to false,
## `downloads.location.directory` will be used.
c.downloads.location.prompt = False

## The editor (and arguments) to use for the `open-editor` command. `{}`
## gets replaced by the filename of the file to be edited.
c.editor.command = ["alacritty", "-e", "nvim '{}'"]

#monospace = "8px 'Bok MonteCarlo'"
#
## Font used in the completion categories.
#c.fonts.completion.category = f"bold {monospace}"
#
## Font used in the completion widget.
#c.fonts.completion.entry = monospace
#
## Font used for the debugging console.
#c.fonts.debug_console = monospace
#
## Font used for the downloadbar.
#c.fonts.downloads = monospace
#
## Font used in the keyhint widget.
#c.fonts.keyhint = monospace
#
## Font used for error messages.
#c.fonts.messages.error = monospace
#
## Font used for info messages.
#c.fonts.messages.info = monospace
#
## Font used for warning messages.
#c.fonts.messages.warning = monospace
#
## Font used for prompts.
#c.fonts.prompts = monospace
#
## Font used in the statusbar.
#c.fonts.statusbar = monospace
#
## Font used in the tab bar.
#c.fonts.tabs = monospace
#
## Font used for the hints.
#c.fonts.hints = "bold 13px 'DejaVu Sans Mono'"
#
## Chars used for hint strings.
#c.hints.chars = "asdfghjklie"
#
## Leave insert mode if a non-editable element is clicked.
#c.input.insert_mode.auto_leave = True
#
## Automatically enter insert mode if an editable element is focused
## after loading the page.
#c.input.insert_mode.auto_load = True
#
## Show a scrollbar.
c.scrolling.bar = "never"
#
## Enable smooth scrolling for web pages. Note smooth scrolling does not
## work with the `:scroll-px` command.
#c.scrolling.smooth = False
#
## Open new tabs (middleclick/ctrl+click) in the background.
#c.tabs.background = True
#
## Behavior when the last tab is closed.
## Valid values:
##   - ignore: Don't do anything.
##   - blank: Load a blank page.
##   - startpage: Load the start page.
##   - default-page: Load the default page.
##   - close: Close the window.
#c.tabs.last_close = "close"
#
## Padding around text for tabs
#c.tabs.padding = {
    #"left": 5,
    #"right": 5,
    #"top": 0,
    #"bottom": 1,
#}
#
## Which tab to select when the focused tab is removed.
## Valid values:
##   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
##   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
##   - last-used: Select the previously selected tab.
#c.tabs.select_on_remove = "prev"
#
## Width of the progress indicator (0 to disable).
#c.tabs.width.indicator = 0
#
#
## The format to use for the window title. The following placeholders are
## defined:
##   * `{perc}`: The percentage as a string like `[10%]`.
##   * `{perc_raw}`: The raw percentage, e.g. `10`
##   * `{title}`: The title of the current web page
##   * `{title_sep}`: The string ` - ` if a title is set, empty otherwise.
##   * `{id}`: The internal window ID of this window.
##   * `{scroll_pos}`: The page scroll position.
##   * `{host}`: The host of the current web page.
##   * `{backend}`: Either ''webkit'' or ''webengine''
##   * `{private}` : Indicates when private mode is enabled.
#c.window.title_format = "{private}{perc}{title}{title_sep}qutebrowser"
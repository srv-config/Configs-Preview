LuaAPI Core + LuaUI Extension: read me first
============================================

Documentation
-------------
Full documentation (setup, API reference, callbacks, Lua UI, protocol and examples)
is on the wiki. Read it in order the first time; each page builds on the previous one.

  https://github.com/srv-config/Configs-Preview/wiki

The exact wiki commit this package was built against is noted in Documentation.txt.

Tools
-----
Two tools help you build and ship Lua UI. Download them from the IGCN store:

  BitmapSlicer      slice UI atlases into named cuts, export Lua / JSON / C++ / PNG
                    https://www.igcn.mu/files/file/167-bitmap-slicer/

  IGC File Encrypt  encrypt your client Lua (and XML) scripts to .usc for release
                    https://www.igcn.mu/files/file/157-igc-file-encrypt/

Client config.ini (developer settings)
--------------------------------------
Optional settings for the game client's config.ini. For developers only.
Do NOT ship them to players; add them only to a developer's client when needed.

[Lua]
; 1 disables the in-client Lua debug console (dev mode only)
DisableDebugConsole = 0

DisableDebugConsole
  0  (default) : the Lua debug console is available
  1            : the console is suppressed

The debug console only opens in dev mode (an account the server has granted Lua dev
mode). This switch lets such a developer turn the console off on their own machine
without giving up dev mode. On a normal player client the console never opens, so the
setting has no effect there.

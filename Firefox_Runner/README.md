LISP as a Firefox Runner
=======
Should be similar for other Browsers
-------
 
AutoLISP can be used as a harness to launch a number of programs in a syntax similar to other shell programs, complete with command line arguements.
The potential use-cases are limited only by one's own imagination.
Naturally, this means we can Rick-Roll using AutoCAD; with some caveats...

#### Preparatory Work
Whether or not this works is largely gated by the Browser settings of the target.
By default Firefox has AutoPlay disabled for security purposes, it can be adjusted on a per domain basis, and Youtube is, in theory, a 'safe-enough' domain to have AutoPlay enabled for~
To adjust AutoPlay settings for a specific site on Firefox:
- Select "Tools" on the Menu Bar
  --If you don't see the Menu-Bar it can be toggled on by Right-Clicking the top of the screen, just left of the minimize button works well (not on a Tab) 
- Select "Page Info"
- Select the "Permissions" tab
  -- You should see "Permissions for: <topLevelDomainYouEntered_PageInfo_From.com>"
  -- If that's <"youtube.com"> great! If it's not, be wary
- A few items down should be Autoplay, switch it from "Use Default" to "Allow Audio & Video"
- You *should* be good. Close "Page Info" and disable the Menu-Bar if you had to Enable it to get this far, C.Y.A.

#### Viewing all Autoplay Overrides for FFox
Want to view and manage all sites which have different permissions?
- 'Hamburger Menu Button' >
-  Settings >
-  Privacy & Security >
- (Scroll Down to "Permissions")
- Autoplay >  <Settings>
From here you can set your Default Permission for all webssites
& view/manage your exceptions list.
However, this doesn't seem to offer the ability to append to those Exceptions; probably a safety concern.

#### The Code
Will be appended soon... probably as a .lsp file, hence the subDirectory for this readme..

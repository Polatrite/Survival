/*

  -- Introduction --

The goal of this library is to provide simple and flexible
keyboard input handling that lets the developer write code
to manage how keyboard input is processed instead of having
to define macros in a .dmf file. The library provides
features to detect keyboard input, remember which keys are
being held, lock/unlock user input, and redirect keyboard
events to different objects.


  -- Running Demos --

To run a demo, pick a demo folder (ex: simple-demo) and
include all of the files in the folder. Then recompile and
run the library to see the demo.


  -- Version History --

Version 6 (posted 07-13-2012)
 * Added support for the numpad with numlock on. These keys have different
   macros but they're converted to the symbols. For example, the numpad4 macro
   is translated to "4" and the "multiply" macro is translated to "*".
 * Added the client.translate_numpad_to_numbers var which is 1 by default and
   can be used to enable or disable this new behavior.
 * Fixed a bug with the Click() proc. For some reason I had it call ..() twice so
   that projects using this library would often have Click() events fire twice.

Version 5 (posted 05-12-2012)
 * Added the client.use_numpad var which can be 0 or 1. If it's 0, it converts
   the "northeast" and "southeast" keys to "page up" and "page down" and the
   northwest and southwest keys to "home" and "end". If it's 1, the names are
   left alone. Its value is 1 by default.
 * Added "insert" to the EXTENDED set of keys.
 * Added a call to ..() in the library's client.Click proc, this way the atom's
   Click proc will still fire no matter what the focus is set to.
 * Made the library use the Forum_account.Text library instead of including its
   own implementation of the split() proc.

Version 4 (posted 02-29-2012)
 * Changed the way macros are defined, again. You can still use the old method
   of setting client/keys to a list of keys to be macroed. You can also use some
   new constants that define groups of keys:
    - ARROWS: the four arrow keys
    - LETTERS: a - z
    - NUMBERS: 0 - 9
    - NUMPAD: the 8 directional keys and center
    - EXTENDED: space bar, shift, ctrl, alt, escape, return, tab, back, delete
    - PUNCTUATION: tilde, plus, minus, brackets, slashes, semicolon, apostrophe, comma, period
    - FUNCTION: F1 - F12
    - ALL_KEYS: The combination of all these constants
   For example, you can set client/keys = LETTERS to only macro the letter keys.
 * Added default.dm which contains some code that had been in keyboard.dm. This
   contains the default behavior for a client's key_up/down/repeat procs.
 * Added support for macroing certain symbols. Previously, the equals sign and
   other symbols couldn't be macroed. Now they should all work.

Version 3 (posted 02-20-2012)
 * Changed the way macros are defined. Macros are now defined for every key
   in the client's keys list. If you want to change what macros are defined
   you can simply override the default value for client/keys at compile time.
   This now lets you control what keys are macroed from outside the library.
 * Added the keys-demo to show how to use the keys list to control what macros
   are defined.

Version 2 (posted 12-03-2011)
 * Added the datum/click() proc which can be used to handle click events.
   It is passed two arguments: the object that was clicked on and the
   client that did the clicking.
 * Made the client/Click() proc call the click() proc for the object that
   client.focus refers to (by defaut, the client).
 * Added the NO_KEY_REPEAT and NO_CLICK flags which can be used to disable
   parts of the library. If you don't need to handle key repeat events in
   your game, you can put #define NO_KEY_REPEAT to disable the macros for
   these events. Keep in mind that with this flag defined, BYOND's default
   key repeat macros still exist (which call client/East(), etc.).
 * Changed the order of events in the library's client/New() proc so that
   focus is set (to the client) before ..() is called (which triggers
   Login() to be called). This means that if you set client.focus inside
   mob/Login(), client/New() won't revert focus back to the client.
 * Added support for some additional keys: backspace, delete, maybe some other
   ones too.

Version 1 (posted 12-02-2011)
 * Provides the key_up, key_down, and key_repeat procs for all objects
   which are passed the key and client when a keyboard event occurs.
 * Provides the client.focus var, which is a reference to an object that
   will receive keyboard events. When a key press, release, or repeat
   event occurs, client.focus.key_up/down/repeat will be called. By
   default client.focus is the client itself.
 * Provides a default implementation of the client's key_down and key_repeat
   procs which call the client's North, South, Center, etc. procs.
 * Provides the client.keys var which is an associative list which
   stores the state of each key - client.keys["a"] is 1 if the A key is
   being held and 0 if it's not held.
 * Provides the client.lock_input, unlock_input, and clear_input procs.
   The first two are used to lock/unlock input - while input is locked
   the key_up/down/repeat procs will not be called (but the keys list
   will still be updated to reflect key releases only). The clear_input
   proc clears the keys list (sets all values to zero).
 * Provides five demos:
    - focus-demo: Shows the effect of changing client.focus.
    - icon-selection-demo: Shows how to use client.focus to create an
      icon selection feature that uses keyboard events to change your icon.
    - mob-demo: Shows how to control other mobs by changing client.focus.
    - movement-demo: Shows how to create a different movement system by
      using the client.keys list.
    - simple-demo: Shows how to use the mob's key_down proc to cause
      actions to occur when certain keys are pressed.


*/
# Instructions

The instructions we will be following for building the retro game console can be found here:

[Lifehacker - How to Build a Raspberry Pi Retro Game Console for $35](http://lifehacker.com/how-to-turn-your-raspberry-pi-into-a-retro-game-console-498561192)

RetroPie comes with a couple of games out the box. Beyond this, ROMs can be found via Google (for example, http://www.emuparadise.me/). Many are illegal however and we cannot condone downloading them, however if you wish to do so in your own home that is your decision.


## Transferring ROMs
Transferring ROMs is done via SFTP or a network share. We recommend FileZilla for this.

* [Download FileZilla](https://filezilla-project.org/)
* Turn on your Raspberry Pi and go through any initial controller setup it asks you to do
* Navigate to the RetroPie menu option
* Go to "Show IP Address" and note down the 2nd inet address (It will be something like 192.168.1.92)
* In the FileZilla site manager, use the following settings:
  * The IP address above
  * Protocol = SFTP
  * Logon Type = Normal
  * Username = pi
  * Password = raspberry
* Click "Connect" and accept the warning that comes up about keys
* Once you are connected, browse to the `/home/pi/RetroPie/roms`
* This is where you can upload ROMs. After uploading ROMs, you will need to press "Start" in retropie and select Quit -> Quit Emulation station. This will restart the system and your new ROMs should show up

## Legal sources of ROMS
Not all ROMs are illegal! Here is a list of legal places where you can download some:
* http://www.mamedev.org/roms/
* http://scummvm.org/games/

There are likely to be others if you search for "public domain roms" and other such search terms.

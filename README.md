# MuntVSTi Editor (MT32edit4v)
MT-32 sysex editor/programmer companion DLL for MuntVSTi 3.0 by Falcosoft. You can download MuntVSTi from here:

https://falcosoft.hu/softwares.html#munt_vsti

<img width="811" height="643" alt="Timbre Editor (Synth 1)" src="https://github.com/user-attachments/assets/1050204c-8f2b-4765-badc-eaf69a46ba0b" />
<img width="811" height="643" alt="Timbre Editor (Synth 2)" src="https://github.com/user-attachments/assets/fb05cbb3-11c4-4bb6-b5d0-334849111744" />
<img width="811" height="643" alt="Part Mixer" src="https://github.com/user-attachments/assets/a96aeeda-63a3-41e8-b836-7697155342f0" />
<img width="811" height="643" alt="Part Mixer (Advanced Controls, Synth 2)" src="https://github.com/user-attachments/assets/5956207a-6a6f-46f2-8a51-4b2eb3895c55" />
<img width="811" height="643" alt="System Settings" src="https://github.com/user-attachments/assets/49ad3fcb-57ab-4f31-b8cd-5d78d5a1cbfb" />  

MT32edit4v functions as a companion DLL for MuntVSTi 3.0 by Falcosoft, which is a VSTi virtual synth instrument that includes the MUNT core for MT-32 emulation with several options. However, sorely missing is an actual sound editor/programmer for musicians and producers. There does exist wonderful timbre editors and MT-32 system programmers that are perfectly usable, even supporting modern Windows (namely, the incredible [MT-32 Editor by sfryers](https://www.vogons.org/viewtopic.php?t=93609) written in .NET), but it's high time that we had a fully virtual tool for DAWs with the sensibilities and intuitive apporach of modern virtual instruments. Also, there are very few DAWs that even allow sysex messages to be sent to VST plugins (only Reaper and Cubase are known to work) which makes directly programming MuntVSTi inside a DAW environment very hard. If MuntVSTi detects the MT32edit4v DLL in its directory, it will expose a button to activate the editor automatically:  

<img width="455" height="411" alt="Launching MT32edit4v" src="https://github.com/user-attachments/assets/a1bdec3c-ec95-4c47-895d-043999664d9b" />

* MuntVSTi allows its memory to be accessed directly by MT32edit4v. This is crucial to keep the editor in sync with MuntVSTi as MUNT itself does not have a MIDI output in any current implementation and does not send sysex data externally as a hardware MT-32 does. It also does not respond at all to Data Request sysex messages.
* MuntVSTi allows its memory to be written to by accepting sysex MIDI message commands (like a hardware MT-32 would), which is how MT32edit4v operates. Since MT32edit4v is a child in-process library with MuntVSTi acting as the host, the communication is direct and bypasses the need for any external programs to facilitate sending the sysex messages (which only few DAWs can do).
* MT32edit4v will also have access to *BOTH* of MuntVSTi's emulated synths separately in real-time at all times. It's like having two MT-32's!
* Previously, unless you had a real hardware MT-32 or the ability to reverse engineer game files, there was no way to capture the custom instrument banks of computer games that supported the MT-32 (since MUNT does not respond to Data Request sysex messages and has no MIDI output). Now with utilizing MuntVSTi with DOSBox or PC emulators/virtual machines to play those games, you will easily be able access their custom banks and back them up as SysEx files via MT32edit4v without needing a real MT-32!  

Currently, as you can see, MT32edit4v utilizes the standard Windows GUI control interface aesthetic. This will be replaced with graphics to make it more appealing at some point in the future. Right now the focus is on function and intuitive design.

# Milestones/Planned Features
- Full timbre editor for each melodic Part (Part Temp Area) - **COMPLETE**
- Patch Mixer view for controlling each Part's Patch data (Patch Temp Area) - **COMPLETE**
- Reverb & Master Tuning controls (System Area) - **COMPLETE**
- Full access to each synth's custom timbre bank (64 timbres x 2 synths = 128 custom timbres) - **COMPLETE *(basic operation)***
- Import/Export SYX files for timbre settings, patch settings, or synth-wide state backup and for use with a real hardware MT-32 (if you have one) - ***IN PROGRESS (import any Sysex, export individual Timbres only)***
- Rhythm Setup editor for the rhythm/percussion Part (Part 9)
- Prettier graphics overhaul for entire interface

# Wishlist
- Implement a way to change each synth's Unit ID # (not possible via SysEx). This is not a high priority as it is only pertinent to replicating EVERY feature of the MT-32 so that it can function as a real one would in certain hardware synth setups. SysEx messages can target individual MT-32's via a unique unit ID # that is only possible to set via the front panel controls. MUNT currently offers no way to do this. This is admittedly a very niche use case and there's no reason to do this in modern setups, and certainly not for gaming. <br>
- Implement a way to replicate the MT-32's partial overflow mode. Another function only accessible via the front panel controls. This isn't necessary at all as MuntVSTi not only comes with 2 synths accessible out of the box (doubling the available polyphony of a hardware MT-32), but also custom controls to increase the MT-32's partial polyphony above the "hardwired" 32 limit for *both* emulated synths. So you can very well have the equivalent of an "MT-128" without even needing this feature.
- Add support for utilizing the D-110 PCM samples ROM. The D-110 and MT-32 a very similar synth-wise as they are both LA synthesizers, but the D-110 has a very different PCM sample set. It would be nice to have the option if one have the ROM.

# Building
You need Delphi XE+ to build the project (Delphi XE8 and the newest Community edition were tested). The free community edition of Delphi can be downloaded from here:

https://www.embarcadero.com/products/delphi/starter/free-download

First you should install the required design time components with the help of Mt32Edit4v_Components.dpk. Then you should open the project file (MT32edit4v.dproj) and build the project.
Depending on the Delphi version some warnings related to unknown properties can be shown by the IDE when the editor form is opened. 
Usually these warnings can be safely ignored. 

# Special Thanks
Very special thanks and high praise to [Falcosoft](https://github.com/falcosoft) for his collaboration in making this editor happen. From adding the connectivity for MT32edit4v to MuntVSTi and for his many tips, guidances, patches, and words of wisdom as MT32edit4v continues development!

# FAQ
**Can this editor be used in a DAW (Digital Audio Workstation) for the purpose of producing music?**<br>
*Yes! This is its primary purpose! :)
<br><br>
**Can this editor be used to edit instruments and sound from computer games that support the MT-32 as a music device?**<br>
*Yes it can! Provided you've set your emulator/virtual machine/etc that is running the game to point to MuntVSTi as its output MIDI device. This can be done using Falcosoft's VST MIDI Driver and setting DOSBox, ScummVM, or whatever else to output to it as its MIDI device. Or even with loopback MIDI devices (such as loopMIDI, LoopBe, or Win11's new Windows MIDI Service which has built-in loopback ports) in conjunction with Falcosoft's MIDI Player which can use a VSTi as its output MIDI device. You can then set MIDI Player's MIDI Input setting set to the same loopback MIDI driver.*<br>
*In fact, currently this is the only way to be able to do this WITHOUT owning a real hardware MT-32 as all implementations of MUNT (other than MuntVSTi) do not have the capability to send sysex data out or respond to incoming Data Request sysex messages.*
<br><br>
**Is this a standalone editor?**<br>
*No, it can only be run as a child in-process library of MuntVSTi.*
<br><br>
**Can this be used with a real hardware MT-32, MT32-Pi device, or other implementation of MUNT?**<br>
*No, currently it's designed specifically to be used only with MuntVSTi (3.0+).*

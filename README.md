# MT32edit4v
MT-32 sysex editor/programmer companion DLL for MuntVSTi by Falcosoft. You can download MuntVSTi from here:

https://falcosoft.hu/softwares.html#munt_vsti

<img width="813" height="645" alt="MT32edit4v_timbre" src="https://github.com/user-attachments/assets/b595caaf-dfb5-44dc-b2fb-ab4f884303ee" />
<img width="813" height="645" alt="MT32edit4v_mixerbasic" src="https://github.com/user-attachments/assets/0c5e9c22-b37b-4d4b-ba23-f12fb62c9ae9" />
<img width="813" height="645" alt="MT32edit4v_mixeradv" src="https://github.com/user-attachments/assets/8e32f2b9-d8db-4ecb-9fc3-cac4d107f3cd" />

MT32edit4v functions as a companion DLL for MuntVSTi by Falcosoft, which is a VSTi virtual synth instrument that includes the MUNT core for MT-32 emulation with several options. However, sorely missing is an actual sound editor/programmer for musicians and producers. There does exist wonderful timbre editors and MT-32 system programmers that are perfectly usable, even supporting modern Windows (namely, the incredible [MT-32 Editor by sfryers](https://www.vogons.org/viewtopic.php?t=93609) written in .NET), but it's high time that we had a fully virtual tool for DAWs with the sensibilities and intuitive apporach of modern virtual instruments. Also, there are very few DAWs that even allow sysex messages to be sent to VST plugins (only Reaper and Cubase are known to work) which makes directly programming MuntVSTi inside a DAW environment very hard. If MuntVSTi detects the MT32edit4v DLL in its directory, it will expose a button to activate the editor automatically:

<img width="455" height="411" alt="MT32edit4v_muntvsti" src="https://github.com/user-attachments/assets/98148271-dfba-440e-9591-4e1628b98514" />

- MuntVSTi allows its memory to be accessed directly by MT32edit4v. This is crucial to keep the editor in sync with MuntVSTi as MUNT itself does not have a MIDI output in any current implementation and does not send sysex data externally as a hardware MT-32 does. It also does not respond at all to Data Request sysex messages.
- MuntVSTi allows its memory to be written to by accepting sysex MIDI message commands (like a hardware MT-32 would), which is how MT32edit4v operates. Since MT32edit4v is a child process with MuntVSTi acting as the host, the communication is direct and bypasses the need for any external programs to facilitate sending the sysex messages (which only few DAWs can do).
- MT32edit4v will also have access to *BOTH* of MuntVSTi's emulated synths separately in real-time at all times. It's like having two MT-32's!
- Previously, unless you had a real hardware MT-32 or the ability to reverse engineer game files, there was no way to capture the custom instrument banks of computer games that supported the MT-32 (since MUNT does not respond to Data Request sysex messages and has no MIDI output). Now with utilizing MuntVSTi with DOSBox or PC emulators/virtual machines to play those games, you will easily be able access their custom banks and back them up as SysEx files via MT32edit4v withouot needing a real MT-32!

Currently, as you can see, MT32edit4v utilizes the standard Windows GUI control interface aesthetic. This will be replaced with graphics to make it more appealing at some point in the future. Right now the focus is on function and intuitive design.

# Planned Features
- Full timbre editor for each melodic Part (Part Temp Area) - **COMPLETE**
- "Mixer" view editor for each Part's Patch data (Patch Temp Area) - *IN PROGRESS*
- Rhythm Setup editor for the rhythm/percussion Part (Part 9)
- Reverb & Master Tuning controls
- Full access to each synth's custom timbre bank (64 timbres * 2 synths = 128 custom timbres)
- Import/Export SYX files for timbre settings, patch settings, or synth-wide state backup and for use with a real hardware MT-32 (if you have one)

# Wishlist
- Implement a way to change each synth's Unit ID # (not possible via SysEx). This is not a high priority as it is only pertinent to replicating EVERY feature of the MT-32 so that it can function as a real one would in certain hardware synth setups. SysEx messages can target individual MT-32's via a unique unit ID # that is only possible to set via the front panel controls. MUNT currently offers no way to do this. This is admittedly a very niche use case and there's no reason to do this in modern setups, and certainly not for gaming.
- Implement a way to replicate the MT-32's partial overflow mode. Another function only accessible via the front panel controls. This isn't necessary at all as MuntVSTi not only comes with 2 synths accessible out of the box (doubling the available polyphony of a hardware MT-32), but also custom controls to increase the MT-32's partial polyphony above the "hardwired" 32 limit for *both* emulated synths. So you can very well have the equivalent of an MT-128 without even needing this feature.

# Special Thanks
Very special thanks and high praise to [Falcosoft](https://github.com/falcosoft) for his collaboration in making this editor happen. From adding the connectivity for MT32edit4v to MuntVSTi and for his many tips, guidances, patches, and words of wisdom as MT32edit4v continues development!

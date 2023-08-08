# Disable_Zram🍉
This module Nukes*/Disable zram on boot + swap memory for better performance 

## Why this module 
For those who are not into this, taken from RAM Truth:

Using swap increases your CPU usage, especially with zram where constant compression and decompression is going on (like using zip files on your PC), and is rarely beneficial on modern devices. Despite this, it's made a resurgence in the market.

Swap - A virtual memory scheme to increase your apparent total RAM. Unless you installed a modification to put this in storage, if you have swap you probably have a compressed block of RAM (called zram) acting as a virtual hard disk for this.

Is it reasonable to use RAM for purposes other than apps and the operating system? Does it make sense to have the operating system constantly pause while it shuffles and reorganizes your RAM? Is it reasonable for you to wait while various pieces of RAM are zipped and unzipped to support this scheme? Is it reasonable to do all of that incorrectly because you can't get enough swap space to properly support multitasking by design?

No. Yes, it does not.

Since Swap Torpedo is dead anyway now the answer is Disable_Zram⚡

It makes no sense to use 4096 MB of swap with 3.7 GB RAM free!
<table>
  <tr>
    <td>Before</td>
    <td>After</td>
   </tr> 
   <tr>
      <td><img src="https://github.com/Nayemhasan/Disable_Zram/blob/main/pics/before.jpg"></td>
      <td><img src="https://github.com/Nayemhasan/Disable_Zram/blob/main/pics/after.jpg"></td>
  </tr>
</table>

## Dependencies
Use the latest [Magisk](https://magiskmanager.com/) manager

## How to use?
 - flash the latest [released](https://github.com/Nayemhasan/Disable_Zram/releases) .zip with magisk
 - reboot and profit*

## Thank You🍉
 

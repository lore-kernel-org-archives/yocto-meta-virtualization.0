Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.10496.1592194758312333993
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 21:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ub8Bg7ED;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: siddhuvgowda.18695@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id t8so14025738ilm.7
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 14 Jun 2020 21:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=poH3HWPgbiZAon5CG+cjyUO/tqrXNuRR5dBpockQVxs=;
        b=ub8Bg7EDWSsfPYAnZi/fHz+Gr90OJfishs8QzZAf5hGz91OBC+987wpMCFZ79aHDJI
         5vND8vX5SlRhuGP5mnl0mZzkdqN135wqSv3TDp31PQ06EHe9BR6iDjNn2GZtwJzwFZg3
         9nrWqvPskugPSa1h88h1y4b789IhfLm32WDZXfytEp+84Ip7j8dWHk3g5ViArqQ3bwaK
         Cylc763PPONFUXnFyHSJWT+ZBltUwFpqbNdXHizeJrUHTJNgdqL5Cvtf1+etGdLH5USZ
         khm+F+KqZBj9tJ0RakYHsnfzclNKLsY1KFZVPYSdiZjIrgKm3CUWvnEs2jClc2iwXa8U
         Rg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=poH3HWPgbiZAon5CG+cjyUO/tqrXNuRR5dBpockQVxs=;
        b=pXXciLcbRjTQCpq1bqKWpnPbH8zP8tuSTLhdUaCAG1p8qQp3sjHayMXWi0ckEbMu2C
         CadPVnc4Svb4ayfoE+UJZMGk0FTXsywQ4P70n0rRqGN2L4yLDGAbX1te6ddu/nobg8c5
         Gl4u4R2Ai31v2NrHiBTGU/HJ14ZV+SVAh+jAdFLQaqOWHrOfHkmulXjix3lpUbYPgGn4
         66TG5qP9nt0H1GuncyszkgtKGlOW1L+p5w/KeinkL4ui2MAqQLaOiLaUbiKx3vCY3lFe
         lJ7KHjuF2QZ19BGjh6eSGyKR2mXwhqOlvPhELvZWSQCKbhtxgB/G8cJEQfJjxeBD8bN0
         uQ9w==
X-Gm-Message-State: AOAM5306c9TNFHqdJiHl9OA/1knBhPPC1H2M2eAUEws/2LDFZuWtHeqz
	nGVrLDnlEYIb/QIuyDLr/dBwEHKxnQaYgOSYits=
X-Google-Smtp-Source: ABdhPJzMgvm/gFsC19EufUzcdsiUyE//NVqOqz3ZGNwfOuuJxlQ2+dolgnaGcC0UeHvJmZmayiWJPUhHut4C1KDcrWA=
X-Received: by 2002:a92:cd45:: with SMTP id v5mr7708316ilq.184.1592194757628;
 Sun, 14 Jun 2020 21:19:17 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net>
In-Reply-To: <20200606005839.GR2903@minyard.net>
From: "Siddhartha V" <Siddhuvgowda.18695@gmail.com>
Date: Mon, 15 Jun 2020 09:49:06 +0530
Message-ID: <CAEkELtBDAGsy9kZtAX3WRM5=4SizpOHFK91_2B103id8WHgO-g@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: cminyard@mvista.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	Christopher Clark <christopher.w.clark@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000f1189005a817ba04"

--000000000000f1189005a817ba04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello really sorry for late response,


    Currently I am working with the warrior series of yocto but the
meta-raspberrypi-xen is in th edunfell series of the yocto. So my doubt is
should I do the building task from the beginning? From the past two days
yocto documentation and any website yocto is not loading ( I am getting
this error* "This site can=E2=80=99t be reached. The connection was reset."=
*). So I
am not able to access the documentation.

   Also, as I am having a very short time period, I tried to build the
image using dunfell from the beginning but I am getting the below error,

ERROR: Task (/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes=
-devtools/binutils/binutils-cross_2.34.bb:do_compile)
failed with exit code '1'
WARNING: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0
do_fetch: Failed to fetch URL
git://github.com/raspberrypi/linux.git;branch=3Drpi-4.19.y, attempting
MIRRORS if available
ERROR: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch:
Fetcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset
_PYTHON_SYSCONFIGDATA_NAME; export
DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus,guid=3D5716e1286=
7bf0fe2966f5f465ee359ba";
export SSH_AGENT_PID=3D"1911"; export
SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
PATH=3D"/home/siddhu/Documents/yocto/dunfell/build/tmp/sysroots-uninative/x=
86_64-linux/usr/bin:/home/siddhu/Documents/yocto/dunfell/sources/poky/scrip=
ts:/home/siddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-li=
nux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sy=
sroot-native/usr/bin/arm-poky-linux-gnueabi:/home/siddhu/Documents/yocto/du=
nfell/build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.=
19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot/usr/bin/crossscripts:/home/s=
iddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux-gnueab=
i/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot-nati=
ve/usr/sbin:/home/siddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi=
4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/=
recipe-sysroot-native/usr/bin:/home/siddhu/Documents/yocto/dunfell/build/tm=
p/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTO=
INC+9da67d7329-r0/recipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/d=
unfell/build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4=
.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot-native/bin:/home/siddhu/Doc=
uments/yocto/dunfell/sources/poky/bitbake/bin:/home/siddhu/Documents/yocto/=
dunfell/build/tmp/hosttools";
export HOME=3D"/home/siddhu"; LANG=3DC git -c core.fsyncobjectfiles=3D0
fetch -f --prune --progress git://github.com/raspberrypi/linux.git
refs/*:refs/* failed with exit code 128, output:
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (11/11), done.
fatal: read error: Connection reset by peer1.29 GiB | 340.00 KiB/s
fatal: early EOF
fatal: index-pack failed

ERROR: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch:
Fetcher failure for URL:
'git://github.com/raspberrypi/linux.git;branch=3Drpi-4.19.y'. Unable to
fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/siddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux=
-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/temp/log.do_=
fetch.2431
ERROR: Task (/home/siddhu/Documents/yocto/dunfell/sources/meta-raspberrypi/=
recipes-kernel/linux/linux-raspberrypi_4.19.bb:do_fetch)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1058 tasks of which 1053 didn't need to
be rerun and 4 failed.

Summary: 4 tasks failed:
  virtual:native:/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/rec=
ipes-support/icu/icu_66.1.bb:do_compile
   #/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-support/=
icu/icu_66.1.bb:do_make_icudata
  /home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-devtools/b=
inutils/binutils-cross_2.34.bb:do_compile
  /home/siddhu/Documents/yocto/dunfell/sources/meta-raspberrypi/recipes-ker=
nel/linux/linux-raspberrypi_4.19.bb:do_fetch



May I know what wrong I am doing here, Even when I started this yocto for
the first time I faced the same but luckily it was resolved automatically
after trying multiple times. But I need some suggestions here. Kindly
suggest me what wrong I am doing here.


--
Thanks and Regards.
Siddhartha V.



On Sat, Jun 6, 2020 at 6:28 AM Corey Minyard <cminyard@mvista.com> wrote:

> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
> > On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com>
> wrote:
> > >
> > > On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
> > > > + Corey
> > > >
> > > > On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
> > > > >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
> > > > >> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
> > > > >> > Hello Siddhartha,
> > > > >> >
> > > > >> > I am also interested in running Xen on the Raspberry Pi 4. I
> hope to have time next week to be able to look into it.
> > > > >> >
> > > > >> > Christopher
> > > > >> >
> > > > >> >
> > > > >> >> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
> > > > >> >>
> > > > >> >> Hello dear meta-virtualization team,
> > > > >> >> I am building the xen minimal image using yocto warrior
> ("bitbake xen-image-minimal") by giving the target machine as
> > > > >"raspberrypi4".
> > > > >>
> > > > >> Corey Minyard created a layer for Xen on Raspberry Pi 4 here
> https://github.com/MontaVista-OpenSourceTechnology/meta-
> > > > >raspberrypi-xen
> > > > >>
> > > > >
> > > > >Someone needs to lean on them to get patches submitted to meta-vir=
t.
> > > >
> > > > Corey: you are hereby encouraged to submit patches to
> meta-virtualization.
> > >
> > > Ok.  The layer has the following basic pieces:
> > >
> > > 1 The xen patches for the Pi4, just a few patches.  As the Xen group
> > >   fixes things, I keep adding :).
> > > 2 Hacks for getting the Pi4 kernel config right for xen.  This should
> go
> > >   away if you don't use the kernel from the Pi4 yocto layer, as it
> > >   doesn't work like most kernels in yocto.
> >
> > I should take a look at the configs and see if I can create a fragment
> > or two, but I can take care of that.
>
> That shouldn't be necessary.  The standard fragments work, it's just
> that the Pi kernel does not use them.  So this is really Pi+Xen
> specific, and hopefully they can fix the Pi kernel to use the normal
> fragments in the future.
>
> >
> > > 3 The addition of xen-tools.  This seems somewhat controversial from =
a
> > >   naming point of view, at least.  But all the major distros seem to
> > >   have it, and it does make things easier.  It brings along a boatloa=
d
> > >   of perl recipes.
> > > 4 Something to make bridges easier to manage.  Distros have another
> tool
> > >   to do this (bridge-utils), but that ties into systemd/initd and wou=
ld
> > >   have been rather complex to integrate into yocto.  Plus it requires
> > >   rebooting to change anything.  The one I created is far simpler and
> > >   works just as well, maybe better.
> > > 5 A few Pi-specific hacks for config and u-boot.
> > >
> > > 1 is a no brainer, and 2 shouldn't matter in the future.  I guess the
> > > questionable ones are 3 and 4.
> >
> > Christopher might have a better idea about #3, but if the
> > functionality is useful, I'm all for having it close to the other Xen
> > components.
> >
> > We've put similar things like #4 into the layer before. Witness
> > cgroups-lite and some of the other semi-custom and more lightweight
> > things. But yah, just a judgement call if they may or may not be
> > useful in other scenarios.
>
> I would like to see it go in, as I couldn't find anything to do this,
> and it's really simple.
>
> >
> > #5 does sound like BSP stuff. Is any of it destined for the rpi layers
> > ? Or is it both rpi AND xen specific, so doesn't really make sense
> > there either ?
>
> It's both Pi and Xen specific.  If everything gets put where it should
> be, that would be the only thing left in this layer :).
>
> -corey
>
> >
> > Thanks for the info, most appreciated.
> >
> > Bruce
> >
> > >
> > > -corey
> > >
> > > >
> > > > >Having a layer like that, with fixes missing from meta-virt, makes
> no sense.
> > > > >
> > > > >Bruce
> > > >
> > > > meta-virtualization seems to be using Xen 4.12 at the moment.
> > > >
> > > > Corey's meta-raspberrypi-xen layer uses Xen 4.13. The Xen patches
> are based on Xen 4.13. Between Xen 4.12 and 4.13 there are a few addition=
al
> patches that are required for running on Raspberry Pi 4.
> > > >
> > > > Would you rather uprev meta-virtualization to Xen 4.13, or backport
> the patches and identify additional backports required for running Xen 4.=
12
> on Raspberry Pi 4?
> > > >
> > > > Stew
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000f1189005a817ba04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello really sorry for late response,<div><br></div><div><=
br></div><div>=C2=A0<font face=3D"arial, sans-serif"> =C2=A0 Currently I am=
 working with the warrior series of yocto but the meta-raspberrypi-xen is i=
n th edunfell series of the yocto. So my doubt is should I do the building =
task from the beginning? From the past two days yocto documentation and any=
 website yocto is not loading ( I am getting this error<b> &quot;This site =
can=E2=80=99t be reached. The connection was reset.&quot;</b>). So I am not=
 able to access the documentation.=C2=A0</font></div><div><br></div><div>=
=C2=A0 =C2=A0Also, as I am having a very short time period, I tried to bui=
ld the image using dunfell from the beginning but I am getting the below er=
ror,</div><div><br></div><div><pre style=3D"box-sizing:border-box;font-fami=
ly:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font=
-size:11.9px;margin-top:0px;margin-bottom:16px;padding:16px;overflow:auto;l=
ine-height:1.45;background-color:rgb(246,248,250);border-radius:3px;color:r=
gb(36,41,46)"><code style=3D"box-sizing:border-box;font-family:SFMono-Regul=
ar,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:11.9px;pa=
dding:0px;margin:0px;background:initial;border-radius:3px;word-break:normal=
;border:0px;display:inline;overflow:visible;line-height:inherit">ERROR: Tas=
k (/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-devtools/=
binutils/binutils-cross_2.34.bb:do_compile) failed with exit code &#39;1&#3=
9;
WARNING: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch: F=
ailed to fetch URL git://<a href=3D"http://github.com/raspberrypi/linux.git=
;branch=3Drpi-4.19.y">github.com/raspberrypi/linux.git;branch=3Drpi-4.19.y<=
/a>, attempting MIRRORS if available
ERROR: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch: Fet=
cher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCO=
NFIGDATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/use=
r/1000/bus,guid=3D5716e12867bf0fe2966f5f465ee359ba&quot;; export SSH_AGENT_=
PID=3D&quot;1911&quot;; export SSH_AUTH_SOCK=3D&quot;/run/user/1000/keyring=
/ssh&quot;; export PATH=3D&quot;/home/siddhu/Documents/yocto/dunfell/build/=
tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/siddhu/Documents/yocto/du=
nfell/sources/poky/scripts:/home/siddhu/Documents/yocto/dunfell/build/tmp/w=
ork/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC=
+9da67d7329-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi:/home/s=
iddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux-gnueab=
i/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot/usr/=
bin/crossscripts:/home/siddhu/Documents/yocto/dunfell/build/tmp/work/raspbe=
rrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d732=
9-r0/recipe-sysroot-native/usr/sbin:/home/siddhu/Documents/yocto/dunfell/bu=
ild/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+g=
itAUTOINC+9da67d7329-r0/recipe-sysroot-native/usr/bin:/home/siddhu/Document=
s/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspbe=
rrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot-native/sbin:/home/=
siddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux-gnuea=
bi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot-nat=
ive/bin:/home/siddhu/Documents/yocto/dunfell/sources/poky/bitbake/bin:/home=
/siddhu/Documents/yocto/dunfell/build/tmp/hosttools&quot;; export HOME=3D&q=
uot;/home/siddhu&quot;; LANG=3DC git -c core.fsyncobjectfiles=3D0 fetch -f =
--prune --progress git://<a href=3D"http://github.com/raspberrypi/linux.git=
">github.com/raspberrypi/linux.git</a> refs/*:refs/* failed with exit code =
128, output:
remote: Enumerating objects: 12, done.        
remote: Counting objects: 100% (12/12), done.        
remote: Compressing objects: 100% (11/11), done.        
fatal: read error: Connection reset by peer1.29 GiB | 340.00 KiB/s      
fatal: early EOF
fatal: index-pack failed

ERROR: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch: Fet=
cher failure for URL: &#39;git://<a href=3D"http://github.com/raspberrypi/l=
inux.git;branch=3Drpi-4.19.y">github.com/raspberrypi/linux.git;branch=3Drpi=
-4.19.y</a>&#39;. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/dunfell/=
build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120=
+gitAUTOINC+9da67d7329-r0/temp/log.do_fetch.2431
ERROR: Task (/home/siddhu/Documents/yocto/dunfell/sources/meta-raspberrypi=
/recipes-kernel/linux/linux-raspberrypi_4.19.bb:do_fetch) failed with exit =
code &#39;1&#39;
NOTE: Tasks Summary: Attempted 1058 tasks of which 1053 didn&#39;t need to=
 be rerun and 4 failed.

Summary: 4 tasks failed:
  virtual:native:/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/re=
cipes-support/icu/icu_66.1.bb:do_compile
   #/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-support=
/icu/icu_66.1.bb:do_make_icudata
  /home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-devtools/=
binutils/binutils-cross_2.34.bb:do_compile
  /home/siddhu/Documents/yocto/dunfell/sources/meta-raspberrypi/recipes-ke=
rnel/linux/linux-raspberrypi_4.19.bb:do_fetch</code></pre></div><div><br></=
div><div><br></div><div>May I know what wrong I am doing here, Even when I =
started this yocto for the first time I faced the same but luckily it was r=
esolved automatically after trying multiple times. But I need some suggesti=
ons here. Kindly suggest me what wrong I am doing here.</div><div><br></div=
><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>--</div><div>Thanks a=
nd Regards.</div>Siddhartha V.<div>=C2=A0</div></div></div></div><br></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Sat, Jun 6, 2020 at 6:28 AM Corey Minyard &lt;<a href=3D"mailto:cminyard=
@mvista.com">cminyard@mvista.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Fri, Jun 05, 2020 at 07:53:53PM -0400,=
 Bruce Ashfield wrote:<br>
&gt; On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard &lt;<a href=3D"mailto:cm=
inyard@mvista.com" target=3D"_blank">cminyard@mvista.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wro=
te:<br>
&gt; &gt; &gt; + Corey<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:<br>
&gt; &gt; &gt; &gt;On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote=
:<br>
&gt; &gt; &gt; &gt;&gt; On Thursday, June 4, 2020 5:13 PM, Christopher Cla=
rk wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; Hello Siddhartha,<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; I am also interested in running Xen on the Ra=
spberry Pi 4. I hope to have time next week to be able to look into it.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; Christopher<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; On Jun 4, 2020, at 5:05 AM, Siddhartha V =
wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; Hello dear meta-virtualization team,<br>
&gt; &gt; &gt; &gt;&gt; &gt;&gt; I am building the xen minimal image using=
 yocto warrior (&quot;bitbake xen-image-minimal&quot;) by giving the target=
 machine as<br>
&gt; &gt; &gt; &gt;&quot;raspberrypi4&quot;.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Corey Minyard created a layer for Xen on Raspberry=
 Pi 4 here <a href=3D"https://github.com/MontaVista-OpenSourceTechnology/me=
ta-" rel=3D"noreferrer" target=3D"_blank">https://github.com/MontaVista-Ope=
nSourceTechnology/meta-</a><br>
&gt; &gt; &gt; &gt;raspberrypi-xen<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;Someone needs to lean on them to get patches submitted =
to meta-virt.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Corey: you are hereby encouraged to submit patches to meta-=
virtualization.<br>
&gt; &gt;<br>
&gt; &gt; Ok.=C2=A0 The layer has the following basic pieces:<br>
&gt; &gt;<br>
&gt; &gt; 1 The xen patches for the Pi4, just a few patches.=C2=A0 As the =
Xen group<br>
&gt; &gt;=C2=A0 =C2=A0fixes things, I keep adding :).<br>
&gt; &gt; 2 Hacks for getting the Pi4 kernel config right for xen.=C2=A0 T=
his should go<br>
&gt; &gt;=C2=A0 =C2=A0away if you don&#39;t use the kernel from the Pi4 yo=
cto layer, as it<br>
&gt; &gt;=C2=A0 =C2=A0doesn&#39;t work like most kernels in yocto.<br>
&gt; <br>
&gt; I should take a look at the configs and see if I can create a fragmen=
t<br>
&gt; or two, but I can take care of that.<br>
<br>
That shouldn&#39;t be necessary.=C2=A0 The standard fragments work, it&#39=
;s just<br>
that the Pi kernel does not use them.=C2=A0 So this is really Pi+Xen<br>
specific, and hopefully they can fix the Pi kernel to use the normal<br>
fragments in the future.<br>
<br>
&gt; <br>
&gt; &gt; 3 The addition of xen-tools.=C2=A0 This seems somewhat controver=
sial from a<br>
&gt; &gt;=C2=A0 =C2=A0naming point of view, at least.=C2=A0 But all the ma=
jor distros seem to<br>
&gt; &gt;=C2=A0 =C2=A0have it, and it does make things easier.=C2=A0 It br=
ings along a boatload<br>
&gt; &gt;=C2=A0 =C2=A0of perl recipes.<br>
&gt; &gt; 4 Something to make bridges easier to manage.=C2=A0 Distros have=
 another tool<br>
&gt; &gt;=C2=A0 =C2=A0to do this (bridge-utils), but that ties into system=
d/initd and would<br>
&gt; &gt;=C2=A0 =C2=A0have been rather complex to integrate into yocto.=C2=
=
=A0 Plus it requires<br>
&gt; &gt;=C2=A0 =C2=A0rebooting to change anything.=C2=A0 The one I create=
d is far simpler and<br>
&gt; &gt;=C2=A0 =C2=A0works just as well, maybe better.<br>
&gt; &gt; 5 A few Pi-specific hacks for config and u-boot.<br>
&gt; &gt;<br>
&gt; &gt; 1 is a no brainer, and 2 shouldn&#39;t matter in the future.=C2=
=A0 I guess the<br>
&gt; &gt; questionable ones are 3 and 4.<br>
&gt; <br>
&gt; Christopher might have a better idea about #3, but if the<br>
&gt; functionality is useful, I&#39;m all for having it close to the other=
 Xen<br>
&gt; components.<br>
&gt; <br>
&gt; We&#39;ve put similar things like #4 into the layer before. Witness<b=
r>
&gt; cgroups-lite and some of the other semi-custom and more lightweight<b=
r>
&gt; things. But yah, just a judgement call if they may or may not be<br>
&gt; useful in other scenarios.<br>
<br>
I would like to see it go in, as I couldn&#39;t find anything to do this,<=
br>
and it&#39;s really simple.=C2=A0 <br>
<br>
&gt; <br>
&gt; #5 does sound like BSP stuff. Is any of it destined for the rpi layer=
s<br>
&gt; ? Or is it both rpi AND xen specific, so doesn&#39;t really make sens=
e<br>
&gt; there either ?<br>
<br>
It&#39;s both Pi and Xen specific.=C2=A0 If everything gets put where it s=
hould<br>
be, that would be the only thing left in this layer :).<br>
<br>
-corey<br>
<br>
&gt; <br>
&gt; Thanks for the info, most appreciated.<br>
&gt; <br>
&gt; Bruce<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; -corey<br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;Having a layer like that, with fixes missing from meta-=
virt, makes no sense.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;Bruce<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; meta-virtualization seems to be using Xen 4.12 at the momen=
t.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Corey&#39;s meta-raspberrypi-xen layer uses Xen 4.13. The X=
en patches are based on Xen 4.13. Between Xen 4.12 and 4.13 there are a few=
 additional patches that are required for running on Raspberry Pi 4.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Would you rather uprev meta-virtualization to Xen 4.13, or =
backport the patches and identify additional backports required for running=
 Xen 4.12 on Raspberry Pi 4?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Stew<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>
<br>-- <br>Best Regards,<br />Siddhartha V

--000000000000f1189005a817ba04--

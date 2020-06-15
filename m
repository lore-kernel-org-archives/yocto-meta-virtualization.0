Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web12.11945.1592204151935969519
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 Jun 2020 23:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HxgeuRac;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id x202so14940373oix.11
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 14 Jun 2020 23:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ko94ufQnpuj7q9EF24Wt9HlJ4MSk+i1wVazqDlwHX6s=;
        b=HxgeuRaceA2E5f3cfjk+o1LGsjniNuk0wjf2FdsTjrxMeebdUwJ4A11Eh9XH+CVYHJ
         pi9XJNNTl/KRjA/nVKllqs8ct69a8ng9mkvGk1wjqqUEJGzYBZjIavWVEdAv1+B84yol
         LHAMBLTtAqyd+AquZ2A9vyANvq1+0vd5nKgaPRXw5NW2UKkRuZQzv6lzvjGu+7vrQQTO
         2sV923Vns4GKZU2yc3ZcpQ1Y/KDF910buOJx7zJTyFNH/QSyf8KI7ZH2r12vrnO8z2j8
         7LFMolFv5/KhEdSIRJR6v+H8Y3GJWqNlSYHxA7Xcnw/CdX1AgBNe529Zclqs4NAwXgl/
         DBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ko94ufQnpuj7q9EF24Wt9HlJ4MSk+i1wVazqDlwHX6s=;
        b=flWVfMQVf94CgyvOFalusukbQE1AGH27TPUmyDpzxgXXpycuoPHBAM1R3qloVNcwL/
         K3LMFkVabS5rrr0OFBZ5lHsRtJcDR47EBQJJhW/ho9TWyORCfCaJM/wxtalbSdPUaOJ5
         eS8jMfVH6Ufq2UmAJx6gTRW251bypLA1JL0k9HKA0NlB7IsKtB1ajd21ZQS1hJYUrd5W
         L7fzk8phqwK6kSQ8teVENzM6JSXhs7iqVYtmVYUD+HbjSRU3a+KbNLgzjDrN+hOdhun3
         6TBnBJzOhtOS+lb99l3EFA2LOWChurQjdxgDiyKHp6UlBk2kqsNDHXbRr+iGK5JUszw9
         cFlw==
X-Gm-Message-State: AOAM530sdZy8m8bTf3XzDtDbNIcx0W/V0KeIjQSUenCu5IBQx28ooS3f
	z9LoeCf2GF5c4um4MSMgszQ6VQugGYKvIA4vZ79bxy5Z
X-Google-Smtp-Source: ABdhPJwEELgGxMTQXzCN3qhF3UKo2hHwWbeD3EZGG0ekBAnorJauefJgb4y1t7X9QOslXlvo+t4TxIIdGUJLB3Uk4kM=
X-Received: by 2002:a54:4015:: with SMTP id x21mr7385609oie.161.1592204150965;
 Sun, 14 Jun 2020 23:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <CY1P110MB05517012EA0DC0134F655D2A8C860@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <20200605211602.GO2903@minyard.net> <CADkTA4N7vqHMi8Fa5H1sRuX4ZnVrEiS4oso5TiObUu0thJGr5g@mail.gmail.com>
 <20200606005839.GR2903@minyard.net> <CAEkELtBDAGsy9kZtAX3WRM5=4SizpOHFK91_2B103id8WHgO-g@mail.gmail.com>
In-Reply-To: <CAEkELtBDAGsy9kZtAX3WRM5=4SizpOHFK91_2B103id8WHgO-g@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Sun, 14 Jun 2020 23:55:39 -0700
Message-ID: <CACMJ4GZ7eX_8PC7EJ2i5V0iWmBUY1ezN90YGMqUB+1Qfiix6KQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Xen on Raspberry Pi 4 (was "How to resolve the ERROR: xen-image-minimal-1.0-r0 do_rootfs: Function failed: do_rootfs. and ERROR: xen-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. ERROR: xen-image-minimal-1.0-r0 do_rootf")
To: siddhartha v <siddhuvgowda.18695@gmail.com>
Cc: Corey Minyard <cminyard@mvista.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2020 at 9:19 PM siddhartha v
<siddhuvgowda.18695@gmail.com> wrote:
>
> Hello really sorry for late response,
>
>
>     Currently I am working with the warrior series of yocto but the meta-=
raspberrypi-xen is in th edunfell series of the yocto. So my doubt is shoul=
d I do the building task from the beginning? From the past two days yocto d=
ocumentation and any website yocto is not loading ( I am getting this error=
 "This site can=E2=80=99t be reached. The connection was reset."). So I am =
not able to access the documentation.
>
>    Also, as I am having a very short time period, I tried to build the im=
age using dunfell from the beginning but I am getting the below error,
>
> ERROR: Task (/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recip=
es-devtools/binutils/binutils-cross_2.34.bb:do_compile) failed with exit co=
de '1'
> WARNING: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch: =
Failed to fetch URL git://github.com/raspberrypi/linux.git;branch=3Drpi-4.1=
9.y, attempting MIRRORS if available
> ERROR: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch: Fe=
tcher failure: Fetch command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSC=
ONFIGDATA_NAME; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/10=
00/bus,guid=3D5716e12867bf0fe2966f5f465ee359ba"; export SSH_AGENT_PID=3D"19=
11"; export SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export PATH=3D"/h=
ome/siddhu/Documents/yocto/dunfell/build/tmp/sysroots-uninative/x86_64-linu=
x/usr/bin:/home/siddhu/Documents/yocto/dunfell/sources/poky/scripts:/home/s=
iddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux-gnueab=
i/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot-nati=
ve/usr/bin/arm-poky-linux-gnueabi:/home/siddhu/Documents/yocto/dunfell/buil=
d/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+git=
AUTOINC+9da67d7329-r0/recipe-sysroot/usr/bin/crossscripts:/home/siddhu/Docu=
ments/yocto/dunfell/build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-ra=
spberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sysroot-native/usr/sbi=
n:/home/siddhu/Documents/yocto/dunfell/build/tmp/work/raspberrypi4-poky-lin=
ux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d7329-r0/recipe-sys=
root-native/usr/bin:/home/siddhu/Documents/yocto/dunfell/build/tmp/work/ras=
pberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+gitAUTOINC+9da67d=
7329-r0/recipe-sysroot-native/sbin:/home/siddhu/Documents/yocto/dunfell/bui=
ld/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.120+gi=
tAUTOINC+9da67d7329-r0/recipe-sysroot-native/bin:/home/siddhu/Documents/yoc=
to/dunfell/sources/poky/bitbake/bin:/home/siddhu/Documents/yocto/dunfell/bu=
ild/tmp/hosttools"; export HOME=3D"/home/siddhu"; LANG=3DC git -c core.fsyn=
cobjectfiles=3D0 fetch -f --prune --progress git://github.com/raspberrypi/l=
inux.git refs/*:refs/* failed with exit code 128, output:
> remote: Enumerating objects: 12, done.
> remote: Counting objects: 100% (12/12), done.
> remote: Compressing objects: 100% (11/11), done.
> fatal: read error: Connection reset by peer1.29 GiB | 340.00 KiB/s
> fatal: early EOF
> fatal: index-pack failed
>
> ERROR: linux-raspberrypi-1_4.19.120+gitAUTOINC+9da67d7329-r0 do_fetch: Fe=
tcher failure for URL: 'git://github.com/raspberrypi/linux.git;branch=3Drpi=
-4.19.y'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/siddhu/Documents/yocto/dunfell=
/build/tmp/work/raspberrypi4-poky-linux-gnueabi/linux-raspberrypi/1_4.19.12=
0+gitAUTOINC+9da67d7329-r0/temp/log.do_fetch.2431
> ERROR: Task (/home/siddhu/Documents/yocto/dunfell/sources/meta-raspberryp=
i/recipes-kernel/linux/linux-raspberrypi_4.19.bb:do_fetch) failed with exit=
 code '1'
> NOTE: Tasks Summary: Attempted 1058 tasks of which 1053 didn't need to be=
 rerun and 4 failed.
>
> Summary: 4 tasks failed:
>   virtual:native:/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/r=
ecipes-support/icu/icu_66.1.bb:do_compile
>    #/home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-suppor=
t/icu/icu_66.1.bb:do_make_icudata
>   /home/siddhu/Documents/yocto/dunfell/sources/poky/meta/recipes-devtools=
/binutils/binutils-cross_2.34.bb:do_compile
>   /home/siddhu/Documents/yocto/dunfell/sources/meta-raspberrypi/recipes-k=
ernel/linux/linux-raspberrypi_4.19.bb:do_fetch
>
>
>
> May I know what wrong I am doing here, Even when I started this yocto for=
 the first time I faced the same but luckily it was resolved automatically =
after trying multiple times. But I need some suggestions here. Kindly sugge=
st me what wrong I am doing here.

The do_fetch step failure for the linux-raspberrypi recipe indicates
that your system is having difficulty retrieving the source materials
that the recipe needs, in this case the source code from the git
repository here: https://github.com/raspberrypi/linux/tree/rpi-4.19.y
Your problem was possibly bad network connectivity to the internet
when you tried your build.

If it succeeded when you retried, your fetch was able to retrieve it
and you likely now have a cached version of it in your DL_DIR that you
have configured in your local.conf, so you should be able to build
without needing another download of it.
https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#user-=
configuration

Christopher

>
>
> --
> Thanks and Regards.
> Siddhartha V.
>
>
>
> On Sat, Jun 6, 2020 at 6:28 AM Corey Minyard <cminyard@mvista.com> wrote:
>>
>> On Fri, Jun 05, 2020 at 07:53:53PM -0400, Bruce Ashfield wrote:
>> > On Fri, Jun 5, 2020 at 5:16 PM Corey Minyard <cminyard@mvista.com> wro=
te:
>> > >
>> > > On Fri, Jun 05, 2020 at 07:55:37PM +0000, Stewart Hildebrand wrote:
>> > > > + Corey
>> > > >
>> > > > On Friday, June 5, 2020 3:19 PM, Bruce Ashfield wrote:
>> > > > >On Fri, Jun 5, 2020 at 3:12 PM Stewart Hildebrand wrote:
>> > > > >> On Thursday, June 4, 2020 5:13 PM, Christopher Clark wrote:
>> > > > >> > Hello Siddhartha,
>> > > > >> >
>> > > > >> > I am also interested in running Xen on the Raspberry Pi 4. I =
hope to have time next week to be able to look into it.
>> > > > >> >
>> > > > >> > Christopher
>> > > > >> >
>> > > > >> >
>> > > > >> >> On Jun 4, 2020, at 5:05 AM, Siddhartha V wrote:
>> > > > >> >>
>> > > > >> >> Hello dear meta-virtualization team,
>> > > > >> >> I am building the xen minimal image using yocto warrior ("bi=
tbake xen-image-minimal") by giving the target machine as
>> > > > >"raspberrypi4".
>> > > > >>
>> > > > >> Corey Minyard created a layer for Xen on Raspberry Pi 4 here ht=
tps://github.com/MontaVista-OpenSourceTechnology/meta-
>> > > > >raspberrypi-xen
>> > > > >>
>> > > > >
>> > > > >Someone needs to lean on them to get patches submitted to meta-vi=
rt.
>> > > >
>> > > > Corey: you are hereby encouraged to submit patches to meta-virtual=
ization.
>> > >
>> > > Ok.  The layer has the following basic pieces:
>> > >
>> > > 1 The xen patches for the Pi4, just a few patches.  As the Xen group
>> > >   fixes things, I keep adding :).
>> > > 2 Hacks for getting the Pi4 kernel config right for xen.  This shoul=
d go
>> > >   away if you don't use the kernel from the Pi4 yocto layer, as it
>> > >   doesn't work like most kernels in yocto.
>> >
>> > I should take a look at the configs and see if I can create a fragment
>> > or two, but I can take care of that.
>>
>> That shouldn't be necessary.  The standard fragments work, it's just
>> that the Pi kernel does not use them.  So this is really Pi+Xen
>> specific, and hopefully they can fix the Pi kernel to use the normal
>> fragments in the future.
>>
>> >
>> > > 3 The addition of xen-tools.  This seems somewhat controversial from=
 a
>> > >   naming point of view, at least.  But all the major distros seem to
>> > >   have it, and it does make things easier.  It brings along a boatlo=
ad
>> > >   of perl recipes.
>> > > 4 Something to make bridges easier to manage.  Distros have another =
tool
>> > >   to do this (bridge-utils), but that ties into systemd/initd and wo=
uld
>> > >   have been rather complex to integrate into yocto.  Plus it require=
s
>> > >   rebooting to change anything.  The one I created is far simpler an=
d
>> > >   works just as well, maybe better.
>> > > 5 A few Pi-specific hacks for config and u-boot.
>> > >
>> > > 1 is a no brainer, and 2 shouldn't matter in the future.  I guess th=
e
>> > > questionable ones are 3 and 4.
>> >
>> > Christopher might have a better idea about #3, but if the
>> > functionality is useful, I'm all for having it close to the other Xen
>> > components.
>> >
>> > We've put similar things like #4 into the layer before. Witness
>> > cgroups-lite and some of the other semi-custom and more lightweight
>> > things. But yah, just a judgement call if they may or may not be
>> > useful in other scenarios.
>>
>> I would like to see it go in, as I couldn't find anything to do this,
>> and it's really simple.
>>
>> >
>> > #5 does sound like BSP stuff. Is any of it destined for the rpi layers
>> > ? Or is it both rpi AND xen specific, so doesn't really make sense
>> > there either ?
>>
>> It's both Pi and Xen specific.  If everything gets put where it should
>> be, that would be the only thing left in this layer :).
>>
>> -corey
>>
>> >
>> > Thanks for the info, most appreciated.
>> >
>> > Bruce
>> >
>> > >
>> > > -corey
>> > >
>> > > >
>> > > > >Having a layer like that, with fixes missing from meta-virt, make=
s no sense.
>> > > > >
>> > > > >Bruce
>> > > >
>> > > > meta-virtualization seems to be using Xen 4.12 at the moment.
>> > > >
>> > > > Corey's meta-raspberrypi-xen layer uses Xen 4.13. The Xen patches =
are based on Xen 4.13. Between Xen 4.12 and 4.13 there are a few additional=
 patches that are required for running on Raspberry Pi 4.
>> > > >
>> > > > Would you rather uprev meta-virtualization to Xen 4.13, or backpor=
t the patches and identify additional backports required for running Xen 4.=
12 on Raspberry Pi 4?
>> > > >
>> > > > Stew
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II

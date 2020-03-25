Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.16303.1585154823939583787
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 09:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S5JuWj5x;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id i24so3297882eds.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Mar 2020 09:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c/Ab0ngHrMebucAKc4UaRWJGDsCXsEnZFUrFw+TOTTw=;
        b=S5JuWj5xMPi94aFt/E/HJK1EwXezvp7saiYmCJO9vVGdZp8c5F1sK3A7GHzP3MVkWG
         uL/lz545V+TwjeM/u36d1hTnF5p3OzmgRk83QuCyqw62sKWu0aHmNzJZsPPRWGthqliI
         +dFd0gsohhO5dXvzNLyHXl988hJvGqSXZcxi/GkZTpmVgF9FcOicyq6bPBkA0T0uAkIJ
         NRAlUiOy30lfyLKnXbWmTHINJ2S9vZzhhJfo9OPzhEUzX3PMgCguspw7abUQQXevJRfe
         vijhl7toAGBvD3jR5ECTY5Z00iOtQrf4O9Ltpqkk7Vt2pKXBgmxOR3N1TRZDZX2SQe73
         enHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c/Ab0ngHrMebucAKc4UaRWJGDsCXsEnZFUrFw+TOTTw=;
        b=A9snghmuUJdPjjokp98DfgqSzyvK3SqDLZ1RCRt1MaPj4epv+fZX7+MBE9CX5Zj1Ok
         MFLvhx16FpvMpN0jstsUsHCR2/N+AxdAClthOqPlGAFQrKbEl97KEiqMd8SzoqCFbibz
         cjo5p/hlZHUtUjUAuyB/X+xtTMQzN4YAdpZhG2zK0+ys9EbaNgvGih/0nNtpwYnyf86H
         w77sdYcKzwZfyrSuzMXxn+i0KwQu9PBP3AQKKolAhgr0fsC97UkyS8EVmogdw4VSAKm4
         fYTV072nr6SI1N962r7eIsfc32AOaGVuJde5xWW3eURzBwHJBNSnYNqVbWp5L51r0JRV
         wPgA==
X-Gm-Message-State: ANhLgQ3GtqJLI6Zk9Lx8nwlGQRf+nBQ9U1Nyqy99ewMGxTls0+sNm2Rb
	XzK8K0007+CkDb/r2fDekTuiOWaH5x/QTQenTYk=
X-Google-Smtp-Source: ADFU+vvIZoivPItQ0pML7PIRE71QrwZmr72UTgNeLbUATKvGA9WwxvcfVJFHTON1ARKtQAGbgoWUMf/7g61OqwX02dM=
X-Received: by 2002:a50:9fcb:: with SMTP id c69mr3768967edf.27.1585154822331;
 Wed, 25 Mar 2020 09:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200325054222.387399-1-raj.khem@gmail.com> <CADkTA4P-J=GzikExuvTk7ZE+ej5XocPK7KEQmQ5X1kR3fb1+zQ@mail.gmail.com>
 <CAMKF1sqYD1gw3qcw+edGawBZZWPz=qyGyHqrgY5xu1E94wcEkA@mail.gmail.com>
 <CADkTA4PC_9KrB2CpL1mOqhmqdSr8g+ZqzRfwWoJwLdrrqtwyTQ@mail.gmail.com> <CAMKF1soSqYqHJCYerw0AUqiO0Z0bCi2-bfHyfgyCFp3JRO16xw@mail.gmail.com>
In-Reply-To: <CAMKF1soSqYqHJCYerw0AUqiO0Z0bCi2-bfHyfgyCFp3JRO16xw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2020 12:46:47 -0400
Message-ID: <CADkTA4M9=bb6ZvzD9tr=gCMDenbOhd+BcTvy9-QHvM54xbg06g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: Enable LTO
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 12:30 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Sounds good to me. Let me first add lto as distro knob so hold on to it
>

ok! No worries, I'll wait on a new patch from you.

Cheers,

Bruce

> On Wed, Mar 25, 2020 at 8:10 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>
>> On Wed, Mar 25, 2020 at 9:47 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Wed, Mar 25, 2020 at 5:53 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> > >
>> > > On Wed, Mar 25, 2020 at 1:42 AM Khem Raj <raj.khem@gmail.com> wrote:
>> > > >
>> > > > openvswitch binaries can shed some size with lto
>> > > >
>> > > > --- a/packages/rdk-linux-gnueabi/openvswitch/openvswitch-ovsdb/files-in-package.txt
>> > > > +++ b/packages/rdk-linux-gnueabi/openvswitch/openvswitch-ovsdb/files-in-package.txt
>> > > > @@ -1,7 +1,7 @@
>> > > > drwxr-xr-x root       root             3488 ./usr
>> > > > drwxr-xr-x root       root             3488 ./usr/bin
>> > > > --rwxr-xr-x root       root           378984 ./usr/bin/ovsdb-client
>> > > > --rwxr-xr-x root       root           353628 ./usr/bin/ovsdb-tool
>> > > > --rwxr-xr-x root       root          1411216 ./usr/bin/ovs-vsctl
>> > > > +-rwxr-xr-x root       root           203356 ./usr/bin/ovsdb-client
>> > > > +-rwxr-xr-x root       root           233172 ./usr/bin/ovsdb-tool
>> > > > +-rwxr-xr-x root       root           287012 ./usr/bin/ovs-vsctl
>> > > > drwxr-xr-x root       root             3488 ./usr/sbin
>> > > > --rwxr-xr-x root       root           379404 ./usr/sbin/ovsdb-server
>> > > > +-rwxr-xr-x root       root           287672 ./usr/sbin/ovsdb-server
>> > > >
>> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > > > ---
>> > > >  recipes-networking/openvswitch/openvswitch_git.bb | 3 +++
>> > > >  1 file changed, 3 insertions(+)
>> > > >
>> > > > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
>> > > > index 07258be..bd74f49 100644
>> > > > --- a/recipes-networking/openvswitch/openvswitch_git.bb
>> > > > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
>> > > > @@ -37,6 +37,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
>> > > >
>> > > >  DPDK_INSTALL_DIR ?= "/opt/dpdk"
>> > > >
>> > > > +CFLAGS += "-flto"
>> > > > +LDFLAGS += "-flto"
>> > >
>> > > Shouldn't this be something that is configurable ? I know that I want
>> > > it to be. i.e. isn't there some sort of distro feature that we can use
>> > > to enable or disable this by default ?
>> > >
>> >
>> > yes distro feature is coming I will  turn this into DISTRO feature too
>> > but in this case benefits are regardless
>>
>> .... but nothing is bug free, there are documented cases of LTO
>> causing issues. So until we get a distro knob to turn this off an on,
>> what about something like ?
>>
>> CFLAGS_LTO ?= "-flto"
>> LDFLAGS_LTO ?= "-flto"
>>
>> CFLAGS += "${CFLAGS_LTO}"
>> LDFLAGS += "${LDFLAGS_LTO}"
>>
>> So if we run into issues, we can easily bappend the LTO flags to nothing.
>>
>> Bruce
>>
>> >
>> > > Bruce
>> > >
>> > > > +
>> > > >  PACKAGECONFIG ?= "libcap-ng"
>> > > >  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
>> > > >  PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
>> > > > --
>> > > > 2.26.0
>> > > >
>> > >
>> > >
>> > > --
>> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > > thee at its end
>> > > - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

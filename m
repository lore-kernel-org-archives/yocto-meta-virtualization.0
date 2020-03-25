Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.13633.1585149026972220592
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Mar 2020 08:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EotHqBgO;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id cf14so2722147edb.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Mar 2020 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BV+MF8WLiHzA7kN0obYO0VgrVoBUPpgOo5VuVnmyZrk=;
        b=EotHqBgOW7o+IvjrEylMUGNyREx2Vt9jVB4w3AOYRpTWopGg7aImm6YtyBVO3LdjWD
         2IXeqoK6TLjd9BLOxlkVm2sbw6oArxqyuEyP7QLSWhHvlz/50TbOgtIpPI61Mh2ebu2D
         rSfC3LZjfQTTE0y/p4L+L4XYVVvl1UYow8/s04BhMDEsZeYEp2WaEj1keuyE7ptM2fzk
         txdftdNkvyUhDjzvRpW1S+g855ZiNO3JfKz1ZHN90he5r96sptUwzL9wpEwPwMVw8xx9
         vYX/MCunGXdZA70zvOW0nCYm1XF+9Ln73V+HCayqqeTD5vA0185O3qKJOXZ08W/q4EYV
         Tveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BV+MF8WLiHzA7kN0obYO0VgrVoBUPpgOo5VuVnmyZrk=;
        b=AhUypD2wBx9acP0Kz/ZZ+PQ14s4YaqnxAaf0DcH3M0UoUPHDJfclybFtao0zSPmCRS
         stsz6+Bep84SC51SLpKu5WSSq3JAHiiybmt5lEhOBLHZh39ilw4wl8DJTuJtTmdpEGP9
         SNlocaOBul2D+R3PQZqofkROtdFDNUe6ckdTEahOt7YdQinRimMnSUdMtuxZ05Fcigxl
         QTOYa38nDlDvL1vY/uw7CcwxhTpqfgaziV152e6nP8NPmMa8MUhct2sCp7pG5qfhPqmb
         XBzW5OjKkXNgxsx6lRkBvxvdMiBw6OFgYUFM7Rdqteq86vi5bSRenIEtePm/13hw3b1i
         Qajg==
X-Gm-Message-State: ANhLgQ0MESdBUXjMlXUYZjbSW2VbVjHIo3sWGdXemMJhdZJ8vBfMTdb7
	8XoeX3b8/Y6hu9Ln/kYhpc5t7+GAYhdQQh/dKbs=
X-Google-Smtp-Source: ADFU+vuV9MEqzbCI5vp/haVbwVd5ZuN928VzMKzWmdP3cSO8/jM5U5cP6TqUgYY65snptPiB/p/8asxSDOREkKMsRxE=
X-Received: by 2002:a05:6402:180a:: with SMTP id g10mr3228882edy.352.1585149025590;
 Wed, 25 Mar 2020 08:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200325054222.387399-1-raj.khem@gmail.com> <CADkTA4P-J=GzikExuvTk7ZE+ej5XocPK7KEQmQ5X1kR3fb1+zQ@mail.gmail.com>
 <CAMKF1sqYD1gw3qcw+edGawBZZWPz=qyGyHqrgY5xu1E94wcEkA@mail.gmail.com>
In-Reply-To: <CAMKF1sqYD1gw3qcw+edGawBZZWPz=qyGyHqrgY5xu1E94wcEkA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2020 11:10:14 -0400
Message-ID: <CADkTA4PC_9KrB2CpL1mOqhmqdSr8g+ZqzRfwWoJwLdrrqtwyTQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: Enable LTO
To: Khem Raj <raj.khem@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 25, 2020 at 9:47 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Mar 25, 2020 at 5:53 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Mar 25, 2020 at 1:42 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > openvswitch binaries can shed some size with lto
> > >
> > > --- a/packages/rdk-linux-gnueabi/openvswitch/openvswitch-ovsdb/files-in-package.txt
> > > +++ b/packages/rdk-linux-gnueabi/openvswitch/openvswitch-ovsdb/files-in-package.txt
> > > @@ -1,7 +1,7 @@
> > > drwxr-xr-x root       root             3488 ./usr
> > > drwxr-xr-x root       root             3488 ./usr/bin
> > > --rwxr-xr-x root       root           378984 ./usr/bin/ovsdb-client
> > > --rwxr-xr-x root       root           353628 ./usr/bin/ovsdb-tool
> > > --rwxr-xr-x root       root          1411216 ./usr/bin/ovs-vsctl
> > > +-rwxr-xr-x root       root           203356 ./usr/bin/ovsdb-client
> > > +-rwxr-xr-x root       root           233172 ./usr/bin/ovsdb-tool
> > > +-rwxr-xr-x root       root           287012 ./usr/bin/ovs-vsctl
> > > drwxr-xr-x root       root             3488 ./usr/sbin
> > > --rwxr-xr-x root       root           379404 ./usr/sbin/ovsdb-server
> > > +-rwxr-xr-x root       root           287672 ./usr/sbin/ovsdb-server
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  recipes-networking/openvswitch/openvswitch_git.bb | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> > > index 07258be..bd74f49 100644
> > > --- a/recipes-networking/openvswitch/openvswitch_git.bb
> > > +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> > > @@ -37,6 +37,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> > >
> > >  DPDK_INSTALL_DIR ?= "/opt/dpdk"
> > >
> > > +CFLAGS += "-flto"
> > > +LDFLAGS += "-flto"
> >
> > Shouldn't this be something that is configurable ? I know that I want
> > it to be. i.e. isn't there some sort of distro feature that we can use
> > to enable or disable this by default ?
> >
>
> yes distro feature is coming I will  turn this into DISTRO feature too
> but in this case benefits are regardless

.... but nothing is bug free, there are documented cases of LTO
causing issues. So until we get a distro knob to turn this off an on,
what about something like ?

CFLAGS_LTO ?= "-flto"
LDFLAGS_LTO ?= "-flto"

CFLAGS += "${CFLAGS_LTO}"
LDFLAGS += "${LDFLAGS_LTO}"

So if we run into issues, we can easily bappend the LTO flags to nothing.

Bruce

>
> > Bruce
> >
> > > +
> > >  PACKAGECONFIG ?= "libcap-ng"
> > >  PACKAGECONFIG[dpdk] = "--with-dpdk=${STAGING_DIR_TARGET}${DPDK_INSTALL_DIR}/share/${TARGET_ARCH}-native-linuxapp-gcc,,dpdk,dpdk"
> > >  PACKAGECONFIG[libcap-ng] = "--enable-libcapng,--disable-libcapng,libcap-ng,"
> > > --
> > > 2.26.0
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

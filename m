Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0992C54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 15:49:28 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.16136.1708616962037575943
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Feb 2024 07:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMPvKzyo;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-299e0271294so2249835a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 07:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708616961; x=1709221761; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7D5jxCQAjp6ktuSIdUe/uLidr5mbf/n8aOCadREoRA=;
        b=CMPvKzyoUZnvYOZMTcxcPjfnXKc5CNQaoSW8qab9ScXbwuqwuXgsV+wWSsJRGzkxZG
         ixZLTdlUX7HZ38i/oAyGhJbn79Q1UCuYjJ1VMwNzqIrgV3uEzPiA7G4D+4O0ReZO5uTW
         J8is8MLhIf2ormbrG27QNvyvI4CBfYtI6+6JuQuvAdqWrHggdlLyoTvWZBoJ+o99yDqa
         tFMtJt8saymLR9G54yZFT10e9lXb+OxILCYNcGPil45lXva7bU0jxfwdI8s948oMKTDJ
         0t5+bDaOmsZHfxJeEK15G+X5p/LsWSA+ViFBUP+tTOHjt6yFJJK6AG1h1J4Yonfjej21
         l+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708616961; x=1709221761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7D5jxCQAjp6ktuSIdUe/uLidr5mbf/n8aOCadREoRA=;
        b=AO/+vL7S9xIAUfvSUzqMQJtczNtkq0o6hl8pGnlek5z4dh1Mqxl4E8RJ+JWB6T0gEB
         prYLKkdFy7XxKU/cH+7kfZBjV9Dct8HrYAX0gvKyYTjYHAbbHtTrVqARkgas0Uvz8AeG
         CsYpDM7RkphnKIVTs4H0p9rxFUGRp6wIDiKQEDz4cX5gOXsat03umnoIbOph/ZzI8l0w
         Ty8FVvH0IziQdrn0a0Ovr5Rkgr+qXzyVwrngB2zitsZP+NAED0vgPVNsIrOWtxIpq6r3
         YwGUspbNbE8gtXEdjkKbhwBARp2ClAuPj8AT32M93nVOEhq5jTXhItk5gII3pLhaVSkN
         YqUQ==
X-Gm-Message-State: AOJu0Yzr0/XZ0nxhXPhW4eAFXe7r/0jSWQ1Lcqc+ndTuEJd+uxePZiij
	v7BsssOdPVr2J2NVEHFNEUrxDSC9rSbektq8yNrVgJ1SQEppIyuTc5tYMbvkFfLimy1wDSTSCkF
	dO+RmJIOZEYK9ERe6ouXA21Py0DbaZR58
X-Google-Smtp-Source: AGHT+IFJaRnphwvY61T0KdaTB2VU4L0R2zhDGaE7vqk7rL5h0n+bmfTfkB7Ki4rANdcfQldVdxhlsM92BjlfaGkSwvw=
X-Received: by 2002:a17:90b:1e0d:b0:299:32f0:8124 with SMTP id
 pg13-20020a17090b1e0d00b0029932f08124mr15853083pjb.42.1708616961016; Thu, 22
 Feb 2024 07:49:21 -0800 (PST)
MIME-Version: 1.0
References: <17B13F840D848DD8.26550@lists.yoctoproject.org> <ad2f14cf-1bcf-45cf-91e6-09e381b8b318@eng.windriver.com>
In-Reply-To: <ad2f14cf-1bcf-45cf-91e6-09e381b8b318@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Feb 2024 10:49:09 -0500
Message-ID: <CADkTA4OEkdw9KD6YRJ+9JWjCzjec2Wq5TVmfrb9tiTS3nijajA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: fix postinstall scriptlets failure
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Feb 2024 15:49:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8571

Thanks for the follow up, it is now dropped!

Bruce

On Wed, Feb 21, 2024 at 2:42=E2=80=AFAM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Bruce,
>
>
> As the comment mentioned,  this issue root cause is service A ...
> service N enable each other caused oe-core's systemctl trap into a dead
> loop. To simply revert a commit in libvirt is masking the truth, other
> package might meet this issue,  so a fix using a filter in systemctl to
> against duplicates has been sent to oe-core mail
> list(https://lists.openembedded.org/g/openembedded-core/message/195958).
>
>
> So please ignore this patch and help to remove it from
> meta-virtualization master-next (commit:
> 79c82358f322983e101e238695a9a77f56a675ab)
>
>
> Thanks  :)
>
>
> Br,
>
> Xiangyu
>
> On 2/6/24 19:11, Xiangyu Chen wrote:
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > libvirt upstream has added all sockets for a service being enabled when=
 a
> > single one of them is[1], it likes serviceA enable serviceB, serviceB e=
nable
> > serviceA, that cause our systemctl script[2] trap into a dead loop in p=
ostinstall
> > stage, the error message as below:
> >
> > Traceback (most recent call last):
> >    File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
> >      return self._str
> > AttributeError: _str
> >
> > During handling of the above exception, another exception occurred:
> > Traceback (most recent call last):
> >    File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> >      SystemdUnit(self.root, also).enable(unit)
> >    File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> >      SystemdUnit(self.root, also).enable(unit)
> >    File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> >      SystemdUnit(self.root, also).enable(unit)
> >    [Previous line repeated 988 more times]
> > ......
> > RecursionError: maximum recursion depth exceeded while calling a Python=
 object
> >
> > Since we are using systemctl script to process the dependency, so rever=
t that
> > commit from upstream.
> >
> > [1] https://github.com/libvirt/libvirt/commit/826931e95a38af8322f8ad069=
dc89117c6404a00
> > [2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-co=
re/systemd/systemd-systemctl/systemctl
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ---
> >   ...ert-systemd-Add-Also-between-sockets.patch | 143 +++++++++++++++++=
+
> >   recipes-extended/libvirt/libvirt_10.0.0.bb    |   1 +
> >   2 files changed, 144 insertions(+)
> >   create mode 100644 recipes-extended/libvirt/libvirt/0001-Revert-syste=
md-Add-Also-between-sockets.patch
> >
> > diff --git a/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-A=
lso-between-sockets.patch b/recipes-extended/libvirt/libvirt/0001-Revert-sy=
stemd-Add-Also-between-sockets.patch
> > new file mode 100644
> > index 00000000..84367fc3
> > --- /dev/null
> > +++ b/recipes-extended/libvirt/libvirt/0001-Revert-systemd-Add-Also-bet=
ween-sockets.patch
> > @@ -0,0 +1,143 @@
> > +From 66aa101abb639c64f71a2867424fb58a39a3bd21 Mon Sep 17 00:00:00 2001
> > +From: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +Date: Tue, 6 Feb 2024 18:45:53 +0800
> > +Subject: [PATCH] Revert "systemd: Add Also between sockets"
> > +
> > +This reverts commit 826931e95a38af8322f8ad069dc89117c6404a00.
> > +
> > +We have systemctl script to process the service dependency, this cause=
 our oe-core systemctl script
> > +trap into a dead loop.
> > +
> > +Error as below:
> > +Traceback (most recent call last):
> > +  File "/usr/lib/python3.8/pathlib.py", line 722, in __str__
> > +    return self._str
> > +AttributeError: _str
> > +
> > +During handling of the above exception, another exception occurred:
> > +Traceback (most recent call last):
> > +  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> > +    SystemdUnit(self.root, also).enable(unit)
> > +  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> > +    SystemdUnit(self.root, also).enable(unit)
> > +  File "recipe-sysroot-native/usr/bin/systemctl", line 255, in enable
> > +    SystemdUnit(self.root, also).enable(unit)
> > +  [Previous line repeated 988 more times]
> > +......
> > +RecursionError: maximum recursion depth exceeded while calling a Pytho=
n object
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +---
> > + src/locking/virtlockd-admin.socket.in | 1 -
> > + src/locking/virtlockd.socket.in       | 1 -
> > + src/logging/virtlogd-admin.socket.in  | 1 -
> > + src/logging/virtlogd.socket.in        | 1 -
> > + src/remote/libvirtd-admin.socket.in   | 2 --
> > + src/remote/libvirtd-ro.socket.in      | 2 --
> > + src/remote/libvirtd.socket.in         | 2 --
> > + src/virtd-admin.socket.in             | 2 --
> > + src/virtd-ro.socket.in                | 2 --
> > + src/virtd.socket.in                   | 2 --
> > + 10 files changed, 16 deletions(-)
> > +
> > +diff --git a/src/locking/virtlockd-admin.socket.in b/src/locking/virtl=
ockd-admin.socket.in
> > +index ed5b94edba..8902ae4225 100644
> > +--- a/src/locking/virtlockd-admin.socket.in
> > ++++ b/src/locking/virtlockd-admin.socket.in
> > +@@ -11,4 +11,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dvirtlockd.socket
> > +diff --git a/src/locking/virtlockd.socket.in b/src/locking/virtlockd.s=
ocket.in
> > +index 4eec90a95e..afd42d124e 100644
> > +--- a/src/locking/virtlockd.socket.in
> > ++++ b/src/locking/virtlockd.socket.in
> > +@@ -9,4 +9,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dvirtlockd-admin.socket
> > +diff --git a/src/logging/virtlogd-admin.socket.in b/src/logging/virtlo=
gd-admin.socket.in
> > +index 7207878008..a634af8942 100644
> > +--- a/src/logging/virtlogd-admin.socket.in
> > ++++ b/src/logging/virtlogd-admin.socket.in
> > +@@ -11,4 +11,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dvirtlogd.socket
> > +diff --git a/src/logging/virtlogd.socket.in b/src/logging/virtlogd.soc=
ket.in
> > +index e1d6e30e4d..7c14d03ce4 100644
> > +--- a/src/logging/virtlogd.socket.in
> > ++++ b/src/logging/virtlogd.socket.in
> > +@@ -9,4 +9,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dvirtlogd-admin.socket
> > +diff --git a/src/remote/libvirtd-admin.socket.in b/src/remote/libvirtd=
-admin.socket.in
> > +index 37efc11357..5cbb83deaa 100644
> > +--- a/src/remote/libvirtd-admin.socket.in
> > ++++ b/src/remote/libvirtd-admin.socket.in
> > +@@ -11,5 +11,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dlibvirtd.socket
> > +-Also=3Dlibvirtd-ro.socket
> > +diff --git a/src/remote/libvirtd-ro.socket.in b/src/remote/libvirtd-ro=
.socket.in
> > +index 6e1fad2272..7e25498728 100644
> > +--- a/src/remote/libvirtd-ro.socket.in
> > ++++ b/src/remote/libvirtd-ro.socket.in
> > +@@ -11,5 +11,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dlibvirtd.socket
> > +-Also=3Dlibvirtd-admin.socket
> > +diff --git a/src/remote/libvirtd.socket.in b/src/remote/libvirtd.socke=
t.in
> > +index 9cd37dc766..919b874acd 100644
> > +--- a/src/remote/libvirtd.socket.in
> > ++++ b/src/remote/libvirtd.socket.in
> > +@@ -9,5 +9,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3Dlibvirtd-ro.socket
> > +-Also=3Dlibvirtd-admin.socket
> > +diff --git a/src/virtd-admin.socket.in b/src/virtd-admin.socket.in
> > +index 63eabd70f8..d3b260e5b1 100644
> > +--- a/src/virtd-admin.socket.in
> > ++++ b/src/virtd-admin.socket.in
> > +@@ -13,5 +13,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3D@service@.socket
> > +-Also=3D@service@-ro.socket
> > +diff --git a/src/virtd-ro.socket.in b/src/virtd-ro.socket.in
> > +index 3284af5a4a..2f701c8adb 100644
> > +--- a/src/virtd-ro.socket.in
> > ++++ b/src/virtd-ro.socket.in
> > +@@ -13,5 +13,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3D@service@.socket
> > +-Also=3D@service@-admin.socket
> > +diff --git a/src/virtd.socket.in b/src/virtd.socket.in
> > +index 502c792e7d..3605b0103e 100644
> > +--- a/src/virtd.socket.in
> > ++++ b/src/virtd.socket.in
> > +@@ -11,5 +11,3 @@ RemoveOnStop=3Dyes
> > +
> > + [Install]
> > + WantedBy=3Dsockets.target
> > +-Also=3D@service@-ro.socket
> > +-Also=3D@service@-admin.socket
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-exten=
ded/libvirt/libvirt_10.0.0.bb
> > index 6b19b700..412fb67b 100644
> > --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> > +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > @@ -32,6 +32,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}=
.tar.xz;name=3Dlibvirt \
> >              file://gnutls-helper.py \
> >              file://0001-prevent-gendispatch.pl-generating-build-path-i=
n-code.patch \
> >              file://0001-messon.build-remove-build-path-information-to-=
avoid-.patch \
> > +           file://0001-Revert-systemd-Add-Also-between-sockets.patch \
> >             "
> >
> >   SRC_URI[libvirt.sha256sum] =3D "8ba2e72ec8bdd2418554a1474c42c35704c30=
174b7611eaf9a16544b71bcf00a"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8562): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8562
> > Mute This Topic: https://lists.yoctoproject.org/mt/104195353/7175143
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [xiangyu.chen@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


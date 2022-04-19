Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66DBC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:05 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.900.1650405691010519294
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 15:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m2AfDrcv;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id t25so23010341edt.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 15:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t2bcXugYoa49hsRGZ4gvb99W2pQfHght1ixD+myG3Lw=;
        b=m2AfDrcv6/XZpHCnmoTt34Sf4SqxP6Fv9R7lcVpR+tulOTXEq1ITWvp9RNvRlYPRqC
         ek5I8o0HtfRhvBy6geK+BaZw0w3uPYpv2rJdRlZcSy+exbMvD61n+f99nj1fNWN+ndEZ
         HiJgeC8mdjBsFf6XlJQ9CngkuJ69wxBkJ4HKmvHPrckjiGfChrJghZb8eCGZBL/8MoyL
         cflB5gIrnD6Idv1wCHU7b+iZ+BxEj+HX76+p9RNE5XpGFbpFgm2Vxk2q7QAKWWhhpi+3
         Hu2kua2Hxg349SMsLcAVL6exSnZFd6/Eo83t0ii8jCGo/vTdIJk70cJGuUVYEgNK3fHK
         QZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t2bcXugYoa49hsRGZ4gvb99W2pQfHght1ixD+myG3Lw=;
        b=Eg7eWoEuAgNmngvJz2O/3qytY8Fj7Ko1F7vIN9fDKiOFJT23FB9bG5+FylT1fnZqhY
         fTilGkvG0ZberMcSBuxSFtxMMO59ofPa8OcLUzk7I2QYoh8jav4GUYmhMv7OUsEU7Hr8
         6SUXw/vnCT8XNKuAyreeThLmSyizf3VnBPf9/OzHzTgA53Km9cpSD92ELKDy7SZzQ045
         10mdTmwLHSRlqkdinNKqK3fybRe+xq2PwFPd4zyK4AHjn+63yGL542rHuYRBiHxAbqtg
         /wHFhcYli9Udnd+S2ympn5VWYjkITReTEOAvuzL0KLPzcOlgJMkJwoLcurxlMHky2Ww1
         XAsw==
X-Gm-Message-State: AOAM531IQmgcimJPiiPwtQlt7quzDzWaBkz2lewA6Vv6TurtBVn3sWgu
	MnMe5/KsDzYzH5yPo8xyzZ05/JOHOqXLFoJFYOs=
X-Google-Smtp-Source: 
 ABdhPJyGzM6NSLn0nrdoqZ4tjTjENoDnOlBZfLALfU5e5Sr1d8Y6ZzX1TKpVj3obsrs0rRtWg+6GKv5HNodCJduK/MU=
X-Received: by 2002:a05:6402:1385:b0:413:2bc6:4400 with SMTP id
 b5-20020a056402138500b004132bc64400mr20109516edv.94.1650405689423; Tue, 19
 Apr 2022 15:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <16E75FCC13F8DB9E.24908@lists.yoctoproject.org>
 <VI1PR08MB3470D55C69E59D176411051592F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
 <CADkTA4NE1CJBbYnVhB8g8kbPEfhXtw8WQ+4FHq60QCz=kp7bKQ@mail.gmail.com>
 <16E762DD856665D2.8966@lists.yoctoproject.org>
 <VI1PR08MB3470BBF7904E49A5E2AC1B7192F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
 <VI1PR08MB3470733477CCFCB2B95464F192F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
In-Reply-To: 
 <VI1PR08MB3470733477CCFCB2B95464F192F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Apr 2022 18:01:18 -0400
Message-ID: 
 <CADkTA4Ogr-YDfY5y0VN0FXY3Xn+nLy2W8XcUvikJLURj5Xu7gQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix
 xen-tools-xencommons do_package
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:05 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7200

On Tue, Apr 19, 2022 at 4:38 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>
>
>
> --
> Diego Sueiro
> Staff Software Developer =E2=80=93 Automotive and Industrial Solutions (C=
E-OSS)
>
> >-----Original Message-----
> >From: Diego Sueiro <Diego.Sueiro@arm.com>
> >Sent: 19 April 2022 20:41
> >To: Diego Sueiro <Diego.Sueiro@arm.com>; bruce.ashfield@gmail.com
> >Cc: meta-virtualization@lists.yoctoproject.org;
> >christopher.w.clark@gmail.com; nd <nd@arm.com>
> >Subject: RE: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-
> >xencommons do_package
> >
> >
> >>-----Original Message-----
> >>From: meta-virtualization@lists.yoctoproject.org <meta-
> >>virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
> >>lists.yoctoproject.org
> >>Sent: 19 April 2022 20:28
> >>To: bruce.ashfield@gmail.com
> >>Cc: meta-virtualization@lists.yoctoproject.org;
> >>christopher.w.clark@gmail.com; nd <nd@arm.com>
> >>Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-
> >>xencommons do_package
> >>
> >>Hi Bruce,
> >>
> >>>-----Original Message-----
> >>>From: meta-virtualization@lists.yoctoproject.org <meta-
> >>>virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield via
> >>>lists.yoctoproject.org
> >>>Sent: 19 April 2022 20:17
> >>>To: Diego Sueiro <Diego.Sueiro@arm.com>
> >>>Cc: meta-virtualization@lists.yoctoproject.org;
> >>>christopher.w.clark@gmail.com; nd <nd@arm.com>
> >>>Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-
> >>>xencommons do_package
> >>>
> >>>On Tue, Apr 19, 2022 at 3:07 PM Diego Sueiro <diego.sueiro@arm.com>
> >>wrote:
> >>>>
> >>>> Hi Bruce and Christopher,
> >>>>
> >>>> I'm not sure if this is the best solution, since after fixing the
> >>>> xen-tools
> >>>do_package, now I'm getting the following error on do_rootfs:
> >>>> ```
> >>>>   Installing       : xen-tools-xencommons-4.15+stable0+84fa99099b-r0=
.
> >>>429/483
> >>>>   Running scriptlet: xen-tools-xencommons-4.15+stable0+84fa99099b-r0=
.
> >>>429/483
> >>>> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a):
> >>>> scriptlet start
> >>>> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a):
> >>>> execv(/bin/sh) pid 5408
> >>>> + set -e
> >>>> + systemctl
> >>>> + OPTS=3D
> >>>> + [ -n
> >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua
> >>>> + l
> >>>> + i
> >>>> + zation-image/1.0-r0/rootfs ]
> >>>> + OPTS=3D--root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-li=
nux/
> >>>> + e w aol-virtualization-image/1.0-r0/rootfs
> >>>> + [ enable =3D enable ]
> >>>> + systemctl
> >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol
> >>>> + - v irtualization-image/1.0-r0/rootfs enable proc-xen.mount
> >>>> + systemctl
> >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol
> >>>> + - v irtualization-image/1.0-r0/rootfs enable
> >>>> + var-lib-xenstored.mount systemctl
> >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol
> >>>> + - v irtualization-image/1.0-r0/rootfs enable
> >>>> + xen-qemu-dom0-disk-backend.service
> >>>> ln -s /lib/systemd/system/xen-qemu-dom0-disk-backend.service
> >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali
> >>>> z
> >>>> a
> >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/
> >>>> x
> >>>> e
> >>>> n-qemu-dom0-disk-backend.service
> >>>> + systemctl
> >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol
> >>>> + - v irtualization-image/1.0-r0/rootfs enable xenconsoled.service
> >>>> ln -s /lib/systemd/system/xenconsoled.service
> >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali
> >>>> z
> >>>> a
> >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/
> >>>> x
> >>>> e
> >>>> nconsoled.service
> >>>> + systemctl
> >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol
> >>>> + - v irtualization-image/1.0-r0/rootfs enable xen-init-dom0.service
> >>>> ln -s /lib/systemd/system/xen-init-dom0.service
> >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali
> >>>> z
> >>>> a
> >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/
> >>>> x
> >>>> e
> >>>> n-init-dom0.service
> >>>> + systemctl
> >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewa=
ol
> >>>> + - v irtualization-image/1.0-r0/rootfs enable xenstored.service
> >>>> ln -s /lib/systemd/system/xenstored.service
> >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali
> >>>> z
> >>>> a
> >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/
> >>>> x
> >>>> e
> >>>> nstored.service
> >>>> + [ -z
> >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua
> >>>> + l
> >>>> + i
> >>>> + zation-image/1.0-r0/rootfs ] [ -n
> >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua
> >>>> + l i zation-image/1.0-r0/rootfs -o ! -d /run/systemd/system ] type
> >>>> + update-rc.d [ -n
> >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua
> >>>> + l i zation-image/1.0-r0/rootfs ] OPT=3D-r
> >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua
> >>>> + l i zation-image/1.0-r0/rootfs update-rc.d -r
> >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua
> >>>> + l i zation-image/1.0-r0/rootfs xencommons defaults 80
> >>>> update-rc.d:
> >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtuali
> >>>> z
> >>>> a
> >>>> tion-image/1.0-r0/rootfs/etc/init.d/xencommons: file does not exist
> >>>> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a):
> >>>> waitpid(5408) rc 5408 status 100
> >>>> warning: %post(xen-tools-xencommons-4.15+stable0+84fa99099b-
> >>>r0.armv8a)
> >>>> scriptlet failed, exit status 1
> >>>>
> >>>> Error in POSTIN scriptlet in rpm package xen-tools-xencommons
> >>>>   Installing       : xen-tools-xen-watchdog-4.15+stable0+84fa99099b-=
r
> >>>430/483
> >>>>   Running scriptlet:
> >>>> xen-tools-xen-watchdog-4.15+stable0+84fa99099b-r
> >>>430/483
> >>>> ```
> >>>>
> >>>> I guess that the "xen: only package xencommon systemd components if
> >>>systemd is enabled" (c9554c6) patch introduced the issues for
> >>>do_package as well as do_rootfs.
> >>>> Also, I never had the issue , at least using system, reported in the
> >>>> commit
> >>>message. And as far as I understand systemd is capable of ignoring
> >>>sysvinit scripts.
> >>>>
> >>>
> >>>Are you building sysvinit when you see the errors you are trying to
> >>>fix ? I've never seen them in either configuration here.
> >>>
> >>>I can confirm that it isn't ignoring them by default, and I had
> >>>multiple reports of the serial port being setup twice, and causing
> >>>runtime /
> >>login errors.
> >>>
> >>>Bruce
> >>
> >>These are my current settings:
> >>VIRTUAL-RUNTIME_init_manager=3D"systemd"
> >>VIRTUAL-RUNTIME_initscripts=3D"initscripts"
> >>DISTRO_FEATURES_BACKFILL_CONSIDERED=3D"sysvinit systemd"
> >>DISTRO_FEATURES=3D"acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6
> >>largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc
> >>x11 vfat seccomp largefile opengl ptest multiarch wayland vulkan
> >>virtualization ipv6 systemd seccomp k3s sysvinit  xen ptest"
> >>
> >
> >I guess I'll have to set the INIT_MANAGER variable to systemd instead:
> >https://git.yoctoproject.org/poky/commit/?id=3Da6ebbe3a10ff76386dde03dda=
a
> >7097bdb2f5d9a5
> >
> >I started a build, lets see how it goes.
>
> I can confirm that by having INIT_MANAGER =3D "system" there are no issue=
s for do_package and do_rootfs.
> I'm sorry for the false alarm.

Hmmm. It should be packaged regardless.  I have a build running, and
will see if I can trigger the issue.

Bruce

>
> --
> Diego
>
> >
> >I'm just curious to see how will be the behaviour on the kirkstone branc=
h.
> >
> >--
> >Diego
> >
> >>
> >>>
> >>>>
> >>>> --
> >>>> Diego Sueiro
> >>>> Staff Software Developer - Automotive and Industrial Solutions
> >>>> (CE-OSS)
> >>>>
> >>>> >-----Original Message-----
> >>>> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >>>> >virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro
> >>>> >via lists.yoctoproject.org
> >>>> >Sent: 19 April 2022 19:32
> >>>> >To: meta-virtualization@lists.yoctoproject.org
> >>>> >Cc: christopher.w.clark@gmail.com; nd <nd@arm.com>; Diego Sueiro
> >>>> ><Diego.Sueiro@arm.com>
> >>>> >Subject: [meta-virtualization][PATCH v2] xen-tools: Fix
> >>>> >xen-tools-xencommons do_package
> >>>> >
> >>>> >With the patch "xen: only package xencommon systemd components if
> >>>> >systemd is enabled" (c9554c6), the following error is displayed:
> >>>> >
> >>>> >    ERROR: xen-tools-4.15+stableAUTOINC+84fa99099b-r0 do_package:
> >>>> >QA
> >>>> >Issue:
> >>>> >    xen-tools: Files/directories were installed but not shipped in
> >>>> >any
> >>package:
> >>>> >        /etc/init.d/xencommons
> >>>> >
> >>>> >To fix this, we need to conditionally include/exclude files in
> >>>> >do_install depending on whether or not systemd is in the
> >>>DISTRO_FEATURES.
> >>>> >
> >>>> >Also, take the opportunity to have the relevant extra sed
> >>>> >processing in these conditionals.
> >>>> >
> >>>> >Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >>>> >
> >>>> >Change since v1:
> >>>> > * Added missing ${D} when removing unnecessary files.
> >>>> >---
> >>>> > recipes-extended/xen/xen-tools.inc | 20 ++++++++++++++------
> >>>> > 1 file changed, 14 insertions(+), 6 deletions(-)
> >>>> >
> >>>> >diff --git a/recipes-extended/xen/xen-tools.inc
> >>>> >b/recipes-extended/xen/xen- tools.inc index 6bbc8cd..4acf054 100644
> >>>> >--- a/recipes-extended/xen/xen-tools.inc
> >>>> >+++ b/recipes-extended/xen/xen-tools.inc
> >>>> >@@ -805,14 +805,22 @@ do_install() {
> >>>> >         for i in $VOLATILE_DIRS; do
> >>>> >             echo "d $i 0755 root root - -"  >>
> >>>${D}${sysconfdir}/tmpfiles.d/xen.conf
> >>>> >         done
> >>>> >-    fi
> >>>> >
> >>>> >-    # fixup default path to qemu-system-i386
> >>>> >-    sed -i 's#\(test -z "$QEMU_XEN" &&
> >>>QEMU_XEN=3D\).*$#\1"/usr/bin/qemu-
> >>>> >system-i386"#' ${D}/etc/init.d/xencommons
> >>>> >+        if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >>>> >backend.service ]; then
> >>>> >+            sed -i 's#ExecStart=3D.*qemu-system-
> >>>> >i386\(.*\)$#ExecStart=3D/usr/bin/qemu-system-i386\1#' \
> >>>> >+                ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >>>> >backend.service
> >>>> >+        fi
> >>>> >+
> >>>> >+        # remove sysvinit specific file:
> >>>> >+        rm -rf ${D}${sysconfdir}/init.d/xencommons
> >>>> >+
> >>>> >+    # sysvinit
> >>>> >+    else
> >>>> >+        # fixup default path to qemu-system-i386
> >>>> >+        sed -i 's#\(test -z "$QEMU_XEN" &&
> >>>> >+ QEMU_XEN=3D\).*$#\1"/usr/bin/qemu-system-i386"#'
> >>>> >+ ${D}/etc/init.d/xencommons
> >>>> >
> >>>> >-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >>>> >backend.service ]; then
> >>>> >-        sed -i 's#ExecStart=3D.*qemu-system-
> >>>> >i386\(.*\)$#ExecStart=3D/usr/bin/qemu-system-i386\1#' \
> >>>> >-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >>>backend.service
> >>>> >+        # remove systemd specific files
> >>>> >+        rm -rf ${D}${systemd_unitdir}
> >>>> >     fi
> >>>> > }
> >>>> >
> >>>> >--
> >>>> >2.35.1
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>--
> >>>- Thou shalt not follow the NULL pointer, for chaos and madness await
> >>>thee at its end
> >>>- "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B735C46467
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.2193.1650413735257273434
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 17:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gWgmGorv;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id ks6so291594ejb.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NoP+r9lVXTUzc/DTvxJA5puCmySC4v5tIlds8P717UY=;
        b=gWgmGorvvUko0hkvvepLt1PcEoL9CoxPcCGwDf43SJBu0q2Jc0CqZyCZsdI9xLdfJ/
         c96HNLV8fNsz4I2mlWQZ6cqPL079WMDgvwu2fF0tbzpZXBTztByDcAIQPqJJCnp5W02h
         He8BEmDe92IT+ojpvNgWNl86GAxV51E0tbxSVpIO866xpxGIpRTnbLU3M8M41X7Ehqsf
         vuq7aFLGRdhPqjObuT8+iMp03rtl3EkyUTeG7bSn5rDf+WLAPsPaey24ePv61nMdNGkP
         EXbRwaS3qId99t2RQFMuXBVU66zy3h/qmK1jYmWh7piXXkBjbvWie+W1QNazV/tFNkBu
         yJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NoP+r9lVXTUzc/DTvxJA5puCmySC4v5tIlds8P717UY=;
        b=xtUBXeqbceR/PMz2CMfMuqT/kmTYOskjCwITsReF947aVW340sJlXwvtW1ixg4XStY
         RKAs5gE/S1TaA6HNX0nklsLf9XuxVLUaQlLLVhFAXsCjJSoD7Nbvp281m2UWmxuM0bIk
         sYGCw5+dU8ORInliVUpEkZYTTggaiQ1eDgyMfsth+BnnUw90Kd1zaaTKTJcbqb2elkql
         NefVUOeELpI5yujM2Ab4p6tEiSawJxMdTcHB2xEsrT/faUr/PQDgb7kxMnHPl7Z0HBcg
         CAf9OmSOpp9jR7chyRTkjLtDH+cfVR2VUfmkU/XUqR3pRuC61h+oiWv9K86GtEK9tLYP
         54aw==
X-Gm-Message-State: AOAM532Q9fVBlweTFGYYYYXWVq6wHt/H6uPPDXfnl9jlHIhiL7lnQqR9
	kRbEQwVuSTQwCiqgw6918CHReydoC5Dt92pPHDQ=
X-Google-Smtp-Source: 
 ABdhPJxoXiKbtqIjLKilP3qxjWmqCUlHgc+OIsnL1d3kAdVOWM+0yHTZ4l8XEHKoq15uIHF9fWPPwcO39tIXzHzY9/A=
X-Received: by 2002:a17:907:86a3:b0:6ec:aaa:7f82 with SMTP id
 qa35-20020a17090786a300b006ec0aaa7f82mr15785482ejc.651.1650413733485; Tue, 19
 Apr 2022 17:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <16E75FCC13F8DB9E.24908@lists.yoctoproject.org>
 <VI1PR08MB3470D55C69E59D176411051592F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
 <CADkTA4NE1CJBbYnVhB8g8kbPEfhXtw8WQ+4FHq60QCz=kp7bKQ@mail.gmail.com>
 <16E762DD856665D2.8966@lists.yoctoproject.org>
 <VI1PR08MB3470BBF7904E49A5E2AC1B7192F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
 <VI1PR08MB3470733477CCFCB2B95464F192F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
 <16E76B3B75796758.23693@lists.yoctoproject.org>
In-Reply-To: <16E76B3B75796758.23693@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Apr 2022 20:15:22 -0400
Message-ID: 
 <CADkTA4N-Z+0mCMxCSaNGBkHujZa0w37ifT3XHbaAxa7GptDGNA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix
 xen-tools-xencommons do_package
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Diego Sueiro <Diego.Sueiro@arm.com>,
	"meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7201

On Tue, Apr 19, 2022 at 6:01 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Tue, Apr 19, 2022 at 4:38 PM Diego Sueiro <Diego.Sueiro@arm.com> wrote=
:
> >
> >
> >
> > --
> > Diego Sueiro
> > Staff Software Developer =E2=80=93 Automotive and Industrial Solutions =
(CE-OSS)
> >
> > >-----Original Message-----
> > >From: Diego Sueiro <Diego.Sueiro@arm.com>
> > >Sent: 19 April 2022 20:41
> > >To: Diego Sueiro <Diego.Sueiro@arm.com>; bruce.ashfield@gmail.com
> > >Cc: meta-virtualization@lists.yoctoproject.org;
> > >christopher.w.clark@gmail.com; nd <nd@arm.com>
> > >Subject: RE: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-
> > >xencommons do_package
> > >
> > >
> > >>-----Original Message-----
> > >>From: meta-virtualization@lists.yoctoproject.org <meta-
> > >>virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
> > >>lists.yoctoproject.org
> > >>Sent: 19 April 2022 20:28
> > >>To: bruce.ashfield@gmail.com
> > >>Cc: meta-virtualization@lists.yoctoproject.org;
> > >>christopher.w.clark@gmail.com; nd <nd@arm.com>
> > >>Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools=
-
> > >>xencommons do_package
> > >>
> > >>Hi Bruce,
> > >>
> > >>>-----Original Message-----
> > >>>From: meta-virtualization@lists.yoctoproject.org <meta-
> > >>>virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield v=
ia
> > >>>lists.yoctoproject.org
> > >>>Sent: 19 April 2022 20:17
> > >>>To: Diego Sueiro <Diego.Sueiro@arm.com>
> > >>>Cc: meta-virtualization@lists.yoctoproject.org;
> > >>>christopher.w.clark@gmail.com; nd <nd@arm.com>
> > >>>Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tool=
s-
> > >>>xencommons do_package
> > >>>
> > >>>On Tue, Apr 19, 2022 at 3:07 PM Diego Sueiro <diego.sueiro@arm.com>
> > >>wrote:
> > >>>>
> > >>>> Hi Bruce and Christopher,
> > >>>>
> > >>>> I'm not sure if this is the best solution, since after fixing the
> > >>>> xen-tools
> > >>>do_package, now I'm getting the following error on do_rootfs:
> > >>>> ```
> > >>>>   Installing       : xen-tools-xencommons-4.15+stable0+84fa99099b-=
r0.
> > >>>429/483
> > >>>>   Running scriptlet: xen-tools-xencommons-4.15+stable0+84fa99099b-=
r0.
> > >>>429/483
> > >>>> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a):
> > >>>> scriptlet start
> > >>>> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a):
> > >>>> execv(/bin/sh) pid 5408
> > >>>> + set -e
> > >>>> + systemctl
> > >>>> + OPTS=3D
> > >>>> + [ -n
> > >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ua
> > >>>> + l
> > >>>> + i
> > >>>> + zation-image/1.0-r0/rootfs ]
> > >>>> + OPTS=3D--root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-=
linux/
> > >>>> + e w aol-virtualization-image/1.0-r0/rootfs
> > >>>> + [ enable =3D enable ]
> > >>>> + systemctl
> > >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/e=
waol
> > >>>> + - v irtualization-image/1.0-r0/rootfs enable proc-xen.mount
> > >>>> + systemctl
> > >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/e=
waol
> > >>>> + - v irtualization-image/1.0-r0/rootfs enable
> > >>>> + var-lib-xenstored.mount systemctl
> > >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/e=
waol
> > >>>> + - v irtualization-image/1.0-r0/rootfs enable
> > >>>> + xen-qemu-dom0-disk-backend.service
> > >>>> ln -s /lib/systemd/system/xen-qemu-dom0-disk-backend.service
> > >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua=
li
> > >>>> z
> > >>>> a
> > >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.want=
s/
> > >>>> x
> > >>>> e
> > >>>> n-qemu-dom0-disk-backend.service
> > >>>> + systemctl
> > >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/e=
waol
> > >>>> + - v irtualization-image/1.0-r0/rootfs enable xenconsoled.service
> > >>>> ln -s /lib/systemd/system/xenconsoled.service
> > >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua=
li
> > >>>> z
> > >>>> a
> > >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.want=
s/
> > >>>> x
> > >>>> e
> > >>>> nconsoled.service
> > >>>> + systemctl
> > >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/e=
waol
> > >>>> + - v irtualization-image/1.0-r0/rootfs enable xen-init-dom0.servi=
ce
> > >>>> ln -s /lib/systemd/system/xen-init-dom0.service
> > >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua=
li
> > >>>> z
> > >>>> a
> > >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.want=
s/
> > >>>> x
> > >>>> e
> > >>>> n-init-dom0.service
> > >>>> + systemctl
> > >>>> + --root=3D/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/e=
waol
> > >>>> + - v irtualization-image/1.0-r0/rootfs enable xenstored.service
> > >>>> ln -s /lib/systemd/system/xenstored.service
> > >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua=
li
> > >>>> z
> > >>>> a
> > >>>> tion-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.want=
s/
> > >>>> x
> > >>>> e
> > >>>> nstored.service
> > >>>> + [ -z
> > >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ua
> > >>>> + l
> > >>>> + i
> > >>>> + zation-image/1.0-r0/rootfs ] [ -n
> > >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ua
> > >>>> + l i zation-image/1.0-r0/rootfs -o ! -d /run/systemd/system ] typ=
e
> > >>>> + update-rc.d [ -n
> > >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ua
> > >>>> + l i zation-image/1.0-r0/rootfs ] OPT=3D-r
> > >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ua
> > >>>> + l i zation-image/1.0-r0/rootfs update-rc.d -r
> > >>>> + /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virt=
ua
> > >>>> + l i zation-image/1.0-r0/rootfs xencommons defaults 80
> > >>>> update-rc.d:
> > >>>> /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtua=
li
> > >>>> z
> > >>>> a
> > >>>> tion-image/1.0-r0/rootfs/etc/init.d/xencommons: file does not exis=
t
> > >>>> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a):
> > >>>> waitpid(5408) rc 5408 status 100
> > >>>> warning: %post(xen-tools-xencommons-4.15+stable0+84fa99099b-
> > >>>r0.armv8a)
> > >>>> scriptlet failed, exit status 1
> > >>>>
> > >>>> Error in POSTIN scriptlet in rpm package xen-tools-xencommons
> > >>>>   Installing       : xen-tools-xen-watchdog-4.15+stable0+84fa99099=
b-r
> > >>>430/483
> > >>>>   Running scriptlet:
> > >>>> xen-tools-xen-watchdog-4.15+stable0+84fa99099b-r
> > >>>430/483
> > >>>> ```
> > >>>>
> > >>>> I guess that the "xen: only package xencommon systemd components i=
f
> > >>>systemd is enabled" (c9554c6) patch introduced the issues for
> > >>>do_package as well as do_rootfs.
> > >>>> Also, I never had the issue , at least using system, reported in t=
he
> > >>>> commit
> > >>>message. And as far as I understand systemd is capable of ignoring
> > >>>sysvinit scripts.
> > >>>>
> > >>>
> > >>>Are you building sysvinit when you see the errors you are trying to
> > >>>fix ? I've never seen them in either configuration here.
> > >>>
> > >>>I can confirm that it isn't ignoring them by default, and I had
> > >>>multiple reports of the serial port being setup twice, and causing
> > >>>runtime /
> > >>login errors.
> > >>>
> > >>>Bruce
> > >>
> > >>These are my current settings:
> > >>VIRTUAL-RUNTIME_init_manager=3D"systemd"
> > >>VIRTUAL-RUNTIME_initscripts=3D"initscripts"
> > >>DISTRO_FEATURES_BACKFILL_CONSIDERED=3D"sysvinit systemd"
> > >>DISTRO_FEATURES=3D"acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6
> > >>largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc
> > >>x11 vfat seccomp largefile opengl ptest multiarch wayland vulkan
> > >>virtualization ipv6 systemd seccomp k3s sysvinit  xen ptest"
> > >>
> > >
> > >I guess I'll have to set the INIT_MANAGER variable to systemd instead:
> > >https://git.yoctoproject.org/poky/commit/?id=3Da6ebbe3a10ff76386dde03d=
daa
> > >7097bdb2f5d9a5
> > >
> > >I started a build, lets see how it goes.
> >
> > I can confirm that by having INIT_MANAGER =3D "system" there are no iss=
ues for do_package and do_rootfs.
> > I'm sorry for the false alarm.
>
> Hmmm. It should be packaged regardless.  I have a build running, and
> will see if I can trigger the issue.

Looking at ti more closely, I do think there's an issue lurking in
some configurations.

My suggestion to fix things up is this:

https://git.yoctoproject.org/meta-virtualization/commit/?h=3Dmaster-next&id=
=3D51e404af981ab18391ca44d121fba71946abcc17

Where we just remove the init system files that we don't want .. which
matches the conditional packaging of xencommons

Bruce


>
> Bruce
>
> >
> > --
> > Diego
> >
> > >
> > >I'm just curious to see how will be the behaviour on the kirkstone bra=
nch.
> > >
> > >--
> > >Diego
> > >
> > >>
> > >>>
> > >>>>
> > >>>> --
> > >>>> Diego Sueiro
> > >>>> Staff Software Developer - Automotive and Industrial Solutions
> > >>>> (CE-OSS)
> > >>>>
> > >>>> >-----Original Message-----
> > >>>> >From: meta-virtualization@lists.yoctoproject.org <meta-
> > >>>> >virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro
> > >>>> >via lists.yoctoproject.org
> > >>>> >Sent: 19 April 2022 19:32
> > >>>> >To: meta-virtualization@lists.yoctoproject.org
> > >>>> >Cc: christopher.w.clark@gmail.com; nd <nd@arm.com>; Diego Sueiro
> > >>>> ><Diego.Sueiro@arm.com>
> > >>>> >Subject: [meta-virtualization][PATCH v2] xen-tools: Fix
> > >>>> >xen-tools-xencommons do_package
> > >>>> >
> > >>>> >With the patch "xen: only package xencommon systemd components if
> > >>>> >systemd is enabled" (c9554c6), the following error is displayed:
> > >>>> >
> > >>>> >    ERROR: xen-tools-4.15+stableAUTOINC+84fa99099b-r0 do_package:
> > >>>> >QA
> > >>>> >Issue:
> > >>>> >    xen-tools: Files/directories were installed but not shipped i=
n
> > >>>> >any
> > >>package:
> > >>>> >        /etc/init.d/xencommons
> > >>>> >
> > >>>> >To fix this, we need to conditionally include/exclude files in
> > >>>> >do_install depending on whether or not systemd is in the
> > >>>DISTRO_FEATURES.
> > >>>> >
> > >>>> >Also, take the opportunity to have the relevant extra sed
> > >>>> >processing in these conditionals.
> > >>>> >
> > >>>> >Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> > >>>> >
> > >>>> >Change since v1:
> > >>>> > * Added missing ${D} when removing unnecessary files.
> > >>>> >---
> > >>>> > recipes-extended/xen/xen-tools.inc | 20 ++++++++++++++------
> > >>>> > 1 file changed, 14 insertions(+), 6 deletions(-)
> > >>>> >
> > >>>> >diff --git a/recipes-extended/xen/xen-tools.inc
> > >>>> >b/recipes-extended/xen/xen- tools.inc index 6bbc8cd..4acf054 1006=
44
> > >>>> >--- a/recipes-extended/xen/xen-tools.inc
> > >>>> >+++ b/recipes-extended/xen/xen-tools.inc
> > >>>> >@@ -805,14 +805,22 @@ do_install() {
> > >>>> >         for i in $VOLATILE_DIRS; do
> > >>>> >             echo "d $i 0755 root root - -"  >>
> > >>>${D}${sysconfdir}/tmpfiles.d/xen.conf
> > >>>> >         done
> > >>>> >-    fi
> > >>>> >
> > >>>> >-    # fixup default path to qemu-system-i386
> > >>>> >-    sed -i 's#\(test -z "$QEMU_XEN" &&
> > >>>QEMU_XEN=3D\).*$#\1"/usr/bin/qemu-
> > >>>> >system-i386"#' ${D}/etc/init.d/xencommons
> > >>>> >+        if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk=
-
> > >>>> >backend.service ]; then
> > >>>> >+            sed -i 's#ExecStart=3D.*qemu-system-
> > >>>> >i386\(.*\)$#ExecStart=3D/usr/bin/qemu-system-i386\1#' \
> > >>>> >+                ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk=
-
> > >>>> >backend.service
> > >>>> >+        fi
> > >>>> >+
> > >>>> >+        # remove sysvinit specific file:
> > >>>> >+        rm -rf ${D}${sysconfdir}/init.d/xencommons
> > >>>> >+
> > >>>> >+    # sysvinit
> > >>>> >+    else
> > >>>> >+        # fixup default path to qemu-system-i386
> > >>>> >+        sed -i 's#\(test -z "$QEMU_XEN" &&
> > >>>> >+ QEMU_XEN=3D\).*$#\1"/usr/bin/qemu-system-i386"#'
> > >>>> >+ ${D}/etc/init.d/xencommons
> > >>>> >
> > >>>> >-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> > >>>> >backend.service ]; then
> > >>>> >-        sed -i 's#ExecStart=3D.*qemu-system-
> > >>>> >i386\(.*\)$#ExecStart=3D/usr/bin/qemu-system-i386\1#' \
> > >>>> >-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> > >>>backend.service
> > >>>> >+        # remove systemd specific files
> > >>>> >+        rm -rf ${D}${systemd_unitdir}
> > >>>> >     fi
> > >>>> > }
> > >>>> >
> > >>>> >--
> > >>>> >2.35.1
> > >>>>
> > >>>>
> > >>>>
> > >>>>
> > >>>
> > >>>
> > >>>--
> > >>>- Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > >>>thee at its end
> > >>>- "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7200): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7200
> Mute This Topic: https://lists.yoctoproject.org/mt/90568380/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


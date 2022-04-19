Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB92C46467
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.1111.1650395853001863855
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 12:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VtLATB06;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id g18so34888666ejc.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xtQ+Oyxxn/6dKevAwTyqLgfbvrsOXZNd297Qx2HpGKc=;
        b=VtLATB06tAa4sf3HMGLuAIPKvXGgme18Gf77A2Gm9MUDLWW6oU8QAfKzGOlGFfYVc1
         gTT/Lw5ox/119oJuow6Gj7e7YFyXf4J9/OjbiB8mhvhKDE290e+63tVqeAWgDDetxP61
         RTe9TPox/bBGZSII+TzBatz0ClkijW2B/NWXKqoqwoV9iLyn/9RDDF0pWLQ5Q4yOtoa9
         DbAwrv325tlC2ovfcAJgoEltcwznYth2eMbnoxReteKom+vK6+JVP31SRR05kE5uZDHP
         oT6XPBZu+iLwxR1ebUWS+OQg8S4dHVuFnSbSl+JY+6x7I7py5fVAa2i0EfeJcXzc3myO
         WeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xtQ+Oyxxn/6dKevAwTyqLgfbvrsOXZNd297Qx2HpGKc=;
        b=ybTnL2R72jWr6CC6wNsQrbvNaf8HDF7oX/qsoYlWSh9EqxBFwPLuwQx81CqRdpFe7u
         J5ML7ms+ZzDILEnNwpyRHN9PSzbu0upypiN0HMfxKz//mlGZTbgE7jYdLrg9bzVsnB6r
         Be767fj4GrMMXSVlPrk9gdn+gRc2zzFic/xXT3c+hmgSXr70p+waL+hkTWa7gZVlDn+m
         HW7dAMihIAMikZIobv1wU4p4zV+4kPQ2o5R4VvTJgFLY1MOAGipgBZid7pSCeryIn74c
         TKg9qylnRB7l1eCxb5/8pPPkiKLS9sOn0pONZE3I3TBwwpeA3Zu6VU5UWuYsdy97eQl7
         rxwA==
X-Gm-Message-State: AOAM533UQfpF839W3u3GGe1jCGi0RaF/pqagSRGlyFIv+OlRC+Tyfpf8
	KaRhnXQ122fLV6U6jXGlZACYCtNiUcnvvLjIcQM=
X-Google-Smtp-Source: 
 ABdhPJxLAUZcPuy9q1G8sab9oodIvZG1TvRg7eqkgWof4BvLkfvcJ4cwS8BnKpG9jMiHmLG6EVWDuCAvC51uhKCAASw=
X-Received: by 2002:a17:907:86a3:b0:6ec:aaa:7f82 with SMTP id
 qa35-20020a17090786a300b006ec0aaa7f82mr14799320ejc.651.1650395851324; Tue, 19
 Apr 2022 12:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <16E75FCC13F8DB9E.24908@lists.yoctoproject.org>
 <VI1PR08MB3470D55C69E59D176411051592F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
In-Reply-To: 
 <VI1PR08MB3470D55C69E59D176411051592F29@VI1PR08MB3470.eurprd08.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Apr 2022 15:17:20 -0400
Message-ID: 
 <CADkTA4NE1CJBbYnVhB8g8kbPEfhXtw8WQ+4FHq60QCz=kp7bKQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] xen-tools: Fix
 xen-tools-xencommons do_package
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>,
	"christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7196

On Tue, Apr 19, 2022 at 3:07 PM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> Hi Bruce and Christopher,
>
> I'm not sure if this is the best solution, since after fixing the xen-tools do_package, now I'm getting the following error on do_rootfs:
> ```
>   Installing       : xen-tools-xencommons-4.15+stable0+84fa99099b-r0.   429/483
>   Running scriptlet: xen-tools-xencommons-4.15+stable0+84fa99099b-r0.   429/483
> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a): scriptlet start
> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a): execv(/bin/sh) pid 5408
> + set -e
> + systemctl
> + OPTS=
> + [ -n /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs ]
> + OPTS=--root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs
> + [ enable = enable ]
> + systemctl --root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs enable proc-xen.mount
> + systemctl --root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs enable var-lib-xenstored.mount
> + systemctl --root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs enable xen-qemu-dom0-disk-backend.service
> ln -s /lib/systemd/system/xen-qemu-dom0-disk-backend.service /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/xen-qemu-dom0-disk-backend.service
> + systemctl --root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs enable xenconsoled.service
> ln -s /lib/systemd/system/xenconsoled.service /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/xenconsoled.service
> + systemctl --root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs enable xen-init-dom0.service
> ln -s /lib/systemd/system/xen-init-dom0.service /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/xen-init-dom0.service
> + systemctl --root=/[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs enable xenstored.service
> ln -s /lib/systemd/system/xenstored.service /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/systemd/system/multi-user.target.wants/xenstored.service
> + [ -z /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs ]
> + [ -n /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs -o ! -d /run/systemd/system ]
> + type update-rc.d
> + [ -n /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs ]
> + OPT=-r /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs
> + update-rc.d -r /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs xencommons defaults 80
> update-rc.d: /[...]/build/tmp_virtualization/work/n1sdp-poky-linux/ewaol-virtualization-image/1.0-r0/rootfs/etc/init.d/xencommons: file does not exist
> %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a): waitpid(5408) rc 5408 status 100
> warning: %post(xen-tools-xencommons-4.15+stable0+84fa99099b-r0.armv8a) scriptlet failed, exit status 1
>
> Error in POSTIN scriptlet in rpm package xen-tools-xencommons
>   Installing       : xen-tools-xen-watchdog-4.15+stable0+84fa99099b-r   430/483
>   Running scriptlet: xen-tools-xen-watchdog-4.15+stable0+84fa99099b-r   430/483
> ```
>
> I guess that the "xen: only package xencommon systemd components if systemd is enabled" (c9554c6) patch introduced the issues for do_package as well as do_rootfs.
> Also, I never had the issue , at least using system, reported in the commit message. And as far as I understand systemd is capable of ignoring sysvinit scripts.
>

Are you building sysvinit when you see the errors you are trying to
fix ? I've never seen them in either configuration here.

I can confirm that it isn't ignoring them by default, and I had
multiple reports of the serial port being setup twice, and causing
runtime / login errors.

Bruce

>
> --
> Diego Sueiro
> Staff Software Developer - Automotive and Industrial Solutions (CE-OSS)
>
> >-----Original Message-----
> >From: meta-virtualization@lists.yoctoproject.org <meta-
> >virtualization@lists.yoctoproject.org> On Behalf Of Diego Sueiro via
> >lists.yoctoproject.org
> >Sent: 19 April 2022 19:32
> >To: meta-virtualization@lists.yoctoproject.org
> >Cc: christopher.w.clark@gmail.com; nd <nd@arm.com>; Diego Sueiro
> ><Diego.Sueiro@arm.com>
> >Subject: [meta-virtualization][PATCH v2] xen-tools: Fix xen-tools-xencommons
> >do_package
> >
> >With the patch "xen: only package xencommon systemd components if
> >systemd is enabled" (c9554c6), the following error is displayed:
> >
> >    ERROR: xen-tools-4.15+stableAUTOINC+84fa99099b-r0 do_package: QA
> >Issue:
> >    xen-tools: Files/directories were installed but not shipped in any package:
> >        /etc/init.d/xencommons
> >
> >To fix this, we need to conditionally include/exclude files in do_install
> >depending on whether or not systemd is in the DISTRO_FEATURES.
> >
> >Also, take the opportunity to have the relevant extra sed processing in these
> >conditionals.
> >
> >Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >
> >Change since v1:
> > * Added missing ${D} when removing unnecessary files.
> >---
> > recipes-extended/xen/xen-tools.inc | 20 ++++++++++++++------
> > 1 file changed, 14 insertions(+), 6 deletions(-)
> >
> >diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-
> >tools.inc
> >index 6bbc8cd..4acf054 100644
> >--- a/recipes-extended/xen/xen-tools.inc
> >+++ b/recipes-extended/xen/xen-tools.inc
> >@@ -805,14 +805,22 @@ do_install() {
> >         for i in $VOLATILE_DIRS; do
> >             echo "d $i 0755 root root - -"  >> ${D}${sysconfdir}/tmpfiles.d/xen.conf
> >         done
> >-    fi
> >
> >-    # fixup default path to qemu-system-i386
> >-    sed -i 's#\(test -z "$QEMU_XEN" && QEMU_XEN=\).*$#\1"/usr/bin/qemu-
> >system-i386"#' ${D}/etc/init.d/xencommons
> >+        if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >backend.service ]; then
> >+            sed -i 's#ExecStart=.*qemu-system-
> >i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
> >+                ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >backend.service
> >+        fi
> >+
> >+        # remove sysvinit specific file:
> >+        rm -rf ${D}${sysconfdir}/init.d/xencommons
> >+
> >+    # sysvinit
> >+    else
> >+        # fixup default path to qemu-system-i386
> >+        sed -i 's#\(test -z "$QEMU_XEN" &&
> >+ QEMU_XEN=\).*$#\1"/usr/bin/qemu-system-i386"#'
> >+ ${D}/etc/init.d/xencommons
> >
> >-    if [ -e ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-
> >backend.service ]; then
> >-        sed -i 's#ExecStart=.*qemu-system-
> >i386\(.*\)$#ExecStart=/usr/bin/qemu-system-i386\1#' \
> >-            ${D}${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service
> >+        # remove systemd specific files
> >+        rm -rf ${D}${systemd_unitdir}
> >     fi
> > }
> >
> >--
> >2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7195): https://lists.yoctoproject.org/g/meta-virtualization/message/7195
> Mute This Topic: https://lists.yoctoproject.org/mt/90568380/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAB6C678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 04:00:47 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.14960.1678248039777593471
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 20:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QVSlqv8a;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id t129so6315699iof.12
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Mar 2023 20:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678248039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIgzIeHQ0+j2DZmRvn4P3SBFXgh3NJznxmaSs7g4/C8=;
        b=QVSlqv8a5AW6ArTMCay6VDLOyxzAXOeH69wzIP8+PMHC1apdj7/rYNoRcyr23D1AFU
         7dk4OzNFULtSixOLIu+nlZVprA4R1Z1/yByYeby0YWHFcA1rwQLPvxf9JlSwAp8uYTDd
         vpXoluqi/xgs93k+aOp6IIOZIMDocUaho1QJRtZP9zViV8fLMiUn3GXcRyf/00MPii6h
         m+dbrb1mBt+j6eA/azT+A5RdVyuBeJjr3MkbQA/qC/ZbwSc8ZlEBac1NvW8Rd7BaT3Js
         YPn7Qj2wYoU18RR8ATqySdAlJkKYIbrDreQo/NsB2gEWVWAfDeNUWFoAchHi1o+/Z6Q2
         7QQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678248039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIgzIeHQ0+j2DZmRvn4P3SBFXgh3NJznxmaSs7g4/C8=;
        b=Xn8UaT1dgUobgvR4xvLH7gE1AriuFMLZiIwXZ9YWaN/enrK0q/QJBW9gqdAi1Sk5VT
         L2NzbrTK8NfYilQdK7AnbObfUyEbcRFHmSU7ViwY16fJmwgy1bKrFxoAd1Z6hEMGuxfH
         doSK9Ar7zl+vF4bkOc3eIq0/kv8msPaFXfH2dxnvaMRCumv+xPipxNbmdRb/K+FA65Ie
         kFFpmatPvVxbbSbYby8noozEQK4k3QYFohAXaGnuSKx0k0OD7tLV8EIDB3MzlV5EFpSF
         b1LURwFCvFry54Tue6Ij9MSD9IFqw9FHmN2N7ayc+OpvDDF1TKytNDGJ6kRhl37okMzs
         wdbg==
X-Gm-Message-State: AO0yUKXGoI2HnIykM7t1h9m22/ZoS3tubkGx7GIMTqE+WroInWu4yXer
	/oKsZD2+uaVbC08bOOap537+3jE6yO6Lyll+ZjM=
X-Google-Smtp-Source: AK7set9jaob3uOj3A/zYQ1UMVSZa4Xseusy2YTUQflptdi2cjJdlpPGZdo7pZxAQ/HfIYgFxdxW1jH1Hciry3B3iFX0=
X-Received: by 2002:a05:6602:20c2:b0:745:4154:b571 with SMTP id
 2-20020a05660220c200b007454154b571mr7805456ioz.3.1678248038803; Tue, 07 Mar
 2023 20:00:38 -0800 (PST)
MIME-Version: 1.0
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
 <ZAEUIxX+2N+Xt6Ez@gmail.com> <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
In-Reply-To: <83fefae9-c822-bdd9-488e-b237c033fa38@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Mar 2023 23:00:27 -0500
Message-ID: <CADkTA4OjL+XfzVK5nKb3JfXfa++ifhgfwp2SOxNweRXrX99FNQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Mar 2023 04:00:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7934

On Thu, Mar 2, 2023 at 8:17=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> Hi Bruce,
>
>
> On 3/3/23 05:24, Bruce Ashfield wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > In message: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox=
.in: if busybox contains init then use it
> > on 01/03/2023 Xiangyu Chen wrote:
> >
> >> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >>
> >> Hi Bruce,
> >>
> >> Recently we found that the lxc ptest has lots of failure cases as belo=
w log-1, after checking the
> >> code, some cases failed due to related the init progess. For example, =
lxc-test-exit-code need to
> >> start container as daemon, but if using bash as init, the container ca=
nnot start correctly.
> > Is there an indication of what busybox is providing that bash isn't ?
>
> In my local setup, when using bash as container init, the container
> doesn't support "reboot" and cannot start correctly in a daemon mode,
> test step as below:
>
> lxc-create -t busybox -n t
>
> lxc-start -n t -d
>
> lxc-ls -f
>
> the container "t" status still in "STOPPED", but when we use a busybox
> init instead of bash, the container status is correct in daemon mode.
>

I'm setting up to test this myself, but generally speaking we should
include this detail in the commit log.

>
> >
> > I don't like to force this in the ptest, while for actual lxc container=
s
> > we still allow bash, which means it may not be functional.
>
> This is a common template for lxc, but I am not sure whether others
> still need bash as lxc container init, so I based the patch
>
> "template-make-busybox-template-compatible-with-core-.patch" to add the
> busybox back.
>

That's the part that concerns me. Why does our bash behave differently
than in other lxc integrations and other distros ?

Do you have the ability to run the same simple tests you have above on
a desktop distro ?

I don't want to force this switch to busybox, without understanding if
we are the only ones seeing this issue .. since that means we are
simply hiding an issue, versus fixing it.

Bruce
>
> >
> > There are other init options in meta-virt, like the docker tini, if we
> > had to enforce something, I'd rather that than busybox.
>
> Good to hear the tini :)
>
> Indeed, enable the busybox-init might need lots of additional effort to
> take care of system which using systemd, otherwise, /sbin/init always to
> be covered by busybox.
>
> >
> > Bruce
>
>
> Br,
>
> Xiangyu
>
>
> >> So added a busybox init utils checking in lxc-busybox template, if cur=
rent system busybox contains
> >> init then use it, after applying this patch, the ptest result as log-2=
.
> >>
> >>
> >> ######## 1og-1: ptest without patch #######
> >>
> >> Starting LXC ptest ###
> >> FAIL: lxc-test-api-reboot
> >> SKIPPED: lxc-test-apparmor
> >> PASS: lxc-test-apparmor-generated
> >> FAIL: lxc-test-apparmor-mount
> >> PASS: lxc-test-arch-parse
> >> FAIL: lxc-test-attach
> >> PASS: lxc-test-automount
> >> FAIL: lxc-test-autostart
> >> PASS: lxc-test-basic
> >> FAIL: lxc-test-capabilities
> >> FAIL: lxc-test-cgpath
> >> PASS: lxc-test-checkpoint-restore
> >> FAIL: lxc-test-cloneconfig
> >> FAIL: lxc-test-clonetest
> >> FAIL: lxc-test-concurrent
> >> PASS: lxc-test-config-jump-table
> >> FAIL: lxc-test-console
> >> FAIL: lxc-test-console-log
> >> FAIL: lxc-test-containertests
> >> FAIL: lxc-test-createconfig
> >> FAIL: lxc-test-createtest
> >> PASS: lxc-test-criu-check-feature
> >> FAIL: lxc-test-cve-2019-5736
> >> FAIL: lxc-test-destroytest
> >> FAIL: lxc-test-device-add-remove
> >> FAIL: lxc-test-exit-code
> >> FAIL: lxc-test-get_item
> >> PASS: lxc-test-getkeys
> >> PASS: lxc-test-list
> >> PASS: lxc-test-locktests
> >> FAIL: lxc-test-lxc-attach
> >> PASS: lxc-test-lxcpath
> >> PASS: lxc-test-may-control
> >> FAIL: lxc-test-mount-injection
> >> FAIL: lxc-test-no-new-privs
> >> PASS: lxc-test-parse-config-file
> >> FAIL: lxc-test-proc-pid
> >> FAIL: lxc-test-procsys
> >> PASS: lxc-test-raw-clone
> >> PASS: lxc-test-reboot
> >> FAIL: lxc-test-rootfs
> >> FAIL: lxc-test-rootfs-options
> >> FAIL: lxc-test-saveconfig
> >> FAIL: lxc-test-share-ns
> >> FAIL: lxc-test-shortlived
> >> SKIPPED: lxc-test-shutdowntest
> >> FAIL: lxc-test-snapdeps
> >> FAIL: lxc-test-snapshot
> >> FAIL: lxc-test-startone
> >> SKIPPED: lxc-test-state-server
> >> FAIL: lxc-test-symlink
> >> FAIL: lxc-test-sys-mixed
> >> FAIL: lxc-test-sysctls
> >> FAIL: lxc-test-unpriv
> >> FAIL: lxc-test-usernic
> >> PASS: lxc-test-usernsexec
> >> PASS: lxc-test-utils
> >>
> >>
> >>
> >>
> >>
> >> Results:
> >>      PASSED =3D 17
> >>      FAILED =3D 37
> >>      SKIPPED =3D 3
> >> (for details check individual test log in ./logs directory)
> >>
> >>
> >> ###########log-2: ptest with patch ###################
> >> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
> >> ### Starting LXC ptest ###
> >> PASS: lxc-test-api-reboot
> >> SKIPPED: lxc-test-apparmor
> >> PASS: lxc-test-apparmor-generated
> >> FAIL: lxc-test-apparmor-mount
> >> PASS: lxc-test-arch-parse
> >> PASS: lxc-test-attach
> >> PASS: lxc-test-automount
> >> PASS: lxc-test-autostart
> >> PASS: lxc-test-basic
> >> PASS: lxc-test-capabilities
> >> PASS: lxc-test-cgpath
> >> PASS: lxc-test-checkpoint-restore
> >> FAIL: lxc-test-cloneconfig
> >> PASS: lxc-test-clonetest
> >> PASS: lxc-test-concurrent
> >> PASS: lxc-test-config-jump-table
> >> PASS: lxc-test-console
> >> PASS: lxc-test-console-log
> >> PASS: lxc-test-containertests
> >> PASS: lxc-test-createconfig
> >> PASS: lxc-test-createtest
> >> PASS: lxc-test-criu-check-feature
> >> PASS: lxc-test-cve-2019-5736
> >> PASS: lxc-test-destroytest
> >> PASS: lxc-test-device-add-remove
> >> PASS: lxc-test-exit-code
> >> FAIL: lxc-test-get_item
> >> PASS: lxc-test-getkeys
> >> PASS: lxc-test-list
> >> PASS: lxc-test-locktests
> >> PASS: lxc-test-lxc-attach
> >> PASS: lxc-test-lxcpath
> >> PASS: lxc-test-may-control
> >> PASS: lxc-test-mount-injection
> >> FAIL: lxc-test-no-new-privs
> >> PASS: lxc-test-parse-config-file
> >> PASS: lxc-test-proc-pid
> >> PASS: lxc-test-procsys
> >> PASS: lxc-test-raw-clone
> >> PASS: lxc-test-reboot
> >> PASS: lxc-test-rootfs
> >> PASS: lxc-test-rootfs-options
> >> PASS: lxc-test-saveconfig
> >> PASS: lxc-test-share-ns
> >> PASS: lxc-test-shortlived
> >> SKIPPED: lxc-test-shutdowntest
> >> FAIL: lxc-test-snapdeps
> >> PASS: lxc-test-snapshot
> >> PASS: lxc-test-startone
> >> SKIPPED: lxc-test-state-server
> >> PASS: lxc-test-symlink
> >> PASS: lxc-test-sys-mixed
> >> PASS: lxc-test-sysctls
> >> FAIL: lxc-test-unpriv
> >> FAIL: lxc-test-usernic
> >> PASS: lxc-test-usernsexec
> >> PASS: lxc-test-utils
> >>
> >> Results:
> >>      PASSED =3D 47
> >>      FAILED =3D 7
> >>      SKIPPED =3D 3
> >> (for details check individual test log in ./logs directory)
> >>
> >>
> >>
> >>
> >> Xiangyu Chen (1):
> >>    lxc: templates/lxc-busybox.in: if busybox contains init then use it
> >>
> >>   ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++++++++=
++
> >>   recipes-containers/lxc/lxc_git.bb             |  1 +
> >>   2 files changed, 46 insertions(+)
> >>   create mode 100644 recipes-containers/lxc/files/0001-template-if-bus=
ybox-contains-init-use-it-in-containe.patch
> >>
> >> --
> >> 2.34.1
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-virtu=
alization/message/7908
> >> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/1050810
> >> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> >> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsu=
b [bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


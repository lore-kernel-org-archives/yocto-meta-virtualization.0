Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D99CC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 19:42:50 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.29407.1679082162918108986
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 12:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmZZtNvE;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id s4so2764921ioj.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679082162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mRA6B/kTtI/3+/V0oJ9YuvgFxfzgVBTskWwFJ+eb2o=;
        b=MmZZtNvE3d3LtW4f/k6T6TDp2+6SlTMaWMQBezBWjZOYp6KH20ALrmgJ2IMn7i9qsZ
         ihJDngt648Z93LPxacqltVaO4KLJnyQONZiQqFNbZX7X0Ss1Sc+3kBESRxeMYoPb/rmq
         dPc2mVbm4/maLEp221hIyRElei1iaAcicynlTcVnI8+lRbKoz+VxgyL6I8pj1EVb3UW8
         CvE5gRsTF36F1l/tXugwH48HbFHQFhvrrgUpx8hw4CG8N7BOf95SG4pu+HU2j6gJdSMb
         zroIJK+UQzxnUH76+cd6EcbLE7QwQwzmSWIF34jqpgeQ+15vJMqwwbXKWK/OX6o4W8lW
         Qsfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679082162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mRA6B/kTtI/3+/V0oJ9YuvgFxfzgVBTskWwFJ+eb2o=;
        b=QMYj24ELQU0zA2F73kpDePkYuuRDS5/6kArl4CIBmxB0+QTQdcG0PbPuB5mX6HwSDl
         6sEHkDjXZHqCiCgBlEnLCHKPFaju8vcipUrfhAqrFfR5Og56SJAFYwEiGM+q7bIXb0My
         5tGJKLs65SR2b8syco31XeLPI6M7DHIXJWPwvVGvN2C18M1iyXHmCv/8OgINJPNCnnb5
         oicLOVBZWuiv7OiFMpiuK8KeGAU/B2XKagm3diPnKAXZVHDu9liAP8dnssq1GL/W6hEu
         RuDFG9ztPqtzPd+X8Dm8eYnN3ezS4tikNR5XAExjDkBRZtcl7+UQQLppVPLt994t+3Tl
         8mSw==
X-Gm-Message-State: AO0yUKU8uJAbX4l7qBBngthiaGCTSK4vvU8fnkGPwrsdu1A0/8YufVaB
	jiwXhYpE09qkDsDWQmhV/y4U0LlPz0gdEMnkzs4obvn/0QA=
X-Google-Smtp-Source: AK7set983+evUbsRKSuQ2FOr9qhqJM23wRkpoFyt6eq2E3DrI+mU9rGVOgI2xdMTTSJ0f0nE7yFo8CFFrrYD61Utg/k=
X-Received: by 2002:a05:6602:148f:b0:751:96ce:ed7d with SMTP id
 a15-20020a056602148f00b0075196ceed7dmr303445iow.1.1679082162049; Fri, 17 Mar
 2023 12:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20230301023825.124974-1-xiangyu.chen@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 17 Mar 2023 15:42:30 -0400
Message-ID: <CADkTA4PjSNKpMs9Lk+oY464+j22Rzgi2faX-=0XTQdgBPjppAw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/1] lxc: templates/lxc-busybox.in:
 if busybox contains init then use it
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Mar 2023 19:42:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7948

This didn't apply cleanly to master-next, but I resolved the conflict
and pushed it to master-next.

I'm testing now.

If I missed an older patch, or otherwise dropped something to mix up
the context, please send new patches.

Bruce


On Tue, Feb 28, 2023 at 9:38=E2=80=AFPM Xiangyu Chen
<xiangyu.chen@eng.windriver.com> wrote:
>
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> Hi Bruce,
>
> Recently we found that the lxc ptest has lots of failure cases as below l=
og-1, after checking the
> code, some cases failed due to related the init progess. For example, lxc=
-test-exit-code need to
> start container as daemon, but if using bash as init, the container canno=
t start correctly.
>
> So added a busybox init utils checking in lxc-busybox template, if curren=
t system busybox contains
> init then use it, after applying this patch, the ptest result as log-2.
>
>
> ######## 1og-1: ptest without patch #######
>
> Starting LXC ptest ###
> FAIL: lxc-test-api-reboot
> SKIPPED: lxc-test-apparmor
> PASS: lxc-test-apparmor-generated
> FAIL: lxc-test-apparmor-mount
> PASS: lxc-test-arch-parse
> FAIL: lxc-test-attach
> PASS: lxc-test-automount
> FAIL: lxc-test-autostart
> PASS: lxc-test-basic
> FAIL: lxc-test-capabilities
> FAIL: lxc-test-cgpath
> PASS: lxc-test-checkpoint-restore
> FAIL: lxc-test-cloneconfig
> FAIL: lxc-test-clonetest
> FAIL: lxc-test-concurrent
> PASS: lxc-test-config-jump-table
> FAIL: lxc-test-console
> FAIL: lxc-test-console-log
> FAIL: lxc-test-containertests
> FAIL: lxc-test-createconfig
> FAIL: lxc-test-createtest
> PASS: lxc-test-criu-check-feature
> FAIL: lxc-test-cve-2019-5736
> FAIL: lxc-test-destroytest
> FAIL: lxc-test-device-add-remove
> FAIL: lxc-test-exit-code
> FAIL: lxc-test-get_item
> PASS: lxc-test-getkeys
> PASS: lxc-test-list
> PASS: lxc-test-locktests
> FAIL: lxc-test-lxc-attach
> PASS: lxc-test-lxcpath
> PASS: lxc-test-may-control
> FAIL: lxc-test-mount-injection
> FAIL: lxc-test-no-new-privs
> PASS: lxc-test-parse-config-file
> FAIL: lxc-test-proc-pid
> FAIL: lxc-test-procsys
> PASS: lxc-test-raw-clone
> PASS: lxc-test-reboot
> FAIL: lxc-test-rootfs
> FAIL: lxc-test-rootfs-options
> FAIL: lxc-test-saveconfig
> FAIL: lxc-test-share-ns
> FAIL: lxc-test-shortlived
> SKIPPED: lxc-test-shutdowntest
> FAIL: lxc-test-snapdeps
> FAIL: lxc-test-snapshot
> FAIL: lxc-test-startone
> SKIPPED: lxc-test-state-server
> FAIL: lxc-test-symlink
> FAIL: lxc-test-sys-mixed
> FAIL: lxc-test-sysctls
> FAIL: lxc-test-unpriv
> FAIL: lxc-test-usernic
> PASS: lxc-test-usernsexec
> PASS: lxc-test-utils
>
>
>
>
>
> Results:
>     PASSED =3D 17
>     FAILED =3D 37
>     SKIPPED =3D 3
> (for details check individual test log in ./logs directory)
>
>
> ###########log-2: ptest with patch ###################
> root@intel-x86-64:/usr/lib64/lxc/ptest# ./run-ptest
> ### Starting LXC ptest ###
> PASS: lxc-test-api-reboot
> SKIPPED: lxc-test-apparmor
> PASS: lxc-test-apparmor-generated
> FAIL: lxc-test-apparmor-mount
> PASS: lxc-test-arch-parse
> PASS: lxc-test-attach
> PASS: lxc-test-automount
> PASS: lxc-test-autostart
> PASS: lxc-test-basic
> PASS: lxc-test-capabilities
> PASS: lxc-test-cgpath
> PASS: lxc-test-checkpoint-restore
> FAIL: lxc-test-cloneconfig
> PASS: lxc-test-clonetest
> PASS: lxc-test-concurrent
> PASS: lxc-test-config-jump-table
> PASS: lxc-test-console
> PASS: lxc-test-console-log
> PASS: lxc-test-containertests
> PASS: lxc-test-createconfig
> PASS: lxc-test-createtest
> PASS: lxc-test-criu-check-feature
> PASS: lxc-test-cve-2019-5736
> PASS: lxc-test-destroytest
> PASS: lxc-test-device-add-remove
> PASS: lxc-test-exit-code
> FAIL: lxc-test-get_item
> PASS: lxc-test-getkeys
> PASS: lxc-test-list
> PASS: lxc-test-locktests
> PASS: lxc-test-lxc-attach
> PASS: lxc-test-lxcpath
> PASS: lxc-test-may-control
> PASS: lxc-test-mount-injection
> FAIL: lxc-test-no-new-privs
> PASS: lxc-test-parse-config-file
> PASS: lxc-test-proc-pid
> PASS: lxc-test-procsys
> PASS: lxc-test-raw-clone
> PASS: lxc-test-reboot
> PASS: lxc-test-rootfs
> PASS: lxc-test-rootfs-options
> PASS: lxc-test-saveconfig
> PASS: lxc-test-share-ns
> PASS: lxc-test-shortlived
> SKIPPED: lxc-test-shutdowntest
> FAIL: lxc-test-snapdeps
> PASS: lxc-test-snapshot
> PASS: lxc-test-startone
> SKIPPED: lxc-test-state-server
> PASS: lxc-test-symlink
> PASS: lxc-test-sys-mixed
> PASS: lxc-test-sysctls
> FAIL: lxc-test-unpriv
> FAIL: lxc-test-usernic
> PASS: lxc-test-usernsexec
> PASS: lxc-test-utils
>
> Results:
>     PASSED =3D 47
>     FAILED =3D 7
>     SKIPPED =3D 3
> (for details check individual test log in ./logs directory)
>
>
>
>
> Xiangyu Chen (1):
>   lxc: templates/lxc-busybox.in: if busybox contains init then use it
>
>  ...box-contains-init-use-it-in-containe.patch | 45 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-template-if-busybox=
-contains-init-use-it-in-containe.patch
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7908): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7908
> Mute This Topic: https://lists.yoctoproject.org/mt/97306618/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


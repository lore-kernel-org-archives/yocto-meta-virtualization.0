Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.28192.1601260959577382929
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Sep 2020 19:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FJ7gvvGw;
 spf=softfail (domain: gmail.com, ip: 198.145.29.25, mailfrom: bruce.ashfield@gmail.com)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 6173C38C0858
	for <meta-virtualization@yoctoproject.org>; Sun, 27 Sep 2020 19:42:38 -0700 (PDT)
Received: by mail-ej1-f67.google.com with SMTP id lo4so6387544ejb.8
        for <meta-virtualization@yoctoproject.org>; Sun, 27 Sep 2020 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cO3Au+t3eXbPApUAihLpklCbqOLBHYvTazcDsFa5i+c=;
        b=FJ7gvvGwoXhmLEQXBj8e5r67928WqKuMV2pqy0HAGvp71l7O/EfnUDFOhwU3GIzs2o
         h+RWCxNi/BbkPhIB6VB1tCGn9fVqbL9tapPwzwIinfqm8UkOIQSxXUEeqG5AOafALsyP
         1IkEwMU6NLND39ghT5SR4AKXtKwAgHHdoG2UhZM+q1yGg76+gNRk/zLiTsocHFKa1kX+
         qqeQuNqHufRy7ft9FBPHzSdNMgdvVsXVuvZieMMUbZIEVDN5ggNoN3WoOgxKuTDaRZ8X
         63wnySuWahGZ5AJBeZEtjhfKboW3RRNJHHHiqIFCoqKPc09NSTN9Lcdx/zOCRaNFJ2Ol
         JOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cO3Au+t3eXbPApUAihLpklCbqOLBHYvTazcDsFa5i+c=;
        b=BKoq7qR+FvQpFeI4ViFVlUv+HOu/RPOiwRV48OyCNK3JnUVQL2PftAJt/OM4YR+20W
         BSq+wBeDd9x7FwJPIc6LgWjwZd9w+NKY0Lhq0YrfI25YK3dcWktfK1c2VWe7YujYhrcK
         ouSShn5CPz6WLR+6319DSisljweqRY6SFql2xF1Rz4iKE34MJ/IYJrJhjsPxhHVQ0rtb
         +BmV/OxFrz9C/Bs+kx8Kv5OGWuIhzSZidk5V5OIrRV6FulkRsMAnWQdrSGcPhECuHJOB
         maXp7sB2T7/7309r6wt1VRynDk6LE1ERF996lumwKDJ1w466otADTJPtS0GtdgbasJj5
         csqw==
X-Gm-Message-State: AOAM533v6G0Aghtas4fr9UYFYNETbH2uslGFIqRV/oMuOvZoSMQNEJAh
	0SSyTOC8X0KdzfeAVq6Xis/jUBioBp9REYhJj98=
X-Google-Smtp-Source: ABdhPJwdZ45dWeAkhTJJpfWoGzpD+nn8X5Q1Ctf7V0wu4p3+ea+ZuTDXZ7aZbJzwy/TrtJ+nizZNvf7w2w3Nc1MRhYQ=
X-Received: by 2002:a17:906:a2cf:: with SMTP id by15mr205011ejb.298.1601260956865;
 Sun, 27 Sep 2020 19:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <16370E1C8879D0E3.12779@lists.yoctoproject.org>
 <20200923075309.46978-1-mingli.yu@windriver.com> <CADkTA4NfOEhuR1JWWkJPAZvNKU6kk_Prz9kejRwBYefqxsFo_g@mail.gmail.com>
 <e3483726-1d87-f7f6-0ff2-515e94ba4ff1@windriver.com>
In-Reply-To: <e3483726-1d87-f7f6-0ff2-515e94ba4ff1@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 27 Sep 2020 22:42:25 -0400
Message-ID: <CADkTA4MWs1Bd2Yn-QEkUbn4rzNuCK-D9pUu=AzQdWRO7omw1xA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2] lxc: remove deprecated options in lxc*.service
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 9:40 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Bruce,
>
> On 9/23/20 8:40 PM, Bruce Ashfield wrote:
> > On Wed, Sep 23, 2020 at 3:54 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> Remove deprecated options in lxc*.service to silence below warning:
> >>   # systemctl status lxc
> >>   [snip]
> >>   /usr/lib/systemd/system/lxc.service:17: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
> >>   /usr/lib/systemd/system/lxc.service:18: Standard output type syslog is obsolete, automatically updating to journal. Please update your unit file, and consider removing the setting altogether.
> >
> > What's the delta to v1 ?
>

This should be logged in the temporary section of the patch, that way
I can track what is changing through a series.

That being said, I went to apply this patch, and it isn't against the
lxc version that we have in master.

Can you update and resubmit ?

Bruce

> The v1 only have one patch
>    file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>
>
> And the v2 have the below two patch files.
>   file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
>   file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
>
> Thanks,
>
> >
> > Bruce
> >
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   ...setting-regarding-the-Standard-Outpu.patch | 35 +++++++++++++++++++
> >>   ...ed-options-in-lxc.service-fixes-3527.patch | 31 ++++++++++++++++
> >>   recipes-containers/lxc/lxc_4.0.2.bb           |  2 ++
> >>   3 files changed, 68 insertions(+)
> >>   create mode 100644 recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> >>   create mode 100644 recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> >>
> >> diff --git a/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> >> new file mode 100644
> >> index 0000000..ab97422
> >> --- /dev/null
> >> +++ b/recipes-containers/lxc/files/0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch
> >> @@ -0,0 +1,35 @@
> >> +From a7a92a06a47322dee45664db5c7bfa68b2b95edb Mon Sep 17 00:00:00 2001
> >> +From: Mingli Yu <mingli.yu@windriver.com>
> >> +Date: Wed, 23 Sep 2020 07:03:02 +0000
> >> +Subject: [PATCH] Remove obsolete setting regarding the Standard Output
> >> +
> >> +The Standard output type "syslog" is obsolete, causing a warning since systemd
> >> +version 246 [1].
> >> +
> >> +Please consider using "journal" or "journal+console"
> >> +
> >> +[1] https://github.com/systemd/systemd/blob/master/NEWS#L202
> >> +
> >> +Upstream-Status: Submitted [https://github.com/lxc/lxc/pull/3541]
> >> +
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + config/init/systemd/lxc@.service.in         | 2 --
> >> + 1 files changed, 2 deletions(-)
> >> +
> >> +diff --git a/config/init/systemd/lxc@.service.in b/config/init/systemd/lxc@.service.in
> >> +index a2aa2211f..21ce64aef 100644
> >> +--- a/config/init/systemd/lxc@.service.in
> >> ++++ b/config/init/systemd/lxc@.service.in
> >> +@@ -14,8 +14,6 @@ ExecStop=@BINDIR@/lxc-stop -n %i
> >> + # Environment=BOOTUP=serial
> >> + # Environment=CONSOLETYPE=serial
> >> + Delegate=yes
> >> +-StandardOutput=syslog
> >> +-StandardError=syslog
> >> +
> >> + [Install]
> >> + WantedBy=multi-user.target
> >> +--
> >> +2.26.2
> >> +
> >> diff --git a/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> >> new file mode 100644
> >> index 0000000..2957680
> >> --- /dev/null
> >> +++ b/recipes-containers/lxc/files/0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch
> >> @@ -0,0 +1,31 @@
> >> +From 0c4cd88d4a19d27ba9b5d2c8fa4d482d78211c35 Mon Sep 17 00:00:00 2001
> >> +From: graysky <graysky@archlinux.us>
> >> +Date: Fri, 21 Aug 2020 06:33:49 -0400
> >> +Subject: [PATCH] remove deprecated options in lxc.service fixes #3527
> >> +
> >> +Remove deprecated options in lxc.service fixes #3527
> >> +
> >> +Upstream-Status: Backport
> >> +
> >> +Signed-off-by: graysky <graysky@archlinux.us>
> >> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> +---
> >> + config/init/systemd/lxc.service.in | 2 --
> >> + 1 file changed, 2 deletions(-)
> >> +
> >> +diff --git a/config/init/systemd/lxc.service.in b/config/init/systemd/lxc.service.in
> >> +index e3745dc2d..397a6c4d0 100644
> >> +--- a/config/init/systemd/lxc.service.in
> >> ++++ b/config/init/systemd/lxc.service.in
> >> +@@ -14,8 +14,6 @@ ExecReload=@LIBEXECDIR@/lxc/lxc-apparmor-load
> >> + # Environment=BOOTUP=serial
> >> + # Environment=CONSOLETYPE=serial
> >> + Delegate=yes
> >> +-StandardOutput=syslog
> >> +-StandardError=syslog
> >> +
> >> + [Install]
> >> + WantedBy=multi-user.target
> >> +--
> >> +2.26.2
> >> +
> >> diff --git a/recipes-containers/lxc/lxc_4.0.2.bb b/recipes-containers/lxc/lxc_4.0.2.bb
> >> index d0ead81..ead6bb2 100644
> >> --- a/recipes-containers/lxc/lxc_4.0.2.bb
> >> +++ b/recipes-containers/lxc/lxc_4.0.2.bb
> >> @@ -47,6 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
> >>          file://templates-use-curl-instead-of-wget.patch \
> >>          file://tests-our-init-is-not-busybox.patch \
> >>          file://tests-add-no-validate-when-using-download-template.patch \
> >> +       file://0001-remove-deprecated-options-in-lxc.service-fixes-3527.patch \
> >> +       file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
> >>          file://dnsmasq.conf \
> >>          file://lxc-net \
> >>          "
> >> --
> >> 2.26.2
> >>
> >>
> >> 
> >>
> >
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F0C0C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:07:15 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.936.1642442834476533829
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fQ6Yw0Bs;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id j7so20565664edr.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4JUeQ2SkOV+t9VH9Fcl/ZVkpSfa+jY4uqM8V7MiwBSw=;
        b=fQ6Yw0BsEFJkqd6SFNmMr9+7K8a6WchI/E+lA4mvoykcm9yWuwjjFrKDrQX0eSH+tq
         vC3xI9zy9KXgB2OqfJpe3Uyg/6SjTHlxbTXe1f1HmO4Xmbh2KQU7e/wDaJfos4KW/zm7
         dk6mctwzaPvxL6Y52kMZRkKkwgYeX0V8ZsyedMGBmSqEg2mz6tXiHpFjmznjZdNiuDjf
         OfuBDkDrWqmbh58d38F4caBsPit/q03Xiz2OM4oDloekGqTQgtZyy8AW/nL1DDrCBQdX
         eulaaPItugdmRVs7xfJR7jxGEYcKJYEjFNycxM9O/qtrfNdZzbmct+kcYsSjZ3FNrI67
         5Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4JUeQ2SkOV+t9VH9Fcl/ZVkpSfa+jY4uqM8V7MiwBSw=;
        b=h8ZoDx1Q2dEr4PEn3d2jusCt+K3WZZcT1OWiNrzIg62hYxy2uAIX4sfRRPPCHmtsD5
         fsyv+cV74S7NwPW5kknZFNLiOVNrYqS56AZlg2BzU0wYSyfsuZgI4B3cvYx4mwIZ6Elb
         swRHeWRzIWK3ADGgnd0pXtBE6E23f2CnBwyQpivSX20ELQCNToeX386KoRW3GydO1BBY
         RUecLhMO46ec6EBFJgS2bF3DZN+OeBdBUYW4oaunLHEIIG+IkNG84Ljh6aTt0RNbVjfE
         0HSYojKWFWZyUQoXjZ43v1AjseOWB9Oo3hraCgiHr4rWY+FTw6tS7hhRCCMiWUd+VzdE
         3kzg==
X-Gm-Message-State: AOAM533Mp2KULbBLtPE1f0k39/D2e0i21lsxTLAfKpjgCLtc7N/cOqTj
	dLHAm1dPoqGr+cEkUyTryQdeQpVpAD4vWXbgGDY=
X-Google-Smtp-Source: 
 ABdhPJwEE1PupTLhEscf+sFRdD5sac1IpoT0uzSlAFK0WfmVz1lvVZ6njB3bjdMyUoHOCi9DoQXjpNBzjpczpatkW9E=
X-Received: by 2002:a17:906:2cd5:: with SMTP id
 r21mr18163509ejr.435.1642442832783;
 Mon, 17 Jan 2022 10:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20220117125827.464599-1-ross.burton@arm.com>
 <16CB123A6CD49E87.30851@lists.yoctoproject.org>
In-Reply-To: <16CB123A6CD49E87.30851@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Jan 2022 13:07:01 -0500
Message-ID: 
 <CADkTA4MR63ejM49VXLaBz_AeK60Xk0kEJ8E1dQ7CPSTAvOkQVg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: fix packaging by using
 setuptools
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
 meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 17 Jan 2022 18:07:15 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7011

On Mon, Jan 17, 2022 at 8:35 AM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Jan 17, 2022 at 7:58 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > Inheriting setuptools3-base doesn't actually define any tasks, so commit
> > 1ef6050 to drop distutils3 had the side-effect of not building any code.
> >
> > Backport a commit from upstream to switch to setuptools, inherit
> > setuptool3, and change DISTUTILS_SETUP_PATH to SETUPTOOLS_SETUP_PATH.
> >
>
> I have a SRCREV bump ready to go for dtc, so I've applied this and
> then the bump on top.

Your change + my update are now queued:

https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=ed4bd1de0d2e040c303a8497ac0cd961aa8b8a7b

If you have any cycles for test build, that would be great .. since
somehow my own build didn't notice the empty package, so I can't say I
fully trust it.

Bruce

>
> Bruce
>
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  recipes-kernel/dtc/files/setuptools.patch | 34 +++++++++++++++++++++++
> >  recipes-kernel/dtc/python3-dtc_1.6.1.bb   |  7 +++--
> >  2 files changed, 38 insertions(+), 3 deletions(-)
> >  create mode 100644 recipes-kernel/dtc/files/setuptools.patch
> >
> > diff --git a/recipes-kernel/dtc/files/setuptools.patch b/recipes-kernel/dtc/files/setuptools.patch
> > new file mode 100644
> > index 0000000..3d37ebd
> > --- /dev/null
> > +++ b/recipes-kernel/dtc/files/setuptools.patch
> > @@ -0,0 +1,34 @@
> > +Upstream-Status: Backport
> > +Signed-off-by: Ross Burton <ross.burton@arm.com>
> > +
> > +From c691776ddb26acbd3674722caafacaf7b6e3e807 Mon Sep 17 00:00:00 2001
> > +From: Rob Herring <robh@kernel.org>
> > +Date: Wed, 10 Nov 2021 19:11:32 -0600
> > +Subject: [PATCH] pylibfdt: Use setuptools instead of distutils
> > +
> > +The use of setuptools is favored over distutils. setuptools is needed to
> > +support building Python 'wheels' and for pip support.
> > +
> > +Signed-off-by: Rob Herring <robh@kernel.org>
> > +Message-Id: <20211111011135.2386773-2-robh@kernel.org>
> > +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> > +---
> > + pylibfdt/setup.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> > +index ef40f15..f065a59 100755
> > +--- a/pylibfdt/setup.py
> > ++++ b/pylibfdt/setup.py
> > +@@ -10,7 +10,7 @@ Copyright (C) 2017 Google, Inc.
> > + Written by Simon Glass <sjg@chromium.org>
> > + """
> > +
> > +-from distutils.core import setup, Extension
> > ++from setuptools import setup, Extension
> > + import os
> > + import re
> > + import sys
> > +--
> > +2.25.1
> > +
> > diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> > index e9b8499..6e02db6 100644
> > --- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> > +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> > @@ -7,6 +7,7 @@ LICENSE = "GPLv2 | BSD-2-Clause"
> >  DEPENDS = "flex-native bison-native swig-native libyaml dtc"
> >
> >  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
> > +           file://setuptools.patch \
> >             file://ssize.patch"
> >
> >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> > @@ -17,13 +18,13 @@ SRCREV = "ecaeb97fec013973360e94888a7de645f084345c"
> >
> >  S = "${WORKDIR}/git"
> >
> > -inherit setuptools3-base pkgconfig
> > +inherit setuptools3 pkgconfig
> >
> > -DISTUTILS_SETUP_PATH = "${S}/pylibfdt"
> > +SETUPTOOLS_SETUP_PATH = "${S}/pylibfdt"
> >
> >  do_configure:prepend() {
> >      oe_runmake -C "${S}" version_gen.h
> > -    mv "${S}/version_gen.h" "${DISTUTILS_SETUP_PATH}/"
> > +    mv "${S}/version_gen.h" "${SETUPTOOLS_SETUP_PATH}/"
> >  }
> >
> >  BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.25.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7008): https://lists.yoctoproject.org/g/meta-virtualization/message/7008
> Mute This Topic: https://lists.yoctoproject.org/mt/88482921/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


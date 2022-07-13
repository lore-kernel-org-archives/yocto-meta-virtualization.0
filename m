Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A131CCA485
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 12:56:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.21555.1657717009619175495
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 05:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xpztc0Uy;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so3591865pjn.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XDZ0mdRkGbF6pekJY/UVKovEDTYEbu6SUeDZcWvXnnY=;
        b=Xpztc0Uyyb5/WL+d1fX+uA7iHKIbxrUEoV7Voa/lIPUgwuo3zc3HK4fNMpZdwLel09
         nxfqH4LXCdNwrtDhh3QXs80PVihREG7AeWhtTP4Eg0Y4mcX/E1xzybnYeRsITtrbb83t
         7xP9rWBlRKiYAz66gZodqUnpTqHQ9AM8PfeP5Rid8Acp4IQsoqxlIi5igJmPEl92WGWY
         oUKDGaj70d1za52pdWMt1oj/lNkDcbBaXUAI7ioeIbznNTPV29IVEfeWZvVW6rYKXOHl
         tGwfXj8EcNVveyCrq2lGz/SurUKhiUw+GgOBnDwJlgAJVhqaHMfLSuZEC80TA0fWrAuR
         BwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XDZ0mdRkGbF6pekJY/UVKovEDTYEbu6SUeDZcWvXnnY=;
        b=TvgG1hz2p/XNHHLFOFP2aGR/0Tcm9sXn1ZtDb9UhB4YQv+V0LbKr1TrxAA24Nmi/09
         MxQNdNfYGshTspWvYkjpl8MH4ooEmEIUE4UQDaUcMHGe8HsHLsXqKMCEsuy2LKegRQvz
         iEciLzhj/zSclC3ckTynAj4l8knTAF0+8Zu49jZuVrU3muaG7HnNv1CXgvTsRX2g3qDV
         FzyeaNc/T4iauovDYxKktdIg8RqBsm81l7q6gNAM5QVe2PZfulLivtxVwW/qM4ZuwId4
         uKRy8T75C7vXJZs8QVO2KjvVJZoS4POT0yzDGLDh/IPD6jEO58tMOHzWHjpIkGwxA0rX
         Ph9A==
X-Gm-Message-State: AJIora9+4uFZu0ITfwXd9HZ9LXJyX2KjhhFVdxsxmEVdZR7nbHJPIuu9
	5FjoABiqBBHwBhpu22YKsyhEIUvHSxmJtlMLIR0=
X-Google-Smtp-Source: 
 AGRyM1sxAc34t+yMnVN5m8izLneZM9CuhZdICcDSDU0HRejqk8Gg4wRrh+JAcd2TYNSlXAevWKXeZ6FXjOYPONxerbM=
X-Received: by 2002:a17:902:d548:b0:16c:115d:7483 with SMTP id
 z8-20020a170902d54800b0016c115d7483mr3354337plf.135.1657717008548; Wed, 13
 Jul 2022 05:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220712141719.879382-1-andrei@gherzan.com>
 <bfc46925-3e47-4c98-96c2-0faf8f89ab06@www.fastmail.com>
In-Reply-To: <bfc46925-3e47-4c98-96c2-0faf8f89ab06@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Jul 2022 08:56:36 -0400
Message-ID: 
 <CADkTA4Mx3gts_+4SHqOZJ57RDzvwXoN0-K7XJhQz6W_7q3OWvQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs: Update to v1.9
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 12:56:56 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7454

On Wed, Jul 13, 2022 at 6:24 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Tue, 12 Jul 2022, at 15:17, Andrei Gherzan wrote:
> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >
> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > ---
> >  ...-Fix-buffer-overflow-on-workdir-path.patch | 32 -------------------
> >  ...erlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} |  7 ++--
> >  2 files changed, 2 insertions(+), 37 deletions(-)
> >  delete mode 100644
> > recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> >  rename recipes-extended/fuse-overlayfs/{fuse-overlayfs_0.6.4.bb =>
> > fuse-overlayfs_1.9.bb} (60%)
> >
> > diff --git
> > a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> > b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> > deleted file mode 100644
> > index 129423d..0000000
> > ---
> > a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From 7e5992d6121aed0cfcbfaf70472f28d87cff1426 Mon Sep 17 00:00:00 2001
> > -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> > -Date: Mon, 11 Jul 2022 20:36:06 +0200
> > -Subject: [PATCH] Fix buffer overflow on workdir path
> > -
> > -We make sure that the path used for workdir is reallocated before
> > -appending. This was initially included in upstream as part of
> > -https://github.com/containers/fuse-overlayfs/commit/d5b725b6f18a437db66bfc1456d04c3bf658f66a.
> > -
> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> > -Upstream-Status: Backport
> > ----
> > - main.c | 3 +++
> > - 1 file changed, 3 insertions(+)
> > -
> > -diff --git a/main.c b/main.c
> > -index e5bdda1..118a6cb 100644
> > ---- a/main.c
> > -+++ b/main.c
> > -@@ -5039,6 +5039,9 @@ main (int argc, char *argv[])
> > -       if (path == NULL)
> > -         goto err_out1;
> > -       mkdir (path, 0700);
> > -+      path = realloc(path, strlen(path)+strlen("/work")+1);
> > -+      if (!path)
> > -+        error (EXIT_FAILURE, errno, "allocating workdir path");
> > -       strcat (path, "/work");
> > -       mkdir (path, 0700);
> > -       free (lo.workdir);
> > ---
> > -2.25.1
> > -
> > diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> > b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> > similarity index 60%
> > rename from recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> > rename to recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> > index 4f793bd..18e9dfa 100644
> > --- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> > +++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> > @@ -5,11 +5,8 @@ containers."
> >  LICENSE = "GPL-3.0-or-later"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >
> > -SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
> > -SRC_URI = " \
> > -     git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https
> > \
> > -     file://0001-Fix-buffer-overflow-on-workdir-path.patch \
> > -"
> > +SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
> > +SRC_URI =
> > "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
> >
> >  DEPENDS = "fuse3"
> >
> > --
> > 2.25.1
>
> Stand by for a v2 on this one. It needs a musl fix. Also, do you see any issues in using 1.9 vs 1.9.0 as a version? They both are semver compliant.

Ack'd. Holding on the queueing of the change.

I don't see a problem, I typically just follow whatever the project is
either putting in the README or their git tags.

I just did a check, and indeed, they go with v1.9 and then start
adding the .x after that .. so v1.9 is fine with me.

Bruce

>
> --
> Andrei Gherzan
> gpg: rsa4096/D4D94F67AD0E9640
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7452): https://lists.yoctoproject.org/g/meta-virtualization/message/7452
> Mute This Topic: https://lists.yoctoproject.org/mt/92333794/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


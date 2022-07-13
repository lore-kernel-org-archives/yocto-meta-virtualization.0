Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A342C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 15:44:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.23568.1657727047188827379
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 08:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fTeo7KqX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso4244692pjk.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Yrm9OvsS8SzAEaflMRnz2WGGSgTasUStmD8AwT1Fe8=;
        b=fTeo7KqXalFMJXTQSRHqA/zdTYzyo0g1rOygJ/MWhfur7hc73WbXLWyrBUuX4dGN6G
         QKMdzncgPXfg+idz48WTDRX60iqdY0VhAfBm5w4hd77/dB95GUELVmDnLXo9rvXSTS2Y
         aZTd23sWdHONU2hoZy3jnTPEIoa+gHi5S6e22Byc1cFZ6LPq6xxEtUMQaM9oLjT/JJtn
         08pzpkACuwsS4xDWUJDHesEU9AadN4OldLRYC1byFZjw0Z0szKKbQH8HimJouNAb4RxL
         4y0mSgdW0y73ErAPea42cj0cAyWn2VbwvmZcyXA/n1CLj04fdNB9I0raSrwoPuSof8Mj
         Xi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Yrm9OvsS8SzAEaflMRnz2WGGSgTasUStmD8AwT1Fe8=;
        b=ZRdsIYArkbSUZFn6ChYx/fD+arqOKXZM3E1as0ZQz3KoCId/Xb4eWsQRJUYJjUs1mO
         1F69Cjs+04+ggl4G/0TjWoDgYYjL0LgLdzK34NdJMxuRai+l21kJNN9nVlKeCpeo2XbL
         ZErMvE9eTVyvaCe56WtMLot1zy/2oM1arExELzSybEauUzYsF7ny2aAmqFIqvi6jyoC/
         qPeHt+fsmuznmE4sNkN1PSgn6YUCn0r28SsBfViygV+ugwaRivM5nbpUQp3DMrBB50+T
         P3vrMxb3+MYaxRAVg5QiKpprrevQisaSrvhjiF+4yncQ8aMgJ0r5pMJi5y4A1nZdDMCh
         Hn5Q==
X-Gm-Message-State: AJIora9uNcA4EvFLv+H1Z/gaw4fSw3gShj7O2AoSkPTt6few5Y1OGO5y
	i/6penM1WzkIdxBGSODLZvUJiTEu+WGJ/Aj0Mos=
X-Google-Smtp-Source: 
 AGRyM1sQ2ZASeFvqal4P9frueRRacx9bCCJqg8TShZtkIXu8QuKoSW5HfvzY7meCFJ5v2y358075zWFWgQAEtC4AdBY=
X-Received: by 2002:a17:903:2285:b0:16c:33dc:8754 with SMTP id
 b5-20020a170903228500b0016c33dc8754mr3738341plh.126.1657727046509; Wed, 13
 Jul 2022 08:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220712141719.879382-1-andrei@gherzan.com>
 <bfc46925-3e47-4c98-96c2-0faf8f89ab06@www.fastmail.com>
 <CADkTA4Mx3gts_+4SHqOZJ57RDzvwXoN0-K7XJhQz6W_7q3OWvQ@mail.gmail.com>
 <dcf31062-d390-4907-9013-32d4ca34d550@www.fastmail.com>
In-Reply-To: <dcf31062-d390-4907-9013-32d4ca34d550@www.fastmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Jul 2022 11:43:54 -0400
Message-ID: 
 <CADkTA4Nb+grARXbKWKvFrMAK8=ZQNdsu2u6GGoNOY8JP5zCBgw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs: Update to v1.9
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 15:44:17 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7457

On Wed, Jul 13, 2022 at 9:55 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> On Wed, 13 Jul 2022, at 13:56, Bruce Ashfield wrote:
> > On Wed, Jul 13, 2022 at 6:24 AM Andrei Gherzan <andrei@gherzan.com> wrote:
> >>
> >> On Tue, 12 Jul 2022, at 15:17, Andrei Gherzan wrote:
> >> > From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >> >
> >> > Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> >> > ---
> >> >  ...-Fix-buffer-overflow-on-workdir-path.patch | 32 -------------------
> >> >  ...erlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} |  7 ++--
> >> >  2 files changed, 2 insertions(+), 37 deletions(-)
> >> >  delete mode 100644
> >> > recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> >> >  rename recipes-extended/fuse-overlayfs/{fuse-overlayfs_0.6.4.bb =>
> >> > fuse-overlayfs_1.9.bb} (60%)
> >> >
> >> > diff --git
> >> > a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> >> > b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> >> > deleted file mode 100644
> >> > index 129423d..0000000
> >> > ---
> >> > a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> >> > +++ /dev/null
> >> > @@ -1,32 +0,0 @@
> >> > -From 7e5992d6121aed0cfcbfaf70472f28d87cff1426 Mon Sep 17 00:00:00 2001
> >> > -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> >> > -Date: Mon, 11 Jul 2022 20:36:06 +0200
> >> > -Subject: [PATCH] Fix buffer overflow on workdir path
> >> > -
> >> > -We make sure that the path used for workdir is reallocated before
> >> > -appending. This was initially included in upstream as part of
> >> > -https://github.com/containers/fuse-overlayfs/commit/d5b725b6f18a437db66bfc1456d04c3bf658f66a.
> >> > -
> >> > -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> >> > -Upstream-Status: Backport
> >> > ----
> >> > - main.c | 3 +++
> >> > - 1 file changed, 3 insertions(+)
> >> > -
> >> > -diff --git a/main.c b/main.c
> >> > -index e5bdda1..118a6cb 100644
> >> > ---- a/main.c
> >> > -+++ b/main.c
> >> > -@@ -5039,6 +5039,9 @@ main (int argc, char *argv[])
> >> > -       if (path == NULL)
> >> > -         goto err_out1;
> >> > -       mkdir (path, 0700);
> >> > -+      path = realloc(path, strlen(path)+strlen("/work")+1);
> >> > -+      if (!path)
> >> > -+        error (EXIT_FAILURE, errno, "allocating workdir path");
> >> > -       strcat (path, "/work");
> >> > -       mkdir (path, 0700);
> >> > -       free (lo.workdir);
> >> > ---
> >> > -2.25.1
> >> > -
> >> > diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> >> > b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> >> > similarity index 60%
> >> > rename from recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> >> > rename to recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> >> > index 4f793bd..18e9dfa 100644
> >> > --- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> >> > +++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> >> > @@ -5,11 +5,8 @@ containers."
> >> >  LICENSE = "GPL-3.0-or-later"
> >> >  LIC_FILES_CHKSUM =
> >> > "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> >> >
> >> > -SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
> >> > -SRC_URI = " \
> >> > -     git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https
> >> > \
> >> > -     file://0001-Fix-buffer-overflow-on-workdir-path.patch \
> >> > -"
> >> > +SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
> >> > +SRC_URI =
> >> > "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
> >> >
> >> >  DEPENDS = "fuse3"
> >> >
> >> > --
> >> > 2.25.1
> >>
> >> Stand by for a v2 on this one. It needs a musl fix. Also, do you see any issues in using 1.9 vs 1.9.0 as a version? They both are semver compliant.
> >
> > Ack'd. Holding on the queueing of the change.
> >
> > I don't see a problem, I typically just follow whatever the project is
> > either putting in the README or their git tags.
> >
> > I just did a check, and indeed, they go with v1.9 and then start
> > adding the .x after that .. so v1.9 is fine with me.
>
> Sounds good. I've sent the v2 here https://lists.yoctoproject.org/g/meta-virtualization/message/7455 but I forgot the v2 subject mention. I can resend it if needed.
>

I see it, we are good!

Bruce

> Andrei



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9C6C63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:51:54 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.29789.1670449913544244342
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:51:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RD5PjI+j;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id m15so8455677ilq.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 13:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MVe5uGAr9Uh8X2vfa+srTVN2gCTwliqVs4XeaNqCWDw=;
        b=RD5PjI+jAn+aHqNzd4N9XA0fiN4fWaBazjgmV13q57DnYqjAdJ9UTN3+YkfMndslzS
         fJcnlz9I7I3FbwF+fZ24v8RlkYPCFBr6lfX2IGQxockEvVmN2K2LMK0ZPpNRY+p6gJb9
         80KkqJJpUnrVkRY2cnLkBxSqhyCq0zD+LSGHtefOUMLrPugDQv5GoDbkouGlv66GrrX1
         wfWEhof+DJ2Z+fI7eKO16eNqGgJ6ChJ4WuZhD0VKiJv+J4HTsit8UbAvLY/8J04Hm8yL
         384bd2rUbCf09GSy1PuZ180z8LvLO4aPFNVHS5uzHSAtIlJv+/rfHOE9auIxmY2KoqhZ
         h2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MVe5uGAr9Uh8X2vfa+srTVN2gCTwliqVs4XeaNqCWDw=;
        b=EFoCBJbqTKBcqZHWocY6hBUDJeNV45BsqBdBo1Fj0CuQckPlBgGybA+YrkG8wh5QCi
         otdEb2e81GqGwDfHYORLKmW/upudgwkum4DL9ju8hDw6hJFP0LnEALhyOWZ2VzG5Qq6V
         mLwjH8E6XLscJVzftWAepv/vb7F5gNlhoDFeb6pClNBsl1C8FWNq2m0y9sS6WCt6QpGb
         grnGwyYo9e030TPGKz5qYeRkIrqkcp08u/0ehtN7+++rlNbJPE5fK3DQYwRYwLqrFhC/
         OoW5EMesqH321gAcq3RgW6atCr86EwhTLrzvYLRG+qY7DVVah28Z7r6Xte0E0Y7h+3s6
         SuJg==
X-Gm-Message-State: ANoB5plAFRE4a1PCbwNqIYGFdC0aGmZqMvWHmr52deo06MPwXqKpyx6+
	rajyyA2r33T4K1ZPNhuYjar+pxRogfDEXKlJI28=
X-Google-Smtp-Source: AA0mqf7twCH9m8kkAmfV2QmkYkZnk1zwJdHlRmLo79VUja26q6G9fyZJ8FMYYypRPfZq7uZCPV0zLckXvmn1x0qPYwI=
X-Received: by 2002:a05:6e02:1292:b0:303:1173:fb23 with SMTP id
 y18-20020a056e02129200b003031173fb23mr22293672ilq.276.1670449912859; Wed, 07
 Dec 2022 13:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20221204213809.483131-1-adrian.freihofer@siemens.com>
In-Reply-To: <20221204213809.483131-1-adrian.freihofer@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 7 Dec 2022 16:51:41 -0500
Message-ID: <CADkTA4MDDd9mupbD-GvAjufDcPQoTK_67yF2ZDBVqOX0icTyFQ@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 0/3] docker updates
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:51:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7748

On Sun, Dec 4, 2022 at 4:38 PM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Bring docker on the kirkstone branch to the same commits as they are on
> master-next. Just let me know if you think this is not the right way. I
> can easily maintain this on my own layer. But there are some bugs and
> CVEs in Docker which make this update kind of mandatory for the LTS
> branch as well.

I need to have a closer look at the changelogs to confirm just bug fixes
in the commits. I got bogged down in yocto summit things, which is why
master-next has cooked longer than it normally does.

I'm completing more updates now, so I'll clear the existing master next
shortly, before staging more.

>
> Some findings:
> * runc-docker RUNC_VERSION is on 1.1.2 on master-next. I set it to 1.1.4
>   bcause this looks correct to me.

I'm not sure where you are seeing this. I see one shortlog that is wrong, but
the versions are 1.1.4 in both of the runc recipes in master-next as it sits
on the server and locally.

https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=6dba10357ce8906c95b81d3256e945c617999aa8

> * docker: SRCREV_moby is used by do_compile. For docker-ce the variable
>   is undefined on master-next. Here it is initialized to SRCREV_docker.

Do you mean in the .inc ? That's been a bug for a while, I switched to a generic
value on master-next:

https://git.yoctoproject.org/meta-virtualization/commit/?h=master-next&id=d3acb1a378e644fe2784a8357390b19695640f78

> * docker: Upstream updated to go 1.8 which does no longer compile with
>   Yocto's go 1.7. There is a patch to revert the go update. It's working
>   but not sure how long this way will work.

So only a problem on the older branch. We could carry a change for
that, but it needs
to be in a separate commit.

That last comment leads me to a general comment. The series is fine in
spirit, but
the changes should be kept separate and should be cherry-picks whenever
possible. i.e. the updates to the 3rd digit versions need to be separate, and be
cherry picks from master. That means they include the git hash they are cherry
picked from, as well as the original sign-offs.

That obviously also means they cannot run ahead of the master version updates
(unless I bump a major version in master). As I mentioned above, I'm going back
through minor updates now, and will stack them on master-next once the current
batch completes some final testing.

Things that need to be done to adapt to cherry-picked commits to the older
branches, need to be separate commits.

Bruce

> * Testing: docker-ce running on a arm64 device can run a Debian
>   container. We will do more tests in the future. But that's what I did
>   so far.
>
> Adrian Freihofer (3):
>   runc-docker: update to 1.1.4-tip
>   containerd-opencontainers: update to 1.6.9
>   docker: update from 20.10.12 to 20.10.21
>
>  .../containerd-opencontainers_git.bb          |    6 +-
>  recipes-containers/docker/docker-ce_git.bb    |   30 +-
>  recipes-containers/docker/docker-moby_git.bb  |   27 +-
>  recipes-containers/docker/docker.inc          |    5 +-
>  .../files/0001-revert-go-1.8-update.patch     | 1218 +++++++++++++++++
>  ...efine-ActKillThread-equal-to-ActKill.patch |   90 --
>  recipes-containers/runc/runc-docker_git.bb    |    4 +-
>  .../runc/runc-opencontainers_git.bb           |    6 +-
>  8 files changed, 1261 insertions(+), 125 deletions(-)
>  create mode 100644 recipes-containers/docker/files/0001-revert-go-1.8-update.patch
>  delete mode 100644 recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch
>
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7733): https://lists.yoctoproject.org/g/meta-virtualization/message/7733
> Mute This Topic: https://lists.yoctoproject.org/mt/95455895/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


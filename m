Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ECBC32771
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 12:49:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.27811.1664196542188117219
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 05:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gg9zCEfb;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id b21so6133115plz.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Sep 2022 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=L7n3RsWgHyzcHxY3JU83dFYQBZyEHNdMxT8tKduwiNE=;
        b=Gg9zCEfbpJlLevm62fjsra1sfoWYewJPFzQCQG9mRNRmfGr7D6SXi/Yf14RrxwbuqM
         Plxf4sFlrS2v4E8CY4TtWF7NLX2lozvYGNzKrKaRgk8XA9lU9VUgLSYHtCONa5LE7xCQ
         es+/KRRGV/fhcTBUcbopg4Eej51THpg8c5HaSyhW8EmCfxMgdTEHoXpKzuLEuNB9UtzN
         a3YoQTemI9fpi9qloumSFeq3Wh5TUhVy47ajiNqwKcmhtPEFBVXmKo17nNIubaL46HJ3
         jqpB79JTwwhQlA74UOBoql/f62ZnJeFiYC5jZHY5Okco4YzdkBWw5TBCkDS2+FoclP0A
         9tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=L7n3RsWgHyzcHxY3JU83dFYQBZyEHNdMxT8tKduwiNE=;
        b=jQKyDk7FyD+s+JR3JePNbKzBK/enZAVUrcLXtkMSvKphMfPefOlhcAnZgG9w/J3m0W
         rJL/wB/PrchNl/zUnh0JIxW8qCdP5Kr1gg305MIPMfEncOA2sEjQ1BeeKkEAYh16jg09
         gNCOdyJKLv3UwBe0c97KKXZubXBXdKdMW6VQZjisz+tWHbEgaXa4H1lfWRV9aR1yOvKR
         qF27820IzvHVyHgGtNxKk+oRSuSAlXeoe7LIEnGeGCxg7Hg3JH1UUpSuuB6fLwZSULLU
         fxB24gl7UGB/G8EGZbu9DmsA9WjyGsG8d9HjINCxSQ7X6PmqfL6JYUFfcEB2w08l7d6c
         5Wcg==
X-Gm-Message-State: ACrzQf1PI+h7qfvaFsenUIyo9fFoc+ZKdxrQ5b4q7wJFtJAO0EnN13Xm
	Eb5SjNeTAfZrCLt9IPwq6+OnZ8luAnWpu/WmvUapgoY8wWEWGw==
X-Google-Smtp-Source: 
 AMsMyM6VtnUlEzE2iQPSiIHCUL1v5Azzj9YqgpE+LWi+bWwovwtk607K2/EkO4cPp32pCKrvwOwEO5scyI1FoCEcIQs=
X-Received: by 2002:a17:90b:3504:b0:202:7253:9b53 with SMTP id
 ls4-20020a17090b350400b0020272539b53mr25228098pjb.155.1664196541483; Mon, 26
 Sep 2022 05:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220920133406.26b27242@serenity>
 <CADkTA4PZY7rBbQwN1AH2D+AWxAqYi5ndmvGwvxmL-xMdPtuFdg@mail.gmail.com>
 <20220926102346.7a0d6fbb@serenity>
In-Reply-To: <20220926102346.7a0d6fbb@serenity>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Sep 2022 08:48:50 -0400
Message-ID: 
 <CADkTA4Pm9_Y0GVr6rbC33FqShBNCTM7usJiJ5esnSW6XY7u7Gg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] fixed typos in kubernetes recipe
To: Guenther Meyer <g.meyer@signum-media.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Sep 2022 12:49:07 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7629

On Mon, Sep 26, 2022 at 4:24 AM Guenther Meyer <g.meyer@signum-media.de> wrote:
>
> On Tue, 20 Sep 2022 08:03:21 -0400
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>
> > The patch itself looks fine, the only issue for easy processing is
> > that it is attached to email, versus being the email. If you send the
> > patch with git-send-email, it will take care of those details.
>
> I never used git-send-email - didn't know it - and I don't know if I
> like it because of security reasons. I also thought it would be easier
> to review/merge a patch if it is received as an attachment instead of
> inline.

git send-email is heavily used, both in the OE ecosystem and many
others. I'm not sure I follow what security concerns you might have
with it .. but if you have anything specific let us know. Because it
would affect all projects using it!

As for attachments, they are harder to work with than inline patches.
The tooling, replies, and well known (kernel-style) workflow is based
around being able to reply inline and discuss patches. There's plenty
of references for how the flow works, and I wouldn't do it justice by
trying to paraphrase it here.

>
> So what is the workflow after a patch is received via email? Is there
> some (automatic) tooling, or what is happening until a patch is merged?
>

It is a pretty standard maintainer workflow. I receive the patches,
queue and test them. I have some of my own CI scripts, as do others
that run against the repository. If a patch needs extra testing or longer
to soak for comments, I'll often stage them in a master-next branch.
For smaller changes, I often just pull them directly into master. I then
follow up to let the submitter know the patch is merged, or provide
change review feedback.

> I'm accustomed to using the fork/commit/merge workflow that most
> projects with github/gitlab repositories have. I guess there is nothing
> like that (planned) in Yocto?
>

It depends on the repository, the project and the maintainer. For
the patch volume on meta-virtualzation, the tried and true method
of patches to the mailing list work. This aligns with OE core, poky
and many of the other ecosystem layers.  But like anything in an
open source project .. it just depends.

The different types of workflows are very well known by the overall
yocto/OE project communities, and we've had some very long
discussions on the topic. You can find them archives on the various
OpenEmbedded Core or OpenEmbedded architecture mailing lists
or in the minutes of the various in person summits we've had over
the years.

> Not that I want it currently, but who decides who will get commit
> access to the Yocto repos?
>

There's no single yocto project repository. The project is an umbrella
with many different subprojects, layers and maintainers. So push
access varies by project.

Most (if not all) of the projects work on a maintainer model.

>
> > That being said, don't worry about re-submitting it, I can detach the
> > patch and apply it.
>
> Thanks for merging the patch into master!
> Will the patch also be merged into kirkstone? What is the workflow here?
>

Either on submission of the patch, someone can indicate that the change
is for master, and another branch. Or once it merges to master, they
can follow up and ask for a backport to an older branch.

In either case, the change needs to be a bugfix, versus a new feature.

I consider this a request to backport, so I've cherry-picked the patch
and merged it to kirkstone.

Bruce

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7628): https://lists.yoctoproject.org/g/meta-virtualization/message/7628
> Mute This Topic: https://lists.yoctoproject.org/mt/93801075/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


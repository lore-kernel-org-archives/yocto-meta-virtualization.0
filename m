Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E064DECAAD8
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 12:03:37 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.11119.1663675413194851352
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 05:03:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvIfeT+q;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id fv3so2855997pjb.0
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Sep 2022 05:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8n5COY/ob5S0qmUiHV8+kWjJWrXsL/FZvUZw0S0U6YE=;
        b=LvIfeT+qrS9NSmIPeos++3ABsZBtrv98ZQValzqRdYgwkFInRmTN1BJJgmD+hTXilL
         8Bf6LYXWM99LRsY3+jRhMr9bSDsm8yczVHlcXhKs5VAaJZWaZIq17pgJDnWiSXSgRF7H
         2rF5zJC/bvtJS1Wd6bq8GSkHVHDYKJ7k4OffPHcIeNJbBhr+SYTUS/Gi/2yyhJSYZPIM
         AWoBsZmD3/qYxtcHpAxWXNZFtZsobeBZfaeiinvf9q7QauAPXJVZVF+x7u2aaS+OkLjk
         GJE3vGJuWE8vFpybClxK91Xe8Xutnh8TbGJmpZwxzFSXBEDyP+1h9cStgD5J0ffJtz7W
         KWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8n5COY/ob5S0qmUiHV8+kWjJWrXsL/FZvUZw0S0U6YE=;
        b=z7DVbYjiKIaBILmrYgEUgDKyEr2Gu4ekw59sXSQ+bKgaTsQIGkvMzl8Pb8p1DeO9gc
         3LIPBM5tMQDuazeLw93p5DyPVFdOmTFLGxS2tFHFvwu6GkLjtSDcKggnooZus1urAgnW
         4sOIFIJz2nOdLfHXlSuJ4UwqEwfk6aNUWfvDRetyD4uDmZSs4ut9XYPgBxYJHDZT/VGs
         cYLIeXV9/GZQLj2jyCSoDIvZHqxSxUGg8SFL4gzM2Z4/lNd0fgP0WvvSWlNVbBaoff8O
         qPMpB1nAeXM2QGRzVwFHKGZR//SUEm1Je13Fgzrl/dgNalwjcFeHd8JtKmKJkTQJpXxp
         eW8Q==
X-Gm-Message-State: ACrzQf2qwhW3wDLjiPfi/V1sYgRrj9+gZhBca0WfkuOSgKvBSr6tFnDh
	0QlVe/kcN0hiJdPJ5QaOmxQRkHIhCcwHNIcv2FU=
X-Google-Smtp-Source: 
 AMsMyM6ToeZ4EFTcvvknggQvUsjS949bXL7z41YCniQ/tiGfAhFKdMqCwiDmjtxyzTdsC+F0ccaw+O8PGThjjIena2M=
X-Received: by 2002:a17:90b:38cb:b0:203:100:bb53 with SMTP id
 nn11-20020a17090b38cb00b002030100bb53mr3615109pjb.107.1663675412314; Tue, 20
 Sep 2022 05:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220920133406.26b27242@serenity>
In-Reply-To: <20220920133406.26b27242@serenity>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Sep 2022 08:03:21 -0400
Message-ID: 
 <CADkTA4PZY7rBbQwN1AH2D+AWxAqYi5ndmvGwvxmL-xMdPtuFdg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] fixed typos in kubernetes recipe
To: Guenther Meyer <g.meyer@signum-media.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Sep 2022 12:03:37 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7622

On Tue, Sep 20, 2022 at 7:31 AM Guenther Meyer <g.meyer@signum-media.de> wrote:
>
> Hi,
>
> I had a problem building the kubernetes package after upgrading to
> kirkstone, the error is also documented here:
> https://errors.yoctoproject.org/Errors/Details/657132/
>
> The typo is still present in the master branch.

Interesting that RPM handles the typo properly. As you can see from
the commit logs, I've been upgrading and building kubernetes over the
past week without any issues (but I use rpm as the package manager).


>
> A patch to fix this is attached.
> I don't know if this is the correct way to submit a patch, as this is
> my first contribution. So feel free to correct me, if I'm wrong.

The patch itself looks fine, the only issue for easy processing is
that it is attached to email, versus being the email. If you send the
patch with git-send-email, it will take care of those details.

That being said, don't worry about re-submitting it, I can detach the
patch and apply it.

Bruce

>
> Guenther
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7620): https://lists.yoctoproject.org/g/meta-virtualization/message/7620
> Mute This Topic: https://lists.yoctoproject.org/mt/93801075/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


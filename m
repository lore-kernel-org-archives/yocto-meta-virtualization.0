Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DA7C4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 18:23:22 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.154.1668709400787649706
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Nov 2022 10:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b6Dpb7cZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id g7so1358818ile.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Nov 2022 10:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxrvJyM5bE4oKwOJkvhAz8GjDbEE6tbgS+rcZ/GOWJI=;
        b=b6Dpb7cZgnnvUw5e1oqIMuaqv6tZTxZ7qG/mgBdHNikF0v6/PWG7QTPXfKCWrXDApD
         Urw8L2h39GsXcTaOz2xGxDBOF12FpGVRkqyr8zzmVjwWKOPoCFR/gyS17U4Om6tueql4
         R05ltszpsrXGZPMFHolgcq4X/bhNKCFMohmoiRwB0fWaepaG0RwSt/rM4SyRk51WEf2D
         QuIOuhRgwePeht3YUvJsUd04MTRHqG5OcZtn3qlgWHalYVLOvBkb1cYxjLq648encGbj
         gOB9Q3onBCpYZEtt6RgCX/OFja5FK2NNoS6xeVgj11nJZzgfdzLMVBIg8skII3OAc9np
         KskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxrvJyM5bE4oKwOJkvhAz8GjDbEE6tbgS+rcZ/GOWJI=;
        b=vMfwBKYEBCNUChedpv2EAxeadDKx1BhXlwG/Mhz1InkjSxgMFtYX5FcoGa17KgpstM
         uzCWU6i6LRq4NkuQQO/Dy+japmdl2GRO1C3+Y7i0rWEGwT+18RnLZUX4Sjfxw8MERjKU
         dZdqwZADRcz7yLgcCpeQQejrRVOtVpvmaLpGV3l2cS8HkWP/uOrIeXHSipAVsrOj8L/J
         1xxa5axM2Pw412eztnM8w1ofhPKDDdI+6q3ow0CXhQEDlO/wFDeUXCRMX/KbLbBpgNvK
         xZStbveWI9FWLOiWofP8EShbgjBAHx0Mjgg8iXyrUZie+pG7yIjXRJfhmRyBiRW+GC48
         ddow==
X-Gm-Message-State: ANoB5pn42cQiZdYPReuaNR0kiHyOSTrLrzWBujgXhGX4/N3j+o/0JS1e
	iJ7cAXr4lbDMAMRR2EM9Im5rRQfErbVaHyZQohLzLfv3MRc=
X-Google-Smtp-Source: AA0mqf5n5e6CohBBIEWJ6fLscoKKkOWl/5kCBWsBSePiFwsAaCsnKxvBouhAdpizSIgz+LkbOTvVRZyrdTemGTRqCf4=
X-Received: by 2002:a92:c204:0:b0:300:f59b:6d0c with SMTP id
 j4-20020a92c204000000b00300f59b6d0cmr1808040ilo.107.1668709399897; Thu, 17
 Nov 2022 10:23:19 -0800 (PST)
MIME-Version: 1.0
References: <3130543.zt3vOreWX6@serenity>
In-Reply-To: <3130543.zt3vOreWX6@serenity>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 17 Nov 2022 13:23:08 -0500
Message-ID: <CADkTA4O=km=BdAbC5=g6+e0eLgfJ2GGqc3QvkTTNkOZ0e4yYYQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] nerdctl: renamed upstream branch
 master to main
To: Guenther Meyer <g.meyer@signum-media.de>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Nov 2022 18:23:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7684

The change itself is fine, but your patch came through mangled, and it
doesn't apply to the repository.

I could make the change myself, but it is probably worth sorting out
which part of the patch sending chain caused the corruption.

Bruce

On Wed, Nov 16, 2022 at 8:09 AM Guenther Meyer <g.meyer@signum-media.de> wrote:
>
> Signed-off-by: Guenther Meyer <g.meyer@signum-media.de>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/
> nerdctl/nerdctl_git.bb
> index 5d4d827..343c85d 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -13,7 +13,7 @@ DEPENDS = " \
>  SRCREV_FORMAT="nerdcli_cgroups"
>  SRCREV_nerdcli = "48f189a53a24c12838433f5bb5dd57f536816a8a"
>
> -SRC_URI = "git://github.com/containerd/
> nerdctl.git;name=nerdcli;branch=master;protocol=https"
> +SRC_URI = "git://github.com/containerd/
> nerdctl.git;name=nerdcli;branch=main;protocol=https"
>
>  include src_uri.inc
>
> --
> 2.38.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7683): https://lists.yoctoproject.org/g/meta-virtualization/message/7683
> Mute This Topic: https://lists.yoctoproject.org/mt/95065671/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


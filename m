Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A626AECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 13:08:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web12.11386.1661864918326316658
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 06:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FHV1g2ch;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id p18so11051442plr.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 30 Aug 2022 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+gSXd7PzevKGp4n9My6KrV/s9u8S+YS8bVruilh1Luw=;
        b=FHV1g2chGOCDDFeH2w8GaI+GPkitFQLt0XC164HoDN4SbqWriKqSKXW7XEBRkF7KaP
         5GRxVy5Uq6xGGKzHd8UTSWN1BS3BSfTENxht88wNR85tUskx4MxA8KK754qZmTkiNC5s
         Rnhc7iLtJ7FN7APtZtdoonLQb0LXZs24WpY5H0aXA99bPhgK++p5K/s2FG+9BsPw6Ste
         IxcmNCnyhKV8TejuN7c5Lye/LDDMwCMGd+6wnIGbWaY9XDiMwKf5eOgI6y3N05zlsY9p
         5GH5xe7lsefQR2vJML3RO90aQdhBcNYWSPTRenLUM1kOC/IjegWWmbb0bTtixSNSbphC
         DRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+gSXd7PzevKGp4n9My6KrV/s9u8S+YS8bVruilh1Luw=;
        b=6pmx6sy9SUHoePJ+Hf75FOlfuNCnwTDG2AX1LGe2Zf/tVCrHJGPYuBF25qTbTdABzF
         WFlVD3wptir+V2NHerkHIaQIpfE3Tsn2PVDaYIpood8d83g4eb/deE7K6ShIBfh8FTjc
         z5LxuXU9Sco7Dwfs1Swr9tIHDQ8+TFvNRCpw8gqNDW3MLUkzcXV7YYf0G58tsP9qGbSU
         r+ZNBICfg+T5NEVjLrYIu7APAwNqTFpfvqDbcumbFOLA+L7+CE7ZErW8IPYFquAmtI9S
         TULMBYfU8EpCyZiBgbSEJBwUb1xi1JdELRmW3hVkUfIf3kOEZbRYSRQ8KXilxbNhLkxt
         S/Kw==
X-Gm-Message-State: ACgBeo0VG4yF1aExn24MeUVQleG7dkHDrFwm4JVM7pFv4fSkZWfZd9gJ
	ZnOYApO9A5+1RIbHl2x4iSRrYRpTC1s6G1zFqm0=
X-Google-Smtp-Source: 
 AA6agR5tfqbw+upx9D6e4i3LoNfX5YTBnSk4rRysF5rjjuJKt/6R4bPBgNdrBoTo3XB4npi8OD4diknUnQL6Zypu+og=
X-Received: by 2002:a17:902:7c94:b0:170:aed6:7e6c with SMTP id
 y20-20020a1709027c9400b00170aed67e6cmr20692719pll.10.1661864917721; Tue, 30
 Aug 2022 06:08:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220830065530.2418-1-vasileios.anagnostopoulos@siemens.com>
 <20220830065530.2418-2-vasileios.anagnostopoulos@siemens.com>
In-Reply-To: <20220830065530.2418-2-vasileios.anagnostopoulos@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 30 Aug 2022 10:08:25 -0300
Message-ID: 
 <CADkTA4OgFd3EtetgOdkMF_x8FbuPc-H=995TtgJwZmtTxhCufw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] k3s: sync the version with the
 upstream version
To: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 30 Aug 2022 13:08:44 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7582

On Tue, Aug 30, 2022 at 3:56 AM Vasileios Anagnostopoulos
<vasileios.anagnostopoulos@siemens.com> wrote:
>
> The k3s project is using as version the git tag:
> https://github.com/k3s-io/k3s/blob/master/scripts/version.sh#L58
> This patch applies that logic in the build artifacts.
>
> Signed-off-by: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
> ---
>  recipes-containers/k3s/k3s_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index 66ff523..23bd783 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -19,7 +19,7 @@ SRC_URI[k3s.md5sum] = "363d3a08dc0b72ba6e6577964f6e94a5"
>  SRCREV_k3s = "24da6adfa98cd05849edf1c42de3862f843a05f4"
>
>  SRCREV_FORMAT = "k3s_fuse"
> -PV = "v1.24.3+k3s1+git${SRCREV_k3s}"
> +PV = "v1.24.3+k3s1"

The first patch is fine, but I won't apply this one, as this is an on
purpose decision.

We are not always on tags, and we need the +git in our version. I
won't bounce it in and out of having git+ as we move through versions,
so the git is always present.

Bruce

>
>  include src_uri.inc
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7580): https://lists.yoctoproject.org/g/meta-virtualization/message/7580
> Mute This Topic: https://lists.yoctoproject.org/mt/93344106/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C08C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 13:59:45 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web10.20554.1669211979791673299
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Nov 2022 05:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K6Mt6n9F;
 spf=pass (domain: gmail.com, ip: 209.85.166.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id d12so551331ilv.4
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 05:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MYBDenQfz+7UyyK8MnPJQo3GfiRFP7TQ20Y/dXdjTf4=;
        b=K6Mt6n9FyT6CVtM9eF3Q+PTA2M4N99NvL8/Ppe9GqxPTbtbzq8vzVtN+wQIKnmX6Rp
         87PDirCelJiMzAG5Ux3QLyUWUzJfAl4qPOvsf7s9hdwrF6ziI4z3MXshfLICq9p2gr4h
         gSvJ5BFTSEfpBCK/GMAPAZyOqFd9kJ8xxFGYVUYX6CY8b8ytRaY+y7kacAjNvtdOPNpM
         rEJO+IpYCDjouGNxp3ThA4+rGRfPSoiGVZbeB244nhiV7yC0UMuQ5KbvrnF+rUe/jSr+
         AQDqrYoNnYzXEvSMuJB7W6RTicpBEs8w0b3RZ5r/9UQWz2jkOG369XBKxiYCbhofncjw
         RpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYBDenQfz+7UyyK8MnPJQo3GfiRFP7TQ20Y/dXdjTf4=;
        b=b+mfLpJVN6DKsZ0FKskia3zU4KMXkuiP1aA+jetqPwpBjawfcGKUbyk9B5NVMV7cgz
         Uk1YhTgNWcwV6YQl2PQ1IgbX2eOWfg5hYB51pQQIzVPMsW79+lkkOvcZBt+r2mn10iZc
         PlI3yKp4Lv4iEG2xrXCthgUwt5KZktsiW25w5KXRdPyCOqDzQcY4xDmFxHUlPf6Xt7UD
         eWHAL8EeErbpe+UJacU4NXjbOolN3dnhCLosXK65wsA2H9eROSHG3kADoMZaWlLwpkjQ
         1MU4GdJkUz4AtwOFydVeR/UWAdz/NHHGgs+upesnEii2/npWs8MAEn/bXSc8EYPmWwCL
         9WVw==
X-Gm-Message-State: ANoB5pnFcYv+7s9T8QzSrJWL20X2Wf8jpz4xhrE412NsJ+Wm9yjU0bjy
	aLfdHhzsycdZpeP0McBRWPYtEH9EwLYSLpG3Aaw=
X-Google-Smtp-Source: AA0mqf7YLtmlZx7oTOnfgRO5dUxkc+BaNtThS3q1U9PW4FiAJi0as7b3xAMOiq/mQWLOeoVQ5FFjeI74valn3hdB6tA=
X-Received: by 2002:a92:c14f:0:b0:300:e884:70a4 with SMTP id
 b15-20020a92c14f000000b00300e88470a4mr7283704ilh.263.1669211979059; Wed, 23
 Nov 2022 05:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20221123085534.3335479-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20221123085534.3335479-1-mingli.yu@eng.windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Nov 2022 08:59:27 -0500
Message-ID: <CADkTA4Mz1TngPwsc-ZcMUw87mmnPCMBPMbQsiv+=R4Q2sKpv-w@mail.gmail.com>
Subject: Re: [meta-realtime][PATCH] README: Update the maintainer part
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Nov 2022 13:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7694

Wow!

You'd think that I would have noticed that . Thanks for the patch.

Bruce

On Wed, Nov 23, 2022 at 3:55 AM <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Update the maintainer part to fix the yocto compliance.
>   INFO: test_readme (common.CommonCheckLayer)
>   INFO:  ... FAIL
>   INFO: Traceback (most recent call last):
>     File "/build/layers/oe-core/scripts/lib/checklayer/cases/common.py", line 38, in test_readme
>      self.assertTrue(email_regex.match(data))
>   AssertionError: None is not true
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  README | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/README b/README
> index 4fbc118..5ccbaf8 100644
> --- a/README
> +++ b/README
> @@ -30,5 +30,6 @@ revision: HEAD
>  Maintenance
>  -----------
>
> +Maintainer: Bruce Ashfield <bruce.ashfield@gmail.com>
>  Please see the MAINTAINERS file for information on contacting the
>  maintainers of this layer, as well as instructions for submitting patches.
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1E5C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 19:50:46 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.1492.1655236239337050945
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xm4KP2mL;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so10020083pjg.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 12:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/r8No+4LadEn5l4wBj4ueGo/TE1mHWNKtobEqbL7yV0=;
        b=Xm4KP2mL9BKXF5zDpnrmyDEz2lWr5Ir27vr23ctKt+r6lLhmmuPVc9Wo45DLwdn0PU
         I5LoWn6RNZzQV0RvIQLRosru5G4H4UhCQUgtl6JuA65RPVvEKS2T5vKd8/WIeOYMfi9W
         RwbIZFJ4GiNNwTuOZBw+KjNNqfUdT4SqY/vdMqSZKpR67TmC+ZzhqwSmOKlRYC5LgnoW
         LFoHyDGUiCtE0Dee2DSOHy8MAklm0/82tn1b0CyV3qUOWLzyW1yY0Vz1bY0zX7NSXHJ0
         Kx6hDRPfeHnbgOcsgE/G8dnAZGPa6JThAnPBp+zrKpyWoItE3zbsReBzh7kVl22D6/UH
         BHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/r8No+4LadEn5l4wBj4ueGo/TE1mHWNKtobEqbL7yV0=;
        b=5mckgH82A6NKrCPoAuuogKYDfIhPkqEm79KrxFE1CcgguGHEShLHKuGH6bCVv3fXOX
         W5KNnU+i7V9wo1QtidS6csA63O/cRdPGRqmw4DpOQSZy2cxUs9nAb8fyIrRi7nVlLCB0
         YsMLwQfX1cJpC7xIxx/Vsu10GwJuHlPlgRLz2u2/pLTXxTivGpU0FCo6HLczK57hwvJS
         V+aKR1fP4ErtvcSLnoY5osLkrDmiEICzdSqkI0aNmt7l27B/nEU9Dj6hrtm0tfwMkCLc
         3a31SpLw371n0mPqUeuPjP41e+q1j4y9qMXpn03cUAAMR0/k1EW2jdVuxMJjReht+B73
         jo/w==
X-Gm-Message-State: AJIora+C3CHs8khYINCVp8n429d9Z7XfaB19k4nhazBK6YEsEwB1+oOC
	3uBGZnZagKFMFYnhGFe5H8QvhVfYuyqAYQQcTMjVsiXspH8=
X-Google-Smtp-Source: 
 AGRyM1sOE2zVRQBmUkkdTeUL12ME/exKNc7ZA0uPckd9d6CLXx5TtYr3wtOkNmt29lTAEspoHPDyO2cGDXaDQSazefA=
X-Received: by 2002:a17:90b:20b:b0:1e3:290c:c2ad with SMTP id
 fy11-20020a17090b020b00b001e3290cc2admr6203528pjb.163.1655236238811; Tue, 14
 Jun 2022 12:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220612080009.130993-1-Qi.Chen@windriver.com>
In-Reply-To: <20220612080009.130993-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 14 Jun 2022 15:50:27 -0400
Message-ID: 
 <CADkTA4NHmi9ayFGpkLqE7gxDCWrT_ER67Us6vqdes2EvPx3O1w@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2 1/9] docker-distribution: fix the
 inehrit and systemd settings
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Jun 2022 19:50:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7384

Thanks!

This series looks better.

I'm working through some other integration issues, but will get this
staged and tested shortly.

Bruce

On Sun, Jun 12, 2022 at 4:00 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> In order for systemd variables such as SYSTEMD_AUTO_ENABLE to have
> effect, we need to inherit the systemd class. We also need to specify
> the package which contains the service.
>
> As go.bbclass already inherits goarch.bbclass, we only need to inehrit
> go.bbclass.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../docker-distribution/docker-distribution_git.bb            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index 0dbdc49..395694a 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -16,8 +16,7 @@ S = "${WORKDIR}/git/src/github.com/docker/distribution"
>
>  GO_IMPORT = "import"
>
> -inherit goarch
> -inherit go
> +inherit goarch go systemd
>
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package.
> @@ -66,6 +65,7 @@ FILES:docker-registry += "${systemd_unitdir}/system/docker-registry.service"
>  FILES:docker-registry += "${sysconfdir}/docker-distribution/*"
>  FILES:docker-registry += "${localstatedir}/lib/registry/"
>
> +SYSTEMD_PACKAGES = "docker-registry"
>  SYSTEMD_SERVICE:docker-registry = "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
>  SYSTEMD_AUTO_ENABLE:docker-registry = "enable"
>
> --
> 2.36.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7370): https://lists.yoctoproject.org/g/meta-virtualization/message/7370
> Mute This Topic: https://lists.yoctoproject.org/mt/91702570/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


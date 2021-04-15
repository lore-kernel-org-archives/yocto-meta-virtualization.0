Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.6301.1618490309575822423
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 05:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QGyQ27Jb;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o20so1572792edc.7
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 15 Apr 2021 05:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eWrYVd+o4uYjwKYrAY/dF5bTIoD6JNMKC/QL6b/EhGQ=;
        b=QGyQ27JbdLKTTe9GiV5feg0kWpgF8t8a1/okSwsE09Oa0EUkpZtKQm4cpPmtyoKLwT
         ZVYLi5ZH8NN/WkHVC1anlohi8QLnydOjQRMZPuVo5+G72/+YwAoEL4D8LcJNoPJVA2QG
         RK4DPXwN/p1Ni+wot4LFU2E+ZYd4Lp5lhQt6t1pFzj52yIMCPY1erlWT/uGx5Fmvcsr1
         OpNHNSFD/Ww0NX/EuJzZmQq3FGBUlgil//oi7DQBK8JMVUrM+A1yPLzpX8tg64L1ZXSM
         Pgs00oIS21aIwBb/aqP5NLjVl+tldwoMUppNoH4FhUBtLMYk99jN/CY+kWP1o6xkvepH
         F/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eWrYVd+o4uYjwKYrAY/dF5bTIoD6JNMKC/QL6b/EhGQ=;
        b=tZAeCzBg3UI9qX8U9Fi/WZyBgN0qzkTrSbWCRh1wp60HBqbfALeHXWiLX7MqBxvTvV
         3E2LNf9qXpONXV6K1qZZpF90Jct8P9BGkOQwpNPd92QDgjQggmSaLYt8h+9lDWw88lg/
         ydjm00c5GU4jAa8emnb2v8IsK+YiiUninVEjwjwEHbAIvmBpgnxBG4o1cAK5SNm9wqDB
         DAj8I0Xi+3izr9JLJIQfFkFAoePiduMyH+tWeY15bF8rFetHAxc30zymALD/AaINF/LE
         6qJyQNcGv7c61ztnXjNblN12nCDUtxPYYpUKOV7au23c6dKKdtKFJ1P8s1SsAj4zuZXD
         Cq4w==
X-Gm-Message-State: AOAM531cb9T8qEghewc4RsZv86CXoxBYiewoTSIO09qkXydGetHoZ0Zo
	JbBaqYsyMgnfDmlAAKglt+8sRNoSFHPLltaOHAM=
X-Google-Smtp-Source: ABdhPJyciS+8mDvyNOzIlCloEQs8p4JcAl+SRznTkMdVC6NlOXqgjPI0R2U99X9hUqL79yv8C+mcYPogMK8c/JdFct0=
X-Received: by 2002:a05:6402:2744:: with SMTP id z4mr3935106edd.347.1618490307954;
 Thu, 15 Apr 2021 05:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210415083718.19954-1-nathan.dunne@arm.com> <20210415083718.19954-2-nathan.dunne@arm.com>
In-Reply-To: <20210415083718.19954-2-nathan.dunne@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 15 Apr 2021 08:38:17 -0400
Message-ID: <CADkTA4Oj4xJ0Cwo5kGEBxB_1pMJuQK51o7e0xcKkybni4F0HZw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 2/2] podman: Added kernel modules for iptables error
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

What's the delta in v2 from v1 ? It wasn't immediately obvious to me.

Bruce

On Thu, Apr 15, 2021 at 4:37 AM Nathan Dunne <Nathan.Dunne@arm.com> wrote:
>
> From: Nathan Dunne <Nathan.Dunne@arm.com>
>
> Added kernel modules kernel-module-xt-masquerade and
> kernel-module-xt-comment to RRECOMMENDS, to avoid iptables
> errors with podman
>
> Issue-Id: SCM-2355
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: If806a6802352b2658a695bf5265c1ead82fe3248
> ---
>  recipes-containers/podman/podman_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 62ae024..6fb803e 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -109,5 +109,5 @@ FILES_${PN} += " \
>  SYSTEMD_SERVICE_${PN} = "podman.service podman.socket"
>
>  RDEPENDS_${PN} += "conmon virtual/runc iptables cni skopeo"
> -RRECOMMENDS_${PN} += "slirp4netns"
> +RRECOMMENDS_${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
>  RCONFLICTS_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

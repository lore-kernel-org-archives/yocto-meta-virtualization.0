Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.12164.1576684081900580268
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Dec 2019 07:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WvVT+43k;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id t17so2038230eds.6
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Dec 2019 07:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hVOgq4JZfyVtomeRps6Thk7m5QmoEYlTFNx0aist5ZE=;
        b=WvVT+43kY+od4WMhGI2ybj5YiHzTFDXk8aadxrjwxeoDrehE/v2FbcyJvF3xcNu9gN
         Sc+iQAJoiOWCY/WApLN2y8aIfQgx/LdYyeTZQa02HXLDwBeP3ifj40qK7dBmgpoMDIOI
         sH0cZxw75p3PHKlK+SWJzb6zG3HW3Utp9EvZuiBUeByRx/MaM5dLNrqQz/x0It+hoR7/
         2mcEA2zbyS+VRo68bSAdusZBWI0LhN91CPR6jkds5h71/88B4ZZamIECcgfnlJaQRDin
         sZW0uOhhqcUCAF+afyaHrFkIx2MUwEZ6/rJ1Z1qEPNvFnZBoroudC6F82vqz4O0Ree/s
         S2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hVOgq4JZfyVtomeRps6Thk7m5QmoEYlTFNx0aist5ZE=;
        b=uSL/K8+7OCf9OPvL1VWJtlVuk5C3egj4/yqh1LPFkHyCSRZzT5plNhHknclQH/T4Ch
         cRpGXPgSsl7JHuWLfM2Mnlnrn2zICgdvu3NZ8n2qqAUKfBk7EtzfFdFcpAdh2dzF6l2X
         z4fwN6x3Kv/CxbdceU04bRLVjeeUydO/46sd4a2fVHMi/z6StGCr3BkAeLXxgXc98NFv
         /qPxNMU/yOJbH4cDTCIorY0WshxoLMX3fK4N2V2WiinxXB9ZRmLKkiVNdNGoaR+PchlL
         yovsdtc/5YBkEXdQhEPxgAUR2LXkSz5NFB/0C1eU76ik4kbabe+AV8ChdSRmLNkzqlta
         UA4Q==
X-Gm-Message-State: APjAAAVq0Ferde2bDqxupxHMG70K6b/B7F7QbOx2WSXk6eWSji8eITKP
	4JkFb4VlCLC8PJlb2FVkHDJFmYWBwBFpbjpmbsU=
X-Google-Smtp-Source: APXvYqy7yIoY/AhwRQ2i69v3SMp8gbbMXwgcK5n4xkpZ8XF3Ip0QQr4ezDiDFsPQ3hfzIcxhqXiNX9boOxaEtwOd5ko=
X-Received: by 2002:a05:6402:55a:: with SMTP id i26mr3160926edx.16.1576684080429;
 Wed, 18 Dec 2019 07:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20191217022902.12973-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20191217022902.12973-1-timothy.t.orling@linux.intel.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 18 Dec 2019 10:47:48 -0500
Message-ID: <CADkTA4Md794SfUCzYuFfxgoH9dMhMg8HXjJp9Q8G1aUNB-GE_g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: upgrade 1.6.1 -> 1.6.2
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 16, 2019 at 9:29 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> Lateest upstream is 1.6.4, but neither 1.6.3 nor 1.6.4
> build cleanly.

I have a full podman upgrade in my M2/M3 work items, but haven't started it yet.

What sort of uncleanly-ness are you seeing in the builds ?

That being said, I've merged this change.

Bruce

>
> Release notes:
> https://github.com/containers/libpod/releases/tag/v1.6.2
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index 50d07ea..e73c028 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -24,7 +24,7 @@ python __anonymous() {
>          raise bb.parse.SkipRecipe(msg)
>  }
>
> -SRCREV = "233d95f4f0a815f11d1c1ae9aba16781c4eb2700"
> +SRCREV = "f3ffda1e08f19e9a6a88484136b5eed76533f21a"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=master \
>  "
> @@ -36,7 +36,7 @@ GO_IMPORT = "import"
>
>  S = "${WORKDIR}/git"
>
> -PV = "1.6.1+git${SRCREV}"
> +PV = "1.6.2+git${SRCREV}"
>
>  PACKAGES =+ "${PN}-contrib"
>
> --
> 2.24.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4880): https://lists.yoctoproject.org/g/meta-virtualization/message/4880
> Mute This Topic: https://lists.yoctoproject.org/mt/68749608/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

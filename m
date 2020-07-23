Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web10.545.1595529731169750138
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2020 11:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=S2YgdWkX;
 spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id h17so5911196oie.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2020 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=szkCSr8tAJIjHaosCpmGB9DhRfGWYEAjLuXfYplu7yA=;
        b=S2YgdWkXAFDSlezweaP57oSjZduRZ8ILWnx7VG40dpSCVPUNVVqiBRj+PXAOkahHmg
         KhqCESwbp+VIbWN18w6ovBrqtQ87NoWZK2Syh5+gIqqJKZtGUfIbe/mO5tCB0uOUWWoN
         3Kv5cmJQmy4AUghlFDiwwOigZVxaLhbjA0DojdZt9rde3QZJSLp9TlsCqhIEbMQCShb+
         o9kmy0xqOF6hx2TbUZnC4cy8TKBqGj5dhPozCBuHxBSiOwnZ9fpJnKyZJGSx4Kqnu4TI
         XwAsPVgdPidodkYxmWRVaESPYjZQm+I0LNMB6AysqtQReS5+Jo+nZ3L2yAZumSJ1M6t2
         3WmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=szkCSr8tAJIjHaosCpmGB9DhRfGWYEAjLuXfYplu7yA=;
        b=hqFNCw2i9eQ/ay6BBuakfJGl4n9yPZMh+5fCx4WOBtJtx30qQtJkQXU0x5FifDbxJT
         OHReDimfqdJodIqKt3jyHUP2xyM+I7fOwHb7AXPAen+q4NnjUWho2W+T/IyFKOV1WYzj
         lXYit7jzDnSMdEIZp1qu8tpflu4EEWgesCYbMz5XnEikbgUxELqChZ66uv2vIyr5e/8j
         VJdLFjAGrK4wmUvoJFHIdSq4j130zywJbfMwgqYezeOmFezM14bIs6TtS+VSzviVvuDC
         /5iN50v+3HnXKdpszOuWXPeRfSf0ypCRb1xu3JGgMDye7oAtY1AluuEy+SwrYbeMWuYo
         T35w==
X-Gm-Message-State: AOAM531io0Z7Hzu+DxgKb7GzHkY9dgzMkKh2WsYIZ4QwCdZgDC7VaYZs
	fm9/UOEcHITbFjJuJSIThT/SAua2EPIR/Fn7t9Y=
X-Google-Smtp-Source: ABdhPJwuE2MLBwOcqCXiHdPQg03utthTVO/Wrz5LiLomJzASiAx7tyX96bm0Cdwbk8Dw1EVC0WppxSqPdB1X+nOY9f0=
X-Received: by 2002:aca:72ca:: with SMTP id p193mr4843537oic.20.1595529730515;
 Thu, 23 Jul 2020 11:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <1595515597-112052-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1595515597-112052-1-git-send-email-diego.sueiro@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 23 Jul 2020 11:41:58 -0700
Message-ID: <CACMJ4Gb+VrL714otAe1RB_yyx_-qeTos8bJeSgOo=zL9=GtOyA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] qemu: Remove duplicated xen PACKAGECONFIG
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 23, 2020 at 7:47 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> The "meta/recipes-devtools/qemu/qemu.inc" already sets the PACKAGECONFIG[xen].

This is correct and this section of the qemu append here can be
removed now, since both openembedded-core and poky have been updated
and contain this version of the logic in their qemu recipes.

Thanks, Diego.

> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
Reviewed-by: Christopher Clark <christopher.clark6@baesystems.com>

Christopher

> ---
>  recipes-devtools/qemu/qemu_%.bbappend | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-devtools/qemu/qemu_%.bbappend b/recipes-devtools/qemu/qemu_%.bbappend
> index 998a401..5cca9e1 100644
> --- a/recipes-devtools/qemu/qemu_%.bbappend
> +++ b/recipes-devtools/qemu/qemu_%.bbappend
> @@ -1,3 +1 @@
> -PACKAGECONFIG[xen] = "--enable-xen,--disable-xen,xen-tools,xen-tools-libxenstore xen-tools-libxenctrl xen-tools-libxenguest"
> -
>  require ${@bb.utils.contains('DISTRO_FEATURES', 'vmsep', '${BPN}-package-split.inc', '', d)}
> --
> 2.7.4
>
> 

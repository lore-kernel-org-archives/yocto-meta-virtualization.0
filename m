Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DF3F5A8D1
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 02:27:34 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4453.1776738446831901215
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Apr 2026 19:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Vo53LiWh;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d6d5e45c43so443512585a.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Apr 2026 19:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776738446; x=1777343246; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6SokXVAX1ipY96Po2T2B1KP5xjBnbjP0dBXIUfLzaU=;
        b=Vo53LiWh2BwRB8NhSvZWZwtvfI2fYimGpIuwEqumGgJ1J0OpRPtIXMcrbLAQUJlwvd
         qsprBBbLbHH/jSKxZSFo4Wr2icJvvVPCOi70M24prw+QEvGN7ZQDmDdZOHxVJPdBbxZW
         qeV4na3P9+jTEOEjkM24tOY/vyWcfN8sgXJeUrYihsZnLcbv62HkIUeoZ8VfhF0Ibuk7
         Pwyd5lVdosxUJef4F+F+K1nrSKb2F20mXUGp4fQGeZuKTuUT6GmoJ5d2RFzVkllM4ilI
         SJ+gE6u5n2Z/UDmqg7nb+hWjzEzMFPobSpd6gyJvzWqQyGXBb5pNlp9C5k0xXM8+FnDk
         z9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776738446; x=1777343246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6SokXVAX1ipY96Po2T2B1KP5xjBnbjP0dBXIUfLzaU=;
        b=eW0MR42TkB8accc+AG0b8OVxk7qUuUJLBT+1hkwqChin/k+0k7pFplK97HzsMF7kQL
         rzssAkjaX3x3j5XuEIbUxAjK7dzjsgC3Bw3v73q1l1CZl2nR3iJe8xXsRfz6kO3MRfRL
         yyro9SjV/hq3KCH0z2VemZaUnNa3Qir4fb+4tXilONO6bui2oVWcoLxQcZBKbFymrCWd
         rR8hNOsNr+EinzfSEZqbZzuaCzkUUiHI1r5ntxXCcnpHUUYM8q5DSU0mGC6XZGN7qnuO
         fdwAZ1sRAmBz1zDt26PAWOQ0eFdr+w/vkrYyvmoqSJC1SBkFyf2iRXXkM9n3oA/fiKUJ
         P2DQ==
X-Gm-Message-State: AOJu0Yy2EI/sQOZ50dvKjGXAnNi0MZg6D3iJ8CVyYp68aQJPkqq20NqE
	wBSU9HEsSlyvDbli2JOO6JdIrxY3IBTkvGq+Bd59ZCJhrZ0WIb/njviF9eknlAny
X-Gm-Gg: AeBDieuRshPdPi1/EOkpkumL/Jt9YM7i7bqeb1zkeroqndiyyCeH5qnu/ITnZQB0Ilh
	hs7YA2htHL2V6rfY0kr4fpTMXlHom0ISs7OEAt9bdcCMA4PcLypo7PT7/o6z4XpUDchO6YIAKEK
	oBgkVk47xNnZX+zxLdwUhbxIeQczuBGcDd5s7DC2N0CEASEQvLQ550pGTx24StTVJjk9qqkOrER
	DG2yI1h0zW5Yiht8KZXQsdxHEgPytxFt53HXGEpaLHWBxYQx3/xI3mWwhijRh0y0bwzPCsqmG6d
	cSb0cTkTy9/UqMD2oJGcqSjBsAl2b1b45EJht7C7hVgToIsbeJ+QExZhHd98h9b3W864SmP/0uH
	Tm8bBxN04wT0E5NPXZkm0575GdHHyrZllnbuLW0FoKNRQWARqARrtivcXb4FXNbzHjIWSt3ACOT
	eBTEXVsaN5b72tEGouaZvy+cXs0YYyub33lZ4oVITRI0bzbjmFETUmyHk0cti6EMff/6lq4+WGx
	A/B/oFDpR8FRd/1fqIaxy39KsWxEPU7HftJb3XX6CrePtE=
X-Received: by 2002:a05:620a:3e87:b0:8ea:e1a7:24a5 with SMTP id af79cd13be357-8eae1a73776mr709540285a.30.1776738445581;
        Mon, 20 Apr 2026 19:27:25 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8eb61bc0d7dsm349638985a.24.2026.04.20.19.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 19:27:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 02:27:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tanguy.raufflet@savoirfairelinux.com
Cc: meta-virtualization@lists.yoctoproject.org,
	paul.leguendekerneizon@savoirfairelinux.com
Subject: Re: [meta-virtualization][PATCH v2] libvirt-dbus: disable
 -Werror=inline to fix build error
Message-ID: <aebgiuuWRWusCmVQ@gmail.com>
References: <20260414090010.79091-1-tanguy.raufflet@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414090010.79091-1-tanguy.raufflet@savoirfairelinux.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 02:27:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9712

I had already merged v1, but since upstream hasn't done an official
release in quite some time, I've gone ahead and changed this to
a PV+git and moved to the tip of the tree.

Which allowed me to drop the CFLAGS:append = " -Wno-error=inline"

Bruce

In message: [meta-virtualization][PATCH v2] libvirt-dbus: disable -Werror=inline to fix build error
on 14/04/2026 Tanguy Raufflet via lists.yoctoproject.org wrote:

> The meson.build from libvirt-dbus enables the flag -Winline. Combined
> with -Werror from Yocto, this causes a build failure because GCC refuses
> to inline g_autoptr_cleanup_generic_gfree() from the glib header
> glib-autocleanups.h, as it considers the call unlikely and estimates
> code size would grow.
> 
> Because the function g_autoptr_cleanup_generic_gfree is defined as
> static inline with good reason, this patch disables -Werror=inline for
> libvirt-dbus to allow the build to succeed.
> 
> Note: This patch is a workaround for a build issue in libvirt-dbus. The
> underlying issue has been fixed [1] upstream in the libvirt-dbus project.
> Once the next version of libvirt-dbus is released that includes the fix,
> this patch should be removed.
> 
> [1]: build: Do not use -Winline
>     SHA: c0fffce8c45e79b73bcb63fac70e24a827367dce
>     Repo: https://gitlab.com/libvirt/libvirt-dbus
> 
> Signed-off-by: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
> ---
> Changes in v2:
> - Added comment referencing upstream fix and note to remove on next
> version bump
> - Link to v1:
> https://lists.yoctoproject.org/g/meta-virtualization/message/9695
> ---
>  recipes-extended/libvirt/libvirt-dbus_1.4.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
> index 767470e2..17db13a9 100644
> --- a/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
> +++ b/recipes-extended/libvirt/libvirt-dbus_1.4.1.bb
> @@ -16,6 +16,10 @@ SRCREV = "0c355bb8921d7cbccf93f41a8615fcd973e64f70"
>  
>  inherit meson pkgconfig
>  
> +# Fixed upstream but not yet released. Remove on next version bump.
> +# https://gitlab.com/libvirt/libvirt-dbus/-/commit/c0fffce8c45e79b73bcb63fac70e24a827367dce
> +CFLAGS:append = " -Wno-error=inline"
> +
>  FILES:${PN} += "\
>      ${datadir}/dbus-1/* \
>      ${datadir}/polkit-1/* \
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9702): https://lists.yoctoproject.org/g/meta-virtualization/message/9702
> Mute This Topic: https://lists.yoctoproject.org/mt/118819722/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



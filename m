Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57861C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 19:51:12 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web11.128800.1669665065415147189
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Nov 2022 11:51:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Nt7OWzUz;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id f6so5552574ilu.13
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 11:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uw6JXpsBbrZON+Zh8Krj5PSGbGE/NnsVfcgL8aWyQCg=;
        b=Nt7OWzUzpvl6jHpYO3WU0YtziboWs7VDdf/XX5RzfQeCgRhj7Dn5CrqARUfJxKs45T
         W69E+kwAAqRzcG10h68bO/AFdlxJRiE0sv55xrmD4R+iKNWHAXDJWyirbPvji5mMmINF
         MYQZHeToG4k6hQOkDAQlj0Ldadl5zf0RE16B7OqwjCYpySIfw935g5uXaYNjf+F1Ix1s
         czijSGzYrYkj8F0V2ZD0n/dyZp8XQqcZXeGDeovTAGBUSoW66IcU7TOyXNiI55WcXlfd
         bfjKrfvAL4NP4A6e7dQqbRoojjrp1R3OP+eQbiWvafEoiMfSid9yF8/B4j83TAFee3ea
         oYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw6JXpsBbrZON+Zh8Krj5PSGbGE/NnsVfcgL8aWyQCg=;
        b=TK8D9tgwmhWHDfpDmWDpqw8SpmntPI0ZelWX7627bic5xyNez63tBWWky2Cu0kq23i
         ymbLHZbrMSnuBwRtm6HvDNhOo77kU8E/yIzfUy9uKeVJ7fSg0BERMHkc5BNZLc89bdlM
         Zz5kLUS9Vnz1cd/4BCdTTP5QRBGKvCDyNdX8XybJefGnd1VThFhF4ZpZv+rpJSKIPj+I
         5wxP4jnV9IkFVeVaMfWwLrenE1oimTc7Q3tObpXGY69sttim1XMeEmQT5Ui4xWcXxVOr
         QTdf1+d37B57qOxc9PYbQl7/JmZi2jjymm9B+6tu7nPInfdfe+XLnTzIXQ1ocdbFtR1X
         1K1A==
X-Gm-Message-State: ANoB5pl6/dh3BgJIy8PybX0kxOhTD5QndLy99dJiSPmqQZMGhHF+XkQU
	m6uvFd9tgFcWmPVqZZKNxhOCdFnja1zRJJyLT07o9neKZcg=
X-Google-Smtp-Source: AA0mqf7fjkyyiyx4p35wBW6y0y0zMWSC08wA+BDbkqa2oHPDg8+tDI0ojCPliUi6Kb8gLwclcqAET9Fw8omWYiVIg5k=
X-Received: by 2002:a05:6e02:180e:b0:303:1214:36ce with SMTP id
 a14-20020a056e02180e00b00303121436cemr3208088ilv.28.1669665064644; Mon, 28
 Nov 2022 11:51:04 -0800 (PST)
MIME-Version: 1.0
References: <20221124135113.4385-1-f_l_k@t-online.de>
In-Reply-To: <20221124135113.4385-1-f_l_k@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Nov 2022 14:50:53 -0500
Message-ID: <CADkTA4PDr4X2tcFwSo4ZW2iwBmfSaNU31M7PpBT6NNVn5FTCSA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCHv2] libvirt-glib: fix pointer-sign issue
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Nov 2022 19:51:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7699

v2 is staged. Still working on the path-qa issue.

Bruce

On Thu, Nov 24, 2022 at 8:51 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Update to latest commit to fix a build issue with latest glib-2-0
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  recipes-extended/libvirt/libvirt-glib_4.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> index 11ad84a..a5cd827 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> @@ -7,7 +7,7 @@ DEPENDS = "glib-2.0 libvirt libxml2"
>
>  SRC_URI = "git://gitlab.com/libvirt/libvirt-glib;protocol=https;branch=master"
>
> -SRCREV = "940bd9ccbfe419573ddec4383e3def4aac1f0e1f"
> +SRCREV = "e0bfc34682744a74b850fa217e9c206a9eb80612"
>  S = "${WORKDIR}/git"
>
>  inherit meson pkgconfig gobject-introspection vala
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7698): https://lists.yoctoproject.org/g/meta-virtualization/message/7698
> Mute This Topic: https://lists.yoctoproject.org/mt/95237858/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


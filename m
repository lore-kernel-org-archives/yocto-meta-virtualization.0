Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61117C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 13:40:02 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.7120.1641908401547451636
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 05:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7FPZFVH;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id u25so67355088edf.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 05:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KYz9CkWuZGmH96BGjMfxcYo5ZkumMBwuINMZXWiEOOU=;
        b=i7FPZFVHZI+Kn4fGejXqqiq+Doc+nE2TncR9RBe+hqAgA4t3TLdDxcXsryTMcvwr2+
         i4M/JKYZLZbh0cznk7PuyDDIjd+/j7cVi6L0uiLr8tg8g/BngX+cM5BbYiGU42Kmrrao
         T03loCaGqSOq0fmHupcnPPqGFGRGXd5d+JJUuR+FKIm3pvhUlCogyf6+59TwXzAK9cxz
         xN5wdBX34dns3+cF307XWVdpLBdiJSN0eYWrdazgt0bppGja1O+Axg8MdwS+S3gLB/WV
         zYuazQppA2/WSt/7zUE7uu1FiJeUkw9Q8o2N/gmNSMqGWWuvbfTr9z/lqWPmy1lQUx2U
         naYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KYz9CkWuZGmH96BGjMfxcYo5ZkumMBwuINMZXWiEOOU=;
        b=2PrrIBaaV8z22u+mRyCiT/DpMIm9Dl4+TjNoYfdFkXoWNzJkQUbz3Ocij0Ae5pkD/f
         dzKlKFicp5dgfWiA1XOw+tD6je5v85mXqu0A5q+askQL0sFnx7tqLzz91QJ3ErspEjQs
         /wFlWBsGmjis8vobO/vT8OmaVH/6ti4uaO5tB+e6CF0ua1SHiBQPLMJHLOQ1Dfiope7c
         ZU5blp+YxnzLoJtKwsNWOmI3r7yYFT9htMXlyNMJIAFhNujKMBdrG6oQnYdY+pZR1jlb
         5/CVZr4Mb1wNvPVqNwv1xkjZB+SEB/dCaOCqXkQNFWfiEBPB6fi09YXrtJOsJtyk+NlE
         vYWA==
X-Gm-Message-State: AOAM531D5jF6o+xYEppMpSG1Z4I5e32Mu9UysYe/62LVVfTW4pqz2tMf
	joqA6LrRNSdPME5wgNs6bfXVO9hbwq4BEdAdU7E=
X-Google-Smtp-Source: 
 ABdhPJygeOhSMCcWP+RLt4eq8PGxU1GVU55FWaGIKsbDyBuec2UrrvsiXvTgN0XW7rRsrKgwY7/YOtljhjJpCggMqQo=
X-Received: by 2002:a17:906:2cd5:: with SMTP id
 r21mr3760745ejr.435.1641908400079;
 Tue, 11 Jan 2022 05:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20220111122116.518980-1-peter.hoyes@arm.com>
In-Reply-To: <20220111122116.518980-1-peter.hoyes@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Jan 2022 08:39:49 -0500
Message-ID: 
 <CADkTA4MpTOdbp7WOZ7FKyZ4hx8ppFKov_Oy3=MAfNDRsReEnKQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] busybox-initrd: oe-core has
 upgraded to 1.35.0
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Diego Sueiro <diego.sueiro@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 11 Jan 2022 13:40:02 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6998

Hi Peter,

Thanks for the patch!

I had made a similar change myself this morning (when I saw my builds
break), and then noticed this patch on the list. I've updated master,
so we should be up and building again.

Cheers,

Bruce

On Tue, Jan 11, 2022 at 7:21 AM Peter Hoyes <peter.hoyes@arm.com> wrote:
>
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> ---
>  .../{busybox-initrd_1.34.1.bb => busybox-initrd_1.35.0.bb}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-core/busybox/{busybox-initrd_1.34.1.bb => busybox-initrd_1.35.0.bb} (100%)
>
> diff --git a/recipes-core/busybox/busybox-initrd_1.34.1.bb b/recipes-core/busybox/busybox-initrd_1.35.0.bb
> similarity index 100%
> rename from recipes-core/busybox/busybox-initrd_1.34.1.bb
> rename to recipes-core/busybox/busybox-initrd_1.35.0.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6997): https://lists.yoctoproject.org/g/meta-virtualization/message/6997
> Mute This Topic: https://lists.yoctoproject.org/mt/88347087/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


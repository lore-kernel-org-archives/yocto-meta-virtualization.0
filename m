Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.45365.1636381083808957445
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 08 Nov 2021 06:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HEM9vtcn;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id v11so60570647edc.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 08 Nov 2021 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=262j8xiBkkkBqHncwXTtkeuGNfCgJp8aYyXP64rE0zA=;
        b=HEM9vtcnEgINDnqUdVpG18QyH+MpjAjhz9VqLJwVY8xLSGvHiDnJHgEd/PkIwNl8w9
         UI2OeEGsYb755nFqBi1PrP3uYQtpUFqPI8E3SoFqzNQtIYWEN+MXAU4sz1zrsxu4QJG+
         NZyv2qbxaq5k+ah2xKDIFB3oRyOrylRKQnmL8qQ7qHgudDTxJoHZTs0/TvUtsRK60sDH
         wq3Kwmks6Rsu0PaKJuEp/0owmfEK+dhhfkga8oJpBjjC6trBTiMY4aDXLjkIScIMgG2M
         qnaGo+ohKQnV+8UxkGbcKx2gE3Z1y3mA55HWj5j2AiRPg3IxvXLms6azHncox5SbGdFg
         1vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=262j8xiBkkkBqHncwXTtkeuGNfCgJp8aYyXP64rE0zA=;
        b=QER1q1XsdmWcD7mcb7tt2VVoTip/jzl2bOB3xhPtxkZIisSTxS0iKUa39D4TOKv2rg
         M6ZF9gRzTPFQoaxRikx7tuaP0gSdR9O5qTrW4SUKHM7Log2fCxh3D1pOn7/NQqb7iLBW
         FdPqLH83xqAuosp7i4QhF9b4tRqZHLmARVmVeK6FuYQD08bRfrXoWJmrXuP0wj/mF8iN
         REZlEOrcnRUXOEpBXTwEbtd3QSHJV15OQledvPA8YI2/FHvGc6RFWbxlbcD71kPly1In
         VvmssmT3/OM3HUYP21ghbAPoA8UsiMEGsqAvZS1ZABezbedGOw9WCS/pYHNI6rNzo6YO
         35pA==
X-Gm-Message-State: AOAM533BLFFpYo8eMw5UjdyeGioJTA2xqqDXcIsp9NvM8FhasIPElF4p
	h46DjF7NYEW/fFxokcBl5B2ACYZmpcq3AB/691I=
X-Google-Smtp-Source: ABdhPJxz3WorrF7M1+i9h+Oh4VdkU9Dn6QJzF9jsOG4QcAK3ELDmJqTtEAfkYYy753dDfUGw7uuKqSCx9rFflFqkXo0=
X-Received: by 2002:a05:6402:5161:: with SMTP id d1mr88565988ede.385.1636381081885;
 Mon, 08 Nov 2021 06:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20211104221006.3757-1-crawford.benjamin15@gmail.com>
In-Reply-To: <20211104221006.3757-1-crawford.benjamin15@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 8 Nov 2021 09:17:50 -0500
Message-ID: <CADkTA4PM2N2PN_YuKDMuqPT03Vsu5F5ZGOGP=HjiJvfMA7Vmzw@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker: add netfilter configuration fragments
To: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

I'm currently unifying the fragments into the central kernel
repository, so I've grabbed this and will make sure it is represented
in that sync.

Bruce

On Thu, Nov 4, 2021 at 6:10 PM Benjamin Mordaunt
<crawford.benjamin15@gmail.com> wrote:
>
> The docker.cfg file is missing a few netfilter
> module requirements. Without these, it is possible
> for networking and bridge initialization to fail.
>
> Signed-off-by: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/docker.cfg | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/docker.cfg b/recipes-kernel/linux/linux-yocto/docker.cfg
> index 79012a6..9378266 100644
> --- a/recipes-kernel/linux/linux-yocto/docker.cfg
> +++ b/recipes-kernel/linux/linux-yocto/docker.cfg
> @@ -5,7 +5,9 @@ CONFIG_NF_CONNTRACK=y
>
>  CONFIG_DM_THIN_PROVISIONING=m
>
> -
> +CONFIG_NETFILTER_NETLINK=m
> +CONFIG_NT_CT_NETLINK=m
> +CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
>  CONFIG_IP_NF_NAT=m
>  CONFIG_IP_NF_TARGET_MASQUERADE=m
>
> --
> 2.30.1 (Apple Git-130)
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

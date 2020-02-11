Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16677.1581455755104006086
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 13:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W86jQxlz;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1F26E016D8; Tue, 11 Feb 2020 13:15:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3C93E003E1
	for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 13:15:52 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id 203so8066451lfa.12
        for <meta-virtualization@yoctoproject.org>; Tue, 11 Feb 2020 13:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOJRCYh2Tt0cTqkArI3zN4o54UqmGMzJrwxkZrdsPJg=;
        b=W86jQxlzzWfXtxA1yFAU5UOPiL4g/lVPVy9Q4LVJj/z8JAeT6mGOMEmHcqK17wzVpo
         nLtKmJAcGMXwaNU8SPnA2xy97BHQISNI8ZLEEac94mIq7IgaMUIcTxd064RfSnp2HiOC
         awwN9lCRQqZSKNXNJZEVrfTyyEQZ3/AqHzzI+SvgGRF7tuDHbkEyz3HfCOPPYN8TSf4Q
         0FxQzxBSuKe0RhAbZXFSFTn+E6kCw+P5lV9OYjKQdEcf+5IFlUedE1EruB69z8p1+UZZ
         dgG3fCIwOtX/SbL9BkddrWM36h1YwRVtULSq7jgTV7omDAKUbYpS/U3OCZse6uWQFoHw
         K6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOJRCYh2Tt0cTqkArI3zN4o54UqmGMzJrwxkZrdsPJg=;
        b=fmtp3PIuIp5WyMk7VzvccvAmXeJGGcnNAkb/xMs1njQKW6vUH7gINo2tMqh/KccYpi
         piF/aLi8CC1XcKNnfOAS5sirZEYO9sA/YfZ08He0lCmZFxwq1ZvVw1SRt5OifC+ujiej
         wxjmW6s1R8/T77Ca+Dchkwtm8kV6Pru1Xzvq0waCqf+cxz3ej8H2oWGLuUvsFw544eJd
         OclPGaksFeH5WJ61JJbKY+/AU44xBbwCciHwC2Ccg+tI4lT+uiu2+f5XwKFeKUoBb7du
         bpQDWsn1jcH2iPBDL6zxg4fBr8SpYJr1mp6p3n6m7Q7NWuJZZh+hj2SL4yMmqP1OkG7h
         cqVQ==
X-Gm-Message-State: APjAAAVVV8fjz1/QqHbVs3jxoqmTdHGMLl634tf+hx7cm6wcl9MJth3v
	2ETcfujJBDquI2WUEgy0p/4gzJYIjFxoABR6KgA=
X-Google-Smtp-Source: APXvYqw87QwFgl3ITjFeeK0/vD1zPQdw2wTLxxKOMpbBVGdz4ByG/NvNFh8eOmB/fPqRvZq810SyqOs0vuQVvDkyR3k=
X-Received: by 2002:ac2:47ec:: with SMTP id b12mr4711997lfp.162.1581455751509;
 Tue, 11 Feb 2020 13:15:51 -0800 (PST)
MIME-Version: 1.0
References: <20200210050754.3534-1-christopher.w.clark@gmail.com> <20200210050754.3534-15-christopher.w.clark@gmail.com>
In-Reply-To: <20200210050754.3534-15-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 11 Feb 2020 16:15:40 -0500
Message-ID: <CADkTA4OYBGGh9Wuc+M7RHBoEdDNM1tu5zJsyWGmuUeuYHiVscw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 11/16] xen-tools: change globbing to fix syntax highlighting
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, 
	Doug Goldstein <cardoe@gentoo.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, 
	Eric Chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 10, 2020 at 12:08 AM <christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Fixes an annoyance when editing the file. No functional change intended.

I'm guessing it saw them as comments ? /*

Bruce

>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index 5b0a339..e166c74 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -197,7 +197,7 @@ FILES_${PN}-dbg += "\
>      ${libdir}/fs/zfs/.debug \
>      ${libdir}/fs/reiserfs/.debug \
>      ${libdir}/fs/iso9660/.debug \
> -    ${libdir}/fs/*/.debug \
> +    ${libdir}/fs/**/.debug \
>      ${sbindir}/.debug \
>      ${libdir}exec/.debug \
>      ${libdir}/xen/libexec/.debug \
> @@ -346,8 +346,8 @@ FILES_${PN}-libfsimage-dev = " \
>      "
>
>  FILES_${PN}-fsimage = " \
> -    ${libdir}/fs/*/*fsimage.so \
> -    ${libdir}/xenfsimage/*/fsimage.so \
> +    ${libdir}/fs/**/[a-z]*fsimage.so \
> +    ${libdir}/xenfsimage/**/fsimage.so \
>      "
>
>  FILES_${PN}-init-xenstore-dom = "${libdir}/xen/bin/init-xenstore-domain"
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

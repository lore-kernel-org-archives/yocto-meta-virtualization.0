Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.26945.1605011853933564698
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Nov 2020 04:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o34w7g04;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id t16so14101452oie.11
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Nov 2020 04:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CqhbaUL7F+qUAsGy0SHTly0OB/l1VMM1XmFvV4jxQZw=;
        b=o34w7g04B2CrOFkxHe03645xwm9ErRsCFs7Fap3feRSFimjwJN63x4vmKsD5flVXSm
         2B+oT5vRyt4q5hyJ5/B8h07YwKHBwegtaguVVc1wis65d8Jtrol1/9Soevmf6t52pQfT
         NKOxnL7x8EzoDIcLj/UwlP81/2An4j2+sOX/RqAWaWkAF8gvhA0naPtLg+IF3fbRAyiM
         GMJpEKYZj6u6SYoLIn5ddt/B+CEo4R9KN5nKUErQtGnqiiiL5Dx9XjBum5qG+jfMOM67
         /qdxv9xk4rjJlw/OjBDJWIQ24nuZ+M/fqhNvcxNuXmW9kzGqnEsYLKbM2JtjwDLIcZKt
         wdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CqhbaUL7F+qUAsGy0SHTly0OB/l1VMM1XmFvV4jxQZw=;
        b=HnZs4pvS9upb4Xr/pPEI0O8Kp4mMxnmthKXuvjUjSb8MSldWblXvzyTYa8xa7+nQqk
         frBY6Zani8Jr5gQ78oCUb1K2zvn7Tq55d3mj5w6gm9Rtsdzt6knVHgxIO+fs7lFu0vzI
         q2K5SCOzo1R7ZqAsafr6Wv106oK+nJAaCxD+svHq7kvkHIVuZaWhiu4Ja75R72Cf2cqE
         qVlxsPrPbz2blnn4uYUa77AVhN5xMsAuHyb9y4+zVDQykG7gxIViAuO9JgD7LxFsdp8h
         22ndqBw8plQ+G/4NYvWHbMrUcrO89qzE0Lr5yXFajfB9gWAoWj5zJ6gGoR0cLuzRy9wL
         iBSw==
X-Gm-Message-State: AOAM5320TinNAtqlf9FLUj4FjQ+8yRE6zM1h8pqpw1QyfOfuc7Mdrp5D
	xt9d1CKutyRMIctJemWhJpA+MaMuOlrXF28C5hE=
X-Google-Smtp-Source: ABdhPJzQQVHmsW5epvmD2VwLGyTSrnjKfa72eVR920FbXvFzeQgotjrU6K7BLvp5eX1/121uXhHAuSsms3NVmTWmWzU=
X-Received: by 2002:aca:abc1:: with SMTP id u184mr2378615oie.122.1605011853296;
 Tue, 10 Nov 2020 04:37:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604933003.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1604933003.git.bertrand.marquis@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 10 Nov 2020 04:37:21 -0800
Message-ID: <CACMJ4GYsGr-rn0q0DgRU5BgTWGG04UEn=WrhU9Td=P=rPRFihg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/2] Fix Xen compilation
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.clark6@baesystems.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 6:47 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> This serie contain 2 patches to fix Xen compilation:
> - on arm32 by adding a patch already merged in Xen master to fix gcc10
>   compilation issues.
> - on x86 to fix an issue happening when compiling xen-tools with older
>   xen versions.

Reviewed - thanks.

> Those would be good candidates to include in gatesgarth.

Agreed.

Christopher

>
> Bertrand Marquis (2):
>   xen: Fix python libraries installation on multilib
>   xen: Fix xenpmd compilation error on arm32
>
>  ...ls-xenpmd-Fix-gcc10-snprintf-warning.patch | 60 +++++++++++++++++++
>  recipes-extended/xen/xen-tools.inc            |  2 +
>  recipes-extended/xen/xen-tools_4.14.bb        |  1 +
>  recipes-extended/xen/xen-tools_git.bb         |  1 +
>  4 files changed, 64 insertions(+)
>  create mode 100644 recipes-extended/xen/files/0001-tools-xenpmd-Fix-gcc10-snprintf-warning.patch
>
> --
> 2.17.1
>
>
> 
>

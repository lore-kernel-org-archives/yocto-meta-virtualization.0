Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web10.13593.1580151176217082923
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Jan 2020 10:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWGi2Q0m;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id e10so11856767edv.9
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Jan 2020 10:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zipoPlArD7iKRxgB+ZsJYba0YjPaP7PnSXQCIM4H3wo=;
        b=jWGi2Q0mv56vsm7DMrgpe6nwkc4M4M3imnjjf+IjHANfk0EBBqnASj5A47Rn2wKA2n
         IcwE2PgbTF73GpyHxVaQhlf1uJhpwCl1p8s+m4UPdcxaOwPxOGi0XeNvvL+YiFsOw+3Z
         m4z9nUpVR7mEJCjk7KrBzcHETSQZe6rCeqAjvaacN9ibrEyVxJBkrHkN+WwOb0y+++F4
         ITTvym5eK+ESEg9ywgykxIt8fQI30nWGL97H4ueHqsr7nwaRpXrkCd5sxIcV9DO5Xa+E
         OKMe1qXNNSUIzChJHXwYTBtlbM+K8otoOUcm9AjwYYhAnyU+e3OlbuZg/7kbEoxpNq5y
         ZMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zipoPlArD7iKRxgB+ZsJYba0YjPaP7PnSXQCIM4H3wo=;
        b=qlEc+vS6rUMbimwxZhR0+JFWE7mjy+HmP/Qg1I5XY6/2iYyrxLUBVse3BIKu1vkQNQ
         ttPTctxGXBN7xqkq6mORZNqhxmzgvF2Bx0bZcwG1gSwlIHNlVfbthOWn0G/cEad2mAqk
         43QTvDs1HcPHUj/iuH7VO9h9HAvyURmHF52o2v5yhWI4IstAqAg/un/gjD1UCLy07tsC
         WMfMGypoWT3XnpyqgPyFBSpQJ90RRf1rcjQ+vFLtH7xV2L/aB0Mup9fzKnZGy8WdqOEp
         WXrVq9Yu3XTlgGw69Z6n9LPJnArpuXDRZv8/g2zwY5MNTGX+2BWwTuy16YdGsRcAv59x
         B4qQ==
X-Gm-Message-State: APjAAAXRsdiM1/G1FtT6qdwlmMeF4BfxuVk8D3spAKXzFqTScgc6Gctk
	Ag+vAHqC9e/+h9Isn0besvriOtdFNf1M1NDv8rg=
X-Google-Smtp-Source: APXvYqyKVjLCwvJJRAyI9gFkILx3O4Gk5u3zm02sz1aOF99wg2mx9Wck+fFCtVn/RjC/LszIVaIrOPBS+cbyJfhT4nU=
X-Received: by 2002:a05:6402:1a4e:: with SMTP id bf14mr104340edb.365.1580151174680;
 Mon, 27 Jan 2020 10:52:54 -0800 (PST)
MIME-Version: 1.0
References: <20200120235453.11518-1-rebecca@bsdio.com> <10748.1579564602739277181@lists.yoctoproject.org>
 <15EDD2ED2558BBB4.24731@lists.yoctoproject.org>
In-Reply-To: <15EDD2ED2558BBB4.24731@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 27 Jan 2020 13:52:43 -0500
Message-ID: <CADkTA4MSjsL6bp66-u8mh4YEaZwF62_ArLqcLsOSQcYrBAW6kg@mail.gmail.com>
Subject: Re: [meta-virtualization] [zeus] [PATCH] Update uwsgi to version 2.0.18
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Rebecca Cran <rebecca@bsdio.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 1:49 PM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> In message: Re: [meta-virtualization] [zeus] [PATCH] Update uwsgi to version 2.0.18
> on 20/01/2020 Rebecca Cran wrote:
>
> > Sorry, this patch is against zeus, not master.
>
> We don't do version bumps in the released branches, unless we can show
> that it is only a bug fix release.
>
> Also, the change must land in master first, before I'd trigger the
> cherry-pick.
>
> So are we saying that there was a python bump in zeus that broke this
> recipe, and there's no way to cherry-pick just the patches that fix
> that build error for zeus ?

Hmm. It looks like gmail messed up the threading of these patches.

I'm seeing two version bumps, one due to a gcc9 (uwsgi) issue and the
other a python 3.8 issue (wsgi).

Are both for zeus ? If so, my comment applies equally to both.

Bruce

>
> Bruce
>
> >
>
> 



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

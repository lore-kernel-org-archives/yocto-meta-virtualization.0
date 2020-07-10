Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.13712.1594395921658623102
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2020 08:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P+w0DPgt;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id ga4so6562196ejb.11
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2020 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6COVLOovKLe6wpw3JyRdGsDuBK7LgIKskcgJLlv/yNo=;
        b=P+w0DPgtVT84fuE99ctVQqSgUl2rQmb6HgfJFz26mfOTn5ECEmYT3LP4eqAzEadsMv
         2jlT0Cozno8iF4pLJ/ywmY7ZmC8u+9RzUBOCIZpGk6xbDl++o1cndzU+u98jl0eAfS6L
         gM1tklwcT0wPEPjoxafasr2YZw2QcWeI2Vvzzw90cVe3wmFU/gxCNFBJl2AysMv5GLI0
         kZPG4kTfW/cX1EVHPlwi5OMG9j0/FF6YB+HVmN7VAxslUqyjOf2Gx99Cca5cn2YWC7Zh
         UHyWUAiH7AhP7pXAv+UlDSDSr8zVr68t6DGK5OV5Pyw0Ffe5yh7duDNSIYgStArF7mJY
         9YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6COVLOovKLe6wpw3JyRdGsDuBK7LgIKskcgJLlv/yNo=;
        b=loOQG2p+iUwx9ELd4qdtrpUdCSx7VQotivdHi+KCemOMseaPazsc5ZP6tRs6Idun42
         sCHRoe8i0x5nRyNDREA6VGnLhNq4D6s0j/blGRkN+TKMTgKuHF7t39CB+n+QlOnYQZxg
         ZiDeRlRZVgD2wqblCZu8PYVJp3H0/vokYDKL7gdMEwSyIHK7h4o+mSzcEHbAEcDZoiso
         g2tpzAXev/cijl0WmN7LOtPfsz77ytApxnJVWN/lg43jU2xWv0lSB5dulEkOL7wwh2JX
         +HzpVCzWFdzmb8FgGZIVD3m55e3qGNt5QWXh2voNO5S1xEuXfV4M6qwrIbPsZuvN4VE8
         yz4g==
X-Gm-Message-State: AOAM531NxYnunZgkkQPOEF6jNoxfMkgF4C2yQ7eS4/0bCfWolif9aMHd
	IJM8NrkRPbucklYJHdfPZ3fSsRQ4GjB0xFAW3E8=
X-Google-Smtp-Source: ABdhPJxpdpK85DM7TsMfwkQDQ+BNKSJzKE302E9x9kWTlOMS+hTTAguGFc/zxNoZ0v6TPUAn4hdMlt5shkwTGEBpg7E=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr60531056ejy.517.1594395920085;
 Fri, 10 Jul 2020 08:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4OQGP3gHNZaQaKMjfhn-RTd3zh=y9D12=We52SLYEOBww@mail.gmail.com>
 <25358.1594390019574091714@lists.yoctoproject.org>
In-Reply-To: <25358.1594390019574091714@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Jul 2020 11:45:08 -0400
Message-ID: <CADkTA4M6QJ90WipiWi99zATuERr0d8sCWpaWhomDA7NkFe5cdA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Prevents two getty running on single serial console (hvc0)
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 10:07 AM Ashish <ashishm@mvista.com> wrote:
>
> Hi Bruce ,
>
> a)  Can you please let me know how can i participate here , as new to this upstream activity.
>      Is there any way i can take come activity here,  as i wanted to contribute on meta-virtualization & xen.

There's no formula on how to best participate. My suggestion is just
to have a goal in mind, i.e. build an application/system based on Xen
running on platform "X". As you encounter errors or feature gaps, fix
or implement the gap and send patches to the list. As you work through
the issues, you'll inevitably find more things to contribute.

>
> b) Thanks for review  comments  , will revisit the patch with introduced this & proceed ahead.
>

In particular, see the commit that introduced the wrapper and the
commits before it. As you can see, we've tried to fix this multiple
times and I don't want to re-introduce already fixed issues.

commit f1e768dfdfb148b9b4c6aaaf065ccea79dd5484d
Author: Jaewon Lee <jaewon.lee@xilinx.com>
Date:   Mon Mar 23 17:01:24 2020 -0700

    sysvinit-inittab_xen: Using getty wrapper to minimize console messages

    Previously the following message was printed on the console every 5
    minutes:
    INIT: Id "X0" respawning too fast: disabled for 5 minutes

    Installing and using a getty-wrapper that will check for the hypervisor
    (hvc0) device and if not present, will call sleep

    Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
    Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

:100644 100644 9d0589c de0af20 M
recipes-core/sysvinit/sysvinit-inittab_xen.inc


commit abcdb5841dfffc1ff4410f6c149dc304d4ac5e42
Author: Bruce Ashfield <bruce.ashfield@gmail.com>
Date:   Fri Apr 12 10:53:51 2019 -0400

    Revert "sysvinit-inittab_xen.inc: fix hypervisor console"

    Temporarily reverting this commit, since it has broken some Xen boot
    usecases. We'll revisit this in the future.

    This reverts commit 50cdecca7b2a0e1bb5eacbec132f26b802f950fc.

:100644 100644 4d56806 9d0589c M
recipes-core/sysvinit/sysvinit-inittab_xen.inc

commit 50cdecca7b2a0e1bb5eacbec132f26b802f950fc
Author: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Date:   Fri Mar 22 12:40:28 2019 -0700

    sysvinit-inittab_xen.inc: fix hypervisor console

    This commit switches over to using existing SERIAL_CONSOLES mechanism
    for hvc0 inittab entry generation.  This then results in
    /bin/start_getty wrapper being used, which avoids the getty failure seen
    when running a xen capable rootfs natively on linux.

    Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
:100644 100644 9d0589c 4d56806 M
recipes-core/sysvinit/sysvinit-inittab_xen.inc


Bruce

>
> - Ashish
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

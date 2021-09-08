Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.15706.1631124558505765929
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Sep 2021 11:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lktpjlTF;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id j13so4067824edv.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Sep 2021 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yqw9xLcpzBApNZgjlQh481vd4ap3ntPKltKRts8fMuY=;
        b=lktpjlTFtLMiu+wifSnrciJXwOYi/nGAl5UGV2Zda/VYNCreyWkpIK5+PDYVx76vMi
         n3V7GHUClS2RSu+aWvjnjUO6ET5EAt6nKq4aryWTEONKNJL9weEdN5AE6deB/KwFmbnY
         BhgHpTB3nRAY9kxgYt8UC24v3G5rmigld3riUHciJQHFU9bthRy86SeoVYBrUnRuVphX
         RbXzu3Cxt4N3FSlJ/Dco+TFnmHhA2P6Wo4z62gk0DPnYnbEJruUY20QSlUpAx9uz+HJw
         y3my3XDfgoCdO1RVNy27Vf3DsLte/I3jPCOyIjXg0M7V4HnusxHHCQaJZXYtX0z2RcYC
         Aoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yqw9xLcpzBApNZgjlQh481vd4ap3ntPKltKRts8fMuY=;
        b=Ts/65w3i8nr9oSoXaPeuBEHU6RDvhbriWmyiUFOKgOR9xo946PsatiQKb32fdRnN/4
         a5OD6NEVaTCZl5VeBk5YFT2NCRsAC1m4Jf+G7Zr5NUi3WWY/7Ddld9qyOI6vdqBlPnkq
         50gqF8cmEVdEpAafaRjY2vca8NuFZW8uTEgNccah6/jWzsilssin9cMKjtBouX62Hlu1
         /cTER955gu9lqV/D23Ecpzmy0w/vyPYNKS5PWebehOpcTCkHUu3mXkaQN1QkzBpdhCn7
         rRXDxz7Q1tqCFoMXjExbNV7YemvAy/fMv1qd6dpKwBpgRrJ2rP4pEszfruSgGkIu3O9O
         kL6g==
X-Gm-Message-State: AOAM531wdFXud10A6xPkzXK9EdlsgyF8RkvpeNPDsRInPI7I4TNEC41p
	ugKBZTsNV9DKMiu7VcNjlBcf7z4p3ST9Rln48owCT4t3XFs=
X-Google-Smtp-Source: ABdhPJytS3iFkorIsmTbwLMShawjjybhNh7ywW7A3AgemDS9VHA/BGxVhZvT9kV+aZIDN8ENfEL1dOBN6RaxuN/fLGY=
X-Received: by 2002:aa7:c790:: with SMTP id n16mr5187603eds.223.1631124556919;
 Wed, 08 Sep 2021 11:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210726185823.26402-1-fib@cisco.com> <20210726185823.26402-2-fib@cisco.com>
 <20210729145700.GB40673@gmail.com> <SJ0PR11MB4784457572877D025E5E69F5ADED9@SJ0PR11MB4784.namprd11.prod.outlook.com>
 <20210802034542.GA16820@gmail.com> <714b7089-56d0-d604-83bf-caaa2f0083d0@windriver.com>
In-Reply-To: <714b7089-56d0-d604-83bf-caaa2f0083d0@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 8 Sep 2021 14:09:05 -0400
Message-ID: <CADkTA4OjygwvG1AOzqWkg1K30u7gPii64wvnThkGLbCQLHCC5A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
To: Changqing Li <changqing.li@windriver.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 1:28 AM Changqing Li <changqing.li@windriver.com> wrote:
>
>
> On 8/2/21 11:45 AM, Bruce Ashfield wrote:
>
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> In message: RE: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
> on 31/07/2021 Ruslan Babayev (fib) wrote:
>
> Can this be cherry-picked into dunfell please?
>
> No problem.
>
> It is now on dunfell as well.
>
> Bruce
>
> Hi,  Bruce
>
> Can this be cherry-picked into hardnott please?  python3-native build also failed on hardnott.
>

Cherry-picked and pushed.

Bruce

> Thanks
>
> //Changqing
>
> -----Original Message-----
> From: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.yoctoproject.org> On Behalf Of Bruce Ashfield
> Sent: Thursday, July 29, 2021 7:57 AM
> To: Ruslan Babayev (fib) <fib@cisco.com>
> Cc: meta-virtualization@lists.yoctoproject.org
> Subject: Re: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend
>
> merged.
>
> Bruce
>
> In message: [meta-virtualization][PATCH v3] python3: remove the no-longer required bbappend on 26/07/2021 Ruslan Babayev wrote:
>
> It has been carried over from python2 and is no longer required.  More
> importantly it breaks the python3-native build due to
> ${STAGING_DIR_TARGET} being "" for native recipes.
>
> Signed-off-by: Ruslan Babayev <fib@cisco.com>
> ---
>  recipes-devtools/python/python3_3.%.bbappend       | 1 -
>  recipes-devtools/python/python3_virtualization.inc | 8 --------
>  2 files changed, 9 deletions(-)
>  delete mode 100644 recipes-devtools/python/python3_3.%.bbappend
>  delete mode 100644 recipes-devtools/python/python3_virtualization.inc
>
> diff --git a/recipes-devtools/python/python3_3.%.bbappend
> b/recipes-devtools/python/python3_3.%.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-devtools/python/python3_3.%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
> '${BPN}_virtualization.inc', '', d)} diff --git
> a/recipes-devtools/python/python3_virtualization.inc
> b/recipes-devtools/python/python3_virtualization.inc
> deleted file mode 100644
> index 55301c7..0000000
> --- a/recipes-devtools/python/python3_virtualization.inc
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> -
> -DEPENDS += " ncurses"
> -
> -do_compile_prepend() {
> -   export LIBRARY_PATH=${STAGING_DIR_TARGET}/lib
> -}
> -
> --
> 2.26.2.Cisco
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

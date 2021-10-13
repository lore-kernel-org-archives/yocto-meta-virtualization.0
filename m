Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.9069.1634135747442962359
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Oct 2021 07:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oWdStev8;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id w19so11337675edd.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Oct 2021 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=363dxN4Zi3ZaI+nhxTu/ZnwfZ41npaDoxMD3apkh/Dk=;
        b=oWdStev8wRwmVsCZRnCcRCgkzTm5pOGOCicb72azSkGebqyCs+ueHjfpC4iqojnytp
         qhaOVrWIReU9hunnb2BnVeFCsBf9NDrVl+hOcAMLM+yXr4Zy4Rk/+5KyeNc7F9p10cBb
         FbqxGKx1liHzKtSmVX4D453mEky/VgXTu0jHrdnrgb7L6/pVj3pIFRiLdMoUsB83T6U1
         3gYjf2qAZrOYbRDxgX+Gia54a+ULbD5EiSp4ml3CN9WQMgqRphrkJYNqDx11hAJXEfe5
         /HUPVS0onXoVymMfTfsatQpBxtczbjd+jbbcey1maLRLrgihbYjhNc0BWWKBvVzO7lUf
         LkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=363dxN4Zi3ZaI+nhxTu/ZnwfZ41npaDoxMD3apkh/Dk=;
        b=x14TzbcIx/OQPlXzsnGNaAlBLDBaq/zpBG7h/SwDvvfowsevvYr98SQfxxcBjKLyD7
         wXHe0cFAZkrIxUBi+a5hE1qQQkjAXZ1fnIjuv9yFEV1z7oWUWJogk5X7nL5/kGlUTuvk
         soE10uALVgaOytd00DVegKr8h5iJC6+Bt9Xl8hHCcvNzXGdimuDp6NbKUYwYxQBoZI9B
         CO5LG24S5U4C0ahLDRdLVAMBE0RgXGanE/J+wb8Y7rw4N4nPs7RXIjYJx3Qq4LiomLL0
         u/rPMgoPk+PPlkaCLNSGNJ0alYhagoKIp98UN7RDwhiSPaeEC8GGmDdk+5uthZrVgzdW
         Vq1w==
X-Gm-Message-State: AOAM532nnRFI9vL7i/y/jD52r5PEFY1uobW7sUQx5rOCtzzQg9gxSJVs
	UptWwd2CobFUXl6XsDEpStH/9zTEgdTZfRPq49w=
X-Google-Smtp-Source: ABdhPJxyNvf5Zws9NoWd9kF31i/gs1XvErwqfrV/qlOHtcgJfmcxkEpNCPbFfDf6BrHP0WhY2ZX/Q7uKjs+PwzhxhJg=
X-Received: by 2002:a17:906:d541:: with SMTP id cr1mr43709123ejc.81.1634135745653;
 Wed, 13 Oct 2021 07:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <9VWo.1634134734913744504.HfhC@lists.yoctoproject.org>
In-Reply-To: <9VWo.1634134734913744504.HfhC@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 13 Oct 2021 10:35:34 -0400
Message-ID: <CADkTA4Pr9YDVXSENU2ioddHDSiUoHSRptatUNpHUe8B-tAT6jA@mail.gmail.com>
Subject: Re: [meta-virtualization] Building crun does not feth everything in do_fetch #meta-virtualization
To: Marc Wiz <mwyocto@wiz.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 10:18 AM Marc Wiz <mwyocto@wiz.com> wrote:
>
> I recently discovered a couple of issues with building crun.
>
> The first issue is when using a proxy to download source.   crun depends =
on libocispec which is a git sub-module.  The proxy environment variables a=
re apparently not passed or recognized by the git sub-module code .  The fi=
x is to add the proxy configuration into the git configuration.
>
> The real issue IMHO is that crun depends on libocispec which depends on y=
ajl.  Yajl is not downloaded until the compile task for crun is executed.  =
This breaks offline builds.
>
> So I am wondering what the best way is to address this?  It seems to me t=
hat the Makefiles for libocispec and yajl would need to be modified and the=
 recipe for crun would need to be modified to fetch the dependencies.
>

All of those dependencies are already specified in the recipe, and in
any integration/build testing that I've done, they are all picked up
properly.

libocispec is directly specified in the SRC_URI and placed where crun
will look for it, so that happens in the fetch task.

yajl is specified in DEPENDS, so it will be in place in the recipe
sysroot before compilation starts.  You get a build error without
yajl, so it is properly in place for the builds that I'm doing.

Bruce

> Thanks,
> Marc
>=20
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

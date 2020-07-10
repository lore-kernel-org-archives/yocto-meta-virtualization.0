Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.9913.1594385088889823723
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2020 05:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bSkt95B5;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id f12so5879472eja.9
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2020 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vfmgFARsFLVQkk8eKB8igs+pe+qZEwcRweheW5H3D98=;
        b=bSkt95B5c4Vce7CmbJIenAdjsio2LyrAJLFJpBL6tvo8+p36+7R4JNApsBCROaqpdz
         BQKUhlXECh6EoHUIg56fdrSCb0NUgW5MiowybYZbbcH94mOGOkpva77QIxVKoFMFocUr
         80oXsB1vUVKLn/sDmW02+TLxb0UEoUp0bRt3EiSLr+G265kVr3h7SM7DH3QTjHyRNXgS
         9CrOhb/B/bS4Tl/PQ5uJiLXXKV3/uMKsEilihkKYE6Pp69SCYOg1+qA9ObTbh2wJvwDe
         /lTN7UH2SBzTfZ0zOjrckyK4ST7iNfNodKzbLQ/M+eJxlyHYn1es0G3MlYSxWZkkBM/5
         6ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vfmgFARsFLVQkk8eKB8igs+pe+qZEwcRweheW5H3D98=;
        b=GGAOfkpVhZOAUiueH6azPkCVqjenwMztGnm06/94Dzys4EEynvlxngMUGLFXhaqqx0
         pX64dDjdoaiH1vPkbL6i/wvIQ4qBvK1XnMOvbf8IpqC7yIxzdT3/f2fuHximW4+2o1xn
         x/d93VqVP9DIDdEYqgiA5p7fgqDazT9i0ThmLxJNZ7FqaAvl4yr0pL7ggEqf3X63eb8m
         xOToEuJyIbDkHafDI+SdKEif4IOJZlaoYOY1D1blCy6Pa8TRhGMiby/0myKGQ3Qc5bPY
         e8PablwCsxLJWHPABHeTrcMxR9IzCEhWURDW40cF2OG6F+rTJnt4+KN1zZBuJtg0671t
         nmaQ==
X-Gm-Message-State: AOAM532Z2klKdfXxXt0mLnIxbg1RnVAwsPICONQcy211KAkcrfaecK+n
	gjzoD6RC4OU+elnAAkUCdhh9MNopKky/ae0mwfY=
X-Google-Smtp-Source: ABdhPJyQ/5DgjjfCKgZozRoZ1U8fZKckoUF4e9+9hArvACc15k51XoY72RKP0/IB6twsA0v0Lx+zuANV9tvzN+xmb3E=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr59806001ejy.517.1594385087208;
 Fri, 10 Jul 2020 05:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <1594366117-14557-1-git-send-email-ashishm@mvista.com>
In-Reply-To: <1594366117-14557-1-git-send-email-ashishm@mvista.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Jul 2020 08:44:36 -0400
Message-ID: <CADkTA4OQGP3gHNZaQaKMjfhn-RTd3zh=y9D12=We52SLYEOBww@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] Prevents two getty running on single serial console (hvc0)
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 3:28 AM Ashish <ashishm@mvista.com> wrote:
>
> When xen is enabled on raspberrypi4-64 machine user had
> two getty's running on the serial console device (hvc0)
> This led to root credentials failure continuously for few time
> followed by user getting the root prompt.
> But user would be unable to operate on serial console as
> he gets "Login timed out after 60 seconds" within few seconds
> and the control goes back again asking login credentials.

The patch is missing a signed-off-by.

Also this change will likely re-introduce other issues, have a look at
git history for that line. We need to have commentary on how the issue
it was fixing won't re-occur.

Cheers,

Bruce

> ---
>  recipes-core/sysvinit/sysvinit-inittab_xen.inc | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_xen.inc b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> index de0af20..04fd8f9 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> +++ b/recipes-core/sysvinit/sysvinit-inittab_xen.inc
> @@ -1,4 +1,3 @@
>  do_install_append() {
>                  echo "" >> ${D}${sysconfdir}/inittab
> -                echo "X0:12345:respawn:${base_sbindir}/getty-wrapper 115200 hvc0" >> ${D}${sysconfdir}/inittab
>  }
> --
> 2.7.4
>
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.12232.1582120843297777315
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 06:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=glbG1t0T;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id j17so29244820edp.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Feb 2020 06:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+WmviqS4/I4Qe55LJ9LwIYIzbk2zIVAfyjW3x/kUN40=;
        b=glbG1t0Tn56fWhpfRo9jggOoVGzIEyejD9XIlW1MdeHyMwLr/ZUXQj6Q1cKvVCNEST
         q3/65YMe045XoxiKUCM/J6Ab+X0z9Xjisn0BJFaCdzHMMFtIX/9N61x00s9BwuN4vAL2
         mrKl8s23GeDIRZZaRwqhVl6C5WIKQNIZwdVJ3Pj4knEasObJvEbYcgqUV781y5RMHPqP
         pJss0NMnfzxXgDsqXeqX/vFsr9l4bgbEFVmLZziVP0LQPSQoslYq4vV+XLRIL06/sl8G
         tozMqpI5R5MSzgdx8RFWMCWXnBEKLCvcssoRzAEfnhEQ6erRoojO4+HQK9UD6NOnyxMR
         Q6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+WmviqS4/I4Qe55LJ9LwIYIzbk2zIVAfyjW3x/kUN40=;
        b=M3Fc8Nzs+TUZ4lGn18qEij/xVAcfHYat+X+bIMZ6lcVu7YtCUBR1dlZKsOoOjWQt0K
         lCG1oqPumY3LDzFV7yIk52CGEeA28FNg2QZnpuDd9gGMnAlkf1ZQra6zWtWJ1+b4OFbI
         1FF+la5uJBd1pnTg4zKoLCozP59WdxVtd98JfS7ga5ZU5m3E8aYAzZwXK5XLjyr+6/7c
         4HWFSn9vAhmYUDgwDfq/6mwqCW6m8uGMmlR9B/97Pcz6ZbkBV5ZJOw7XtaUHtRYNQe8m
         XiDYvRyZlVTrpdUw63wtXFodXn/V/sc+DOkUZG+TzjMIe+nILgLuqEpChM1ELb+yk5rS
         UWDA==
X-Gm-Message-State: APjAAAVN9s5AJR8xjcGRbLneZpEED53BFATcJpg6mtFuoSwaantBAMdn
	H9MJ90ghQX6ejOlLcAzmG5TQCkxodD4m3p7t8L0=
X-Google-Smtp-Source: APXvYqyphEKEKJ59+Ijk4Wo4yKTY6AqgLuBavilbn1dujDm2HIkYhGdfaVp6R5Oz11AI+4mPPGpC/T093NWz0fcAxEw=
X-Received: by 2002:a17:906:d0d3:: with SMTP id bq19mr5953432ejb.37.1582120841362;
 Wed, 19 Feb 2020 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <15F33D74C6BC534D.11355@lists.yoctoproject.org>
 <74D7E070-D2BE-4A70-9394-0DE45CC5E06C@arm.com> <CADkTA4MmNbkXjMQCJGF4NME4Vp0mgH8KUbL2a5c5Q-ZWpMo=ag@mail.gmail.com>
 <10562492-D715-4A10-85F9-983CD272221F@arm.com>
In-Reply-To: <10562492-D715-4A10-85F9-983CD272221F@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 19 Feb 2020 09:00:30 -0500
Message-ID: <CADkTA4MFBHuXrySuG02TzOkmEitwMwXXs-JPccZj--7-NR9RDA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] Xen: fix do_deploy dependencies
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2020 at 8:47 AM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
>
>
> On 19 Feb 2020, at 13:31, Bruce Ashfield <bruce.ashfield@gmail.com> wrote=
:
>
> On Wed, Feb 19, 2020 at 8:09 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
>
>
>
> On 14 Feb 2020, at 10:17, Bertrand Marquis via Lists.Yoctoproject.Org <be=
rtrand.marquis=3Darm.com@lists.yoctoproject.org> wrote:
>
> do_deploy is using the files installed during do_install and it must be
> executed after it but before do_build. This is fixing SSTATE behaviour
> which had previously an empty scene in some cases.
>
>
> Any chance somebody could check and ack on this ?
>
>
> There's an entire update / re-work of Xen on the mailing list. I won't
> be merging any Xen patches until we have that sorted out.
>
>
> Ok I will re-push my patch once the changes in Xen are merged then.
>

the patch does look fine, and I've tagged it for merging. I just
wanted to get the big changes in before jiggling anything (even if it
shouldn't have an impact).

Bruce

> Cheers
> Bertrand
>
>
>
> Cheers,
>
> Bruce
>
> While there, it would make sense to also push this in zeus branch.
>
> =E2=80=94
> Bertrand Marquis
>
>
> Change-Id: I04b1f652c697ed0bc7e262571dd03e123ac096f6
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> recipes-extended/xen/xen.inc | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 36ab78e..41b1983 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -1099,7 +1099,9 @@ do_deploy() {
>    fi
> }
>
> -addtask deploy after do_populate_sysroot
> +# do_deploy is using files created during do_install so force it to be c=
alled
> +# after do_install but before do_build
> +addtask deploy before do_build after do_install
>
> # Enable use of menuconfig directly from bitbake and also within the devs=
hell
> OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> --
> 2.17.1
>
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
>
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

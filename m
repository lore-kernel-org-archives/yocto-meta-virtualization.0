Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.9359.1631719766644851942
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Sep 2021 08:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aoUUx6TI;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id v5so5077783edc.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Sep 2021 08:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fS1kewwofFpbA2GWuVwHdcY4ljnE2i49wchRPX52xcE=;
        b=aoUUx6TI5NFxyDADRtQJtQvfToHgPY8ndZ+TCjowH/1HFoIVnna/9gJDIRvZWKMGkb
         D6tNi6dE70j9exZpC9vizOdjQ1lg1/iBF7r45v8dPhHb9ViY5g2WTKXWzl4MeVEj63EK
         Thr5iva5MEwbVRpE66QVhmylHBcdGiBJVp6jTZHjxr9KYLZR8+xd2XI5PaAmm1c8rct9
         7g3+3evP5/sVL8xTs3IYvqh81EuN7qxDPswS/10H9DiNHK9OAv2oDcvCHR7ypF0Osf6j
         6sZx3t8bF/1k7pC0rpeCohMhpR70hBZb1YIkNi1sK1NOJ7PNdHjEGyJU8xsvneEZ60N9
         4DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fS1kewwofFpbA2GWuVwHdcY4ljnE2i49wchRPX52xcE=;
        b=XSTpByvW8p/NH8LGlUrtdWsFS3UvuUPajKPKR2bFrdVD9LhL4rZulWbQY0Nzrberus
         fpSVFAmJcXvaznJE/KaM+3h0lHzrOuAQ0wiOD4ByQG2NupYn6R38rT+EOttifp3rnACg
         0F9dTafLvihmeLPBR4DdcqGgKBGvSP5n0OjT2PdpDM/Gubbu1dJFay3aUTl/jfdGTsH4
         Pe4doaDzHqar5E6c8sYzD/8i5X+Cx2k6SOHN6TkIxjeDHcrzWBBT5wBKt3KS/IeaAcQE
         FM0GF6Nm1z1KRrWpSU5tagm183LmGVCzzVCwkee76DEUNeylN326BNQ2bIYBxwRF7w3o
         REtA==
X-Gm-Message-State: AOAM530SAOSZIsjJK7dj7+r233u5Xdfox/kwrGNBWBfocOOsX3D41DWZ
	6dzJ8NS3vDV3E/BTMd5YwGdekeeX8wupaX2GmoM=
X-Google-Smtp-Source: ABdhPJzD7WTf5GGuTXhygtlBO5nsBU565bwZBow7XHVxYRKOA3rbxCD+8FMnDfSZ13ltikCMh24Ff/leAaQT/FT8gxM=
X-Received: by 2002:a05:6402:3088:: with SMTP id de8mr636602edb.76.1631719761356;
 Wed, 15 Sep 2021 08:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210915104739.19316-1-sanakazisk19@gmail.com>
In-Reply-To: <20210915104739.19316-1-sanakazisk19@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 15 Sep 2021 11:29:10 -0400
Message-ID: <CADkTA4NaP=Gy3z0Py-MHM1_NcAKxcbDU32wUU3bPUyGNBPE=Aw@mail.gmail.com>
Subject: Re: [meta-virtualization][master][PATCH] lxc: Fix -c command for lxc-attach
To: sana kazi <sanakazisk19@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Since this change is part of lxc 4.0.10, I did the version bump.

At the same time, I switched the recipe to _git (as I've wanted to for
a while), so I can more easily debug things.

I had a LOT of issues with the lxc-download template and images
servers, but I was able to verify basic functionality.

Can you rebase this series on top of master-next, and resend the second patch ?

Bruce

On Wed, Sep 15, 2021 at 6:47 AM sana kazi <sanakazisk19@gmail.com> wrote:
>
> Added fix_c_command.patch the -c command seems to be broken because
> the passed context is ignored and always overwritten by the context
> specified in the config file.
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  .../lxc/files/fix_c_command.patch             | 36 +++++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.9.bb           |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/fix_c_command.patch
>
> diff --git a/recipes-containers/lxc/files/fix_c_command.patch b/recipes-containers/lxc/files/fix_c_command.patch
> new file mode 100644
> index 0000000..1ed8daf
> --- /dev/null
> +++ b/recipes-containers/lxc/files/fix_c_command.patch
> @@ -0,0 +1,36 @@
> +From 9becf309a81806ef08acf9ca99ab95c1bcfa1f65 Mon Sep 17 00:00:00 2001
> +From: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +Date: Mon, 23 Aug 2021 15:39:28 +0200
> +Subject: [PATCH] attach: Fix -c command
> +
> +Currently, the -c command (to set the selinux context) seems to be
> +broken because the passed context is ignored and always overwritten by
> +the context specified in the config file. The intention behind the -c
> +imho was to be able to manually overwrite this behavior. This patch
> +ensures that the selinux context will be set if passed via the command
> +line.
> +
> +Signed-off-by: Maximilian Blenk <Maximilian.Blenk@bmw.de>
> +---
> + src/lxc/tools/lxc_attach.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +Upstream-Status: Backport [https://github.com/lxc/lxc/commit/9becf309a81806ef08acf9ca99ab95c1bcfa1f65.patch]
> +Comment: No change in any hunk
> +
> +diff --git a/src/lxc/tools/lxc_attach.c b/src/lxc/tools/lxc_attach.c
> +index 0374d980b4..e6b388b20c 100644
> +--- a/src/lxc/tools/lxc_attach.c
> ++++ b/src/lxc/tools/lxc_attach.c
> +@@ -379,7 +379,10 @@ int main(int argc, char *argv[])
> +               attach_options.gid = my_args.gid;
> +
> +       // selinux_context will be NULL if not set
> +-      attach_options.lsm_label = selinux_context;
> ++      if (selinux_context) {
> ++              attach_options.attach_flags |= LXC_ATTACH_LSM_LABEL;
> ++              attach_options.lsm_label = selinux_context;
> ++      }
> +
> +       if (command.program) {
> +               ret = c->attach_run_wait(c, &attach_options, command.program,
> diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
> index 6720733..c45ae5c 100644
> --- a/recipes-containers/lxc/lxc_4.0.9.bb
> +++ b/recipes-containers/lxc/lxc_4.0.9.bb
> @@ -50,6 +50,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>         file://dnsmasq.conf \
>         file://lxc-net \
>          file://enable_seccomp_profile_when_compiled_libseccomp.patch \
> +        file://fix_c_command.patch \
>         "
>
>  SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
> --
> 2.17.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

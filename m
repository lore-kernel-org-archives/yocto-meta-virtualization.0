Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web11.1599.1596608136261374494
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 23:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AMsYqP1C;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id h16so12421876oti.7
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Aug 2020 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=088I69KBhc5QbWOP35sJj3FMoFXLuV1BXSxhkcUVK8k=;
        b=AMsYqP1CA/uJSjdFhDc5BniRWdy+p32DBdyj1Hsm4RKMRGuYRW0Jkr+3g5lueg3Weu
         qTYmRPVuMsNK3ICrEprS+r4w85EXHWONw5h+Qu2lBqtzwt7n8gM3cn2XfoojliooSU4R
         sZPXyAYgyPMUGdQQB9gj023n9yQEL3WZOo+F7DFTvwx7fFLzD5NLCKqPpmkInCpFLlY4
         z1K8BwA7nRyzAwWNmhfnDa0snQeeCd3gVOvAbvOO+odEE/fQCIbqy2d6O9MIDgH+GXaG
         f3CFe0VL9QJMbya7xkzq0IJwTrpWsNeWLgLF40AiFmBMnlo4r/CPfFg+GCbE19sMC0AM
         mjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=088I69KBhc5QbWOP35sJj3FMoFXLuV1BXSxhkcUVK8k=;
        b=eGyUim6i+1X9W5q97s+ex5TgwacoxNRc/zHutlOn+o3vN7Q3kLkHRenoA4dpLk6Hf5
         1jaj8UiEP8EKtXyiZewFaYyEL9zcBV9/mqcKhQUSxGR41GY1HrMm9M9q+2NxPXxgSCAb
         tBgA6/ArFHSH7D1kNCSXjdyrdwHSnFNgBj5kzaPQnxWPBd6XNLMb3aVSkyIbPT92xg/z
         BvMsX57KRBrKO3b9kxPZA2gae/8r5Xh8D76gLQv0Ki2NTy8VAk2ndQX/F5UeIuJofW12
         yNAxfcvQHTfHwZjY4CxH9FMwj0Tj7sXWzHrzJo4kV99g+D0NtWl61AMhSweDSxyX3Ra+
         ERng==
X-Gm-Message-State: AOAM531hPPYrn/a8AiSHiZ0vC70femF7fPFrvcU+CcCpqHOeOdDjhhK1
	yQpsNQdWlzuhi6XoZzXon3G4cBZY/uSvuRpMgug=
X-Google-Smtp-Source: ABdhPJwrR1EKo46W21GnRTyNhc67OSXLt9Y/DUTGLgZCFNg+Jb+pzV0Br4zqLzQuIKw6EKBkMdQlpioa0+vwWG4+sxM=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr1419627otp.192.1596608135488;
 Tue, 04 Aug 2020 23:15:35 -0700 (PDT)
MIME-Version: 1.0
References: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com> <1596547693-87664-2-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596547693-87664-2-git-send-email-diego.sueiro@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 4 Aug 2020 23:15:24 -0700
Message-ID: <CACMJ4GayxGn82iNWFTELQ=8=QrdfNq4MojWDTdSGxjJUZteLBw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xen: Add support for config fragments and diffconfig
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>, 
	Doug Goldstein <cardoe@gentoo.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 6:28 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> This patch introduces the following changes:
>
> 1. By inheriting cml1.bbclass we can drop some environment variables
>    settings in xen-hypervisor.inc for the menuconfig task, and also be
>    able to search for config fragmens and use the diffconfig task.
>
> 2. Change the do_configure to pre-generate the xen/.config in order
>    to enable the merge_config.sh to run successfully when config
>    fragments are listed in SRC_URI.
>
> 3. Copy-and-Paste the do_diffconfig function from meta/classes/cml1.bbclass
>    and modify the path of the .config.orig and .config files.

Thanks for another interesting submission!

>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-extended/xen/README             |  3 +++
>  recipes-extended/xen/xen-hypervisor.inc | 46 ++++++++++++++++++++++++++-------
>  2 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> index 34e7977..f86d269 100644
> --- a/recipes-extended/xen/README
> +++ b/recipes-extended/xen/README

I note that you have found the README file. Please could you CC both
Doug and I, as it requests in that file, with future submissions for
the Xen recipes?

> @@ -25,6 +25,9 @@ Select the config settings that you want and Save the file. If you save it to
>  the default ".config" file when prompted by menuconfig, you can find it in the
>  'xen' subdirectory of the build tree.
>
> +Configurarion fragments are also supported. To use them you need to list the

spelling: 'Configuration' please

> +.cfg files in the SRC_URI.
> +
>  security patches
>  ----------------
>
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index 784059b..55effe3 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -31,9 +31,13 @@ FILES_${PN}-efi = " \
>      /boot/xen.efi \
>      ${exec_prefix}/lib64/efi/xen* \
>      "
> +inherit cml1

Could this be added to the existing inherit statement?

>
>  do_configure() {
>      do_configure_common
> +    cd ${S}/xen; XEN_CONFIG_EXPERT=y make

This looks quite a bit like building. It seems to build quite a lot
when I run it in the devshell. What does this build?
Is there a specific build target you can specify? Should it use oe_runmake?

> +    ${S}/xen/tools/kconfig/merge_config.sh -m ${S}/xen/.config ${@" ".join(find_cfgs(d))}

Please could you test for the presence of at least one config fragment
being present in the SRC_URI before running the merge script.

> +    cml1_do_configure
>  }
>
>  do_compile() {
> @@ -77,15 +81,11 @@ do_deploy[depends] += "xen-tools:do_populate_sysroot"
>  do_deploy[depends] += "xen-tools:do_deploy"
>
>  # Enable use of menuconfig directly from bitbake and also within the devshell
> -OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO CROSS_CURSES_LIB RECIPE_SYSROOT_NATIVE"
> -HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> -HOSTLDFLAGS = "${BUILD_LDFLAGS}"
> -TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
> +OE_TERMINAL_EXPORTS += "RECIPE_SYSROOT_NATIVE"

See feedback on the earlier patch in this series please.

>  do_devshell[depends] += "ncurses-native:do_populate_sysroot"
>
> -CROSS_CURSES_LIB = "-lncurses -L$RECIPE_SYSROOT_NATIVE/usr/lib"
> +CROSS_CURSES_LIB += "-L$RECIPE_SYSROOT_NATIVE/usr/lib"
>
> -KCONFIG_CONFIG_COMMAND ??= "menuconfig"
>  python do_menuconfig() {
>      import shutil
>
> @@ -107,7 +107,33 @@ python do_menuconfig() {
>          bb.note("Configuration changed, recompile will be forced")
>          bb.build.write_taint('do_compile', d)
>  }
> -do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
> -do_menuconfig[nostamp] = "1"
> -do_menuconfig[dirs] = "${B}"
> -addtask menuconfig after do_configure
> +
> +python do_diffconfig() {
> +    import shutil
> +    import subprocess
> +
> +    workdir = d.getVar('WORKDIR')
> +    fragment = workdir + '/fragment.cfg'
> +    configorig = 'xen/.config.orig'
> +    config = 'xen/.config'
> +
> +    try:
> +        md5newconfig = bb.utils.md5_file(configorig)
> +        md5config = bb.utils.md5_file(config)
> +        isdiff = md5newconfig != md5config
> +    except IOError as e:
> +        bb.fatal("No config files found. Did you do menuconfig ?\n%s" % e)
> +
> +    if isdiff:
> +        statement = 'diff --unchanged-line-format= --old-line-format= --new-line-format="%L" ' + configorig + ' ' + config + '>' + fragment
> +        subprocess.call(statement, shell=True)
> +        # No need to check the exit code as we know it's going to be
> +        # non-zero, but that's what we expect.
> +        shutil.copy(configorig, config)
> +
> +        bb.plain("Config fragment has been dumped into:\n %s" % fragment)
> +    else:
> +        if os.path.exists(fragment):
> +            os.unlink(fragment)
> +}

At the point where this code is being copied across into this recipe,
it would be good to be working on a way to fold it back together when
possible. Since you're introducing inherit of the cml1 class, what do
you think to submitting a patch to the class to make the menuconfig
and diffconfig functions general enough -- eg. making the names of the
config files overridable via variables, just like the
KCONFIG_CONFIG_COMMAND variable, etc -- so that the menuconfig and
diffconfig code in this recipe can be dropped later in favour of just
setting a few variables for that class?

Christopher


> +
> --
> 2.7.4
>
> 

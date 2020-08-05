Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.1169.1596605121626033407
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 04 Aug 2020 22:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c75QHVxo;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 25so14962765oir.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 04 Aug 2020 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=epCHvRtz49EWyabxTlOZhIkdpg/osxPM6sWuOzEy/wo=;
        b=c75QHVxonhYkWqkW6pmTnV1iQkO8fT3tx4uuWxm9ncbQn3NWWOeiHwKldutKJrErK8
         bm+jterpElspuei6dXs7IOLS7FeaMKQWEayXBvdDrPsRHoGsZ+N99Uq4aUQFxvHaTQyi
         vEBngQ6Y8ck9+tsNmgp/spFNi2SllVGWxLRqOEfWw7QgxzoaxZr8GoKm7AhahQVuJTVu
         cPhMh6hFe+43VHR8Q0fl+EyBIZxkV2p3xzBM5EBqsIqeXBf6S9mIx0pjn2jpmUJCaDDh
         vGtYOOqesTbPm4IElKXpLKGAYEGmbObHdU1cvmWWNTt3IVRtTJF55GS8RUS+IvdoEwqe
         eDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=epCHvRtz49EWyabxTlOZhIkdpg/osxPM6sWuOzEy/wo=;
        b=XXDpc7Wh2ICbcxZ/W2erfO1Olj8L+EbQqxdwgqhIt5t3SNzqV95+xh9u2Fir+Y1Wam
         0vRhfdHcktr/aSLm4PbUiEZqxJBydcEnv5VwNDZ/kCejtvtyFxkiDyydB4BQ5WegcxS2
         5y0Ji7k39LwPimZ08eBQ22xr94RHMo/UbDy0Zn2Y8lBcwcxTPYl7ewObSjRtOe+n4JIZ
         9uN7GzUfRAuHACDIeC4h8Xy0cGDHoaibdKvb7Q5tywb9rvjQi8iTU6G8L57N6h5+6oLd
         vXkZDE0Lc5C7H4ijphHiNCPPVd4T/e2c17CqJS2RPm2YOTthCaFjq+SkA6Rnm2aaEaY8
         zvNQ==
X-Gm-Message-State: AOAM5311RDTRWwTeLerUsRU7v7asClsEz1jeNYw9Y9mqUKs+mSf+6+pa
	1jJEGebnHJXrcYRNaXGksE6SWBcQ49JPdxBM4S4=
X-Google-Smtp-Source: ABdhPJwjhSId+lAHd/jSQwqs0QH03qbemVYhCVppNyTQvQ/dOmQJHHrIWwSQrCF/wTEfuLeVoGNHlyZ8yJ8cWEKL9xY=
X-Received: by 2002:aca:ac53:: with SMTP id v80mr1395015oie.20.1596605120823;
 Tue, 04 Aug 2020 22:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1596547693-87664-1-git-send-email-diego.sueiro@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Tue, 4 Aug 2020 22:25:09 -0700
Message-ID: <CACMJ4GbhFuOyGKVQn8u+VeWMXyAC_F-37huMKczibiHdAQyhCw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] xen: Fix menuconfig
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 4, 2020 at 6:28 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> When building in OE environment the linker path needs to be passed when
> buildind the Kconfig tool in order to get the menuconfig task properly
> working.

Hi Diego,

Thank-you for working on fixing this - it is nice to see this tool
working correctly again. I have some feedback inline below.

> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  ...g-Allow-specification-of-ncurses-location.patch | 55 ++++++++++++++++++++++
>  recipes-extended/xen/xen-hypervisor.inc            |  4 +-
>  recipes-extended/xen/xen_4.14.bb                   |  1 +
>  recipes-extended/xen/xen_git.bb                    |  1 +
>  4 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
>
> diff --git a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> new file mode 100644
> index 0000000..74c9cb0
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> @@ -0,0 +1,55 @@
> +Upstream-Status: Inappropriate [oe specific, cross compile issue]

How have you arrived at this "Upstream-Status" for this patch?
I ask because if it is possible to avoid carrying this patch in
meta-virtualization indefinitely, it would be good to do so. Please
can you submit it upstream for feedback and hopefully acceptance from
the Xen maintainers?


> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +
> +From d078e29aa31ac3fa4c041bf89c46bc6372c1a02a Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Mon, 2 Jul 2018 23:10:28 -0400
> +Subject: menuconfig,mconf-cfg: Allow specification of ncurses location
> +
> +In some cross build environments such as the Yocto Project build
> +environment it provides an ncurses library that is compiled
> +differently than the host's version.  This causes display corruption
> +problems when the host's curses includes are used instead of the
> +includes from the provided compiler are overridden.  There is a second
> +case where there is no curses libraries at all on the host system and
> +menuconfig will just fail entirely.
> +
> +The solution is simply to allow an override variable in
> +check-lxdialog.sh for environments such as the Yocto Project.  Adding
> +a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> +compiling and linking against the right headers and libraries.

I think it's going to be good to get feedback from the Xen build
system maintainers on whether these variable names are going to be
acceptable upstream. It could make sense to add documentation for them
to the INSTALL file at the head of the repository where some of the
other build system variables are explained.

> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +cc: Michal Marek <mmarek@suse.cz>
> +cc: linux-kbuild@vger.kernel.org
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + xen/tools/kconfig/mconf-cfg.sh | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> + mode change 100755 => 100644 xen/tools/kconfig/mconf-cfg.sh
> +
> +(limited to 'xen/tools/kconfig/mconf-cfg.sh')
> +
> +diff --git a/xen/tools/kconfig/mconf-cfg.sh b/xen/tools/kconfig/mconf-cfg.sh
> +old mode 100755
> +new mode 100644
> +index c812872d7f9d..65a9b9e5b8a6
> +--- a/xen/tools/kconfig/mconf-cfg.sh
> ++++ b/xen/tools/kconfig/mconf-cfg.sh
> +@@ -4,6 +4,14 @@
> + PKG="ncursesw"
> + PKG2="ncurses"
> +
> ++if [ "$CROSS_CURSES_LIB" != "" ]; then
> ++    echo libs=\'$CROSS_CURSES_LIB\'
> ++    if [ x"$CROSS_CURSES_INC" != x ]; then
> ++      echo cflags=\'$CROSS_CURSES_INC\'
> ++    fi
> ++    exit 0
> ++fi
> ++
> + if [ -n "$(command -v pkg-config)" ]; then
> +       if pkg-config --exists $PKG; then
> +               echo cflags=\"$(pkg-config --cflags $PKG)\"
> +--
> +cgit v1.2.2-1-g5e49
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index c386917..784059b 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -77,12 +77,14 @@ do_deploy[depends] += "xen-tools:do_populate_sysroot"
>  do_deploy[depends] += "xen-tools:do_deploy"
>
>  # Enable use of menuconfig directly from bitbake and also within the devshell
> -OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> +OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO CROSS_CURSES_LIB RECIPE_SYSROOT_NATIVE"

Is there a reason for exporting RECIPE_SYSROOT_NATIVE?

>  HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
>  HOSTLDFLAGS = "${BUILD_LDFLAGS}"
>  TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
>  do_devshell[depends] += "ncurses-native:do_populate_sysroot"
>
> +CROSS_CURSES_LIB = "-lncurses -L$RECIPE_SYSROOT_NATIVE/usr/lib"

Since this definition here doesn't use { braces }, the value of
RECIPE_SYSROOT_NATIVE isn't substituted into CROSS_CURSES_LIB, and so
it gets evaluated later when the mconf-cfg.sh script is run. It would
be good to add a comment to explain why you're not making the
substitution occur within the recipe instead.

With adding /usr/lib as the suffix: would STAGING_LIBDIR_NATIVE be a
more appropriate variable to use?

Do you need to define and add CROSS_CURSES_INC to the terminal
exports? It looks like that is actually introduced indirectly in the
next commit in your series, so is this patch correct without doing
that?

thanks

Christopher

> +
>  KCONFIG_CONFIG_COMMAND ??= "menuconfig"
>  python do_menuconfig() {
>      import shutil
> diff --git a/recipes-extended/xen/xen_4.14.bb b/recipes-extended/xen/xen_4.14.bb
> index 0413bee..91e8988 100644
> --- a/recipes-extended/xen/xen_4.14.bb
> +++ b/recipes-extended/xen/xen_4.14.bb
> @@ -6,6 +6,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/xen_git.bb
> index 408bc3b..57791fc 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -6,6 +6,7 @@ XEN_BRANCH ?= "master"
>  SRC_URI = " \
>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
>      file://xen-arm64-implement-atomic-fetch-add.patch \
> +    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
>      "
>
>  LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> --
> 2.7.4
>
> 

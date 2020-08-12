Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web10.1130.1597257980487766093
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 12 Aug 2020 11:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R153ON27;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id u63so2747344oie.5
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 12 Aug 2020 11:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3cYLbjVe44Ad7QbuTHkuW+crclxRqZbDGuw4O1MEqmQ=;
        b=R153ON27oBDn/MucGj0+Ahiw/EttD2M+PpIamDF/wDjD2nAmq2lZBi2kHIgjrhXLk1
         e7zqnC/YNB5269Uiyi1G1vY61MXFO1giuT1Wwbq3PPgtUAU38t0iM+52vBGhVuDAb+Iv
         a8gN44bNP+o8moc6gWvbUYwsLZx0d/MRp+d1kK5EBw3IR08pNbN2bcw017b8ehTGxNKk
         M7ctx3l+HcRCl3V97GoxmBBRIjmTpom0005ShcsuXhyFcERxxFHH0nsVK31tHw14TIdX
         nR5QxeNWcmATk0TpCI6dsR8ruL2xWKgo1kE0FcB2Qjf6OyQy3Eyhz+idZiOJu6drLHyt
         bpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3cYLbjVe44Ad7QbuTHkuW+crclxRqZbDGuw4O1MEqmQ=;
        b=N9N+C5zSmwdQDFkFJ8k5unQrB+L0a4hGMG6//Y746vxTk6Qbww2DK9KYibcmzOtY2j
         CLWV+2X8CBWrFyQxBwtoRxgY/Cm+BrtNxAGvFxeFcjUBKuwKGcXs6AaeDebO1qZVXZuW
         NS0eoC6VtsNo1DJ1iooEjA30kxmc+8nmLP6DRkTpuHZnYus/eOPzfDDHz6CsFbzN0FHI
         vqtnRKl1fNLVwj9i6aJkCjVKsGTTBux2JjfNWImuS35f8CGNRDpxGtFgxrJ11AScTQmC
         FsAvT58Z7HdR5SO6ySf2NFtZTiC4G+TgJDLRP/HShKJwRaVWfhsPXcBnbqE3wZMg58GO
         vrIg==
X-Gm-Message-State: AOAM532FiqHtc9U4/d0ZlBj7FocO1I9in7p0xTYx+Xe6TfqxohoOka10
	1zos/P6QUJ7WInAWVTLU16ykD7LNRMDydrypR5s=
X-Google-Smtp-Source: ABdhPJzSj0lXmi4x6uFAOiH94KX5jc8lz3ILQAGE6EUpWs4HbCvrNPuOUew+drhGmneczj3vK5aU5//qSSGKnwqJ9c4=
X-Received: by 2002:aca:c6c9:: with SMTP id w192mr451069oif.28.1597257979641;
 Wed, 12 Aug 2020 11:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <1597251220-21873-1-git-send-email-diego.sueiro@arm.com>
In-Reply-To: <1597251220-21873-1-git-send-email-diego.sueiro@arm.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 12 Aug 2020 11:46:07 -0700
Message-ID: <CACMJ4Gbq_jHcnzaqAdD91i+c+w_wko+s4fQ0MmsJiC8W0c=w+A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: Fix menuconfig and add support for config fragments and diffconfig
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 12, 2020 at 9:53 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> This patch introduces the following changes:
>
> 1. When building in OE environment the linker path needs to be passed when
>    buildind the Kconfig tool in order to get the menuconfig task properly
>    working.
>
> 2. By inheriting cml1.bbclass we can drop some environment variables
>    settings in xen-hypervisor.inc for the menuconfig task, and also be
>    able to search for config fragmens and use the diffconfig task. Also,
>    there is no need to have a custom do_menuconfig task anymore.
>
> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> ---
>  recipes-extended/xen/README                        |  3 +
>  ...g-Allow-specification-of-ncurses-location.patch | 64 ++++++++++++++++++++++
>  recipes-extended/xen/xen-hypervisor.inc            | 48 ++++++----------
>  recipes-extended/xen/xen_4.14.bb                   |  1 +
>  recipes-extended/xen/xen_git.bb                    |  1 +
>  5 files changed, 87 insertions(+), 30 deletions(-)
>  create mode 100644 recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
>
> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> index 34e7977..f86d269 100644
> --- a/recipes-extended/xen/README
> +++ b/recipes-extended/xen/README
> @@ -25,6 +25,9 @@ Select the config settings that you want and Save the file. If you save it to
>  the default ".config" file when prompted by menuconfig, you can find it in the
>  'xen' subdirectory of the build tree.
>
> +Configurarion fragments are also supported. To use them you need to list the

Configuration

> +.cfg files in the SRC_URI.
> +
>  security patches
>  ----------------
>
> diff --git a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> new file mode 100644
> index 0000000..64319d6
> --- /dev/null
> +++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> @@ -0,0 +1,64 @@
> +Upstream-Status: Inappropriate [oe specific, cross compile issue]

Is this being considered for submission upstream?
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
so: Pending?

> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +commit e6972e689a980ab28637e94e48c77eeace6abde5
> +Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date:   Mon Jul 2 23:10:28 2018 -0400
> +
> +    xen/kconfig,menuconfig,mconf-cfg: Allow specification of ncurses location
> +
> +    In some cross build environments such as the Yocto Project build
> +    environment it provides an ncurses library that is compiled
> +    differently than the host's version.  This causes display corruption
> +    problems when the host's curses includes are used instead of the
> +    includes from the provided compiler are overridden.  There is a second
> +    case where there is no curses libraries at all on the host system and
> +    menuconfig will just fail entirely.
> +
> +    The solution is simply to allow an override variable in
> +    check-lxdialog.sh for environments such as the Yocto Project.  Adding
> +    a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
> +    compiling and linking against the right headers and libraries.
> +
> +    Change-Id: Ibe8dfafc90655e3be2671dbbb0cb7f5631fc4d44
> +    Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> +    cc: Michal Marek <mmarek@suse.cz>
> +    cc: linux-kbuild@vger.kernel.org
> +    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +    Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> +
> +diff --git a/INSTALL b/INSTALL
> +index 0d3eb89..9dcda8f 100644
> +--- a/INSTALL
> ++++ b/INSTALL
> +@@ -33,6 +33,10 @@ small subset of the options.  Attempts to change other options will be
> + silently overridden.  The only way to find which configuration options
> + are available is to run `make menuconfig' or the like.
> +
> ++To use the menuconfig in cross build environments, e.g. openembedded,
> ++set the CROSS_CURSES_LIB and CROSS_CURSES_INC environment variables with
> ++the proper values required for libs and cflags compilation settings.
> ++
> + You can counter-override this behaviour by setting XEN_CONFIG_EXPERT=y
> + in your environment.  However, doing this is not supported and the
> + resulting configurations do not receive security support.  If you set

The doc has a couple of existing sections for variables that affect
the build -- better to add the new documentation there?

> +diff --git a/xen/tools/kconfig/mconf-cfg.sh b/xen/tools/kconfig/mconf-cfg.sh
> +old mode 100755
> +new mode 100644

??

> +index c812872..65a9b9e
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
> diff --git a/recipes-extended/xen/xen-hypervisor.inc b/recipes-extended/xen/xen-hypervisor.inc
> index c386917..28d64c5 100644
> --- a/recipes-extended/xen/xen-hypervisor.inc
> +++ b/recipes-extended/xen/xen-hypervisor.inc
> @@ -9,7 +9,7 @@ DESCRIPTION = "The Xen hypervisor"
>  # The Xen hypervisor has a narrower compatible platform range than the Xen tools
>  COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-.*-linux-gnueabi'
>
> -inherit deploy python3native
> +inherit deploy python3native cml1
>
>  PACKAGES = " \
>      ${PN} \
> @@ -34,6 +34,17 @@ FILES_${PN}-efi = " \
>
>  do_configure() {
>      do_configure_common
> +
> +    # Handle the config fragments
> +    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
> +        # If .config is not present generate one in order
> +        # to use the merge_config.sh
> +        if [ ! -f "${S}/xen/.config" ] ; then
> +            oe_runmake -C ${S}/xen defconfig
> +        fi
> +        ${S}/xen/tools/kconfig/merge_config.sh -m -O \
> +            ${S}/xen ${S}/xen/.config ${@" ".join(find_cfgs(d))}
> +    fi
>  }
>
>  do_compile() {
> @@ -77,35 +88,12 @@ do_deploy[depends] += "xen-tools:do_populate_sysroot"
>  do_deploy[depends] += "xen-tools:do_deploy"
>
>  # Enable use of menuconfig directly from bitbake and also within the devshell
> -OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO"
> -HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> -HOSTLDFLAGS = "${BUILD_LDFLAGS}"
> -TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
>  do_devshell[depends] += "ncurses-native:do_populate_sysroot"
>
> -KCONFIG_CONFIG_COMMAND ??= "menuconfig"
> -python do_menuconfig() {
> -    import shutil
> -
> -    try:
> -        mtime = os.path.getmtime("xen/.config")
> -        shutil.copy("xen/.config", "xen/.config.orig")
> -    except OSError:
> -        mtime = 0
> +# Pass the native library path for kconfig build when running the do_menuconfig
> +# task
> +CROSS_CURSES_LIB += "-L${STAGING_LIBDIR_NATIVE}"

I think this illustrates why the new variable names that this patch
introduces could be improved: they are set with values that enable the
build to generate binaries that run on the host (ie. native), not the
target (cross). Alternatively, in the kconfig Makefile, a HOST prefix
denotes variables that are used to build binaries that run on the
host.

Christopher

>
> -    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if [ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> -        d.getVar('PN') + ' Configuration', d)
> -
> -    try:
> -        newmtime = os.path.getmtime("xen/.config")
> -    except OSError:
> -        newmtime = 0
> -
> -    if newmtime > mtime:
> -        bb.note("Configuration changed, recompile will be forced")
> -        bb.build.write_taint('do_compile', d)
> -}
> -do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
> -do_menuconfig[nostamp] = "1"
> -do_menuconfig[dirs] = "${B}"
> -addtask menuconfig after do_configure
> +# Specify the root dir of the .config file for do_menuconfig and do_diffconfig
> +# tasks
> +KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
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

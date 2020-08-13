Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.9911.1597325700951343758
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 06:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sH9QrOR9;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id jp10so6218126ejb.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Aug 2020 06:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+bG9AD0YZ0pFwYWUxih5DUolSmShr07AFtl4Q5/g068=;
        b=sH9QrOR9HxmgTO302fcltzeoBFa73uMQFc0K5P4gW0ViA+6o+YZIiQo5W9AbR/d/PG
         gtXiS18n3p6VqBzvGc4n60hTFAOS7LT+DpMi2nwbJ7CdhNpU6Rq9/rePoiRsBs01JXxg
         Gbm3YxmJLTNnGUFA1qXF1nsasx1d86sRrEVGgLWpafx+GcTrHalIx91ZIt4Ma84bUwBp
         IaWjyuvCgcfsbXJrPwMm8B72EIcHvIMUrBPzEChpzApWArHF0WNhJGgiJBDHQeR8CTQ7
         xnpgx7PN6+P+gkf8J4hVAehMDRAXWZKS19Hp8YLDnI7UVzyyZkcWfJyseJzRtc2CmblH
         Yxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+bG9AD0YZ0pFwYWUxih5DUolSmShr07AFtl4Q5/g068=;
        b=MhLoGi6K26qrrwXVhOnf77IPJoH78basPudzA7LKz3yRpzC0h74ueWQ/5dv8IiCOKX
         vfV5H8lyewl9VytzuIRg7QdYaT+AlY0zlDj6M1/hFJN694D7IhOPa3GCTTupACVxElCU
         /yLrhhIGjgxsBCuaNq6a6ySAzFded9NfylU29UySRwcutbKsw7ZYdDLD27qzHTjuDqR/
         ONhYI0dMmx2kwnT/TnPr8mav+jqUtb6COFynQGynSOpcBjfBT/JewNuYc1Zxw3fB/l34
         XH3QGXYc+JqC9yNojs95f1DFi9HTbE3UvqJ/mqvDNAcSOb4iM2wh04Iij8+yr7l8hDzX
         1lwQ==
X-Gm-Message-State: AOAM533E/HNzuImL/6qCHN/tr4OYDF+Qz5TuGhG5xk/iJIjdNswPCQoC
	9cSFN3F7ImRA3yYeoJfEwffWl5JH5pgbY41wJyg=
X-Google-Smtp-Source: ABdhPJy9Z/4UL8uQ+JiGKDdF9+ze+/6hX9y5eucPiEiccteBwzWHapjvRUALPCDzRiApyQbnDkcAXUZj2CSWKcl2Qvo=
X-Received: by 2002:a17:906:bc52:: with SMTP id s18mr4522741ejv.298.1597325699351;
 Thu, 13 Aug 2020 06:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <1597251220-21873-1-git-send-email-diego.sueiro@arm.com>
 <CACMJ4Gbq_jHcnzaqAdD91i+c+w_wko+s4fQ0MmsJiC8W0c=w+A@mail.gmail.com> <AM6PR08MB34614D05C55020D5E09A491592430@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB34614D05C55020D5E09A491592430@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 13 Aug 2020 09:34:47 -0400
Message-ID: <CADkTA4ONwTgLnjPasGO=zrAK917QnCUD8tnwgFfEGF=BSUMzbw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: Fix menuconfig and add support for config fragments and diffconfig
To: Diego Sueiro <Diego.Sueiro@arm.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, nd <nd@arm.com>, 
	Doug Goldstein <cardoe@gentoo.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: multipart/alternative; boundary="000000000000e686d405acc25e55"

--000000000000e686d405acc25e55
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 3:14 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:

> Hello Christopher,
>
> Please, find my comments inline.
>
> >-----Original Message-----
> >From: Christopher Clark <christopher.w.clark@gmail.com>
> >Sent: 12 August 2020 19:46
> >To: Diego Sueiro <Diego.Sueiro@arm.com>
> >Cc: meta-virtualization@lists.yoctoproject.org; nd <nd@arm.com>
> >Subject: Re: [meta-virtualization][PATCH] xen: Fix menuconfig and add
> support
> >for config fragments and diffconfig
> >
> >On Wed, Aug 12, 2020 at 9:53 AM Diego Sueiro <diego.sueiro@arm.com>
> >wrote:
> >>
> >> This patch introduces the following changes:
> >>
> >> 1. When building in OE environment the linker path needs to be passed
> >when
> >>    buildind the Kconfig tool in order to get the menuconfig task
> properly
> >>    working.
> >>
> >> 2. By inheriting cml1.bbclass we can drop some environment variables
> >>    settings in xen-hypervisor.inc for the menuconfig task, and also be
> >>    able to search for config fragmens and use the diffconfig task. Also,
> >>    there is no need to have a custom do_menuconfig task anymore.
> >>
> >> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >> ---
> >>  recipes-extended/xen/README                        |  3 +
> >>  ...g-Allow-specification-of-ncurses-location.patch | 64
> >++++++++++++++++++++++
> >>  recipes-extended/xen/xen-hypervisor.inc            | 48
> ++++++----------
> >>  recipes-extended/xen/xen_4.14.bb                   |  1 +
> >>  recipes-extended/xen/xen_git.bb                    |  1 +
> >>  5 files changed, 87 insertions(+), 30 deletions(-)  create mode
> >> 100644
> >> recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specificati
> >> on-of-ncurses-location.patch
> >>
> >> diff --git a/recipes-extended/xen/README b/recipes-extended/xen/README
> >> index 34e7977..f86d269 100644
> >> --- a/recipes-extended/xen/README
> >> +++ b/recipes-extended/xen/README
> >> @@ -25,6 +25,9 @@ Select the config settings that you want and Save
> >> the file. If you save it to  the default ".config" file when prompted
> >> by menuconfig, you can find it in the  'xen' subdirectory of the build
> tree.
> >>
> >> +Configurarion fragments are also supported. To use them you need to
> >> +list the
> >
> >Configuration
>
> Ooops, I forgot about this one.
>
> >
> >> +.cfg files in the SRC_URI.
> >> +
> >>  security patches
> >>  ----------------
> >>
> >> diff --git
> >> a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specifica
> >> tion-of-ncurses-location.patch
> >> b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specifica
> >> tion-of-ncurses-location.patch
> >> new file mode 100644
> >> index 0000000..64319d6
> >> --- /dev/null
> >> +++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-speci
> >> +++ fication-of-ncurses-location.patch
> >> @@ -0,0 +1,64 @@
> >> +Upstream-Status: Inappropriate [oe specific, cross compile issue]
> >
> >Is this being considered for submission upstream?
> >https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> >so: Pending?
>
> In a thread of emails, @Doug mentioned that this patch was not going to be
> accepted in the Xen source tree. We discussed that we are going to submit
> the
> solution to the kernel mainline and if accepted, Doug will sync-up the Xen
> kconfig source with the kernel. Since this patch is targeting the Xen
> source tree
> and will not be accepted by the Xen project as is, I thought that the
> Upstream-Status should be set as Inappropriate. @Bruce, can you please
> advice what is the best description to add in it?
>

The field isn't too strictly regulated, and since there are two potential
"upstreams", we can just put two entries.

I'd suggest one for Xen upstream (which is what you have), i.e.
Upstream-status: Xen: ......

And a second for the kernel, and in that one, we can put "pending".

Bruce



>
> >
> >> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com> commit
> >> +e6972e689a980ab28637e94e48c77eeace6abde5
> >> +Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> +Date:   Mon Jul 2 23:10:28 2018 -0400
> >> +
> >> +    xen/kconfig,menuconfig,mconf-cfg: Allow specification of ncurses
> >> + location
> >> +
> >> +    In some cross build environments such as the Yocto Project build
> >> +    environment it provides an ncurses library that is compiled
> >> +    differently than the host's version.  This causes display
> corruption
> >> +    problems when the host's curses includes are used instead of the
> >> +    includes from the provided compiler are overridden.  There is a
> second
> >> +    case where there is no curses libraries at all on the host system
> and
> >> +    menuconfig will just fail entirely.
> >> +
> >> +    The solution is simply to allow an override variable in
> >> +    check-lxdialog.sh for environments such as the Yocto Project.
> Adding
> >> +    a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and
> >allowing
> >> +    compiling and linking against the right headers and libraries.
> >> +
> >> +    Change-Id: Ibe8dfafc90655e3be2671dbbb0cb7f5631fc4d44
> >> +    Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> +    cc: Michal Marek <mmarek@suse.cz>
> >> +    cc: linux-kbuild@vger.kernel.org
> >> +    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> +    Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
> >> +
> >> +diff --git a/INSTALL b/INSTALL
> >> +index 0d3eb89..9dcda8f 100644
> >> +--- a/INSTALL
> >> ++++ b/INSTALL
> >> +@@ -33,6 +33,10 @@ small subset of the options.  Attempts to change
> >> +other options will be  silently overridden.  The only way to find
> >> +which configuration options  are available is to run `make menuconfig'
> or
> >the like.
> >> +
> >> ++To use the menuconfig in cross build environments, e.g.
> >> ++openembedded, set the CROSS_CURSES_LIB and CROSS_CURSES_INC
> >> ++environment variables with the proper values required for libs and
> cflags
> >compilation settings.
> >> ++
> >> + You can counter-override this behaviour by setting
> >> + XEN_CONFIG_EXPERT=y in your environment.  However, doing this is not
> >> + supported and the resulting configurations do not receive security
> >> + support.  If you set
> >
> >The doc has a couple of existing sections for variables that affect the
> build --
> >better to add the new documentation there?
> >
>
> Well, the introduction of these variables are not affecting the build
> itself since
> they are only used when building kconfig in a cross build environment for
> the
> menuconfig target. Either way, since this patch will not be merged
> directly to
> the Xen source tree, I'm thinking about dropping the documentation changes
> since for the normal Yocto use cases the user does not need to care about
> it
> because the build system is already setting it properly.
> Do you agree with removing the documentation changes in this patch?
>
> >> +diff --git a/xen/tools/kconfig/mconf-cfg.sh
> >> +b/xen/tools/kconfig/mconf-cfg.sh old mode 100755 new mode 100644
> >
> >??
>
> This came from the original patch. Shall I remove the file mode
> modification?
>
> >
> >> +index c812872..65a9b9e
> >> +--- a/xen/tools/kconfig/mconf-cfg.sh
> >> ++++ b/xen/tools/kconfig/mconf-cfg.sh
> >> +@@ -4,6 +4,14 @@
> >> + PKG="ncursesw"
> >> + PKG2="ncurses"
> >> +
> >> ++if [ "$CROSS_CURSES_LIB" != "" ]; then
> >> ++    echo libs=\'$CROSS_CURSES_LIB\'
> >> ++    if [ x"$CROSS_CURSES_INC" != x ]; then
> >> ++      echo cflags=\'$CROSS_CURSES_INC\'
> >> ++    fi
> >> ++    exit 0
> >> ++fi
> >> ++
> >> + if [ -n "$(command -v pkg-config)" ]; then
> >> +       if pkg-config --exists $PKG; then
> >> +               echo cflags=\"$(pkg-config --cflags $PKG)\"
> >> diff --git a/recipes-extended/xen/xen-hypervisor.inc
> >> b/recipes-extended/xen/xen-hypervisor.inc
> >> index c386917..28d64c5 100644
> >> --- a/recipes-extended/xen/xen-hypervisor.inc
> >> +++ b/recipes-extended/xen/xen-hypervisor.inc
> >> @@ -9,7 +9,7 @@ DESCRIPTION = "The Xen hypervisor"
> >>  # The Xen hypervisor has a narrower compatible platform range than
> >> the Xen tools  COMPATIBLE_HOST =
> '(x86_64.*).*-linux|aarch64.*-linux|arm-
> >.*-linux-gnueabi'
> >>
> >> -inherit deploy python3native
> >> +inherit deploy python3native cml1
> >>
> >>  PACKAGES = " \
> >>      ${PN} \
> >> @@ -34,6 +34,17 @@ FILES_${PN}-efi = " \
> >>
> >>  do_configure() {
> >>      do_configure_common
> >> +
> >> +    # Handle the config fragments
> >> +    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
> >> +        # If .config is not present generate one in order
> >> +        # to use the merge_config.sh
> >> +        if [ ! -f "${S}/xen/.config" ] ; then
> >> +            oe_runmake -C ${S}/xen defconfig
> >> +        fi
> >> +        ${S}/xen/tools/kconfig/merge_config.sh -m -O \
> >> +            ${S}/xen ${S}/xen/.config ${@" ".join(find_cfgs(d))}
> >> +    fi
> >>  }
> >>
> >>  do_compile() {
> >> @@ -77,35 +88,12 @@ do_deploy[depends] += "xen-
> >tools:do_populate_sysroot"
> >>  do_deploy[depends] += "xen-tools:do_deploy"
> >>
> >>  # Enable use of menuconfig directly from bitbake and also within the
> >> devshell -OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS
> >TERMINFO"
> >> -HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> >> -HOSTLDFLAGS = "${BUILD_LDFLAGS}"
> >> -TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
> >>  do_devshell[depends] += "ncurses-native:do_populate_sysroot"
> >>
> >> -KCONFIG_CONFIG_COMMAND ??= "menuconfig"
> >> -python do_menuconfig() {
> >> -    import shutil
> >> -
> >> -    try:
> >> -        mtime = os.path.getmtime("xen/.config")
> >> -        shutil.copy("xen/.config", "xen/.config.orig")
> >> -    except OSError:
> >> -        mtime = 0
> >> +# Pass the native library path for kconfig build when running the
> >> +do_menuconfig # task CROSS_CURSES_LIB += "-
> >L${STAGING_LIBDIR_NATIVE}"
> >
> >I think this illustrates why the new variable names that this patch
> introduces
> >could be improved: they are set with values that enable the build to
> generate
> >binaries that run on the host (ie. native), not the target (cross).
> Alternatively, in
> >the kconfig Makefile, a HOST prefix denotes variables that are used to
> build
> >binaries that run on the host.
>
> If we change the variable name, I'll have to change the original patch and
> also
> add in this recipe the following:
> OE_TERMINAL_EXPORTS += "HOST_CURSES_LIB HOST_CURSES_INC"
> HOST_CURSES_LIB = "${CROSS_CURSES_LIB} -L${STAGING_LIBDIR_NATIVE}"
> HOST_CURSES_INC = "${CROSS_CURSES_INC}"
>
> I'm trying to avoid as much as possible extra customisations to extend
> what cml1.bbclass
> is already providing , and keep this recipe as clean as possible.
> Please, confirm that you want me to go ahead with this extra
> settings/customisations.
>
> Diego
>
> >
> >Christopher
> >
> >>
> >> -    oe_terminal("${SHELL} -c \"cd xen; XEN_CONFIG_EXPERT=y make %s; if
> >[ \$? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to
> continue... ';
> >read r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
> >> -        d.getVar('PN') + ' Configuration', d)
> >> -
> >> -    try:
> >> -        newmtime = os.path.getmtime("xen/.config")
> >> -    except OSError:
> >> -        newmtime = 0
> >> -
> >> -    if newmtime > mtime:
> >> -        bb.note("Configuration changed, recompile will be forced")
> >> -        bb.build.write_taint('do_compile', d)
> >> -}
> >> -do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
> >> -do_menuconfig[nostamp] = "1"
> >> -do_menuconfig[dirs] = "${B}"
> >> -addtask menuconfig after do_configure
> >> +# Specify the root dir of the .config file for do_menuconfig and
> >> +do_diffconfig # tasks KCONFIG_CONFIG_ROOTDIR = "${S}/xen"
> >> diff --git a/recipes-extended/xen/xen_4.14.bb
> >> b/recipes-extended/xen/xen_4.14.bb
> >> index 0413bee..91e8988 100644
> >> --- a/recipes-extended/xen/xen_4.14.bb
> >> +++ b/recipes-extended/xen/xen_4.14.bb
> >> @@ -6,6 +6,7 @@ XEN_BRANCH ?= "stable-${XEN_REL}"
> >>  SRC_URI = " \
> >>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=$%7BXEN_BRANCH%7D> \
> >>      file://xen-arm64-implement-atomic-fetch-add.patch \
> >> +
> >> + file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca
> >> + tion.patch \
> >>      "
> >>
> >>  LIC_FILES_CHKSUM ?=
> >"file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> >> diff --git a/recipes-extended/xen/xen_git.bb
> >> b/recipes-extended/xen/xen_git.bb index 408bc3b..57791fc 100644
> >> --- a/recipes-extended/xen/xen_git.bb
> >> +++ b/recipes-extended/xen/xen_git.bb
> >> @@ -6,6 +6,7 @@ XEN_BRANCH ?= "master"
> >>  SRC_URI = " \
> >>      git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=$%7BXEN_BRANCH%7D> \
> >>      file://xen-arm64-implement-atomic-fetch-add.patch \
> >> +
> >> + file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-loca
> >> + tion.patch \
> >>      "
> >>
> >>  LIC_FILES_CHKSUM ?=
> >"file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> >> --
> >> 2.7.4
> >>
> >> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e686d405acc25e55
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Aug 13, 2020 at 3:14 AM Diego Sueiro &lt;<a=
 href=3D"mailto:Diego.Sueiro@arm.com">Diego.Sueiro@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Christopher=
,<br>
<br>
Please, find my comments inline.<br>
<br>
&gt;-----Original Message-----<br>
&gt;From: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmai=
l.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt;Sent: 12 August 2020 19:46<br>
&gt;To: Diego Sueiro &lt;<a href=3D"mailto:Diego.Sueiro@arm.com" target=3D=
"_blank">Diego.Sueiro@arm.com</a>&gt;<br>
&gt;Cc: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>; nd &lt;<a hre=
f=3D"mailto:nd@arm.com" target=3D"_blank">nd@arm.com</a>&gt;<br>
&gt;Subject: Re: [meta-virtualization][PATCH] xen: Fix menuconfig and add =
support<br>
&gt;for config fragments and diffconfig<br>
&gt;<br>
&gt;On Wed, Aug 12, 2020 at 9:53 AM Diego Sueiro &lt;<a href=3D"mailto:die=
go.sueiro@arm.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt;<br>
&gt;wrote:<br>
&gt;&gt;<br>
&gt;&gt; This patch introduces the following changes:<br>
&gt;&gt;<br>
&gt;&gt; 1. When building in OE environment the linker path needs to be pa=
ssed<br>
&gt;when<br>
&gt;&gt;=C2=A0 =C2=A0 buildind the Kconfig tool in order to get the menuco=
nfig task properly<br>
&gt;&gt;=C2=A0 =C2=A0 working.<br>
&gt;&gt;<br>
&gt;&gt; 2. By inheriting cml1.bbclass we can drop some environment variab=
les<br>
&gt;&gt;=C2=A0 =C2=A0 settings in xen-hypervisor.inc for the menuconfig ta=
sk, and also be<br>
&gt;&gt;=C2=A0 =C2=A0 able to search for config fragmens and use the diffc=
onfig task. Also,<br>
&gt;&gt;=C2=A0 =C2=A0 there is no need to have a custom do_menuconfig task=
 anymore.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@ar=
m.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 recipes-extended/xen/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +<br>
&gt;&gt;=C2=A0 ...g-Allow-specification-of-ncurses-location.patch | 64<br>
&gt;++++++++++++++++++++++<br>
&gt;&gt;=C2=A0 recipes-extended/xen/xen-hypervisor.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 48 ++++++----------<br>
&gt;&gt;=C2=A0 recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"=
noreferrer" target=3D"_blank">xen_4.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;&gt;=C2=A0 recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;&gt;=C2=A0 5 files changed, 87 insertions(+), 30 deletions(-)=C2=A0 cr=
eate mode<br>
&gt;&gt; 100644<br>
&gt;&gt; recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specif=
icati<br>
&gt;&gt; on-of-ncurses-location.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/recipes-extended/xen/README b/recipes-extended/xen/R=
EADME<br>
&gt;&gt; index 34e7977..f86d269 100644<br>
&gt;&gt; --- a/recipes-extended/xen/README<br>
&gt;&gt; +++ b/recipes-extended/xen/README<br>
&gt;&gt; @@ -25,6 +25,9 @@ Select the config settings that you want and Sa=
ve<br>
&gt;&gt; the file. If you save it to=C2=A0 the default &quot;.config&quot;=
 file when prompted<br>
&gt;&gt; by menuconfig, you can find it in the=C2=A0 &#39;xen&#39; subdire=
ctory of the build tree.<br>
&gt;&gt;<br>
&gt;&gt; +Configurarion fragments are also supported. To use them you need=
 to<br>
&gt;&gt; +list the<br>
&gt;<br>
&gt;Configuration<br>
<br>
Ooops, I forgot about this one.<br>
<br>
&gt;<br>
&gt;&gt; +.cfg files in the SRC_URI.<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 security patches<br>
&gt;&gt;=C2=A0 ----------------<br>
&gt;&gt;<br>
&gt;&gt; diff --git<br>
&gt;&gt; a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-spec=
ifica<br>
&gt;&gt; tion-of-ncurses-location.patch<br>
&gt;&gt; b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-spec=
ifica<br>
&gt;&gt; tion-of-ncurses-location.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..64319d6<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-=
speci<br>
&gt;&gt; +++ fication-of-ncurses-location.patch<br>
&gt;&gt; @@ -0,0 +1,64 @@<br>
&gt;&gt; +Upstream-Status: Inappropriate [oe specific, cross compile issue=
]<br>
&gt;<br>
&gt;Is this being considered for submission upstream?<br>
&gt;<a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guid=
elines" rel=3D"noreferrer" target=3D"_blank">https://www.openembedded.org/w=
iki/Commit_Patch_Message_Guidelines</a><br>
&gt;so: Pending?<br>
<br>
In a thread of emails, @Doug mentioned that this patch was not going to be=
<br>
accepted in the Xen source tree. We discussed that we are going to submit =
the<br>
solution to the kernel mainline and if accepted, Doug will sync-up the Xen=
<br>
kconfig source with the kernel. Since this patch is targeting the Xen sour=
ce tree<br>
and will not be accepted by the Xen project as is, I thought that the<br>
Upstream-Status should be set as Inappropriate. @Bruce, can you please<br>
advice what is the best description to add in it?<br></blockquote><div><br=
></div><div><div class=3D"gmail_default" style=3D"font-size:small">The fiel=
d isn&#39;t too strictly regulated, and since there are two potential &quot=
;upstreams&quot;, we can just put two entries.</div><div class=3D"gmail_def=
ault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">I&#39;d suggest one for Xen upstream (which is what y=
ou have), i.e. Upstream-status: Xen: ......</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">And a second for the kernel, and in that one, we can =
put &quot;pending&quot;.</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt;<br>
&gt;&gt; +Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:diego.sueiro@a=
rm.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt; commit<br>
&gt;&gt; +e6972e689a980ab28637e94e48c77eeace6abde5<br>
&gt;&gt; +Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@wind=
river.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
&gt;&gt; +Date:=C2=A0 =C2=A0Mon Jul 2 23:10:28 2018 -0400<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 xen/kconfig,menuconfig,mconf-cfg: Allow specificat=
ion of ncurses<br>
&gt;&gt; + location<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 In some cross build environments such as the Yocto=
 Project build<br>
&gt;&gt; +=C2=A0 =C2=A0 environment it provides an ncurses library that is=
 compiled<br>
&gt;&gt; +=C2=A0 =C2=A0 differently than the host&#39;s version.=C2=A0 Thi=
s causes display corruption<br>
&gt;&gt; +=C2=A0 =C2=A0 problems when the host&#39;s curses includes are u=
sed instead of the<br>
&gt;&gt; +=C2=A0 =C2=A0 includes from the provided compiler are overridden=
.=C2=A0 There is a second<br>
&gt;&gt; +=C2=A0 =C2=A0 case where there is no curses libraries at all on =
the host system and<br>
&gt;&gt; +=C2=A0 =C2=A0 menuconfig will just fail entirely.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 The solution is simply to allow an override variab=
le in<br>
&gt;&gt; +=C2=A0 =C2=A0 check-lxdialog.sh for environments such as the Yoc=
to Project.=C2=A0 Adding<br>
&gt;&gt; +=C2=A0 =C2=A0 a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the=
 issue and<br>
&gt;allowing<br>
&gt;&gt; +=C2=A0 =C2=A0 compiling and linking against the right headers an=
d libraries.<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 Change-Id: Ibe8dfafc90655e3be2671dbbb0cb7f5631fc4d=
44<br>
&gt;&gt; +=C2=A0 =C2=A0 Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:=
jason.wessel@windriver.com" target=3D"_blank">jason.wessel@windriver.com</a=
>&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 cc: Michal Marek &lt;<a href=3D"mailto:mmarek@suse=
.cz" target=3D"_blank">mmarek@suse.cz</a>&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 cc: <a href=3D"mailto:linux-kbuild@vger.kernel.org=
" target=3D"_blank">linux-kbuild@vger.kernel.org</a><br>
&gt;&gt; +=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.=
com</a>&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 Signed-off-by: Diego Sueiro &lt;<a href=3D"mailto:=
diego.sueiro@arm.com" target=3D"_blank">diego.sueiro@arm.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/INSTALL b/INSTALL<br>
&gt;&gt; +index 0d3eb89..9dcda8f 100644<br>
&gt;&gt; +--- a/INSTALL<br>
&gt;&gt; ++++ b/INSTALL<br>
&gt;&gt; +@@ -33,6 +33,10 @@ small subset of the options.=C2=A0 Attempts t=
o change<br>
&gt;&gt; +other options will be=C2=A0 silently overridden.=C2=A0 The only =
way to find<br>
&gt;&gt; +which configuration options=C2=A0 are available is to run `make =
menuconfig&#39; or<br>
&gt;the like.<br>
&gt;&gt; +<br>
&gt;&gt; ++To use the menuconfig in cross build environments, e.g.<br>
&gt;&gt; ++openembedded, set the CROSS_CURSES_LIB and CROSS_CURSES_INC<br>
&gt;&gt; ++environment variables with the proper values required for libs =
and cflags<br>
&gt;compilation settings.<br>
&gt;&gt; ++<br>
&gt;&gt; + You can counter-override this behaviour by setting<br>
&gt;&gt; + XEN_CONFIG_EXPERT=3Dy in your environment.=C2=A0 However, doing=
 this is not<br>
&gt;&gt; + supported and the resulting configurations do not receive secur=
ity<br>
&gt;&gt; + support.=C2=A0 If you set<br>
&gt;<br>
&gt;The doc has a couple of existing sections for variables that affect th=
e build --<br>
&gt;better to add the new documentation there?<br>
&gt;<br>
<br>
Well, the introduction of these variables are not affecting the build itse=
lf since<br>
they are only used when building kconfig in a cross build environment for =
the<br>
menuconfig target. Either way, since this patch will not be merged directl=
y to<br>
the Xen source tree, I&#39;m thinking about dropping the documentation cha=
nges<br>
since for the normal Yocto use cases the user does not need to care about =
it<br>
because the build system is already setting it properly.<br>
Do you agree with removing the documentation changes in this patch?<br>
<br>
&gt;&gt; +diff --git a/xen/tools/kconfig/mconf-cfg.sh<br>
&gt;&gt; +b/xen/tools/kconfig/mconf-cfg.sh old mode 100755 new mode 100644=
<br>
&gt;<br>
&gt;??<br>
<br>
This came from the original patch. Shall I remove the file mode modificati=
on?=C2=A0 <br>
<br>
&gt;<br>
&gt;&gt; +index c812872..65a9b9e<br>
&gt;&gt; +--- a/xen/tools/kconfig/mconf-cfg.sh<br>
&gt;&gt; ++++ b/xen/tools/kconfig/mconf-cfg.sh<br>
&gt;&gt; +@@ -4,6 +4,14 @@<br>
&gt;&gt; + PKG=3D&quot;ncursesw&quot;<br>
&gt;&gt; + PKG2=3D&quot;ncurses&quot;<br>
&gt;&gt; +<br>
&gt;&gt; ++if [ &quot;$CROSS_CURSES_LIB&quot; !=3D &quot;&quot; ]; then<br=
>
&gt;&gt; ++=C2=A0 =C2=A0 echo libs=3D\&#39;$CROSS_CURSES_LIB\&#39;<br>
&gt;&gt; ++=C2=A0 =C2=A0 if [ x&quot;$CROSS_CURSES_INC&quot; !=3D x ]; the=
n<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 echo cflags=3D\&#39;$CROSS_CURSES_INC\&#39=
;<br>
&gt;&gt; ++=C2=A0 =C2=A0 fi<br>
&gt;&gt; ++=C2=A0 =C2=A0 exit 0<br>
&gt;&gt; ++fi<br>
&gt;&gt; ++<br>
&gt;&gt; + if [ -n &quot;$(command -v pkg-config)&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if pkg-config --exists $PKG; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo cfla=
gs=3D\&quot;$(pkg-config --cflags $PKG)\&quot;<br>
&gt;&gt; diff --git a/recipes-extended/xen/xen-hypervisor.inc<br>
&gt;&gt; b/recipes-extended/xen/xen-hypervisor.inc<br>
&gt;&gt; index c386917..28d64c5 100644<br>
&gt;&gt; --- a/recipes-extended/xen/xen-hypervisor.inc<br>
&gt;&gt; +++ b/recipes-extended/xen/xen-hypervisor.inc<br>
&gt;&gt; @@ -9,7 +9,7 @@ DESCRIPTION =3D &quot;The Xen hypervisor&quot;<br=
>
&gt;&gt;=C2=A0 # The Xen hypervisor has a narrower compatible platform ran=
ge than<br>
&gt;&gt; the Xen tools=C2=A0 COMPATIBLE_HOST =3D &#39;(x86_64.*).*-linux|a=
arch64.*-linux|arm-<br>
&gt;.*-linux-gnueabi&#39;<br>
&gt;&gt;<br>
&gt;&gt; -inherit deploy python3native<br>
&gt;&gt; +inherit deploy python3native cml1<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PACKAGES =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${PN} \<br>
&gt;&gt; @@ -34,6 +34,17 @@ FILES_${PN}-efi =3D &quot; \<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 do_configure() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 do_configure_common<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 # Handle the config fragments<br>
&gt;&gt; +=C2=A0 =C2=A0 if [ -n &quot;${@&#39; &#39;.join(find_cfgs(d))}&q=
uot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If .config is not present generate=
 one in order<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # to use the merge_config.sh<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -f &quot;${S}/xen/.config&quo=
t; ] ; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${S}/xen=
 defconfig<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/xen/tools/kconfig/merge_config.=
sh -m -O \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/xen ${S}/xen/.con=
fig ${@&quot; &quot;.join(find_cfgs(d))}<br>
&gt;&gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 do_compile() {<br>
&gt;&gt; @@ -77,35 +88,12 @@ do_deploy[depends] +=3D &quot;xen-<br>
&gt;tools:do_populate_sysroot&quot;<br>
&gt;&gt;=C2=A0 do_deploy[depends] +=3D &quot;xen-tools:do_deploy&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Enable use of menuconfig directly from bitbake and also w=
ithin the<br>
&gt;&gt; devshell -OE_TERMINAL_EXPORTS +=3D &quot;HOST_EXTRACFLAGS HOSTLDF=
LAGS<br>
&gt;TERMINFO&quot;<br>
&gt;&gt; -HOST_EXTRACFLAGS =3D &quot;${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot=
;<br>
&gt;&gt; -HOSTLDFLAGS =3D &quot;${BUILD_LDFLAGS}&quot;<br>
&gt;&gt; -TERMINFO =3D &quot;${STAGING_DATADIR_NATIVE}/terminfo&quot;<br>
&gt;&gt;=C2=A0 do_devshell[depends] +=3D &quot;ncurses-native:do_populate_=
sysroot&quot;<br>
&gt;&gt;<br>
&gt;&gt; -KCONFIG_CONFIG_COMMAND ??=3D &quot;menuconfig&quot;<br>
&gt;&gt; -python do_menuconfig() {<br>
&gt;&gt; -=C2=A0 =C2=A0 import shutil<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 try:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime =3D os.path.getmtime(&quot;xen=
/.config&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.copy(&quot;xen/.config&quot;,=
 &quot;xen/.config.orig&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 except OSError:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mtime =3D 0<br>
&gt;&gt; +# Pass the native library path for kconfig build when running th=
e<br>
&gt;&gt; +do_menuconfig # task CROSS_CURSES_LIB +=3D &quot;-<br>
&gt;L${STAGING_LIBDIR_NATIVE}&quot;<br>
&gt;<br>
&gt;I think this illustrates why the new variable names that this patch in=
troduces<br>
&gt;could be improved: they are set with values that enable the build to g=
enerate<br>
&gt;binaries that run on the host (ie. native), not the target (cross). Al=
ternatively, in<br>
&gt;the kconfig Makefile, a HOST prefix denotes variables that are used to=
 build<br>
&gt;binaries that run on the host.<br>
<br>
If we change the variable name, I&#39;ll have to change the original patch=
 and also<br>
add in this recipe the following:<br>
OE_TERMINAL_EXPORTS +=3D &quot;HOST_CURSES_LIB HOST_CURSES_INC&quot;<br>
HOST_CURSES_LIB =3D &quot;${CROSS_CURSES_LIB} -L${STAGING_LIBDIR_NATIVE}&q=
uot;<br>
HOST_CURSES_INC =3D &quot;${CROSS_CURSES_INC}&quot;<br>
<br>
I&#39;m trying to avoid as much as possible extra customisations to extend=
 what cml1.bbclass<br>
is already providing , and keep this recipe as clean as possible.<br>
Please, confirm that you want me to go ahead with this extra settings/cust=
omisations.<br>
<br>
Diego<br>
<br>
&gt;<br>
&gt;Christopher<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 oe_terminal(&quot;${SHELL} -c \&quot;cd xen; XEN_C=
ONFIG_EXPERT=3Dy make %s; if<br>
&gt;[ \$? -ne 0 ]; then echo &#39;Command failed.&#39;; printf &#39;Press =
any key to continue... &#39;;<br>
&gt;read r; fi\&quot;&quot; % d.getVar(&#39;KCONFIG_CONFIG_COMMAND&#39;),<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVar(&#39;PN&#39;) + &#39; Confi=
guration&#39;, d)<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 try:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 newmtime =3D os.path.getmtime(&quot;=
xen/.config&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 except OSError:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 newmtime =3D 0<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 if newmtime &gt; mtime:<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Configuration changed,=
 recompile will be forced&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.write_taint(&#39;do_compile=
&#39;, d)<br>
&gt;&gt; -}<br>
&gt;&gt; -do_menuconfig[depends] +=3D &quot;ncurses-native:do_populate_sys=
root&quot;<br>
&gt;&gt; -do_menuconfig[nostamp] =3D &quot;1&quot;<br>
&gt;&gt; -do_menuconfig[dirs] =3D &quot;${B}&quot;<br>
&gt;&gt; -addtask menuconfig after do_configure<br>
&gt;&gt; +# Specify the root dir of the .config file for do_menuconfig and=
<br>
&gt;&gt; +do_diffconfig # tasks KCONFIG_CONFIG_ROOTDIR =3D &quot;${S}/xen&=
quot;<br>
&gt;&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" =
rel=3D"noreferrer" target=3D"_blank">xen_4.14.bb</a><br>
&gt;&gt; b/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen_4.14.bb</a><br>
&gt;&gt; index 0413bee..91e8988 100644<br>
&gt;&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"=
noreferrer" target=3D"_blank">xen_4.14.bb</a><br>
&gt;&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_4.14.bb" rel=3D"=
noreferrer" target=3D"_blank">xen_4.14.bb</a><br>
&gt;&gt; @@ -6,6 +6,7 @@ XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://xenbits.xen.org/xen.g=
it;branch=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits=
.xen.org/xen.git;branch=3D${XEN_BRANCH}</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://xen-arm64-implement-atomic-fetch-add.p=
atch \<br>
&gt;&gt; +<br>
&gt;&gt; + file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses=
-loca<br>
&gt;&gt; + tion.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM ?=3D<br>
&gt;&quot;file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4e5&quot;<br>
&gt;&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" r=
el=3D"noreferrer" target=3D"_blank">xen_git.bb</a><br>
&gt;&gt; b/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen_git.bb</a> index 408bc3b..57791fc 100644<br>
&gt;&gt; --- a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">xen_git.bb</a><br>
&gt;&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">xen_git.bb</a><br>
&gt;&gt; @@ -6,6 +6,7 @@ XEN_BRANCH ?=3D &quot;master&quot;<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://xenbits.xen.org/xen.g=
it;branch=3D$%7BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits=
.xen.org/xen.git;branch=3D${XEN_BRANCH}</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 file://xen-arm64-implement-atomic-fetch-add.p=
atch \<br>
&gt;&gt; +<br>
&gt;&gt; + file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses=
-loca<br>
&gt;&gt; + tion.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 LIC_FILES_CHKSUM ?=3D<br>
&gt;&quot;file://COPYING;md5=3D419739e325a50f3d7b4501338e44a4e5&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--000000000000e686d405acc25e55--

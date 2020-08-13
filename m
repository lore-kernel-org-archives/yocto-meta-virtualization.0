Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
 by mx.groups.io with SMTP id smtpd.web12.6854.1597358622568939076
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 13 Aug 2020 15:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eCxYPmiU;
 spf=pass (domain: gmail.com, ip: 209.85.167.193, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f193.google.com with SMTP id v13so6511957oiv.13
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 13 Aug 2020 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XlzKpQlyoNjoVopTvS3hT4VGsVnCCPITonNkFivi76c=;
        b=eCxYPmiU4CId/wYN7HpV+t0c57ae4f+/8RHEc55zNTPCCOjJbTmaBlQ2fT85khGD8+
         gJVAdt1UGEVwxdaLdwzyisyWXCO0taaZo0DBI0DktKdMPlm1Xzb3Sqrv+sY0KqVnIVJD
         4yAwqqgBySX3HfGegoKDsNq8ooz3exSbzKLDwIypHoW2tjto7ulZoGkyUccGgPoNIaRw
         mPPSmxZvYcXTvvGPYJVyUpyi2IXSxAa7E1jZFO4DB3scO36GRD1ucIKWVCMX5HPmboUV
         ubSc+61qeqQigRlX8kCzNnDYLMKt+js9wKiTqmHGj+US+vFTaVCPWyDdQ16SE0+z517A
         ap2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XlzKpQlyoNjoVopTvS3hT4VGsVnCCPITonNkFivi76c=;
        b=ab7gKANTJp2MPdZVTa7SM9lSB+JDc/bOkkwL+QvBvtjGcsfWpaFCDU13f2ILwuUdyA
         LYX8D7j1dq3FPXaiLoc1eH0EAwTDS6Hn4WVQ2KTQ5EjOXDc6X2iwmFjp6v0maqMRgT8w
         RNhNp5eK+CqhiZJ0fpGnO1wM2ugRtLharmKC7U2gqnfftapjK1rDFF9FAVPbmfb8vNKc
         jOLERj9IAjHRRHsC5XZ+zgwd+84cZtdMmq/6BYv7x+Sx0NQbSduUyw7NnV53oAUTQc6B
         2YPtwnkuyOk4REniRlcpccievNdtvD1zkUeofDQWYFzhSWNIOaZLlEtxWTpTDWGgEIih
         FVkA==
X-Gm-Message-State: AOAM532LCw+RNVYHUt1tOO1P/vZJNiHEgiSvYQYEUQiaam0RZk4OHj2S
	JS624v6QpDQ3jQlKSfx0Z08pnJhEak3sF/K9z2To9YdP
X-Google-Smtp-Source: ABdhPJwMw52lTlXDvqTlqU8Zk9k0Gkg3pfaW1IEKfNWKshT5R9ZlniX1pxeFRqrCK3GbAcbwuH+5TJRgunp5kCLQHMc=
X-Received: by 2002:aca:d01:: with SMTP id 1mr38962oin.161.1597358621539; Thu,
 13 Aug 2020 15:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <1597251220-21873-1-git-send-email-diego.sueiro@arm.com>
 <CACMJ4Gbq_jHcnzaqAdD91i+c+w_wko+s4fQ0MmsJiC8W0c=w+A@mail.gmail.com>
 <AM6PR08MB34614D05C55020D5E09A491592430@AM6PR08MB3461.eurprd08.prod.outlook.com>
 <CADkTA4ONwTgLnjPasGO=zrAK917QnCUD8tnwgFfEGF=BSUMzbw@mail.gmail.com>
In-Reply-To: <CADkTA4ONwTgLnjPasGO=zrAK917QnCUD8tnwgFfEGF=BSUMzbw@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Thu, 13 Aug 2020 15:43:28 -0700
Message-ID: <CACMJ4GaUL8FAf-oP=KytHQDh5z4H+661QewkdMsH5OM50GmA3A@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] xen: Fix menuconfig and add support for config fragments and diffconfig
To: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>, 
	Diego Sueiro <Diego.Sueiro@arm.com>
Cc: nd <nd@arm.com>, Doug Goldstein <cardoe@gentoo.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 13, 2020 at 6:35 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> On Thu, Aug 13, 2020 at 3:14 AM Diego Sueiro <Diego.Sueiro@arm.com> wrote:
>> > On Wed, 12 Aug, Christopher Clark <christopher.w.clark@gmail.com> wrote:
>> >On Wed, Aug 12, 2020 at 9:53 AM Diego Sueiro <diego.sueiro@arm.com>
>> >wrote:
>> >>
>> >> This patch introduces the following changes:
>> >>
>> >> 1. When building in OE environment the linker path needs to be passed
>> >when
>> >>    buildind the Kconfig tool in order to get the menuconfig task properly
>> >>    working.
>> >>
>> >> 2. By inheriting cml1.bbclass we can drop some environment variables
>> >>    settings in xen-hypervisor.inc for the menuconfig task, and also be
>> >>    able to search for config fragmens and use the diffconfig task. Also,
>> >>    there is no need to have a custom do_menuconfig task anymore.
>> >>
>> >> Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>

>> >> diff --git
>> >> a/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specifica
>> >> tion-of-ncurses-location.patch
>> >> b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-specifica
>> >> tion-of-ncurses-location.patch
>> >> new file mode 100644
>> >> index 0000000..64319d6
>> >> --- /dev/null
>> >> +++ b/recipes-extended/xen/files/0001-menuconfig-mconf-cfg-Allow-speci
>> >> +++ fication-of-ncurses-location.patch
>> >> @@ -0,0 +1,64 @@
>> >> +Upstream-Status: Inappropriate [oe specific, cross compile issue]
>> >
>> >Is this being considered for submission upstream?
>> >https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>> >so: Pending?
>>
>> In a thread of emails, @Doug mentioned that this patch was not going to be
>> accepted in the Xen source tree. We discussed that we are going to submit the
>> solution to the kernel mainline and if accepted, Doug will sync-up the Xen
>> kconfig source with the kernel.

ok, I hadn't interpreted Doug's comment as a nack of this patch for Xen, but I
did see that you guys are going to first work with it towards inclusion in the
mainline kernel -- good, thanks for taking that on.

>> Since this patch is targeting the Xen source tree
>> and will not be accepted by the Xen project as is, I thought that the
>> Upstream-Status should be set as Inappropriate. @Bruce, can you please
>> advice what is the best description to add in it?
>
>
> The field isn't too strictly regulated, and since there are two potential "upstreams", we can just put two entries.
>
> I'd suggest one for Xen upstream (which is what you have), i.e. Upstream-status: Xen: ......
>
> And a second for the kernel, and in that one, we can put "pending".
>
> Bruce
>
>>
>> >
>> >> +Signed-off-by: Diego Sueiro <diego.sueiro@arm.com> commit
>> >> +e6972e689a980ab28637e94e48c77eeace6abde5
>> >> +Author: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> +Date:   Mon Jul 2 23:10:28 2018 -0400
>> >> +
>> >> +    xen/kconfig,menuconfig,mconf-cfg: Allow specification of ncurses
>> >> + location
>> >> +
>> >> +    In some cross build environments such as the Yocto Project build
>> >> +    environment it provides an ncurses library that is compiled
>> >> +    differently than the host's version.  This causes display corruption
>> >> +    problems when the host's curses includes are used instead of the
>> >> +    includes from the provided compiler are overridden.  There is a second
>> >> +    case where there is no curses libraries at all on the host system and
>> >> +    menuconfig will just fail entirely.
>> >> +
>> >> +    The solution is simply to allow an override variable in
>> >> +    check-lxdialog.sh for environments such as the Yocto Project.  Adding
>> >> +    a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and
>> >allowing
>> >> +    compiling and linking against the right headers and libraries.
>> >> +
>> >> +    Change-Id: Ibe8dfafc90655e3be2671dbbb0cb7f5631fc4d44
>> >> +    Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> >> +    cc: Michal Marek <mmarek@suse.cz>
>> >> +    cc: linux-kbuild@vger.kernel.org
>> >> +    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> >> +    Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
>> >> +
>> >> +diff --git a/INSTALL b/INSTALL
>> >> +index 0d3eb89..9dcda8f 100644
>> >> +--- a/INSTALL
>> >> ++++ b/INSTALL
>> >> +@@ -33,6 +33,10 @@ small subset of the options.  Attempts to change
>> >> +other options will be  silently overridden.  The only way to find
>> >> +which configuration options  are available is to run `make menuconfig' or
>> >the like.
>> >> +
>> >> ++To use the menuconfig in cross build environments, e.g.
>> >> ++openembedded, set the CROSS_CURSES_LIB and CROSS_CURSES_INC
>> >> ++environment variables with the proper values required for libs and cflags
>> >compilation settings.
>> >> ++
>> >> + You can counter-override this behaviour by setting
>> >> + XEN_CONFIG_EXPERT=y in your environment.  However, doing this is not
>> >> + supported and the resulting configurations do not receive security
>> >> + support.  If you set
>> >
>> >The doc has a couple of existing sections for variables that affect the build --
>> >better to add the new documentation there?
>> >
>>
>> Well, the introduction of these variables are not affecting the build itself since
>> they are only used when building kconfig in a cross build environment for the
>> menuconfig target. Either way, since this patch will not be merged directly to
>> the Xen source tree, I'm thinking about dropping the documentation changes
>> since for the normal Yocto use cases the user does not need to care about it
>> because the build system is already setting it properly.
>> Do you agree with removing the documentation changes in this patch?

Sure. The commit message and patch content is clear enough for here.

>>
>> >> +diff --git a/xen/tools/kconfig/mconf-cfg.sh
>> >> +b/xen/tools/kconfig/mconf-cfg.sh old mode 100755 new mode 100644
>> >
>> >??
>>
>> This came from the original patch. Shall I remove the file mode modification?

I haven't tested your patch but it looked like you were modifying the mode on
the 'merge_config.sh' script that you're about to run in do_configure; I see
now that this is a different script, so ok, no change needed.

>>
>> >
>> >> +index c812872..65a9b9e
>> >> +--- a/xen/tools/kconfig/mconf-cfg.sh
>> >> ++++ b/xen/tools/kconfig/mconf-cfg.sh
>> >> +@@ -4,6 +4,14 @@
>> >> + PKG="ncursesw"
>> >> + PKG2="ncurses"
>> >> +
>> >> ++if [ "$CROSS_CURSES_LIB" != "" ]; then
>> >> ++    echo libs=\'$CROSS_CURSES_LIB\'
>> >> ++    if [ x"$CROSS_CURSES_INC" != x ]; then
>> >> ++      echo cflags=\'$CROSS_CURSES_INC\'
>> >> ++    fi
>> >> ++    exit 0
>> >> ++fi
>> >> ++
>> >> + if [ -n "$(command -v pkg-config)" ]; then
>> >> +       if pkg-config --exists $PKG; then
>> >> +               echo cflags=\"$(pkg-config --cflags $PKG)\"
>> >> diff --git a/recipes-extended/xen/xen-hypervisor.inc
>> >> b/recipes-extended/xen/xen-hypervisor.inc
>> >> index c386917..28d64c5 100644
>> >> --- a/recipes-extended/xen/xen-hypervisor.inc
>> >> +++ b/recipes-extended/xen/xen-hypervisor.inc
>> >> @@ -9,7 +9,7 @@ DESCRIPTION = "The Xen hypervisor"
>> >>  # The Xen hypervisor has a narrower compatible platform range than
>> >> the Xen tools  COMPATIBLE_HOST = '(x86_64.*).*-linux|aarch64.*-linux|arm-
>> >.*-linux-gnueabi'
>> >>
>> >> -inherit deploy python3native
>> >> +inherit deploy python3native cml1
>> >>
>> >>  PACKAGES = " \
>> >>      ${PN} \
>> >> @@ -34,6 +34,17 @@ FILES_${PN}-efi = " \
>> >>
>> >>  do_configure() {
>> >>      do_configure_common
>> >> +
>> >> +    # Handle the config fragments
>> >> +    if [ -n "${@' '.join(find_cfgs(d))}" ]; then
>> >> +        # If .config is not present generate one in order
>> >> +        # to use the merge_config.sh
>> >> +        if [ ! -f "${S}/xen/.config" ] ; then
>> >> +            oe_runmake -C ${S}/xen defconfig
>> >> +        fi
>> >> +        ${S}/xen/tools/kconfig/merge_config.sh -m -O \
>> >> +            ${S}/xen ${S}/xen/.config ${@" ".join(find_cfgs(d))}

If you're going to resubmit your patch, it would be nice to avoid running
find_cfgs twice; but I won't insist.


>> >> +    fi
>> >>  }
>> >>
>> >>  do_compile() {
>> >> @@ -77,35 +88,12 @@ do_deploy[depends] += "xen-
>> >tools:do_populate_sysroot"
>> >>  do_deploy[depends] += "xen-tools:do_deploy"
>> >>
>> >>  # Enable use of menuconfig directly from bitbake and also within the
>> >> devshell -OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS
>> >TERMINFO"
>> >> -HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
>> >> -HOSTLDFLAGS = "${BUILD_LDFLAGS}"
>> >> -TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
>> >>  do_devshell[depends] += "ncurses-native:do_populate_sysroot"
>> >>
>> >> -KCONFIG_CONFIG_COMMAND ??= "menuconfig"
>> >> -python do_menuconfig() {
>> >> -    import shutil
>> >> -
>> >> -    try:
>> >> -        mtime = os.path.getmtime("xen/.config")
>> >> -        shutil.copy("xen/.config", "xen/.config.orig")
>> >> -    except OSError:
>> >> -        mtime = 0
>> >> +# Pass the native library path for kconfig build when running the
>> >> +do_menuconfig # task CROSS_CURSES_LIB += "-
>> >L${STAGING_LIBDIR_NATIVE}"
>> >
>> >I think this illustrates why the new variable names that this patch introduces
>> >could be improved: they are set with values that enable the build to generate
>> >binaries that run on the host (ie. native), not the target (cross). Alternatively, in
>> >the kconfig Makefile, a HOST prefix denotes variables that are used to build
>> >binaries that run on the host.
>>
>> If we change the variable name, I'll have to change the original patch and also
>> add in this recipe the following:
>> OE_TERMINAL_EXPORTS += "HOST_CURSES_LIB HOST_CURSES_INC"
>> HOST_CURSES_LIB = "${CROSS_CURSES_LIB} -L${STAGING_LIBDIR_NATIVE}"
>> HOST_CURSES_INC = "${CROSS_CURSES_INC}"
>>
>> I'm trying to avoid as much as possible extra customisations to extend what cml1.bbclass
>> is already providing , and keep this recipe as clean as possible.
>> Please, confirm that you want me to go ahead with this extra settings/customisations.

ok, understood. I would much prefer that the cml1.bbclass had not used those
variable names but since they are established, that's what you should work with
rather than adding further complexity here.

Thanks for being clear with your explanations; and best of luck with
the upstreaming.

Christopher

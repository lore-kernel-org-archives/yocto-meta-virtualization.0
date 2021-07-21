Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.1527.1626835317407217317
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Jul 2021 19:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YiDLyK8a;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id ca14so527163edb.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Jul 2021 19:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YC9N4/dg0kMN9U2YKgrGHkT7OCkPc4ED43mC+NQdJUk=;
        b=YiDLyK8a8GHqdyFsF/SKqBWSklvz9htPmIqbB9ng0OpUHIrU4ZTJnlAK7XWDlUeMDF
         oNyf0xKqmiOm7rt9a4FQVJX96aE7NHdfdzzQ5kQ3pSlSsIlYl23BIkxaB+N63+rLRwvg
         G2gH4pxDEAS7PZVvQ5ac5gTBQ2KqV5W0DaeAFsVkOSIXtH065dqETqyuX79Karvlcv9l
         H/m+Ch8QnI2MQ5isbkVxEPGF0xZ8iXj5RmB80Dj5FsYwr/R+UBpkcn2GrRAqFhjgb2ga
         h0vSpn8qfqDKOIkqimSURInFW+tXquxyLhfWiRxAxRJtGNgW1TO3lVMmnP0AlaUjV2UE
         z09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YC9N4/dg0kMN9U2YKgrGHkT7OCkPc4ED43mC+NQdJUk=;
        b=lmm5PU/cStukpgT0kP7zvOKCozpP4h8iklViVZydLHoIrX3llVxnTCZ47TZSxJnncG
         CGCdKcyBOqeWtMHI7dcwlUBkopH9LNHx2GgEZ3oiwwzoP3TeuoZH57SpFrPL1vRF1Kvn
         JofYNnvtLFE8XERcZ2ESubP/hyJxRFh4hIJzXQs2jdpX7jPok6eQKCwj5r8jDQ151Wh5
         +aKgj8ZfdCYCIxpEbVK0DDjR/53yIHo5bymF+Qr3/HYW89U2TtRTIyX8auT7enjuO8wb
         omCIwO/Dn2MyceuEgacahz95ZPrH3NagQdOweRQzufK7D1Fo+ihIymjl6d4gMmQ71DzT
         1kYw==
X-Gm-Message-State: AOAM530uJPtlDruiJngnU3zXO/82bnx2SvMmLwvNzSCx0vWxFouRj3zV
	xRgR4qnDcRfZti8/AIbS9NxGTYR8/3UExPzpXAI=
X-Google-Smtp-Source: ABdhPJwRIedgFcPJIdQ5TETYILWem3RFJrhskHDq/x/8frkE8X2pdhfurWdkiH4ibs6mypyZPttS/NupXCH8lH5fZQk=
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr45850058edu.352.1626835315714;
 Tue, 20 Jul 2021 19:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210708044300.127016-1-christopher.w.clark@gmail.com> <20210708044300.127016-2-christopher.w.clark@gmail.com>
In-Reply-To: <20210708044300.127016-2-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 20 Jul 2021 22:41:44 -0400
Message-ID: <CADkTA4PAHVoD3Raxsn6iK9m668GxC_fYgCsHf9=ZnZYb3LYC+Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] lopper, python-dtc: add new recipes for device tree tools
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.clark@starlab.io>, Doug Goldstein <cardoe@gentoo.org>, 
	Diego Sueiro <diego.sueiro@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	andrew.cooper3@citrix.com, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, scott.davis@starlab.io, adam.schwalm@starlab.io
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> From: Christopher Clark <christopher.clark@starlab.io>
>
> This device tree tooling is being added as a prequisite for enabling
> qemuboot to run Xen system images with device trees generated for Qemu.
>
> lopper: a tool for performing operations on device tree files.
> A new recipe inspired by the original from meta-xilinx-bsp.
>
> python-dtc: a python library for the Device Tree compiler.
> This is a prerequisite for lopper. Imported from meta-xilinx-bsp with an
> updated SRCREV and DESCRIPTION for the latest release, version 1.6.1.
>
> Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> ---
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb | 26 ++++++++++++++
>  recipes-kernel/lopper/lopper.bb         | 45 +++++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
>  create mode 100644 recipes-kernel/lopper/lopper.bb
>
> diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> new file mode 100644
> index 0000000..5374029
> --- /dev/null
> +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Python Library for the Device Tree Compiler"
> +HOMEPAGE = "https://devicetree.org/"
> +DESCRIPTION = "A python library for the Device Tree Compiler, a tool used to manipulate Device Tree files which contain a data structure for describing hardware."
> +SECTION = "bootloader"
> +LICENSE = "GPLv2 | BSD"
> +
> +DEPENDS = "flex-native bison-native swig-native libyaml dtc"
> +
> +SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git"
> +
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> +
> +LIC_FILES_CHKSUM = "file://libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
> +
> +SRCREV = "ecaeb97fec013973360e94888a7de645f084345c"
> +
> +S = "${WORKDIR}/git/pylibfdt"
> +
> +inherit distutils3
> +
> +do_configure_prepend() {

Sorry for being so slow on the review of this, I was deep into getting
the umoci backend to work for OCI image creation and am just getting
to reviews now!

> +    make -C "${S}/.." version_gen.h

Two minor thoughts on the line above:

 - did you try oe_runmake ? versus the bare 'make' call ? I always
forget to do that myself.
 - the ${S}/.. concerned me at first, until I took a close look at
${S}. Could we use "${WORKDIR}/git/" instead ? That doesn't make it
look like we are scribbling outside of ${S}.

> +    mv "${S}/../version_gen.h" "${S}/"
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/recipes-kernel/lopper/lopper.bb b/recipes-kernel/lopper/lopper.bb
> new file mode 100644
> index 0000000..274d5b9
> --- /dev/null
> +++ b/recipes-kernel/lopper/lopper.bb
> @@ -0,0 +1,45 @@
> +SUMMARY = "Device Tree Lopper"
> +DESCRIPTION = "Tool for manipulation of system device tree files"
> +LICENSE = "BSD-3-Clause"
> +SECTION = "bootloader"
> +
> +SRC_URI = "git://github.com/devicetree-org/lopper.git"
> +SRCREV = "0c23e51d585608ab04009ccf3499f168e2f4d478"
> +S = "${WORKDIR}/git"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
> +
> +RDEPENDS_${PN} = " \
> +    python3-core \
> +    python3-dtc \
> +    python3-humanfriendly \
> +    "
> +
> +do_install() {
> +    install -d "${D}/${bindir}"
> +    install -d "${D}/${datadir}/${BPN}"
> +
> +    install -m 0644 "${S}/README" "${D}/${datadir}/${BPN}"
> +    install -m 0644 "${S}/README-architecture.txt" "${D}/${datadir}/${BPN}"
> +    install -m 0644 "${S}/README.pydoc" "${D}/${datadir}/${BPN}"
> +    install -m 0644 "${S}/LICENSE.md" "${D}/${datadir}/${BPN}"
> +
> +    install -d "${D}/${datadir}/${BPN}/assists"
> +    install -m 0644 "${S}/assists/"* "${D}/${datadir}/${BPN}/assists/"
> +
> +    install -d "${D}/${datadir}/${BPN}/lops"
> +    install -m 0644 "${S}/lops/"* "${D}/${datadir}/${BPN}/lops/"
> +
> +    install -d "${D}/${datadir}/${BPN}/device-trees"
> +    install -m 0644 "${S}/device-trees/"* "${D}/${datadir}/${BPN}/device-trees/"
> +
> +    install -m 0755 "${S}/"lopper*.py "${D}/${datadir}/${BPN}/"
> +
> +    datadir_relpath=${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}
> +    ln -s "${datadir_relpath}/${BPN}/lopper.py" "${D}/${bindir}/"

This looks good to me. I'm working on getting lopper into a pypi
format, but I'll take care of updating this recipe once that work is
complete.

Bruce

> +}
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

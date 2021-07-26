Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web09.3801.1627338277437666620
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 26 Jul 2021 15:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m0ORnxfi;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id y18so12816090oiv.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 26 Jul 2021 15:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhXwYyfcC0/TnnSEq9Witef+Gx8OsHZnFdSFL+Afg+k=;
        b=m0ORnxfiawXyD4yXJco93xai8K/HMI1BTB2wlhrIF0yHQApzxaT/S8BVqoyNx+afJp
         0kVXK35gVr1I6YbOBZX3+qlmVHX5GTDx+U6HQ/ALauGc9DokgeiQQRZnUABcHDApSWaC
         Gr3iCnURbcoLBgYlxpp+1Z/IDntx02YSsBzX6QnC5inHDZXNMyaibHJVeade0dmkSgkR
         lxAEiWohWl+hkAQRvEGTGnxlyNeNKu9gvf2wPoKpfifGuOJzmEso7vIhF8pP7DRAd9dI
         FtJGFC09uFPdWRgpHuszpaANXapgoCBiNqhLCt7hwbqTh2eiMfyZ5bKiCIEGykJzlBkS
         iUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhXwYyfcC0/TnnSEq9Witef+Gx8OsHZnFdSFL+Afg+k=;
        b=i/DxrwF6GZNLl/8wuUXKt8D79EFO6cCW2uYjsFMSGBBMkky4r/UPFoNm220A7nVFxf
         JSNPFFeZUjG/m3ukkRo7Dl0/45pQy9UiK70GgaPA3hPs8K6QFIyWghVJG14BvTSSFC3k
         VKg3/264yoiVb2NHwljyK0Hj/khWs5QJqmHkfrtjzKPhOquVRudevcia5P7uiGUGq6sS
         mLiKbFrPz8Dp7FLBAZlmLB2irNA1+r/cjnGYQC2YNRI6oiXjdr1bJWydayGJBTEnyXmi
         nKoFDFJZaeVfK4oNoSWhj48ZG+lygdP61ohHFfgk8+Y60QuhcIYCd+n/LoTI28fBS9W4
         +bfA==
X-Gm-Message-State: AOAM531GuqCzPb2anBz6R9ivNzzeo7rOCg14k89SQDfPNqlwIDIG3Tif
	YvXo/6KB0pBLB5mGdMSRsyntt7OH/1XIoZEnyBA=
X-Google-Smtp-Source: ABdhPJzDzR8KNLahQVF95FiE5XL7fbEImBVTDWEtUdc3bBuf/UsmGmPiCHUvqeivFftk7/KTzkocmozSrWI6tXZMzuk=
X-Received: by 2002:aca:90b:: with SMTP id 11mr12809774oij.152.1627338276808;
 Mon, 26 Jul 2021 15:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210708044300.127016-1-christopher.w.clark@gmail.com>
 <20210708044300.127016-2-christopher.w.clark@gmail.com> <CADkTA4PAHVoD3Raxsn6iK9m668GxC_fYgCsHf9=ZnZYb3LYC+Q@mail.gmail.com>
In-Reply-To: <CADkTA4PAHVoD3Raxsn6iK9m668GxC_fYgCsHf9=ZnZYb3LYC+Q@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 26 Jul 2021 15:24:25 -0700
Message-ID: <CACMJ4GaLDr0rrjdiuw9jPR2LT1kZ+2p_WsnFV_JeT0LTWB3fpw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/2] lopper, python-dtc: add new recipes for device tree tools
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Christopher Clark <christopher.clark@starlab.io>, Doug Goldstein <cardoe@gentoo.org>, 
	Diego Sueiro <diego.sueiro@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>, 
	Rich Persaud <persaur@gmail.com>, Scott Davis <scott.davis@starlab.io>, 
	Adam Schwalm <adam.schwalm@starlab.io>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 7:41 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> >
> > From: Christopher Clark <christopher.clark@starlab.io>
> >
> > This device tree tooling is being added as a prequisite for enabling
> > qemuboot to run Xen system images with device trees generated for Qemu.
> >
> > lopper: a tool for performing operations on device tree files.
> > A new recipe inspired by the original from meta-xilinx-bsp.
> >
> > python-dtc: a python library for the Device Tree compiler.
> > This is a prerequisite for lopper. Imported from meta-xilinx-bsp with an
> > updated SRCREV and DESCRIPTION for the latest release, version 1.6.1.
> >
> > Signed-off-by: Christopher Clark <christopher.clark@starlab.io>
> > ---
> >  recipes-kernel/dtc/python3-dtc_1.6.1.bb | 26 ++++++++++++++
> >  recipes-kernel/lopper/lopper.bb         | 45 +++++++++++++++++++++++++
> >  2 files changed, 71 insertions(+)
> >  create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
> >  create mode 100644 recipes-kernel/lopper/lopper.bb
> >
> > diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> > new file mode 100644
> > index 0000000..5374029
> > --- /dev/null
> > +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> > @@ -0,0 +1,26 @@
> > +SUMMARY = "Python Library for the Device Tree Compiler"
> > +HOMEPAGE = "https://devicetree.org/"
> > +DESCRIPTION = "A python library for the Device Tree Compiler, a tool used to manipulate Device Tree files which contain a data structure for describing hardware."
> > +SECTION = "bootloader"
> > +LICENSE = "GPLv2 | BSD"
> > +
> > +DEPENDS = "flex-native bison-native swig-native libyaml dtc"
> > +
> > +SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git"
> > +
> > +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> > +
> > +LIC_FILES_CHKSUM = "file://libfdt.i;beginline=1;endline=6;md5=afda088c974174a29108c8d80b5dce90"
> > +
> > +SRCREV = "ecaeb97fec013973360e94888a7de645f084345c"
> > +
> > +S = "${WORKDIR}/git/pylibfdt"
> > +
> > +inherit distutils3
> > +
> > +do_configure_prepend() {
>
> Sorry for being so slow on the review of this, I was deep into getting
> the umoci backend to work for OCI image creation and am just getting
> to reviews now!
>
> > +    make -C "${S}/.." version_gen.h
>
> Two minor thoughts on the line above:
>
>  - did you try oe_runmake ? versus the bare 'make' call ? I always
> forget to do that myself.

oops, yep, I forgot - I've checked with that done and it works fine,
so will update in v2

>  - the ${S}/.. concerned me at first, until I took a close look at
> ${S}. Could we use "${WORKDIR}/git/" instead ? That doesn't make it
> look like we are scribbling outside of ${S}.

Will fix. Thanks for the review.

Christopher

>
> > +    mv "${S}/../version_gen.h" "${S}/"
> > +}
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > diff --git a/recipes-kernel/lopper/lopper.bb b/recipes-kernel/lopper/lopper.bb
> > new file mode 100644
> > index 0000000..274d5b9
> > --- /dev/null
> > +++ b/recipes-kernel/lopper/lopper.bb
> > @@ -0,0 +1,45 @@
> > +SUMMARY = "Device Tree Lopper"
> > +DESCRIPTION = "Tool for manipulation of system device tree files"
> > +LICENSE = "BSD-3-Clause"
> > +SECTION = "bootloader"
> > +
> > +SRC_URI = "git://github.com/devicetree-org/lopper.git"
> > +SRCREV = "0c23e51d585608ab04009ccf3499f168e2f4d478"
> > +S = "${WORKDIR}/git"
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=8e5f5f691f01c9fdfa7a7f2d535be619"
> > +
> > +RDEPENDS_${PN} = " \
> > +    python3-core \
> > +    python3-dtc \
> > +    python3-humanfriendly \
> > +    "
> > +
> > +do_install() {
> > +    install -d "${D}/${bindir}"
> > +    install -d "${D}/${datadir}/${BPN}"
> > +
> > +    install -m 0644 "${S}/README" "${D}/${datadir}/${BPN}"
> > +    install -m 0644 "${S}/README-architecture.txt" "${D}/${datadir}/${BPN}"
> > +    install -m 0644 "${S}/README.pydoc" "${D}/${datadir}/${BPN}"
> > +    install -m 0644 "${S}/LICENSE.md" "${D}/${datadir}/${BPN}"
> > +
> > +    install -d "${D}/${datadir}/${BPN}/assists"
> > +    install -m 0644 "${S}/assists/"* "${D}/${datadir}/${BPN}/assists/"
> > +
> > +    install -d "${D}/${datadir}/${BPN}/lops"
> > +    install -m 0644 "${S}/lops/"* "${D}/${datadir}/${BPN}/lops/"
> > +
> > +    install -d "${D}/${datadir}/${BPN}/device-trees"
> > +    install -m 0644 "${S}/device-trees/"* "${D}/${datadir}/${BPN}/device-trees/"
> > +
> > +    install -m 0755 "${S}/"lopper*.py "${D}/${datadir}/${BPN}/"
> > +
> > +    datadir_relpath=${@os.path.relpath(d.getVar('datadir'), d.getVar('bindir'))}
> > +    ln -s "${datadir_relpath}/${BPN}/lopper.py" "${D}/${bindir}/"
>
> This looks good to me. I'm working on getting lopper into a pypi
> format, but I'll take care of updating this recipe once that work is
> complete.
>
> Bruce
>
> > +}
> > +
> > +do_configure[noexec] = "1"
> > +do_compile[noexec] = "1"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.25.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21634E00D35; Tue,  3 Sep 2019 14:14:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE16AE00BF8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 14:14:06 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id a4so2463252ljk.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 14:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7FvBnESVdO7zpnMHV/S3+vepL+J6t4XjxKXZ090Kw/U=;
	b=l1CjOB830DYCQ0tJK1itlIbTvDS43zzPhTkD2BbOA1D0vBeq3dJAIYo5yb/7s15L84
	7baKhhYoHuRz02ZMZg8/Kk0PIbc7KJs9GpQbof4s3gy6N4hZW//07V1gEv0HtFrKR4BI
	uIoGCfOGekOgSU99I2gtBPp1p2CJnfCgjf1TSIbfTVDDkkujKoAD7v3oH9x4ZPno0oVF
	utKVlI2rC1kxaN+PqkNT3ai0/C6hNkwSJfJSFRMEKRt4UBvX3bXmPZVH+LDcxeCJ6AXU
	9Mlp8zaKv6dvbR8vxFc3Vuoq0Jhe1cVLzBW44McWzg4KbBJ3NROaOEMgof1fkTtDlaCM
	CqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7FvBnESVdO7zpnMHV/S3+vepL+J6t4XjxKXZ090Kw/U=;
	b=G7f674bFsPWDhPinzxa7GAaJz1L592iroBp02LIL5s9zGlZe0PI8Oliu8Xmrwe1z5e
	oirgJeOW0vZYRcbS13CBWoxsY30YF5fKXGF+Dvcz9bONeaIao6qeo8D1k3eBXMoeFoMO
	ub9T3vhgjzThlt0ZynUfs6AGBkEeCdf6x/+wCSB3UFUjY4ocfBR27ckD4AYPtUYectSo
	YM2woF6bwSV4uJ8nEV5ZnWvHmii53mDB3y8jIDeB8rcCaEvfeHegFHA+l0CFfviO4KrD
	+P8GdOH0aD6SUdQkOLtySattVNpo/OMSeOTPctCKxXu9+5+Vu2aDMQ0weVmQPRHrSdSP
	T/YQ==
X-Gm-Message-State: APjAAAUqqkMExTxTLzRZPd0Gprem3J07M/CjW5OBDLGqNkShnFWfnJLO
	W7M50gnTK6E22waNc59YTZa7VM+USbrz4TMps1o=
X-Google-Smtp-Source: APXvYqx51mc0Rgs3Y3yJwfQLYIj8XoFPMSdovkI5CMCnsK4+hZ1ltkxBVexNDlQuqf3jx4eYhKgA5lA8X2N9kt5VvAA=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr20980162ljg.78.1567545245546; 
	Tue, 03 Sep 2019 14:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<CAPuovEJ_0kHC+eNOUO33CxH7=P_zq0MNf9W5wkDJvgJU-1zimw@mail.gmail.com>
	<CADkTA4PBvoEP7w-Q1QDCDjE6+dX6SzxFF-_jrbYZ+A11gL7kFw@mail.gmail.com>
	<1771246.8WWc8Gzl8P@yow-masselst-lx1>
In-Reply-To: <1771246.8WWc8Gzl8P@yow-masselst-lx1>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 17:13:54 -0400
Message-ID: <CADkTA4MOj_x-P3r8EtwP-QQZ4uzfRZe=C2PfAh7hP5rEo+nV3w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 4/6] skopeo: add skopeo
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2019 21:14:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 3, 2019 at 5:06 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Tuesday, September 3, 2019 5:00:18 P.M. EDT Bruce Ashfield wrote:
> > On Tue, Sep 3, 2019 at 4:41 PM Mark Asselstine
> >
> > <mark.asselstine@windriver.com> wrote:
> > > On Tue, Sep 3, 2019 at 1:18 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> > > > On Sun, Sep 1, 2019 at 4:35 PM Stefan Agner <stefan@agner.ch> wrote:
> > > > > From: Stefan Agner <stefan.agner@toradex.com>
> > > > >
> > > > > skopeo is a command line utility that performs various operations on
> > > > > container images and image repositories.
> > > > >
> > > > > skopeo can work with OCI images as well as the original Docker v2
> > > > > images.
> > > > >
> > > > > The recipe originates from from meta-overc commit a497792. It has
> > > > > been updated with the new project URL and v0.1.39.
> > > >
> > > > Nice!
> > > >
> > > > This was on my list to bring into meta-virtualization. Once I can
> > > > confirm that it passes the meta-overc use cases, I'll merge this and
> > > > drop the one from meta-overc.
> > >
> > > Which takes an item off my todo list. So double nice!
> > >
> > > Eventually I want to have this build -native and an addition to the
> > > fetcher so it can be used to populate a rootfs with container images
> > > from something like docker hub.
> >
> > I can honestly say "good luck wit that". There has to be an easier
> > route than skopeo for that functionality.
> >
> > It simply has too many dependencies (and yet unused functionality) to
> > be built -native. IMHO, it's just not the right tool for that job.
> >
>
> For sure and knowing that you have spent quite a bit of time looking at this I
> am not about to argue against your assessment. I don't think this closes the
> door on working with the skopeo folks to break up the functionality in order
> to make this more feasible. At any rate, this is a ways off.

... or there just might be something in development for this already.
I've heard of some oci / standards stuff that might address this, or
maybe some of the alternate tools to skope are a better starting
point.

I'm just warning anyone that tries this, that they'll either have to
split / drop functionality or chase a LOT of -native dependencies.

Bruce

>
> MarkA
>
> > Bruce
> >
> > > MarkA
> > >
> > > > Bruce
> > > >
> > > > > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> > > > > ---
> > > > >
> > > > >  recipes-containers/skopeo/skopeo_git.bb | 73
> > > > >  +++++++++++++++++++++++++
> > > > >  1 file changed, 73 insertions(+)
> > > > >  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
> > > > >
> > > > > diff --git a/recipes-containers/skopeo/skopeo_git.bb
> > > > > b/recipes-containers/skopeo/skopeo_git.bb new file mode 100644
> > > > > index 0000000..82d3f23
> > > > > --- /dev/null
> > > > > +++ b/recipes-containers/skopeo/skopeo_git.bb
> > > > > @@ -0,0 +1,73 @@
> > > > > +HOMEPAGE = "https://github.com/containers/skopeo"
> > > > > +SUMMARY = "Work with remote images registries - retrieving
> > > > > information, images, signing content" +LICENSE = "Apache-2.0"
> > > > > +LIC_FILES_CHKSUM =
> > > > > "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584" +
> > > > > +DEPENDS = " \
> > > > > +    gpgme \
> > > > > +    multipath-tools \
> > > > > +    btrfs-tools \
> > > > > +    glib-2.0 \
> > > > > +    ostree \
> > > > > +"
> > > > > +
> > > > > +inherit go
> > > > > +
> > > > > +RDEPENDS_${PN} = " \
> > > > > +     gpgme \
> > > > > +     libgpg-error \
> > > > > +     libassuan \
> > > > > +"
> > > > > +
> > > > > +SRC_URI = "git://github.com/containers/skopeo"
> > > > > +
> > > > > +SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
> > > > > +PV = "v0.1.39-dev+git${SRCPV}"
> > > > > +GO_IMPORT = "import"
> > > > > +
> > > > > +S = "${WORKDIR}/git"
> > > > > +
> > > > > +inherit goarch
> > > > > +inherit pkgconfig
> > > > > +
> > > > > +# This disables seccomp and apparmor, which are on by default in the
> > > > > +# go package.
> > > > > +EXTRA_OEMAKE="BUILDTAGS=''"
> > > > > +
> > > > > +do_compile() {
> > > > > +       export GOARCH="${TARGET_GOARCH}"
> > > > > +
> > > > > +       # Setup vendor directory so that it can be used in GOPATH.
> > > > > +       #
> > > > > +       # Go looks in a src directory under any directory in GOPATH
> > > > > but riddler +       # uses 'vendor' instead of 'vendor/src'. We can
> > > > > fix this with a symlink. +       #
> > > > > +       # We also need to link in the ipallocator directory as that is
> > > > > not under +       # a src directory.
> > > > > +       ln -sfn . "${S}/src/import/vendor/src"
> > > > > +       mkdir -p
> > > > > "${S}/src/import/vendor/src/github.com/projectatomic/skopeo" +
> > > > > ln -sfn "${S}/src/import/skopeo"
> > > > > "${S}/src/import/vendor/src/github.com/projectatomic/skopeo" +
> > > > > ln -sfn "${S}/src/import/version"
> > > > > "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
> > > > > +       export GOPATH="${S}/src/import/vendor"
> > > > > +
> > > > > +       # Pass the needed cflags/ldflags so that cgo
> > > > > +       # can find the needed headers files and libraries
> > > > > +       export CGO_ENABLED="1"
> > > > > +       export CFLAGS=""
> > > > > +       export LDFLAGS=""
> > > > > +       export CGO_CFLAGS="${BUILDSDK_CFLAGS}
> > > > > --sysroot=${STAGING_DIR_TARGET}" +       export
> > > > > CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}" +
> > > > >     cd ${S}/src/import
> > > > > +
> > > > > +       oe_runmake binary-local
> > > > > +}
> > > > > +
> > > > > +do_install() {
> > > > > +       install -d ${D}/${sbindir}
> > > > > +       install -d ${D}/${sysconfdir}/containers
> > > > > +
> > > > > +       install ${S}/src/import/skopeo ${D}/${sbindir}/
> > > > > +       install ${S}/src/import/default-policy.json
> > > > > ${D}/${sysconfdir}/containers/policy.json +}
> > > > > +
> > > > > +INSANE_SKIP_${PN} += "ldflags"
> > > > > --
> > > > > 2.20.1
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > meta-virtualization mailing list
> > > > > meta-virtualization@yoctoproject.org
> > > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > --
> > > > _______________________________________________
> > > > meta-virtualization mailing list
> > > > meta-virtualization@yoctoproject.org
> > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


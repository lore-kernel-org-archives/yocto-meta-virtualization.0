Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F8F4E00D6A; Tue,  3 Sep 2019 14:00:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C6C1E007E1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 14:00:30 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id l11so14052689lfk.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 14:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/xbqSpZ35/LJdsW0pT3D55zkAyFO0Ysk/9X1XXPGyzE=;
	b=pVBcqSL0hWqNyTERl1VMezawpg3sAFU67Ty+CMleEiqy34no5HfzEPId2PkagdYUvG
	oDD0W/bsMbooffPGgDAxINLIR0t2OV0HA/bmiczt6rxGQ54JEK/jZZY5F/wJCq5G2g5F
	Rs3aBAds3jqLa4lUSkekPSfsdnq9Thm6gu7GyCCoWasA8oiV1YHKANMJx4pE/ML1pzXW
	2HNfzkv8DZ5QLos8oKTOpGP271I3GR0A8tu+GxC0mZ1FYmyWSpguKRAdvNFGwQGNgWYz
	03G25Yu8XPsY5Vz5Ohk85bQYvGK0W5GF/AMvP11X4m4ztaWy/+gFK/3PZeI1Cy1d51SE
	qtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/xbqSpZ35/LJdsW0pT3D55zkAyFO0Ysk/9X1XXPGyzE=;
	b=Oj4433qqsaLKz2uBHfDtzkZ0YCsQFWiJXtK/GoYMd8hTR9k2kY5AMKHJs38erY9tX9
	SpGz6U313k6srnPMFV7rtWv7RtocAQLeasMowRkGuc/e7h3SPXAnHNkXBgIQUyV3glQg
	lV/Q3rv/05eKuY/oIwvywO2AOBFUyMBcLGRk/DCDOAVzklpg5CImSQ1vxyi9k/+8asFv
	zvSq45rwTuZc9Iakx1nALgA7dI4xODaImbc1NH6MyNVyVkWVCX/os8HMzwB/Crs7s9QZ
	zd/CAfTzoL9f0PKuGwPA0dNl35Htrqy7yLwV7rDLykGx2tc0X067jEhuVpxOMVXs5gjX
	I6BA==
X-Gm-Message-State: APjAAAVtLEPVBRKRLkg5cm6QeB0/dDKOhaKhmrd3Zen6H494ynyO/XjO
	EeSwVWOiHCTmeixR0i/R+vcdU1JQctowPIqdmFko3+Vk
X-Google-Smtp-Source: APXvYqxlgfmPUzcTEGMfgq4MpOGOxeiF5WPRTo7FkKJBY73OMz6NFHpTq3Qm78bcinMhozctqi33qLcnwVT4MILmc2Q=
X-Received: by 2002:ac2:5a07:: with SMTP id q7mr12390706lfn.177.1567544429322; 
	Tue, 03 Sep 2019 14:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-5-stefan@agner.ch>
	<CADkTA4PGYknPXvx_wFS9yq6Gp9QmwX1ta7UNVygdfLKjB+Wq_Q@mail.gmail.com>
	<CAPuovEJ_0kHC+eNOUO33CxH7=P_zq0MNf9W5wkDJvgJU-1zimw@mail.gmail.com>
In-Reply-To: <CAPuovEJ_0kHC+eNOUO33CxH7=P_zq0MNf9W5wkDJvgJU-1zimw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 17:00:18 -0400
Message-ID: <CADkTA4PBvoEP7w-Q1QDCDjE6+dX6SzxFF-_jrbYZ+A11gL7kFw@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Sep 2019 21:00:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 3, 2019 at 4:41 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> On Tue, Sep 3, 2019 at 1:18 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Sun, Sep 1, 2019 at 4:35 PM Stefan Agner <stefan@agner.ch> wrote:
> > >
> > > From: Stefan Agner <stefan.agner@toradex.com>
> > >
> > > skopeo is a command line utility that performs various operations on
> > > container images and image repositories.
> > >
> > > skopeo can work with OCI images as well as the original Docker v2
> > > images.
> > >
> > > The recipe originates from from meta-overc commit a497792. It has
> > > been updated with the new project URL and v0.1.39.
> >
> > Nice!
> >
> > This was on my list to bring into meta-virtualization. Once I can
> > confirm that it passes the meta-overc use cases, I'll merge this and
> > drop the one from meta-overc.
>
> Which takes an item off my todo list. So double nice!
>
> Eventually I want to have this build -native and an addition to the
> fetcher so it can be used to populate a rootfs with container images
> from something like docker hub.

I can honestly say "good luck wit that". There has to be an easier
route than skopeo for that functionality.

It simply has too many dependencies (and yet unused functionality) to
be built -native. IMHO, it's just not the right tool for that job.

Bruce

>
> MarkA
>
> >
> > Bruce
> >
> > >
> > > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> > > ---
> > >  recipes-containers/skopeo/skopeo_git.bb | 73 +++++++++++++++++++++++++
> > >  1 file changed, 73 insertions(+)
> > >  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
> > >
> > > diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> > > new file mode 100644
> > > index 0000000..82d3f23
> > > --- /dev/null
> > > +++ b/recipes-containers/skopeo/skopeo_git.bb
> > > @@ -0,0 +1,73 @@
> > > +HOMEPAGE = "https://github.com/containers/skopeo"
> > > +SUMMARY = "Work with remote images registries - retrieving information, images, signing content"
> > > +LICENSE = "Apache-2.0"
> > > +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584"
> > > +
> > > +DEPENDS = " \
> > > +    gpgme \
> > > +    multipath-tools \
> > > +    btrfs-tools \
> > > +    glib-2.0 \
> > > +    ostree \
> > > +"
> > > +
> > > +inherit go
> > > +
> > > +RDEPENDS_${PN} = " \
> > > +     gpgme \
> > > +     libgpg-error \
> > > +     libassuan \
> > > +"
> > > +
> > > +SRC_URI = "git://github.com/containers/skopeo"
> > > +
> > > +SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
> > > +PV = "v0.1.39-dev+git${SRCPV}"
> > > +GO_IMPORT = "import"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +inherit goarch
> > > +inherit pkgconfig
> > > +
> > > +# This disables seccomp and apparmor, which are on by default in the
> > > +# go package.
> > > +EXTRA_OEMAKE="BUILDTAGS=''"
> > > +
> > > +do_compile() {
> > > +       export GOARCH="${TARGET_GOARCH}"
> > > +
> > > +       # Setup vendor directory so that it can be used in GOPATH.
> > > +       #
> > > +       # Go looks in a src directory under any directory in GOPATH but riddler
> > > +       # uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
> > > +       #
> > > +       # We also need to link in the ipallocator directory as that is not under
> > > +       # a src directory.
> > > +       ln -sfn . "${S}/src/import/vendor/src"
> > > +       mkdir -p "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> > > +       ln -sfn "${S}/src/import/skopeo" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> > > +       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
> > > +       export GOPATH="${S}/src/import/vendor"
> > > +
> > > +       # Pass the needed cflags/ldflags so that cgo
> > > +       # can find the needed headers files and libraries
> > > +       export CGO_ENABLED="1"
> > > +       export CFLAGS=""
> > > +       export LDFLAGS=""
> > > +       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> > > +       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> > > +       cd ${S}/src/import
> > > +
> > > +       oe_runmake binary-local
> > > +}
> > > +
> > > +do_install() {
> > > +       install -d ${D}/${sbindir}
> > > +       install -d ${D}/${sysconfdir}/containers
> > > +
> > > +       install ${S}/src/import/skopeo ${D}/${sbindir}/
> > > +       install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
> > > +}
> > > +
> > > +INSANE_SKIP_${PN} += "ldflags"
> > > --
> > > 2.20.1
> > >
> > > --
> > > _______________________________________________
> > > meta-virtualization mailing list
> > > meta-virtualization@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


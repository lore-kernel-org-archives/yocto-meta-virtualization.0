Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C077E0097C; Tue,  3 Sep 2019 13:41:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.196 listed in list.dnswl.org]
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59D82E0074B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:41:40 -0700 (PDT)
Received: by mail-oi1-f196.google.com with SMTP id h4so10567968oih.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc;
	bh=Q0cPWq8v5PMBvtNozoFkSKVT0fVRyVDxprxHa/G8nMU=;
	b=D1fJNEhCOR/4Uz/Doibir7Oo9PbCfTFeoHZ7GtcwdP1/cfsmio8bPu2emT0s2Xir6p
	oyZFj5Jrs9Kz8MVCMPHR4xeGW360ag2+iZcrLwm/Y64Y3EG0FuAVGwVICx7kIteNjWtv
	WJ8GoVWC2Jkel500VixITWNT+xMFtCRk+uDwvzq/0ET9dsGvj0ewqUBMuOtWC+hVJ3Pq
	XF6K6+nwCfP5+xeajVCF3VhDsihGxe/JrmV8+g59IoOVjrlmJpbJEb4+XtqCH53MAevL
	tvpWaLAJnO8s7ofstc/eQn6Hnlor/OVAR0wd82gVFJQaF6O8RfOvFd5B1azKm0zi2LO7
	EkPw==
X-Gm-Message-State: APjAAAXS+jjymeP024GrYQ970oJpE4gW0iC5/cPzFrW2Xofgxz9KUYTm
	dItM9axT4DKd6iYiodyOjuKsrP2Ly19VtIJ/F/I=
X-Google-Smtp-Source: APXvYqwYZ2TzVR8nj4FP/VAuDJwnYebQHnUZdoTbQlR598+gi8GTlYQlCd4UXsLTSpNWVePT4095zcr5ill0DD8vPvs=
X-Received: by 2002:aca:b8c2:: with SMTP id i185mr877215oif.112.1567543299972; 
	Tue, 03 Sep 2019 13:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-5-stefan@agner.ch>
	<CADkTA4PGYknPXvx_wFS9yq6Gp9QmwX1ta7UNVygdfLKjB+Wq_Q@mail.gmail.com>
In-Reply-To: <CADkTA4PGYknPXvx_wFS9yq6Gp9QmwX1ta7UNVygdfLKjB+Wq_Q@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 3 Sep 2019 16:41:29 -0400
Message-ID: <CAPuovEJ_0kHC+eNOUO33CxH7=P_zq0MNf9W5wkDJvgJU-1zimw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 4/6] skopeo: add skopeo
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2019 20:41:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 3, 2019 at 1:18 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Sun, Sep 1, 2019 at 4:35 PM Stefan Agner <stefan@agner.ch> wrote:
> >
> > From: Stefan Agner <stefan.agner@toradex.com>
> >
> > skopeo is a command line utility that performs various operations on
> > container images and image repositories.
> >
> > skopeo can work with OCI images as well as the original Docker v2
> > images.
> >
> > The recipe originates from from meta-overc commit a497792. It has
> > been updated with the new project URL and v0.1.39.
>
> Nice!
>
> This was on my list to bring into meta-virtualization. Once I can
> confirm that it passes the meta-overc use cases, I'll merge this and
> drop the one from meta-overc.

Which takes an item off my todo list. So double nice!

Eventually I want to have this build -native and an addition to the
fetcher so it can be used to populate a rootfs with container images
from something like docker hub.

MarkA

>
> Bruce
>
> >
> > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> > ---
> >  recipes-containers/skopeo/skopeo_git.bb | 73 +++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> >  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
> >
> > diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> > new file mode 100644
> > index 0000000..82d3f23
> > --- /dev/null
> > +++ b/recipes-containers/skopeo/skopeo_git.bb
> > @@ -0,0 +1,73 @@
> > +HOMEPAGE = "https://github.com/containers/skopeo"
> > +SUMMARY = "Work with remote images registries - retrieving information, images, signing content"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584"
> > +
> > +DEPENDS = " \
> > +    gpgme \
> > +    multipath-tools \
> > +    btrfs-tools \
> > +    glib-2.0 \
> > +    ostree \
> > +"
> > +
> > +inherit go
> > +
> > +RDEPENDS_${PN} = " \
> > +     gpgme \
> > +     libgpg-error \
> > +     libassuan \
> > +"
> > +
> > +SRC_URI = "git://github.com/containers/skopeo"
> > +
> > +SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
> > +PV = "v0.1.39-dev+git${SRCPV}"
> > +GO_IMPORT = "import"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit goarch
> > +inherit pkgconfig
> > +
> > +# This disables seccomp and apparmor, which are on by default in the
> > +# go package.
> > +EXTRA_OEMAKE="BUILDTAGS=''"
> > +
> > +do_compile() {
> > +       export GOARCH="${TARGET_GOARCH}"
> > +
> > +       # Setup vendor directory so that it can be used in GOPATH.
> > +       #
> > +       # Go looks in a src directory under any directory in GOPATH but riddler
> > +       # uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
> > +       #
> > +       # We also need to link in the ipallocator directory as that is not under
> > +       # a src directory.
> > +       ln -sfn . "${S}/src/import/vendor/src"
> > +       mkdir -p "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> > +       ln -sfn "${S}/src/import/skopeo" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> > +       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
> > +       export GOPATH="${S}/src/import/vendor"
> > +
> > +       # Pass the needed cflags/ldflags so that cgo
> > +       # can find the needed headers files and libraries
> > +       export CGO_ENABLED="1"
> > +       export CFLAGS=""
> > +       export LDFLAGS=""
> > +       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> > +       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> > +       cd ${S}/src/import
> > +
> > +       oe_runmake binary-local
> > +}
> > +
> > +do_install() {
> > +       install -d ${D}/${sbindir}
> > +       install -d ${D}/${sysconfdir}/containers
> > +
> > +       install ${S}/src/import/skopeo ${D}/${sbindir}/
> > +       install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
> > +}
> > +
> > +INSANE_SKIP_${PN} += "ldflags"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


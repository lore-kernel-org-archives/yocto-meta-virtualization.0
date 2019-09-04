Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9525E00DF3; Wed,  4 Sep 2019 05:40:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.128.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C21CE00D35
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Sep 2019 05:40:31 -0700 (PDT)
Received: by mail-wm1-f65.google.com with SMTP id t9so3539038wmi.5
	for <meta-virtualization@yoctoproject.org>;
	Wed, 04 Sep 2019 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lUwFFEhMf+o1YDAkmS03eCXKBxu+lopPGD7E6/jwGjw=;
	b=sg/yES3/9YG5xS+9F4eYB0X4vFhKRsXaPLvldX/Wnk/mwovH2wW14/6PeeiI7oBhmd
	LwxSr43Xf29POM+e9YgehcmtYYi9JrVImPuJpzg2WmPx63ozNCG3BLZNHlI/avf93viz
	tcBlDR1ylak/A8zlEf+2i7Jl17ZcZKqIo9/UBso6VnfuwlUn1RqwUX05+TavhBQdFlmH
	xVD3fqHCjDjqqUh6K+1Ipj5Caw9kiuzmn/qShG0GJebxJ4cn2emOzUVUo5rDGpgaXLJ7
	rtCtBVXMKqpahyTcUjMEynwK0t2SdmcDUeYLFNUu9+cmc2+UapgMMNWBrNi7WmzFO/w+
	6vqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lUwFFEhMf+o1YDAkmS03eCXKBxu+lopPGD7E6/jwGjw=;
	b=CUnxK/5ymc/6zuxYhiBZSYGRwjHeltseHLId1ukcGkT+/AlyRWt2JxrerebgWV569O
	u5oBwKapbgh3M1Rb+L9Ai3EHAixIlzl0MXoxNCPihOkYYloc5TYpofiH9IF/2kIoBbib
	XQONtdgbc6nIYHf3AMenbFjh5MRMcvRDjaoqkoEWyYP2BTejpTRbsPXIqKS/UI/Cnour
	W9YNp2ZlU8xDl9Pzr2sZYwWv1h1kewmiyyr/CqdBekb1PnZAAkEvVOCjScuwqyaSHXmQ
	L896m/sC7NEJWwZN1Vv6/iAYO0JPzdtmvSmxJz4W2S1LwMkVEGqk+oOhuQAsw7K1rJuc
	JJgw==
X-Gm-Message-State: APjAAAXxmuNTZgm5NexBFqk+nSHc/ooHkQ3KRSyFY+GOpA74Vo5sFkoZ
	Ug3wQjwMhwBo1Z8g+eHoDhT4kf8yr6Vrnj1vvSM=
X-Google-Smtp-Source: APXvYqwe75JvxzkZ0miaCxBplHpqXpzilymrQMFu5/OmOvhO8T1MIfJaGfpy4EfA5fyCaHtJzfCYHGgvrYrhQq3S8D0=
X-Received: by 2002:a1c:9d87:: with SMTP id g129mr3901840wme.160.1567600830008;
	Wed, 04 Sep 2019 05:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<CAPuovEJ_0kHC+eNOUO33CxH7=P_zq0MNf9W5wkDJvgJU-1zimw@mail.gmail.com>
	<CADkTA4PBvoEP7w-Q1QDCDjE6+dX6SzxFF-_jrbYZ+A11gL7kFw@mail.gmail.com>
	<1771246.8WWc8Gzl8P@yow-masselst-lx1>
	<CADkTA4MOj_x-P3r8EtwP-QQZ4uzfRZe=C2PfAh7hP5rEo+nV3w@mail.gmail.com>
	<2b0d0f0985204990398de33d423d7551@agner.ch>
In-Reply-To: <2b0d0f0985204990398de33d423d7551@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Sep 2019 08:40:18 -0400
Message-ID: <CADkTA4PDunctjHmTB4BzZRFWXOiEYhHHutnnebH8Yzyhb5fgEg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	meta-virtualization <meta-virtualization@yoctoproject.org>,
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
X-List-Received-Date: Wed, 04 Sep 2019 12:40:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 2:56 AM Stefan Agner <stefan@agner.ch> wrote:
>
> On 2019-09-03 23:13, Bruce Ashfield wrote:
> > On Tue, Sep 3, 2019 at 5:06 PM Mark Asselstine
> > <mark.asselstine@windriver.com> wrote:
> >>
> >> On Tuesday, September 3, 2019 5:00:18 P.M. EDT Bruce Ashfield wrote:
> >> > On Tue, Sep 3, 2019 at 4:41 PM Mark Asselstine
> >> >
> >> > <mark.asselstine@windriver.com> wrote:
> >> > > On Tue, Sep 3, 2019 at 1:18 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> >> wrote:
> >> > > > On Sun, Sep 1, 2019 at 4:35 PM Stefan Agner <stefan@agner.ch> wrote:
> >> > > > > From: Stefan Agner <stefan.agner@toradex.com>
> >> > > > >
> >> > > > > skopeo is a command line utility that performs various operations on
> >> > > > > container images and image repositories.
> >> > > > >
> >> > > > > skopeo can work with OCI images as well as the original Docker v2
> >> > > > > images.
> >> > > > >
> >> > > > > The recipe originates from from meta-overc commit a497792. It has
> >> > > > > been updated with the new project URL and v0.1.39.
> >> > > >
> >> > > > Nice!
> >> > > >
> >> > > > This was on my list to bring into meta-virtualization. Once I can
> >> > > > confirm that it passes the meta-overc use cases, I'll merge this and
> >> > > > drop the one from meta-overc.
> >> > >
> >> > > Which takes an item off my todo list. So double nice!
> >> > >
> >> > > Eventually I want to have this build -native and an addition to the
> >> > > fetcher so it can be used to populate a rootfs with container images
> >> > > from something like docker hub.
>
> I was actually thinking about something along those lines too...
>
> >> >
> >> > I can honestly say "good luck wit that". There has to be an easier
> >> > route than skopeo for that functionality.
> >> >
> >> > It simply has too many dependencies (and yet unused functionality) to
> >> > be built -native. IMHO, it's just not the right tool for that job.
> >> >
>
> Skopeo Github days "Work with remote images registries - retrieving
> information, images, signing content", doesn't seem that wrong either.

Indeed. I use skopeo extensively, so I do like it. But I'm still
holding out hopes that something else will come out of the CNCF/OCI
working groups that is smaller, or at least a better defined and
focused.

When someone asked this before, the tooling really isn't the hard
part. It is going to be licensing, reproducibility, support, etc, etc.
So if we were able to do this, there's many landmines that aren't
technical.

> Sure, it comes with some extra features, and if there is a more
> lightweight solution that would be nice. But then, its still better than
> running a complete container engine to fetch an image, as some people do
> :-)
>
> >>
> >> For sure and knowing that you have spent quite a bit of time looking at this I
> >> am not about to argue against your assessment. I don't think this closes the
> >> door on working with the skopeo folks to break up the functionality in order
> >> to make this more feasible. At any rate, this is a ways off.
> >
> > ... or there just might be something in development for this already.
> > I've heard of some oci / standards stuff that might address this, or
> > maybe some of the alternate tools to skope are a better starting
> > point.
> >
> > I'm just warning anyone that tries this, that they'll either have to
> > split / drop functionality or chase a LOT of -native dependencies.
>
> It does not seem that bad anymore now that we use the go build systems
> dependency stuff. In the OE recipe there are only a hand full
> dependencies now. Isn't it just a matter of invoking native go and
> things should work out automagically?

It wasn't that easy in my experimenting. All of the different disk
support was spidering through a lot of utilities that weren't easy to
build as -native.

But absolutely, the go packaging is better now, and we have just
captured / fetched what we need in most of the recipes, so there's no
longer 30 or 40 go recipes to extend to native (and of which 20 broke
when I tried it).

Cheers,

Bruce

>
> --
> Stefan
>
>
> >
> > Bruce
> >
> >>
> >> MarkA
> >>
> >> > Bruce
> >> >
> >> > > MarkA
> >> > >
> >> > > > Bruce
> >> > > >
> >> > > > > Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> >> > > > > ---
> >> > > > >
> >> > > > >  recipes-containers/skopeo/skopeo_git.bb | 73
> >> > > > >  +++++++++++++++++++++++++
> >> > > > >  1 file changed, 73 insertions(+)
> >> > > > >  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
> >> > > > >
> >> > > > > diff --git a/recipes-containers/skopeo/skopeo_git.bb
> >> > > > > b/recipes-containers/skopeo/skopeo_git.bb new file mode 100644
> >> > > > > index 0000000..82d3f23
> >> > > > > --- /dev/null
> >> > > > > +++ b/recipes-containers/skopeo/skopeo_git.bb
> >> > > > > @@ -0,0 +1,73 @@
> >> > > > > +HOMEPAGE = "https://github.com/containers/skopeo"
> >> > > > > +SUMMARY = "Work with remote images registries - retrieving
> >> > > > > information, images, signing content" +LICENSE = "Apache-2.0"
> >> > > > > +LIC_FILES_CHKSUM =
> >> > > > > "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584" +
> >> > > > > +DEPENDS = " \
> >> > > > > +    gpgme \
> >> > > > > +    multipath-tools \
> >> > > > > +    btrfs-tools \
> >> > > > > +    glib-2.0 \
> >> > > > > +    ostree \
> >> > > > > +"
> >> > > > > +
> >> > > > > +inherit go
> >> > > > > +
> >> > > > > +RDEPENDS_${PN} = " \
> >> > > > > +     gpgme \
> >> > > > > +     libgpg-error \
> >> > > > > +     libassuan \
> >> > > > > +"
> >> > > > > +
> >> > > > > +SRC_URI = "git://github.com/containers/skopeo"
> >> > > > > +
> >> > > > > +SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
> >> > > > > +PV = "v0.1.39-dev+git${SRCPV}"
> >> > > > > +GO_IMPORT = "import"
> >> > > > > +
> >> > > > > +S = "${WORKDIR}/git"
> >> > > > > +
> >> > > > > +inherit goarch
> >> > > > > +inherit pkgconfig
> >> > > > > +
> >> > > > > +# This disables seccomp and apparmor, which are on by default in the
> >> > > > > +# go package.
> >> > > > > +EXTRA_OEMAKE="BUILDTAGS=''"
> >> > > > > +
> >> > > > > +do_compile() {
> >> > > > > +       export GOARCH="${TARGET_GOARCH}"
> >> > > > > +
> >> > > > > +       # Setup vendor directory so that it can be used in GOPATH.
> >> > > > > +       #
> >> > > > > +       # Go looks in a src directory under any directory in GOPATH
> >> > > > > but riddler +       # uses 'vendor' instead of 'vendor/src'. We can
> >> > > > > fix this with a symlink. +       #
> >> > > > > +       # We also need to link in the ipallocator directory as that is
> >> > > > > not under +       # a src directory.
> >> > > > > +       ln -sfn . "${S}/src/import/vendor/src"
> >> > > > > +       mkdir -p
> >> > > > > "${S}/src/import/vendor/src/github.com/projectatomic/skopeo" +
> >> > > > > ln -sfn "${S}/src/import/skopeo"
> >> > > > > "${S}/src/import/vendor/src/github.com/projectatomic/skopeo" +
> >> > > > > ln -sfn "${S}/src/import/version"
> >> > > > > "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
> >> > > > > +       export GOPATH="${S}/src/import/vendor"
> >> > > > > +
> >> > > > > +       # Pass the needed cflags/ldflags so that cgo
> >> > > > > +       # can find the needed headers files and libraries
> >> > > > > +       export CGO_ENABLED="1"
> >> > > > > +       export CFLAGS=""
> >> > > > > +       export LDFLAGS=""
> >> > > > > +       export CGO_CFLAGS="${BUILDSDK_CFLAGS}
> >> > > > > --sysroot=${STAGING_DIR_TARGET}" +       export
> >> > > > > CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}" +
> >> > > > >     cd ${S}/src/import
> >> > > > > +
> >> > > > > +       oe_runmake binary-local
> >> > > > > +}
> >> > > > > +
> >> > > > > +do_install() {
> >> > > > > +       install -d ${D}/${sbindir}
> >> > > > > +       install -d ${D}/${sysconfdir}/containers
> >> > > > > +
> >> > > > > +       install ${S}/src/import/skopeo ${D}/${sbindir}/
> >> > > > > +       install ${S}/src/import/default-policy.json
> >> > > > > ${D}/${sysconfdir}/containers/policy.json +}
> >> > > > > +
> >> > > > > +INSANE_SKIP_${PN} += "ldflags"
> >> > > > > --
> >> > > > > 2.20.1
> >> > > > >
> >> > > > > --
> >> > > > > _______________________________________________
> >> > > > > meta-virtualization mailing list
> >> > > > > meta-virtualization@yoctoproject.org
> >> > > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >> > > >
> >> > > > --
> >> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> > > > thee at its end
> >> > > > - "Use the force Harry" - Gandalf, Star Trek II
> >> > > > --
> >> > > > _______________________________________________
> >> > > > meta-virtualization mailing list
> >> > > > meta-virtualization@yoctoproject.org
> >> > > > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >>
> >>
> >>
> >>



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


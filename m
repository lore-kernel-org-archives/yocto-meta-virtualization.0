Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CB2E0E00D68; Tue,  3 Sep 2019 10:18:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.178 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6156E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 10:18:12 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id l20so2390698ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 10:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x4tYpy5G6QmY2c3I6vSnzSs0TqV2T6a4Y3LKXvg6TBE=;
	b=r8VsLSVpgOAYWFKLJXOKVSNcQH/5tZfK5V/FdQBCjoJvwOoXq4Gw6efS9E0+9ozAXm
	nMD08Z1zhtRfywHZUmJPsNx1yzS7eYI30FXFXFhMR0wU1icman8/8NYVKsVMkzQqdjdH
	KDzeV3NISfPjsCnyrUdBFKZQVK6X1Cn5PMBltqPiTfL72a7B88NNtxCMDoPZ6RB770+m
	OjyVRbjEzFQIl2IjA03GXJKBE2GaGmPZwNqXh1aSmhIplzZ7RidzUyWkrPCNtTZqp+pR
	qJm5/qpE4XIoC/CDvDMueG/Ve7LWONpOoo3vzqOWkzW+DjAPT7RA4/XVZT2ry3u7Kdym
	qEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x4tYpy5G6QmY2c3I6vSnzSs0TqV2T6a4Y3LKXvg6TBE=;
	b=kNsRK/uzp27Tb2YurEhWo3fHN/0nhgpWGEO1kgewPI4WmhKfl9G3iRa+wSsd9HayCh
	to9Zfsd6uxZOBp9XCegHqrPgsK+Nm74UWlGv/0QN2jlPqa7DRsv9LHLN16UBkL00KrFF
	DREt0TGafZ00qzqd41HhFbWS1HvIpeUcrv7B7W4oRGqn5N3CR/OcqsU1wB9uRX10Iw0w
	G+bpYNXJIeelDHvMBjrw9A8O7H6mu+ND1sD1go1A5MsioYgJM/bm0Ph+MlIWDUITL+m3
	9hYRlNOya1EXpheqKWCaQ6K8yScxANJ77Y3PoEcpNA2rG9h5tGzmd7I7dGi5FkKUNIr+
	257Q==
X-Gm-Message-State: APjAAAVUzlaW+jEoNTueKZAxWoaiOqa8EBIzZ7Qlza1JI3vGp/CxtrY/
	zf2fdNjZc8jwieLXvfKVEzKmBsX5d8EOaJ0hIvUuezGn
X-Google-Smtp-Source: APXvYqxBuf6lhpNQl3GTzOICYqC9ffWszIN5DNa1uMIELKVMmocLy5tKO6w4k5K9f2Ho16916qZ7vmnf7Ly9zfdE/Mc=
X-Received: by 2002:a2e:9214:: with SMTP id k20mr4189216ljg.232.1567531091560; 
	Tue, 03 Sep 2019 10:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-5-stefan@agner.ch>
In-Reply-To: <20190901203338.38768-5-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 13:18:00 -0400
Message-ID: <CADkTA4PGYknPXvx_wFS9yq6Gp9QmwX1ta7UNVygdfLKjB+Wq_Q@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
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
X-List-Received-Date: Tue, 03 Sep 2019 17:18:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 1, 2019 at 4:35 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> skopeo is a command line utility that performs various operations on
> container images and image repositories.
>
> skopeo can work with OCI images as well as the original Docker v2
> images.
>
> The recipe originates from from meta-overc commit a497792. It has
> been updated with the new project URL and v0.1.39.

Nice!

This was on my list to bring into meta-virtualization. Once I can
confirm that it passes the meta-overc use cases, I'll merge this and
drop the one from meta-overc.

Bruce

>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/skopeo/skopeo_git.bb | 73 +++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 recipes-containers/skopeo/skopeo_git.bb
>
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> new file mode 100644
> index 0000000..82d3f23
> --- /dev/null
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -0,0 +1,73 @@
> +HOMEPAGE = "https://github.com/containers/skopeo"
> +SUMMARY = "Work with remote images registries - retrieving information, images, signing content"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7e611105d3e369954840a6668c438584"
> +
> +DEPENDS = " \
> +    gpgme \
> +    multipath-tools \
> +    btrfs-tools \
> +    glib-2.0 \
> +    ostree \
> +"
> +
> +inherit go
> +
> +RDEPENDS_${PN} = " \
> +     gpgme \
> +     libgpg-error \
> +     libassuan \
> +"
> +
> +SRC_URI = "git://github.com/containers/skopeo"
> +
> +SRCREV = "1cf1e06582142c522543560f2bc6d6756696e8ad"
> +PV = "v0.1.39-dev+git${SRCPV}"
> +GO_IMPORT = "import"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit goarch
> +inherit pkgconfig
> +
> +# This disables seccomp and apparmor, which are on by default in the
> +# go package.
> +EXTRA_OEMAKE="BUILDTAGS=''"
> +
> +do_compile() {
> +       export GOARCH="${TARGET_GOARCH}"
> +
> +       # Setup vendor directory so that it can be used in GOPATH.
> +       #
> +       # Go looks in a src directory under any directory in GOPATH but riddler
> +       # uses 'vendor' instead of 'vendor/src'. We can fix this with a symlink.
> +       #
> +       # We also need to link in the ipallocator directory as that is not under
> +       # a src directory.
> +       ln -sfn . "${S}/src/import/vendor/src"
> +       mkdir -p "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> +       ln -sfn "${S}/src/import/skopeo" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo"
> +       ln -sfn "${S}/src/import/version" "${S}/src/import/vendor/src/github.com/projectatomic/skopeo/version"
> +       export GOPATH="${S}/src/import/vendor"
> +
> +       # Pass the needed cflags/ldflags so that cgo
> +       # can find the needed headers files and libraries
> +       export CGO_ENABLED="1"
> +       export CFLAGS=""
> +       export LDFLAGS=""
> +       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +       cd ${S}/src/import
> +
> +       oe_runmake binary-local
> +}
> +
> +do_install() {
> +       install -d ${D}/${sbindir}
> +       install -d ${D}/${sysconfdir}/containers
> +
> +       install ${S}/src/import/skopeo ${D}/${sbindir}/
> +       install ${S}/src/import/default-policy.json ${D}/${sysconfdir}/containers/policy.json
> +}
> +
> +INSANE_SKIP_${PN} += "ldflags"
> --
> 2.20.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


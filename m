Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 04790E00D68; Tue,  3 Sep 2019 10:27:08 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49167E0097C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 10:27:07 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id z17so16904276ljz.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 10:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MeCZ1pm8ex1MxeAHMX12XWVpPVA1ujq4OpLcQP/PWIM=;
	b=b8brOrpVN+BDSsFS8LGgz4bFf6zSoWjpYfBpvIq3Lrq1ZlatEE2j/8IinCGmIJAfJy
	hRQR0ro8tWoqLftF9PnwCQVeo7GTpQyMtFepKWI2PNRNpitgcpn86wvwcyg0pio+w6Se
	Xo0FRbOJLaqp2Nqguq+dkib6cu274DQ5peR6/vr5vqsJ5atEGFk95amN6MDFZgT/pEPY
	pJEKlcl2DczyLMxEtYHTtK/WrcLBFwFKYY8iM1JPJdNeZ9Ab4VLUGNBQsEehAqJBlbEB
	3LcelSkl/mt4YdlDo8BAdiIezmUAxML0CrRmHUL+zJBCfobbPCkxGCx3JfCUFHh48z3B
	v02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MeCZ1pm8ex1MxeAHMX12XWVpPVA1ujq4OpLcQP/PWIM=;
	b=SvVBz0HmAfINlwVDwnHSNM8490mW/tVHRoykCNgFuAPvlLRP7zTDYqecgdvaNgPDDg
	KbErRLmttPrAbi4qIL4REa0kZdJMWVpxCVowcNMUKA2BcrYxvObzNdqpMVXSwDpyo8Bp
	20tXMFJdHvXYiSoZIL/rMy9cZKFyDTKSc7ZiEzsnhwAzbgjFcA35/lwNwmZiRyQWB20O
	q5YNhKe32zlMUsgKyVcP5+eZ7jCsDYAmDlwLNxw4H3J5ZnqnHmozbLVy2d3pkEw3z2s1
	4CsmAE18wxujOs1EV+oWlp4SX8pXIvHoBk/4nurJkH7J6uUPyL+nuQV1IEyAeTlqHKww
	801A==
X-Gm-Message-State: APjAAAX4KmIj4tCOXEO/H0hfp6JKjVRT/q1JlRcNr2IpABrl3/yyU6Hk
	AsI4BehTspm6FPlwbgipGUCY7HC76QeUzdSBBWE=
X-Google-Smtp-Source: APXvYqyKZpPi0gOt5tgZSY6M3JD1raa4klULo3KwplSJgWu+JpRP9YYHEXuMi7KHUFxhvXdq5ydePA1i6Orc7AGWeZ4=
X-Received: by 2002:a2e:96d3:: with SMTP id d19mr1661129ljj.185.1567531626135; 
	Tue, 03 Sep 2019 10:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190901203338.38768-1-stefan@agner.ch>
	<20190901203338.38768-7-stefan@agner.ch>
In-Reply-To: <20190901203338.38768-7-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 13:26:55 -0400
Message-ID: <CADkTA4PFq2jB5P=ddSz3uix2yiQHTP83L1HG+GEvZOp+5p3fEQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 6/6] podmon: add the Pod Manager tool
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
X-List-Received-Date: Tue, 03 Sep 2019 17:27:09 -0000
Content-Type: text/plain; charset="UTF-8"

I'm assuming the subject should be "podman" and not "podmon".

On Sun, Sep 1, 2019 at 4:34 PM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Podman is a daemonless container engine for developing, managing, and
> running OCI Containers on your Linux System. Containers can either be
> run as root or in rootless mode.
>
> This patch adds the initial recipe for podman. Currently a minimal
> feature set is supported. It seems that libseccomp is mandatory, which
> makes meta-security a mandatory dependency for this recipe.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/podman/podman_git.bb | 91 +++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 recipes-containers/podman/podman_git.bb
>
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> new file mode 100644
> index 0000000..6f4e7d4
> --- /dev/null
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -0,0 +1,91 @@
> +HOMEPAGE = "https://podman.io/"
> +SUMMARY =  "A daemonless container engine"
> +DESCRIPTION = "Podman is a daemonless container engine for developing, \
> +    managing, and running OCI Containers on your Linux System. Containers can \
> +    either be run as root or in rootless mode. Simply put: \
> +    `alias docker=podman`. \
> +    "
> +
> +DEPENDS = " \
> +    go-metalinter-native \
> +    go-md2man-native \
> +    gpgme \
> +    libseccomp \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +"
> +
> +SRCREV = "00057929f5acfd98341964d85722383363376d52"
> +SRC_URI = " \
> +    git://github.com/containers/libpod.git;branch=master \
> +"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
> +
> +GO_IMPORT = "import"
> +
> +S = "${WORKDIR}/git"
> +
> +PV = "1.5.1+git${SRCREV}"
> +
> +PACKAGES =+ "${PN}-contrib"
> +
> +PODMAN_PKG = "github.com/containers/libpod"
> +BUILDTAGS = "seccomp systemd exclude_graphdriver_btrfs exclude_graphdriver_devicemapper"

On my other similar recipes, I've been asked to make this a ?= so it
can be easily overridden. Is that possible here ?

> +
> +# overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"

Is this a debug statement left in, or is it relevant to podman ?

> +export LDFLAGS=""
> +
> +inherit go goarch
> +inherit systemd pkgconfig
> +
> +do_configure[noexec] = "1"
> +
> +EXTRA_OEMAKE = " \
> +     PREFIX=${prefix} BINDIR=${bindir} LIBEXECDIR=${libexecdir} \
> +     ETCDIR=${sysconfdir} TMPFILESDIR=${nonarch_libdir}/tmpfiles.d \
> +     SYSTEMDDIR=${systemd_unitdir}/system USERSYSTEMDDIR=${systemd_unitdir}/user \
> +"
> +
> +do_compile() {
> +       # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> +       # docker to download its dependencies but rather
> +       # use dependencies packaged independently.
> +       cd ${S}/src
> +       rm -rf .gopath
> +       mkdir -p .gopath/src/"$(dirname "${PODMAN_PKG}")"
> +       ln -sf ../../../../import/ .gopath/src/"${PODMAN_PKG}"
> +
> +       ln -sf "../../../import/vendor/github.com/varlink/" ".gopath/src/github.com/varlink"
> +
> +       export GOPATH="${S}/src/.gopath"
> +       export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
> +
> +       cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
> +
> +       make cmd/podman/varlink/iopodman.go GO=go

I've been trying to squash out all the raw calls to make. Does this
work if oe_runmake is used ?

Also, out of curiosity, if GO=go isn't set .. what executable does it
try to run ?

> +
> +       # Pass the needed cflags/ldflags so that cgo
> +       # can find the needed headers files and libraries
> +       export GOARCH=${TARGET_GOARCH}
> +       export CGO_ENABLED="1"
> +       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> +
> +       make BUILDTAGS="${BUILDTAGS}"

Same here. Does oe_runmake work ?

Bruce

> +}
> +
> +do_install() {
> +       cd ${S}/src/.gopath/src/"${PODMAN_PKG}"
> +
> +       oe_runmake install install.docker DESTDIR="${D}"
> +}
> +
> +FILES_${PN} += " \
> +    ${systemd_unitdir}/system/* \
> +    ${systemd_unitdir}/user/* \
> +    ${nonarch_libdir}/tmpfiles.d/* \
> +    ${sysconfdir}/docker \
> +"
> +
> +RDEPENDS_${PN} += "conmon runc-opencontainers iptables cni skopeo"
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


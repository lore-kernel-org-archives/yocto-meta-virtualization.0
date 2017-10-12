Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92EA6E008A4; Thu, 12 Oct 2017 10:02:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19EC1E006CA
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 10:02:29 -0700 (PDT)
Received: by mail-qk0-f180.google.com with SMTP id m189so1993954qke.4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Oct 2017 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y7QoaBILyACYOhIxOaOp3sIgv+cGnsREjhfJPYtQkAw=;
	b=Ly0xCLMwijNtOn7d65GXFvauQHnY4xoKTmMQ8wpIecNHToJC4z+BgqgCO8pTqlbDjr
	vmcMJB8SeAFtmvBUv3DMQme6BxNNtyFRyjF1oY6hfmYUZI+NatkbH1kXKINjxZWB09Pp
	KFaIlVCCxLDTlclbxo1i4BOze6z9Ti5Xa8JPEjwLUthA9Na1qoDiIPxO5XlaWeBX1tId
	NJyDk8G2p3I/oD7np3/qMEkKD86IvKgyr98ZWVFXMw++9zZLonljgrXtskhR7P3QK9Ms
	9tOwvOdDBjaqqlwSJB9uteOm9JY4xGEpFHtFo8gFvPs49z5NXMG+/go1lD/h7vdcU+hf
	DLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y7QoaBILyACYOhIxOaOp3sIgv+cGnsREjhfJPYtQkAw=;
	b=JBZ8koQLuPmdvipBpIwGJOUWT17+kWtzdsAOjHEEJe4QMVjA+dILEE5FYwQlvG6KsW
	68XdeCJCGsqvpr1LhLxc5QBKLQz3eZwhiUT8GdUhr5gLfmuniYBFlbpvm3HWcw/lz16l
	qkDNTfFLopF1yXEWCpHYOTz8NXW2Lu+09XfSwIcdPkuyIyPqK2H1xVeSxUlQRoNywYIh
	QzXWa03dJkCINVsLJi0LsRXWmj0WiTP3hdL4Xca5yN5OlDBcrELQruy1DaISBhDCGGsF
	G1I2UE8mU32x8djFBY+ijzUbfAKh6lDMoi4BYI225E0luA789MmwRhuuZ5C6dyt1imN1
	T1lw==
X-Gm-Message-State: AMCzsaX3LWZKUpaD0woJaPi3moC14U00/l/DLjAIXk3/bdq2ELNbLXtm
	DttPYwHwS21iqoRMeyzPNDUSYRgj+rFmm/5d43M=
X-Google-Smtp-Source: ABhQp+R7ZWsXhapwbrhB4cnRyqEZuGlcSMY5oRi1d0CWoDWgd9+U1Fv5DvF38KUA29LpQ3XTFOgQCd0ktl2iBa0MyhQ=
X-Received: by 10.233.235.149 with SMTP id b143mr1368712qkg.218.1507827748308; 
	Thu, 12 Oct 2017 10:02:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Thu, 12 Oct 2017 10:02:27 -0700 (PDT)
In-Reply-To: <1507826997-28383-5-git-send-email-pbarker@toganlabs.com>
References: <1507826997-28383-1-git-send-email-pbarker@toganlabs.com>
	<1507826997-28383-5-git-send-email-pbarker@toganlabs.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Oct 2017 13:02:27 -0400
Message-ID: <CADkTA4N07AyeVWHsTBNBde5a6=OvhY4d+PA1B-Lj2unV-HC9Ag@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/4] runc: Simplify recipes
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
X-List-Received-Date: Thu, 12 Oct 2017 17:02:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 12, 2017 at 12:49 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> * All common settings are merged into the runc.inc file.
>
> * SRC_URI and SRCREV settings are normalised, dropping unnecessary arguments.

I'm going to keep the named SRCREVs, since we very often have multiple different
git upstreams in a single build. You'll see that in my new recipes
that I've been
adding.

It does no harm, so it stays.

>
> * Variables in runc.inc are re-ordered slightly to make things clearer.

Extra churn. I'd rather leave things be.

>
> * Drop unused EXTRA_FLAGS variable in runc-docker which isn't picked up by the
>   runc Makefile anyway as it isn't exported.

This could be a separate patch.

>
> * Drop unnecessary do_compile_prepend in runc-opencontainers as the "vendor/src"
>   symlink is already created in do_compile in runc.inc.

As could this.

Bruce

>
> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb         | 10 ++--------
>  recipes-containers/runc/runc-opencontainers_git.bb | 19 ++++---------------
>  recipes-containers/runc/runc.inc                   |  9 ++++++---
>  3 files changed, 12 insertions(+), 26 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 28232d9..b1fb624 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,8 +2,8 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all components
>  #       have been updated to match.
> -SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
> -SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
> +SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
> +SRC_URI = "git://github.com/docker/runc.git \
>             file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
>             file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
>             file://0003-Update-memory-specs-to-use-int64-not-uint64.patch \
> @@ -12,10 +12,4 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
>             file://0001-Disable-building-recvtty.patch \
>            "
>
> -GO_IMPORT = "import"
> -
> -EXTRA_FLAGS = "-v -x -work"
> -
>  RUNC_VERSION = "1.0.0-rc3"
> -PROVIDES += "virtual/runc"
> -RPROVIDES_${PN} = "virtual/runc"
> diff --git a/recipes-containers/runc/runc-opencontainers_git.bb b/recipes-containers/runc/runc-opencontainers_git.bb
> index 2cfceea..ea093ee 100644
> --- a/recipes-containers/runc/runc-opencontainers_git.bb
> +++ b/recipes-containers/runc/runc-opencontainers_git.bb
> @@ -1,19 +1,8 @@
>  include runc.inc
>
>  SRCREV = "2e7cfe036e2c6dc51ccca6eb7fa3ee6b63976dcd"
> -SRC_URI = " \
> -    git://github.com/opencontainers/runc;branch=master \
> -    file://0001-Use-correct-go-cross-compiler.patch \
> -    "
> -RUNC_VERSION = "1.0.0-rc4"
> -PROVIDES += "virtual/runc"
> -RPROVIDES_${PN} = "virtual/runc"
> -
> -GO_IMPORT = "import"
> +SRC_URI = "git://github.com/opencontainers/runc \
> +           file://0001-Use-correct-go-cross-compiler.patch \
> +          "
>
> -do_compile_prepend() {
> -       # Go looks in a src directory under any directory in GOPATH but
> -       # runc-opencontainers uses 'vendor' instead of 'vendor/src'. We can fix
> -       # this with a symlink.
> -       ln -sfn . "${S}/src/import/vendor/src"
> -}
> +RUNC_VERSION = "1.0.0-rc4"
> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/runc.inc
> index b1f2ba8..7901bc7 100644
> --- a/recipes-containers/runc/runc.inc
> +++ b/recipes-containers/runc/runc.inc
> @@ -2,6 +2,10 @@ HOMEPAGE = "https://github.com/opencontainers/runc"
>  SUMMARY = "runc container cli tools"
>  DESCRIPTION = "runc is a CLI tool for spawning and running containers according to the OCI specification."
>
> +PROVIDES += "virtual/runc"
> +RPROVIDES_${PN} = "virtual/runc"
> +RRECOMMENDS_${PN} = "lxc docker"
> +
>  # Apache-2.0 for containerd
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
> @@ -11,14 +15,13 @@ S = "${WORKDIR}/git"
>  PV = "${RUNC_VERSION}+git${SRCREV}"
>
>  inherit go
> -RRECOMMENDS_${PN} = "lxc docker"
> +GO_IMPORT = "import"
>
>  LIBCONTAINER_PACKAGE="github.com/opencontainers/runc/libcontainer"
>
> -do_configure[noexec] = "1"
>  EXTRA_OEMAKE="BUILDTAGS=''"
>
> -inherit goarch
> +do_configure[noexec] = "1"
>
>  do_compile() {
>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


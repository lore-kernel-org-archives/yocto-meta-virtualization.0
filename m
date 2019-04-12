Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5E49E00B1B; Fri, 12 Apr 2019 07:52:58 -0700 (PDT)
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
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AFC3E00994
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2019 07:52:57 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id h18so7696710lfj.11
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2019 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jp6Pd+gYVVG/ZY+Sed2Ugiyw06lZ3Tn+WksOtD0s070=;
	b=vVz3V4e92ymTgzMaJ85cE2F1WCrVRNQNhx2zaIhSymTHd8O5lg/iHoKI1lWhBHr5DD
	sXvz9xbcrJOPhNwgrpwGdmAOJlN6ibZjboat7ci+LumTwxZPUyuZMPePYQlDFCU2xIGV
	K/gmif/H7dGThCmUGLwoaco+zWYHPjSvNxATgp/W2CfZVfNppXMEKEyjo1/qAexAN9nd
	NCvAnyxKXcwc1/tc5+sB24N5eIQw0Hh/rMFhtLixrDF+QQVag5Nl+CxmCLCmxj6NtDPc
	KX6hp5rh80Myet5lB3oCfH7YQXLjG8iQHqeN9Le8XfsPZaUiJAeft3EgMk5jhJI+3qLQ
	tFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jp6Pd+gYVVG/ZY+Sed2Ugiyw06lZ3Tn+WksOtD0s070=;
	b=PRDwRRfG8Vwbs/y/0rMw3c2xlRlXn9LyIu8NsTPGhOXTmerCZtp7Jxy4mHQzwvd++7
	mHzxEmDv2y64ld+9BOi5rCYfPoUkuXKN1cpYA5ghnf7V4cTRIgDAuQPF0dyw7aL1QWxH
	pxPcYy1hGOwANHToKQXB1LRzPdvLZxEm9uykZ86sOMrKSQ4Ohd/CEf5kyqxFNOVBMYtb
	9hz9ktw+xw3HG/1D7dI6JRAlZ7Yjws4Wvx84DB4IZcU7qHxlRS1TalMF0oKQI9wf4EUW
	YNTIoWjgN8XQB/Lh4yf9s3sl3QHSczHQRDtMBbbMM/MB6KxocuvHkX+W8DyUpgegRKW8
	la0w==
X-Gm-Message-State: APjAAAXmQ6iTivtm3Spab7M0GB+YF5xUd4spp9Ypr7tNdHTtx4+dIPmK
	/TuMqYFc/pMU3JuEbDmP5yg3Tq2nnaNwqdSJbMg=
X-Google-Smtp-Source: APXvYqzRZb6NrwPRoncDXvckZU4dDfyW050dzwu7kmxgSJVXseZEDCFQAyaQfmT2wIVSvfBPYkUo1IhZCU4J0VzYzIA=
X-Received: by 2002:a19:e619:: with SMTP id d25mr2829240lfh.66.1555080776100; 
	Fri, 12 Apr 2019 07:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <1555035605-5127-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1555035605-5127-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Apr 2019 10:52:45 -0400
Message-ID: <CADkTA4M0JTvtxE9PgbvqBLiUBTsiqgyoj-r=b8mViZZKRnkWjA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] cri-o: fixup build
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
X-List-Received-Date: Fri, 12 Apr 2019 14:52:58 -0000
Content-Type: text/plain; charset="UTF-8"

Looks sane to me, and I was able to build it here.

Merged.

Bruce

On Thu, Apr 11, 2019 at 10:20 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> After oe-core commits
>
> 5f48939e2640 [goarch.bbclass: use MACHINEOVERRIDES and simplify go_map_arm()]
> 6300c4a83f7c [go.bbclass:Export more GO* environment variables]
>
> we see a build failure with cri-o:
>   | go build runtime/cgo: attempting to install package runtime/cgo into read-only GOROOT
>   | Makefile:112: recipe for target 'conmon/config.h' failed
>   | make: *** [conmon/config.h] Error 1
>
> to avoid this we should not overwrite the GO* environment being setup
> by the go.bbclass, so we drop most of our GO* exports here.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 19 -------------------
>  1 file changed, 19 deletions(-)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
> index 2af3c12..cac5536 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -53,18 +53,8 @@ inherit pkgconfig
>  EXTRA_OEMAKE="BUILDTAGS=''"
>
>  do_compile() {
> -       export GOARCH="${TARGET_GOARCH}"
> -       export GOROOT="${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>         export GOPATH="${S}/src/import:${S}/src/import/vendor"
>
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CFLAGS=""
> -       export LDFLAGS=""
> -       export CGO_CFLAGS="${BUILDSDK_CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -
>         # link fixups for compilation
>         rm -f ${S}/src/import/vendor/src
>         ln -sf ./ ${S}/src/import/vendor/src
> @@ -82,15 +72,6 @@ do_compile() {
>         ln -sf ../../../../version ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/version
>         ln -sf ../../../../lib ${S}/src/import/vendor/github.com/kubernetes-sigs/cri-o/lib
>
> -       export GOPATH="${S}/src/import/.gopath:${S}/src/import/vendor:${STAGING_DIR_TARGET}/${prefix}/local/go"
> -       export GOROOT="${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_SYS}/go"
> -
> -       # Pass the needed cflags/ldflags so that cgo
> -       # can find the needed headers files and libraries
> -       export CGO_ENABLED="1"
> -       export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -       export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
> -
>         cd ${S}/src/import
>
>         oe_runmake binaries
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


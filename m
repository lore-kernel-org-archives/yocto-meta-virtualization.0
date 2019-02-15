Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE913E00C93; Fri, 15 Feb 2019 07:19:00 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.172 listed in list.dnswl.org]
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56244E00C43
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 07:18:59 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id v16so8637431ljg.13
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Feb 2019 07:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v2rWX5QMJJOUt46hjCa6GOpHxkO/JVrnvhPX0PM87TI=;
	b=W+qelHudwca6e0dl1s3hzx/paiezf6TLJ8vGVx0HZONxeKEKswXfb1VN3PpGmOyRWz
	WiarsTZZ21lhL2enSQn/0w+A3igogEsWljGJr/EffhuQMqkgee44E6TBt+jFKNDLkHDg
	KK8nDsXoPHifrw7sgK7ob2jdu409klnikKNWkdnuZW/8/tc1wSnTbMfoXO8divHbQ0ba
	ladnlLVqR/tAClh58zi180QoCnhTDJt2BgfkuTQtds8t8R2NwR4fPHrBNxGTLedHiA2g
	yXmSTcX8OqVkFpCNZmICMC0j+OxLH8P8VQMEqwoOYgoAMeHUxmriJg8yl/W1FBuFpy+5
	RVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v2rWX5QMJJOUt46hjCa6GOpHxkO/JVrnvhPX0PM87TI=;
	b=lbbsOGiCcugBlAOQ8+c1dPDUlEldXR3czSkrAiSoVS1tXLLWn4jkpZbY3Rz+zGayGK
	jlzdPk1VKIuOn9oLZBX/RR8pDHqa9NGbRW4vm4FdRpomd9FKkW39hvNiM/dm3E3BioB8
	FDzxMDH+cl1y+P89clddXIaJ3qhB5MaP4BN+9DNroWT5rxQtbnbP+S53PveM0Xam1vYw
	t0CLJ+Qn3Td1KI0HmdUs+g0wLxPJrkg1f3S5uvza/QvyUkkWQi+J6psxJQa0q22InGG3
	5+n3UXH2Th7sKrVOZjzBSU9sjBN3LU/1PiRGEz0wBxGGncjyI0XWxMm5mDvC4asjyRdQ
	8r4w==
X-Gm-Message-State: AHQUAuYCAbHOGnJQCPpFJDLuhm8In0bTD+lBelKWM1r+OquRaptOUUpX
	cPg6v42qZPwGkWjpGcAIlC+iGZDShdKeog1Mf3kDVdky2K0=
X-Google-Smtp-Source: AHgI3IaP0QzZTyfpkLYoxoyDa4/BRsKJykdmxYhpWmYDXLjX8Y/AB/2tKIRwNwTohMD4XKaUVVheHHTRKzdq4XtvxTM=
X-Received: by 2002:a2e:8554:: with SMTP id
	u20-v6mr5947669ljj.193.1550243937997; 
	Fri, 15 Feb 2019 07:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20190215145613.11794-1-stefan@agner.ch>
In-Reply-To: <20190215145613.11794-1-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Feb 2019 10:18:46 -0500
Message-ID: <CADkTA4NvJxAFpLgZRjaFA3jbQ7csyj-6w0QpB0+ffMMhkSx+7g@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 1/2] containerd: update to v1.2.4
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
X-List-Received-Date: Fri, 15 Feb 2019 15:19:00 -0000
Content-Type: text/plain; charset="UTF-8"

I've already got this one queued, I'm doing some extra testing and
expect to push it next week.

Bruce

On Fri, Feb 15, 2019 at 9:56 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Update containerd to the latest release of the 1.2.x branch. We have
> to tweak the go compile patch, but otherwise, the build is unchanged.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  .../containerd/containerd-opencontainers_git.bb             |  4 ++--
>  .../files/0001-build-use-oe-provided-GO-and-flags.patch     | 13 +++++++------
>  2 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 7755f7d..f7d8645 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -1,4 +1,4 @@
> -SRCREV = "0190e5f3900227fc739afbc8f4a03df968dc337b"
> +SRCREV = "e6b3f5632f50dbc4e9cb6288d911bf4f5e95b18e"
>  SRC_URI = "git://github.com/containerd/containerd;nobranch=1 \
>             file://0001-build-use-oe-provided-GO-and-flags.patch \
>            "
> @@ -7,7 +7,7 @@ include containerd.inc
>
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>
> -CONTAINERD_VERSION = "v1.2.0"
> +CONTAINERD_VERSION = "v1.2.4"
>
>  PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
> diff --git a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> index c2433f1..f6b6a11 100644
> --- a/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> +++ b/recipes-containers/containerd/files/0001-build-use-oe-provided-GO-and-flags.patch
> @@ -1,6 +1,6 @@
> -From 408e8b526d490af817a64b7220e8e2c3789de58f Mon Sep 17 00:00:00 2001
> -From: Bruce Ashfield <bruce.ashfield@gmail.com>
> -Date: Sun, 10 Feb 2019 23:46:06 +0000
> +From 6e76a23b831c1c8d39e14afe7ef1368eacaa778a Mon Sep 17 00:00:00 2001
> +From: Stefan Agner <stefan.agner@toradex.com>
> +Date: Fri, 15 Feb 2019 13:37:19 +0000
>  Subject: [PATCH] build: use oe provided GO and flags
>
>  We want to use the go compiler as defined in the oe-enviroment, not the
> @@ -8,6 +8,7 @@ generic call to 'go'. Without changing this, we'll get things like cgo
>  errors and invalid flag combos.
>
>  Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>  ---
>   Makefile | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> @@ -20,8 +21,8 @@ index 8e680133..fd7d2813 100644
>   # Build a binary from a cmd.
>   bin/%: cmd/% FORCE
>         @echo "$(WHALE) $@${BINARY_SUFFIX}"
> --      @go build ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> -+      @$(GO) build ${GO_BUILD_FLAGS} ${DEBUG_GO_GCFLAGS} ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> +-      @go build ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
> ++      @$(GO) build ${GO_GCFLAGS} ${GO_BUILD_FLAGS} -o $@${BINARY_SUFFIX} ${GO_LDFLAGS} ${GO_TAGS}  ./$<
>
>   bin/containerd-shim: cmd/containerd-shim FORCE # set !cgo and omit pie for a static shim build: https://github.com/golang/go/issues/17789#issuecomment-258542220
>         @echo "$(WHALE) bin/containerd-shim"
> @@ -41,5 +42,5 @@ index 8e680133..fd7d2813 100644
>   binaries: $(BINARIES) ## build binaries
>         @echo "$(WHALE) $@"
>  --
> -2.19.1
> +2.13.6
>
> --
> 2.13.6
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C44CE00DA7; Tue,  3 Sep 2019 13:01:41 -0700 (PDT)
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
	*      [209.85.167.47 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 399B5E00D35
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 13:01:40 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id x80so2815460lff.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ITRGNh5k1AGRuPFtiqXzBYHTU6enogugbCAhjJrKmXU=;
	b=uefNJ5k2wmLIzSwcSpQKjUyZzZcBKTCCEuYzaGs3G/DqIUS23wtyt4eAk9BeXeEqvs
	YM385vgFjitOUfaw50lrLs7X2Y6eQcofjJu+x+8ystWr1k1si7Jld3L6NuUPkIZCuy8s
	GUOYBKdx+39sKfsnMRez+PZE1W5MPv8781wpFUNF2tm7ST6uPmgcGCPx130X7uuEhaQK
	JqSZAqIpFDXTpbznKrzXjjqEJiI9wWnHns1yVxe9My/FQSleMJTFDUuCYB5b/SmHITg3
	XJisot1Mhz1I6FrZ/3SeiuwsEiIUFTrEoygmbQaaSsoDJUWJ9NBBiuwH0VGOrLnb8YAC
	8aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ITRGNh5k1AGRuPFtiqXzBYHTU6enogugbCAhjJrKmXU=;
	b=UWAbNZMBMBEqAIbOv5ZN8ri4mKk0uhP9oKd/UTQDndCmGwCDw2B8CYRXL96BybRP7m
	/yA0iYX2g1PO5yC8KlCvZUYxk886QEnly7T223uKLrTQRNM1jfOwUavgcHHx+ZtR3aK3
	ODXkBFGoB9heh3Z07t0Vq3/bTMLZif0I1fDaum6gHCab6PHC5xEptgnqN3cVT4lKFSo0
	NClrh8x9t1ElgDevilKl5BIJEtIIFScW/MIxCc1r0YxeR6/ka4yFJMlIoUxNG8zMqIoA
	ptMScBhqwc/ziM1rVn+Q1V/PB/MYiyMKxGTf9j5ADTr9OkCqpoYKo1FqvT9ghbG42bHk
	lVEA==
X-Gm-Message-State: APjAAAXb5Ih9b8/wnXQm9hOmAkOYyND9SwgeR4JD2KRlW2sg9SOFDL5m
	KzE9CI0NvwvUqYwkLtjrb0b3+X6AK5aZyjuNcMU=
X-Google-Smtp-Source: APXvYqzcwpnkVISG44uV0eCSayy+GCd8z3vwqMglK+WOfPb8Vb8ONbnwpytvkgzw7fZs7+uc2bPzCK4GZYLNO7QFZzM=
X-Received: by 2002:a19:428f:: with SMTP id
	p137mr22056111lfa.149.1567540899023; 
	Tue, 03 Sep 2019 13:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <1567413409-22401-1-git-send-email-hongxu.jia@windriver.com>
	<1567413409-22401-2-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1567413409-22401-2-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 16:01:28 -0400
Message-ID: <CADkTA4O4aPWFASJ29xQTgWEt-jRc8s8HKxh4CTk6TUbvQArMeg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/2] containerd-opencontainers: building unstripped binaries
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
X-List-Received-Date: Tue, 03 Sep 2019 20:01:41 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Sep 2, 2019 at 4:37 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> It defaults to "-s -w" [1] which strips debug information, refresh a backported
> patch to build unstripped binaries
>
> https://golang.org/cmd/link/
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../0001-Add-build-option-GODEBUG-1.patch          | 42 ++++++++++++++++++++++
>  .../containerd/containerd-opencontainers_git.bb    |  3 ++
>  2 files changed, 45 insertions(+)
>  create mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> new file mode 100644
> index 0000000..05c4f15
> --- /dev/null
> +++ b/recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
> @@ -0,0 +1,42 @@
> +From 84874e47aa2025b8e73df0286c44f3b8a1d9fdb2 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 2 Sep 2019 16:20:07 +0800
> +Subject: [PATCH] Add build option "GODEBUG=1"
> +
> +Make will generate GDB friendly binary with this build option.
> +
> +Signed-off-by: Hui Zhu <teawater@hyper.sh>
> +
> +Upstream-Status: Backport [c5a0c7f491b435e4eb45972903b00e2d8ed46495]
> +
> +Partly backport and refresh to v1.2.7
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/import/Makefile | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index 4355395..4fb5d3b 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -75,11 +75,15 @@ TEST_REQUIRES_ROOT_PACKAGES=$(filter \
> + COMMANDS=ctr containerd containerd-stress
> + MANPAGES=ctr.1 containerd.1 containerd-config.1 containerd-config.toml.5
> +
> ++ifndef GODEBUG
> ++   EXTRA_LDFLAGS += -s -w
> ++endif
> ++
> + # Build tags seccomp and apparmor are needed by CRI plugin.
> + BUILDTAGS ?= seccomp apparmor
> + GO_TAGS=$(if $(BUILDTAGS),-tags "$(BUILDTAGS)",)
> +-GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
> +-SHIM_GO_LDFLAGS=-ldflags '-s -w -X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static"'
> ++GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) $(EXTRA_LDFLAGS)'
> ++SHIM_GO_LDFLAGS=-ldflags '-X $(PKG)/version.Version=$(VERSION) -X $(PKG)/version.Revision=$(REVISION) -X $(PKG)/version.Package=$(PACKAGE) -extldflags "-static" $(EXTRA_LDFLAGS)'
> +
> + #Replaces ":" (*nix), ";" (windows) with newline for easy parsing
> + GOPATHS=$(shell echo ${GOPATH} | tr ":" "\n" | tr ";" "\n")
> +--
> +2.7.4
> +
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 424de74..347eae5 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -1,6 +1,7 @@
>  SRCREV = "fd103cb716352c7e19768e4fed057f71d68902a0"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.2 \
>             file://0001-build-use-oe-provided-GO-and-flags.patch \
> +           file://0001-Add-build-option-GODEBUG-1.patch \
>            "
>
>  include containerd.inc
> @@ -9,5 +10,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d
>
>  CONTAINERD_VERSION = "v1.2.7"
>
> +EXTRA_OEMAKE += "GODEBUG=1"
> +
>  PROVIDES += "virtual/containerd"
>  RPROVIDES_${PN} = "virtual/containerd"
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


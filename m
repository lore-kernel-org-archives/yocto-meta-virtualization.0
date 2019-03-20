Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 077CEE00C43; Wed, 20 Mar 2019 11:44:05 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 384BBE00BC8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:44:04 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id u68so2685342lff.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FnAZAToWsQpx0KF1CMkzPb4OT7Qiio0MgBCElWMhai0=;
	b=vRpl1XRwU8JMDr17L24PD2LaAEPNM/oB1yBpPrZbaDelihbIsSI0OPaD5m5bzftj+A
	bGriVJ5/FM/78Q9ltFCYrFRqk6Obp9mJFdusHNeLMvsXpfFIYTb9UlU4rYhcqnfDEHOG
	U9JZ+JJk6vwYCipS6own38g4Q2xa1g6QT7OUh/xf7YNuUp9B6mCkQT2lvBxNUG3LQIPV
	xV1bJVKGdMmIeWys4EP3pRGqmr8BsO20GUt0z4aYC0cNgjQtwth4wtEAu+67KOsTNgQw
	hsfIK1E23vLU2K7TsS7sat1RL5oq8InOuJnABMzYCSUNMZmbY1y37jKsD8A0anxXU/5K
	lxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FnAZAToWsQpx0KF1CMkzPb4OT7Qiio0MgBCElWMhai0=;
	b=k2GmpWivdNH59hBVFaQLxSILzLu1F6moO4daqO0KvorIgw7frhX23cduSsi9qeTIur
	in6mvjZ2mXHqCU/1XYsrMKP8ebrqWXduFY/p8RfPLQZjhMOV7Lg/dCikx0WhaF4EA61x
	DBh56EqIsyDA+2zTFKvKCPmi2n7pJG1OAQhd7EJR6qNwIYZFl6CGVbnDk2oc/84e71IL
	hcHBbK92lEmQmNTJz7pW0keYKw2C2ychQBJxdOEPm7r+Lm3r1TmLHIddpYJdsNa0cCFr
	0Ix2X6kzmFAUdJIQi4MbeXA2UCRf3Wfib9iXSUvx8ZXlDGwCMxZ7t17sJ+yI2o9EJI4v
	5qng==
X-Gm-Message-State: APjAAAXhlrewpVXrVGAX+L4j2Mq2wURU7bAAHFXKB/xWdPEDxBWk/brO
	tcdNcs0taAiZqbKeB2RGvTrkkN5Ai6vvfY7tt5E=
X-Google-Smtp-Source: APXvYqxb91luE8P5SZGVx4RbUhyWJwtdXHP/yXbE3OfEL+vOOFuyJxz/eEEpoqnz0g2QWTBQlEszEc0u4CR51xmRXgA=
X-Received: by 2002:ac2:4554:: with SMTP id j20mr4468083lfm.112.1553107443142; 
	Wed, 20 Mar 2019 11:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190320063426.82963-1-hongzhi.song@windriver.com>
In-Reply-To: <20190320063426.82963-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Mar 2019 14:43:52 -0400
Message-ID: <CADkTA4P67woZSJwwnHL02SUL160V7ug2TBLVp1iHx+sGQptVxw@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] irqbalance: uprev to v1.5.0
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
X-List-Received-Date: Wed, 20 Mar 2019 18:44:05 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Mar 20, 2019 at 2:34 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  .../irqbalance/fix-configure-libcap-ng.patch  | 29 -------------------
>  ...rqbalance_1.4.0.bb => irqbalance_1.5.0.bb} |  5 ++--
>  2 files changed, 2 insertions(+), 32 deletions(-)
>  delete mode 100644 recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
>  rename recipes-extended/irqbalance/{irqbalance_1.4.0.bb => irqbalance_1.5.0.bb} (64%)
>
> diff --git a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> deleted file mode 100644
> index fb22d7a..0000000
> --- a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 20a1b2ff2e6d80924824983c363c80f66e05c0d0 Mon Sep 17 00:00:00 2001
> -From: Ming Liu <ming.liu@windriver.com>
> -Date: Sun, 6 Sep 2015 14:43:24 +0800
> -Subject: [PATCH] grasp withval for libcap-ng
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Ming Liu <ming.liu@windriver.com>
> -
> ----
> - configure.ac | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 38a1bee..95f1488 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -62,7 +62,10 @@ AS_IF(
> - ])
> -
> - AC_ARG_WITH([libcap-ng],
> --  AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@]))
> -+  [AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@])],
> -+  [libcap_ng=$withval],
> -+  [libcap_ng=$withval]
> -+)
> -
> - AS_IF(
> -   [test "x$libcap_ng" != "xno"],
> diff --git a/recipes-extended/irqbalance/irqbalance_1.4.0.bb b/recipes-extended/irqbalance/irqbalance_1.5.0.bb
> similarity index 64%
> rename from recipes-extended/irqbalance/irqbalance_1.4.0.bb
> rename to recipes-extended/irqbalance/irqbalance_1.5.0.bb
> index 1aee7ca..f73b106 100644
> --- a/recipes-extended/irqbalance/irqbalance_1.4.0.bb
> +++ b/recipes-extended/irqbalance/irqbalance_1.5.0.bb
> @@ -4,12 +4,11 @@
>
>  require irqbalance.inc
>
> -SRC_URI[md5sum] = "26ee6db57c4509737e541e98773a39f5"
> -SRC_URI[sha256sum] = "62de71510a2496fcf027efb0b288dd48e53e9efc931fa573c95580cad6264d07"
> +SRC_URI[md5sum] = "3daa34066d28e2ff44fdac9c39952822"
> +SRC_URI[sha256sum] = "3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b"
>
>  SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
>             file://add-initscript.patch \
>             file://irqbalance-Add-status-and-reload-commands.patch \
> -           file://fix-configure-libcap-ng.patch \
>             file://irqbalanced.service \
>            "
> --
> 2.17.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


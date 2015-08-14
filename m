Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 29EB2E00A3C; Thu, 13 Aug 2015 20:43:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f174.google.com (mail-yk0-f174.google.com
	[209.85.160.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7136DE00767
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:43:17 -0700 (PDT)
Received: by ykdt205 with SMTP id t205so59252713ykd.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MyD9oHxujtrCqSfcf7g7jVFLrfAC18K0Wc+62m4aUg4=;
	b=FTi298sqF1tXaz0scvlm4c50C9cM5r1Esm9CRKDdIVrxB4p1P8kXMu+ZLdaCKDkpIJ
	2OpIY5SFbFqKriL/xsTbYRcyZgxBs+plETS04BhjDy7NOQMvpdYs7Lq22e/ddzq9Ti9l
	SfRDSMBWn6jrtFfrENugZHD4rkYBEiuG3fm0We6LbBGerDtmcqXRbfeMEa6ljXAMfN0q
	LBdrSFMHiosVlOoLHpptAhBdaRQMt2cyYTY8x2NfBuPbN9HEEtGp84Nr8Lde1VGzLD9f
	MmBxjCsZgdD61MMg3wExt2cKQ84iOk9in/becg44qLFJVy43V9z9lakjG4psIbB72N0+
	c4Hg==
MIME-Version: 1.0
X-Received: by 10.170.88.130 with SMTP id f124mr8908467yka.21.1439523797141;
	Thu, 13 Aug 2015 20:43:17 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Thu, 13 Aug 2015 20:43:17 -0700 (PDT)
In-Reply-To: <1439477944-17425-1-git-send-email-Jim.Somerville@windriver.com>
References: <1439477944-17425-1-git-send-email-Jim.Somerville@windriver.com>
Date: Thu, 13 Aug 2015 23:43:17 -0400
Message-ID: <CADkTA4OTa0-CJsLDR26xtfHMM63B7DBuED_=_23fZN2h0z2qKw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jim Somerville <Jim.Somerville@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: doc: fix broken manpage build
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
X-List-Received-Date: Fri, 14 Aug 2015 03:43:21 -0000
Content-Type: text/plain; charset=UTF-8

merged

Bruce

On Thu, Aug 13, 2015 at 10:59 AM, Jim Somerville
<Jim.Somerville@windriver.com> wrote:
> docbook2man fails to build the man pages in poky
> due to missing the ancient Davenport 3.0 DTD.
> Poky meta has the Oasis 3.1 version so upgrade
> to use that instead.
>
> Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> ---
>  .../lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch   | 32 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_1.1.2.bb                |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch b/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch
> new file mode 100644
> index 0000000..5f9d771
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch
> @@ -0,0 +1,32 @@
> +From 4cf207ffd64c6f815e62ecbbf25b5a378e707182 Mon Sep 17 00:00:00 2001
> +Message-Id: <4cf207ffd64c6f815e62ecbbf25b5a378e707182.1439319694.git.Jim.Somerville@windriver.com>
> +From: Jim Somerville <Jim.Somerville@windriver.com>
> +Date: Tue, 11 Aug 2015 14:05:00 -0400
> +Subject: [PATCH 1/1] lxc: doc: upgrade to use docbook 3.1 DTD
> +
> +docbook2man fails to build the man pages in poky
> +due to missing the ancient Davenport 3.0 DTD.
> +Poky meta has the Oasis 3.1 version so upgrade
> +to use that instead.
> +
> +Signed-off-by: Jim Somerville <Jim.Somerville@windriver.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4972803..2e67b5e 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -179,7 +179,7 @@ AM_CONDITIONAL([ENABLE_DOCBOOK], [test "x$db2xman" != "x"])
> + AM_CONDITIONAL([USE_DOCBOOK2X], [test "x$db2xman" != "xdocbook2man"])
> +
> + if test "x$db2xman" = "xdocbook2man"; then
> +-      docdtd="\"-//Davenport//DTD DocBook V3.0//EN\""
> ++      docdtd="\"-//OASIS//DTD DocBook V3.1//EN\""
> + else
> +       docdtd="\"-//OASIS//DTD DocBook XML\" \"http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd\""
> + fi
> +--
> +1.8.3.2
> +
> diff --git a/recipes-containers/lxc/lxc_1.1.2.bb b/recipes-containers/lxc/lxc_1.1.2.bb
> index 77d226b..7bbae88 100644
> --- a/recipes-containers/lxc/lxc_1.1.2.bb
> +++ b/recipes-containers/lxc/lxc_1.1.2.bb
> @@ -33,6 +33,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-busybox-add-OpenSSH-support.patch \
>         file://make-some-OpenSSH-tools-optional.patch \
>         file://Generate-lxc-restore-net-properly.patch \
> +       file://lxc-doc-upgrade-to-use-docbook-3.1-DTD.patch \
>         "
>
>  SRC_URI[md5sum] = "3ebadacf5fe8bfe689fd7a09812b682c"
> --
> 1.8.3.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69D8DE00B66; Thu, 12 Apr 2018 13:01:31 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B05E8E00873
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 13:01:29 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id e5-v6so9457132lfb.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 12 Apr 2018 13:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ji/ongQs8ms64TD/F93oGOEcIGiLTbJ+eXMvHva5BeA=;
	b=Vs9LhZ2qjeIIoOYl2SVz2Vu7/8F/3Vk13eYmUrqqHkbPgJU07sQp7eZKRUQUoW4KNX
	PbxrvoRf6IIUeUW7n70YEUB1yBnSzP51vvJDvQN0cp9xA4IKD+XOhBWFpjLBWS+hDm2Q
	bQwdBmBZHALZmt1NlUB1HKjkTOtT85ILbl8YJs8oKIXi5EnJOL2+HBtAMdScQ1iX0LNX
	IZz7wMJIIU0IU6M6JC+JeQtP263m1VmgeZrCajERxIZhkOmTIpaEOibnKdugY7qsIvKm
	sVZKvNytzJ3dPPnFRwQtM1B4yoXW+58YuVWnI4df2CM5xqlkXKor2SVXYTSacHurwCqd
	aaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ji/ongQs8ms64TD/F93oGOEcIGiLTbJ+eXMvHva5BeA=;
	b=HYZ+QAkCKtE7PLKBc6C2Jwz+LlQhy0yvTxw1iZMo7nqw6ZqajsPq1ouh4DZEORNMG/
	/BymjM9PvN4qhBRxWtnWS/i4gGSXsEKaSMW2ERsjvEbsUWp1+XhCVnDM/3Cf1O2Tq3+i
	c6f4dVeLuWPNA8o87aUmw5i2em9+SdxpXr4fLyH4Jz/pn2S8S9hA4Whfbw/tgthgS3iB
	2naE42TbIh9/CzdRY+JsJc4uZRZBnA9xz9x6rkts2x/zPL419rHoUlfcNwVCe3FDjKPt
	UPAC9yoxxxnZApSkp01KLuCXzFVDJiTx0rIjfZmLDdk8Vi6QxI7VU1auKrCjPS48uVs/
	CagA==
X-Gm-Message-State: ALQs6tBO/Pw8OcJJYYtdna6EfX6lyFt+EfcMJR3xJeJytkzg/6u+dnRZ
	+NJJkWM5BvcVP69DcR7awSxcb5rfjnIxpBKu+ss=
X-Google-Smtp-Source: AIpwx48LONHQnNtqfHP1mSy7bewwFGYy/6UhXGtMcIWLpq5k8fC51ecBbQ+EXsVbiSD39cindMOUFGU9QchUO2dPRwg=
X-Received: by 2002:a19:d78a:: with SMTP id
	q10-v6mr6282857lfi.94.1523563287652; 
	Thu, 12 Apr 2018 13:01:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 12 Apr 2018 13:01:27 -0700 (PDT)
In-Reply-To: <1523413748-2138-1-git-send-email-yi.zhao@windriver.com>
References: <1523413748-2138-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 12 Apr 2018 16:01:27 -0400
Message-ID: <CADkTA4PDP2DRfJ0EQqa9WGntFdH5BuFCXf6ik51jtP7DeeayTg@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] irqbalance: refresh patches to fix QA warning
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
X-List-Received-Date: Thu, 12 Apr 2018 20:01:31 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Apr 10, 2018 at 10:29 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
> The patches are refreshed with devtool command:
> devtool modify irqbalance
> devtool finish --force-patch-refresh irqbalance meta-virtualization
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../irqbalance/irqbalance/add-initscript.patch          | 17 +++++++++++++----
>  .../irqbalance/irqbalance/fix-configure-libcap-ng.patch | 13 +++++++++----
>  .../irqbalance-Add-status-and-reload-commands.patch     | 10 ++++------
>  3 files changed, 26 insertions(+), 14 deletions(-)
>
> diff --git a/recipes-extended/irqbalance/irqbalance/add-initscript.patch b/recipes-extended/irqbalance/irqbalance/add-initscript.patch
> index 46a75a8..b0e608e 100644
> --- a/recipes-extended/irqbalance/irqbalance/add-initscript.patch
> +++ b/recipes-extended/irqbalance/irqbalance/add-initscript.patch
> @@ -1,14 +1,23 @@
> -irqbalance: add basic init script
> +From 80c45eecc193c6c13430ddeb40b9b0fd1841ceee Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Thu, 14 Mar 2013 23:31:38 -0700
> +Subject: [PATCH] irqbalance: add basic init script
>
>  The upstream irqbalance release package does not contain an
>  init script so we create a basic one here.
>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +
>  ---
> -Index: irqbalance-0.56/irqbalance.init
> -===================================================================
> + irqbalance.init | 35 +++++++++++++++++++++++++++++++++++
> + 1 file changed, 35 insertions(+)
> + create mode 100644 irqbalance.init
> +
> +diff --git a/irqbalance.init b/irqbalance.init
> +new file mode 100644
> +index 0000000..d12d62c
>  --- /dev/null
> -+++ irqbalance-0.56/irqbalance.init
> ++++ b/irqbalance.init
>  @@ -0,0 +1,35 @@
>  +#!/bin/sh
>  +#
> diff --git a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> index 5be5243..fb22d7a 100644
> --- a/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> +++ b/recipes-extended/irqbalance/irqbalance/fix-configure-libcap-ng.patch
> @@ -1,17 +1,22 @@
> +From 20a1b2ff2e6d80924824983c363c80f66e05c0d0 Mon Sep 17 00:00:00 2001
> +From: Ming Liu <ming.liu@windriver.com>
> +Date: Sun, 6 Sep 2015 14:43:24 +0800
>  Subject: [PATCH] grasp withval for libcap-ng
>
>  Upstream-Status: Pending
>
>  Signed-off-by: Ming Liu <ming.liu@windriver.com>
> +
>  ---
> - configure.ac |    5 ++++-
> + configure.ac | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> -diff -urpN a/configure.ac b/configure.ac
> +diff --git a/configure.ac b/configure.ac
> +index 38a1bee..95f1488 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -61,7 +61,10 @@ AS_IF(
> - AM_CONDITIONAL([LOCAL_GLIB], [test "x$local_glib2" = "xyes"])
> +@@ -62,7 +62,10 @@ AS_IF(
> + ])
>
>   AC_ARG_WITH([libcap-ng],
>  -  AS_HELP_STRING([libcap-ng], [Add libcap-ng-support @<:@default=auto@:>@]))
> diff --git a/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch b/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
> index d853d0b..ec01448 100644
> --- a/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
> +++ b/recipes-extended/irqbalance/irqbalance/irqbalance-Add-status-and-reload-commands.patch
> @@ -1,4 +1,4 @@
> -From dc7366896dd5a5bae82be4b11530bc9fdb7cbcdd Mon Sep 17 00:00:00 2001
> +From 9a16da2628cc4fddf37fe0368b4f6424270f0b2d Mon Sep 17 00:00:00 2001
>  From: Yang Shi <yang.shi@windriver.com>
>  Date: Mon, 26 Aug 2013 10:58:02 -0700
>  Subject: [PATCH] irqbalance: Add status and reload commands
> @@ -6,9 +6,10 @@ Subject: [PATCH] irqbalance: Add status and reload commands
>  Add status and reload commands for irqbalanced init script
>
>  Signed-off-by: Yang Shi <yang.shi@windriver.com>
> +
>  ---
> - irqbalance.init |   12 +++++++++---
> - 1 files changed, 9 insertions(+), 3 deletions(-)
> + irqbalance.init | 12 +++++++++---
> + 1 file changed, 9 insertions(+), 3 deletions(-)
>
>  diff --git a/irqbalance.init b/irqbalance.init
>  index d12d62c..f58bf55 100644
> @@ -50,6 +51,3 @@ index d12d62c..f58bf55 100644
>         exit 1
>         ;;
>   esac
> ---
> -1.7.5.4
> -
> --
> 2.7.4
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


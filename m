Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DB018E00CBC; Sun, 24 Mar 2019 20:15:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C669CE00D20
	for <meta-virtualization@yoctoproject.org>;
	Sun, 24 Mar 2019 20:15:26 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id u2so4897407lfd.4
	for <meta-virtualization@yoctoproject.org>;
	Sun, 24 Mar 2019 20:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iUP9rrzedQGHQb2/Smw5BCFHN38EOH6UoTNXpFuvOJM=;
	b=pnQbciiF9IuwMgptDMslHHIp3T4dzsYEzMmVrjxeAFaQi8hRHAHsjbwsgPri5+g/HW
	WP6bTBubaZLbuw43cjMOCg2EXTLnLRZQilPz0lmkoMAjtYDpmkS03IEyMEk1BEwuzMxS
	pPGv1PKo16cYcvP9hxdMH5KhIOOMtetSBBCZG8M1f4MaLdi5/YahhfWluA7+SSxFzOEA
	Jd7vVT4xTduLY/xwKw1r3TC5tTF0nt0mJfMkmpiOAOEOlOse62iWGrpAR9iYc5V+JZJa
	cjM3sxD8KxaIEjQCfBQ9TnnQl+k5lvxrOmqnXXFawE82lLwt74qCyMzv9Z2hHnMR4Vpz
	HK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iUP9rrzedQGHQb2/Smw5BCFHN38EOH6UoTNXpFuvOJM=;
	b=nVB/BNSt97YPyBDAYp6xjQWhY+p/nQyDNRx4JZU+kF6+1La5yNERWidkE5WInQP6pf
	YGvkHuBnuTbS9hCcTdY6vGtO/VkraKv0dQHuBL1vkKtZDA371QNECGxfJ3e2wgSArl1q
	btNRrlQA8EMXtEouysvgMMOq9KuF+Z8KbW44aKpk8PJesJlUSBWXGzMU91rJvvm7tvvq
	wWlsCTK3QNYYwPs+Rrks67ZcLJY5nCzxU2duUImXLeZyOKPxDVaYe9baIZYWSElR5679
	JnT92o6JrdnfxgLywy0q8ftUUQWT8WwPff0zEDgEhHLAD11iXkieWZqzTJb++ZSK2SaF
	oOTA==
X-Gm-Message-State: APjAAAVdwl8rsOTR1SBHyNq3cG84OwZkXGOdo0puxeXW1S8mXU17qmce
	pHD+6n8s5w73y8lO0+wg1UQh98XM/42N+QqzKfqiJ9mi
X-Google-Smtp-Source: APXvYqwkHp7eWVDYpK9Qd7M6+hjblFSc3FcGvASJCPavFniwh7dEb3X+kTrUznmoe0w9lp/E26Bs8AAeJi+EpOg749E=
X-Received: by 2002:ac2:4554:: with SMTP id j20mr10778616lfm.112.1553483725713;
	Sun, 24 Mar 2019 20:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <1553234944-19534-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1553234944-19534-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 24 Mar 2019 23:15:14 -0400
Message-ID: <CADkTA4NueGO78NSf9+Vci3DdNf_q2zB2sWWab5cgvkZfFveRcg@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] criu: upgrade to 3.11
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
X-List-Received-Date: Mon, 25 Mar 2019 03:15:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Mar 22, 2019 at 2:09 AM Dengke Du <dengke.du@windriver.com> wrote:
>
> Remove the following patch, because the 3.11 version already contain it.
>     0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-containers/criu/criu_git.bb                |  5 ++-
>  ...on-t-open-run-criu.kdat-if-doesn-t-exists.patch | 42 ----------------------
>  2 files changed, 2 insertions(+), 45 deletions(-)
>  delete mode 100644 recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 123f6a3..c6981c9 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -13,15 +13,14 @@ EXCLUDE_FROM_WORLD = "1"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
>
> -SRCREV = "c49eab368a68682475c4e693258246e04232e6d2"
> -PV = "3.10+git${SRCPV}"
> +SRCREV = "c74b83cd49c00589c0c0468ba5fe685b67fdbd0a"
> +PV = "3.11+git${SRCPV}"
>
>  SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
>             file://0001-criu-Fix-toolchain-hardcode.patch \
>             file://0002-criu-Skip-documentation-install.patch \
>             file://0001-criu-Change-libraries-install-directory.patch \
>             file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> -           file://0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch \
>            "
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> diff --git a/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch b/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
> deleted file mode 100644
> index 805f799..0000000
> --- a/recipes-containers/criu/files/0001-kdat-Don-t-open-run-criu.kdat-if-doesn-t-exists.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From b9760919eb3f805dd3d2af5692b49cba9c468595 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Mon, 26 Nov 2018 02:39:59 -0500
> -Subject: [PATCH] kdat: Don't open /run/criu.kdat if doesn't exists
> -
> -When CRIU is called for a first time and the /run/criu.kdat file does
> -not exists, the following warning is shown:
> -       Warn  (criu/kerndat.c:847): Can't load /run/criu.kdat
> -
> -This patch is replacing this warning with a more appropriate debug
> -message.
> -       File /run/criu.kdat does not exist
> -
> -Signed-off-by: Radostin Stoyanov <rstoyanov1@gmail.com>
> -Signed-off-by: Andrei Vagin <avagin@virtuozzo.com>
> -
> -Upstream-Status: Backport [https://github.com/checkpoint-restore/criu/commit/868de91a099c00f099d8a41557d660d173f72521]
> -
> -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ----
> - criu/kerndat.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/criu/kerndat.c b/criu/kerndat.c
> -index 8cb5690..9fb475c 100644
> ---- a/criu/kerndat.c
> -+++ b/criu/kerndat.c
> -@@ -789,7 +789,10 @@ static int kerndat_try_load_cache(void)
> -
> -       fd = open(KERNDAT_CACHE_FILE, O_RDONLY);
> -       if (fd < 0) {
> --              pr_warn("Can't load %s\n", KERNDAT_CACHE_FILE);
> -+              if(ENOENT == errno)
> -+                      pr_debug("File %s does not exist\n", KERNDAT_CACHE_FILE);
> -+              else
> -+                      pr_warn("Can't load %s\n", KERNDAT_CACHE_FILE);
> -               return 1;
> -       }
> -
> ---
> -2.8.1
> -
> --
> 2.7.4
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


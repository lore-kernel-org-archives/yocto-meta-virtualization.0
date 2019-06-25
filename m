Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6C2FE00D30; Mon, 24 Jun 2019 21:12:37 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D7CFE00D00
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 21:12:37 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id 131so14753567ljf.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 21:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8aTtBDXEv4xlJMCTfFC06ZHNRZiKQW8XxbtHMHBaneI=;
	b=hAPUVd18WcpOl50GhztswCTZUlhkhc5a8TWJTNvi/JanlSa07MQ97b1R5NX2yhAfHC
	76cahKLX2V1fSCH7VcP9JFIL18O7icOC1BduaWauhBqP3ONZ7ZVBfVT07YO1MEmI6/b0
	sXGw3u4tOh6j6XSFyYKBSj6LJ+BpsUV45btOvLAXjD5D+lyhpP0VvbVR3b3FUYyCagnv
	YclktLYotwpRWDNBJYwvhiTAGpotXIvMZnraWCIrBMfxcQFx8YaVqbj7okczIFe5g63E
	MegY1DHHWjRup5eutmFyKZIKT98NuELmL/NVABRAChkCx9H+QSVVY5s5UdlAA+9sSB4Q
	xwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8aTtBDXEv4xlJMCTfFC06ZHNRZiKQW8XxbtHMHBaneI=;
	b=dDE63hEwIMjbhX4702e/8QGYzSm/neGZiZGOwtGGFduS6v0Z0b9mO80AJqYOWMOSjY
	2i1g66gwJOYLrf9m+q5atNNNdMZ4/ECELJbQo/c1mrMC0FANOrvmfql1YdFFnkKXTB/N
	1gJzCFvU1yrjfIODy3P93rJ64bYryU7/MWPpLHvXwCwMF09fIrTajkalxm4H3E7GribB
	0fagRYO7S7CJVp2X78ahnVxxXrwQRWsbO6Hok9K91uS7GDZ10T8dbBq3++Q7OyzwlMP2
	9kN10pPkecW3ucouiXZOdmlbsOHeBNcZeMpp02oOE0Mp5Sg3r1i1hSki9X0xV0M+gNYN
	t7xA==
X-Gm-Message-State: APjAAAXanLLRmuRGJrpeahTMZU3/29LRC3KB77EKjWS1rBj+C9yPN4I4
	BGiU5jW1eOSgGEHt3T6BfX5HEVr/HvYj7GAIycQ=
X-Google-Smtp-Source: APXvYqyKVaLi56kWeB+TLbhHsjofkJbW1vQD+II9/nAqzz27Sb2NCSBdP2jGEpBbeLdYyNqc/O6MIjjbGaoSJJ1eA/8=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr33898370ljj.78.1561435956143; 
	Mon, 24 Jun 2019 21:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <1560967216-4994-1-git-send-email-bostancioglucevat@gmail.com>
In-Reply-To: <1560967216-4994-1-git-send-email-bostancioglucevat@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jun 2019 00:12:25 -0400
Message-ID: <CADkTA4Nbb2DAch+uLmGK7dH87Vn1ZYzVK-jb15R7sKh+BDPoUw@mail.gmail.com>
To: Cevat Bostancioglu <bostancioglucevat@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kvmtool: Werror Disabled Patch
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
X-List-Received-Date: Tue, 25 Jun 2019 04:12:37 -0000
Content-Type: text/plain; charset="UTF-8"

merged!

Bruce

On Wed, Jun 19, 2019 at 2:00 PM Cevat Bostancioglu
<bostancioglucevat@gmail.com> wrote:
>
> Couple of compile time warnings(sizeof-pointer-memaccess, format-truncation) turned into errors before with Werror command, this patch disables this feature.
> ---
>  .../files/0003-kvmtool-Werror-disabled.patch       | 24 ++++++++++++++++++++++
>  recipes-extended/kvmtool/kvmtool.bb                |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
>
> diff --git a/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
> new file mode 100644
> index 0000000..4d2f255
> --- /dev/null
> +++ b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
> @@ -0,0 +1,24 @@
> +From 377a09c16003eaa40f7f337127b10728ee0ade35 Mon Sep 17 00:00:00 2001
> +From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> +Date: Wed, 19 Jun 2019 20:36:56 +0300
> +Subject: [PATCH] WERROR override disabled.
> +
> +WERROR override causes gcc sizeof-pointer-memaccess,  format-truncation errors.
> +---
> + Makefile | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/Makefile b/Makefile
> +index 030ff4e..fc5e177 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -2,6 +2,7 @@
> + # Define WERROR=0 to disable -Werror.
> + #
> +
> ++WERROR = 0
> + ifeq ($(strip $(V)),)
> +       E = @echo
> +       Q = @
> +--
> +2.7.4
> diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
> index d487ee2..004e09e 100644
> --- a/recipes-extended/kvmtool/kvmtool.bb
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -14,6 +14,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
>             file://0001-Avoid-pointers-for-address-of-packed-members.patch \
>             file://0001-kvmtool-9p-fixed-compilation-error.patch \
>             file://0002-kvmtool-add-EXTRA_CFLAGS-variable.patch \
> +           file://0003-kvmtool-Werror-disabled.patch \
>             "
>
>  SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
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


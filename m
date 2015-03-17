Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E9C13E00753; Tue, 17 Mar 2015 06:43:28 -0700 (PDT)
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
	*      [209.85.217.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5938E00746
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Mar 2015 06:43:25 -0700 (PDT)
Received: by lbcds1 with SMTP id ds1so7227275lbc.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Mar 2015 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=RkUMWz30csInTbRkfQ584k+kul5mPQon5X6HVV0mTsc=;
	b=f3C1PVewaZNDDVUMuVndchPlxdS+G0C2wpf2QUtgAtbDyKncspCE4brP91p6cQYjQk
	dn8O8DHSH2dzHYv2LlZAnU3ddklSbwktDbl8r2Iw19xRhl/84SP99hLTud0VAkVwY1ua
	LgLCHDXmw4WN/vYioZG+4yK7lpzfBqZuhxm8B6ZGFOSDa/IYvHZPEpEflFz30a1U6tHB
	HsgOhV10Y1hudaqYz6iUmufxxf88MFi9teqZx9QjKoZMCSjUJopE83V7pvD1epgIdjmE
	zzGnqD8hyq+tbsTD0O9whBTsK7slTLQo8mUht55lJgdxMjnqXpH07SmzDgDB/Ufz5HUS
	N2MA==
MIME-Version: 1.0
X-Received: by 10.152.179.42 with SMTP id dd10mr29166980lac.122.1426599803746; 
	Tue, 17 Mar 2015 06:43:23 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 17 Mar 2015 06:43:23 -0700 (PDT)
In-Reply-To: <1426504623-1921-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1426504623-1921-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Tue, 17 Mar 2015 09:43:23 -0400
Message-ID: <CADkTA4Ptv_B=_Mopd_NuX4LoAvKR0YsFE2uMHL52W6RRJgNjPQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: Update support for seccomp on PPC architectures
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
X-List-Received-Date: Tue, 17 Mar 2015 13:43:29 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 16, 2015 at 7:17 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Update the LXC recipe with the upstream-applied version of the patch.

merged.

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  .../files/ppc-add-seccomp-support-for-lxc.patch    | 29 +++++++++++++++-------
>  1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> index 6faf791..1055539 100644
> --- a/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> +++ b/recipes-containers/lxc/files/ppc-add-seccomp-support-for-lxc.patch
> @@ -1,6 +1,6 @@
> -From 29ca2ec418cb496ac8a19f0718a8474a55cfe16d Mon Sep 17 00:00:00 2001
> +From b4067426d58aec9b6cad7a4739793f3d90c5f189 Mon Sep 17 00:00:00 2001
>  From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> -Date: Wed, 4 Feb 2015 11:28:32 +0000
> +Date: Thu, 12 Mar 2015 08:57:47 +0000
>  Subject: [PATCH] seccomp: add ppc support
>
>  This patch enables seccomp support for LXC containers running on PowerPC
> @@ -13,16 +13,21 @@ default seccomp policy example files delivered with the LXC package.
>
>  [1] https://github.com/seccomp/libseccomp/commits/working-ppc64
>
> -Upstream-Status: Pending
> -[https://lists.linuxcontainers.org/pipermail/lxc-devel/2015-March/011437.html]
> +v2:
> +- add #ifdefs in get_new_ctx to fix builds on systems not having SCMP_ARCH_PPC*
> +  defined
> +
> +Upstream-Status: Applied
> +[https://github.com/lxc/lxc/commit/b4067426d58aec9b6cad7a4739793f3d90c5f189]
>
>  Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Acked-by: Serge E. Hallyn <serge.hallyn@ubuntu.com>
>  ---
> - src/lxc/seccomp.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> - 1 file changed, 42 insertions(+)
> + src/lxc/seccomp.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 48 insertions(+)
>
>  diff --git a/src/lxc/seccomp.c b/src/lxc/seccomp.c
> -index 3ba6c9a..0e2310f 100644
> +index 3ba6c9a..108faa0 100644
>  --- a/src/lxc/seccomp.c
>  +++ b/src/lxc/seccomp.c
>  @@ -121,6 +121,9 @@ enum lxc_hostarch_t {
> @@ -48,17 +53,23 @@ index 3ba6c9a..0e2310f 100644
>         return lxc_seccomp_arch_unknown;
>   }
>
> -@@ -150,6 +159,9 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
> +@@ -150,6 +159,15 @@ scmp_filter_ctx get_new_ctx(enum lxc_hostarch_t n_arch, uint32_t default_policy_
>         case lxc_seccomp_arch_i386: arch = SCMP_ARCH_X86; break;
>         case lxc_seccomp_arch_amd64: arch = SCMP_ARCH_X86_64; break;
>         case lxc_seccomp_arch_arm: arch = SCMP_ARCH_ARM; break;
> ++#ifdef SCMP_ARCH_PPC64LE
>  +      case lxc_seccomp_arch_ppc64le: arch = SCMP_ARCH_PPC64LE; break;
> ++#endif
> ++#ifdef SCMP_ARCH_PPC64
>  +      case lxc_seccomp_arch_ppc64: arch = SCMP_ARCH_PPC64; break;
> ++#endif
> ++#ifdef SCMP_ARCH_PPC
>  +      case lxc_seccomp_arch_ppc: arch = SCMP_ARCH_PPC; break;
> ++#endif
>         default: return NULL;
>         }
>
> -@@ -343,6 +355,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
> +@@ -343,6 +361,36 @@ static int parse_config_v2(FILE *f, char *line, struct lxc_conf *conf)
>                                 cur_rule_arch = lxc_seccomp_arch_arm;
>                         }
>   #endif
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


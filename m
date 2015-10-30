Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFCFEE00B58; Fri, 30 Oct 2015 05:38:26 -0700 (PDT)
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
	*      [209.85.160.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E78ACE00B4A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 05:38:25 -0700 (PDT)
Received: by ykek133 with SMTP id k133so74289271yke.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Oct 2015 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aNHRaGkoTrvxuU8ZfyvXlSCBXu+JrRmEzC1iU0fdeY4=;
	b=aizHA7alE3qYi1gof4Lv4vnyVTFqdGPXCWdHsAuR4uBo/JZxNY9YOuKZekm1DBuhpB
	RWQALMQT+gtyFjLyWIHlHMES8ustt4QF6BsunGm+xeTEH8q4h/ZYJSr3iNS0kUTV/EJL
	YridL4KkhC3gP6vOgPQhEU4xX8SGo+sPRrVFMj4Hx4Fy0yNI9RRuzvCO8jD+6H+pO0dO
	dk4Dp5aJMh1y4WWDX1h5pD5kNgOfrMzvUwUMfesGmkPJ7nqL2OUKMtqOFhQhoB7uekJL
	d3gXgOZ+pm6tfO8IoO5CXxBhHSJEO6/SiBSAYSv+t/7uEezwNS8RY7BFZ5lEH4NgfCPR
	co4Q==
MIME-Version: 1.0
X-Received: by 10.129.155.130 with SMTP id s124mr5990843ywg.68.1446208705205; 
	Fri, 30 Oct 2015 05:38:25 -0700 (PDT)
Received: by 10.129.153.142 with HTTP; Fri, 30 Oct 2015 05:38:25 -0700 (PDT)
In-Reply-To: <1445563064-19994-1-git-send-email-rongqing.li@windriver.com>
References: <1445563064-19994-1-git-send-email-rongqing.li@windriver.com>
Date: Fri, 30 Oct 2015 08:38:25 -0400
Message-ID: <CADkTA4ON7VqXEFLLRHSJeBbjzWQ9ZJff_4+o1nzNNibpcu2niQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: rongqing.li@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: upgrade it to 1.1.4
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
X-List-Received-Date: Fri, 30 Oct 2015 12:38:26 -0000
Content-Type: text/plain; charset=UTF-8

sorry for the delay. This is now merged.

Bruce

On Thu, Oct 22, 2015 at 9:17 PM,  <rongqing.li@windriver.com> wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> V1.1.4 includes a fix for CVE-2015-1335:
>
> lxc-start in lxc before 1.0.8 and 1.1.x before 1.1.4 allows local container
> administrators to escape AppArmor confinement via a symlink attack on a (1)
> mount target or (2) bind mount source.
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-1335
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  recipes-containers/lxc/{lxc_1.1.3.bb => lxc_1.1.4.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-containers/lxc/{lxc_1.1.3.bb => lxc_1.1.4.bb} (97%)
>
> diff --git a/recipes-containers/lxc/lxc_1.1.3.bb b/recipes-containers/lxc/lxc_1.1.4.bb
> similarity index 97%
> rename from recipes-containers/lxc/lxc_1.1.3.bb
> rename to recipes-containers/lxc/lxc_1.1.4.bb
> index e61aa6d..4006deb 100644
> --- a/recipes-containers/lxc/lxc_1.1.3.bb
> +++ b/recipes-containers/lxc/lxc_1.1.4.bb
> @@ -36,8 +36,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://logs-optionally-use-base-filenames-to-report-src-fil.patch \
>         "
>
> -SRC_URI[md5sum] = "197abb5a28ab0b689c737eb1951023fb"
> -SRC_URI[sha256sum] = "933b87f773ea6213c912fcd25b8f24d66fb66d285b80797dac530a8b94b7d1ad"
> +SRC_URI[md5sum] = "d33c4bd9c57755c0e2b0e2acbc3f171d"
> +SRC_URI[sha256sum] = "8f072ea2001bc94389003d82a91902855edf16b609e06f0486a74e4b8973e5dc"
>
>  S = "${WORKDIR}/${BPN}-${PV}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


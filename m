Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9CD6E00D59; Sun, 25 Aug 2019 19:16:28 -0700 (PDT)
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
	*      [209.85.167.45 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08DD3E00A93
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:16:27 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id q27so1440162lfo.10
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Aug 2019 19:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CFUvh5tvniwDESkj5z50GjOnLoB/E8StF94dpM9RV8A=;
	b=uPr/5oJzroYyErusL2tDUhprLk48Lhm0EtnuGp4jAuUWMFfiCVm4UNyDhajcGaur3F
	9gegHGwS29sMfO2YbsKGRiWBGlSme3JBhB3gf8KuB8C/4Tn86c/nY6pnEtKGmiCxwqlV
	fB/Fi+NnG0nW6VkFfn3ejWqRHMpZ8ZnUusMZ5zCrRMpqn3z/quzrUIdOHAJpX5Xl/uAA
	V8DCzvfmOmudKS/0SQnPrLyQjyW6ehcSHahSAFsGqtKoeXfzrc/ikhErRo8qZjho3fQo
	Zjdc3gE1nL5n8JlVX9wsDv7ZMaYJQtYRSxXSA+bMwbq74xWvF+XGlV9BAezgZrtrjqS4
	hkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CFUvh5tvniwDESkj5z50GjOnLoB/E8StF94dpM9RV8A=;
	b=ZlqULCaRadsKeMKGNk/bBse8PKTcGMtOTaiERogiNpibqx7ZaMxCC+Hx4gcIEP44wY
	TLapfMKjU/555VtFbj1KLytkAR/wabXrY6K8GsqPL91BRz+DIiRSNv3bHvmCFrxWQZYH
	zz/J6VfV6FHoyE81leWviBhVqQwotN4GkBogteznx+bpcyGVADLiKrLCoEfysgyfiBhZ
	3Qz8ZP4y/UlZTEAHaYyDqnu9wreaEBSV1NKbFi3umtol34oYz8lExTlpDcwxWhfY7trg
	9AWt+PqFVJvdSWx51B0bbGKDbWfTpByrIZEXiF7Gum+U2MC5cFHo+JKe16bBCuwBe6hR
	R3+w==
X-Gm-Message-State: APjAAAUm0beI7KmxeI9GYafI1RnGU2v18DPT/VXPlHpxlKz9CrTdTdS+
	LYsoBwodAIMznZvubnU2WEzCUV0Gv8Q04JtKKz6g0ywD
X-Google-Smtp-Source: APXvYqyGJvjkKJBIpx8ZrvkKCbnT+mNd8KF1MiOC29yhRkG1Q4fHKI0yFCTwJyRA97CroDKaeUcfWaVvl00B4iFB38w=
X-Received: by 2002:a05:6512:50f:: with SMTP id
	o15mr8634116lfb.63.1566785786835; 
	Sun, 25 Aug 2019 19:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190820091934.107475-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190820091934.107475-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 25 Aug 2019 22:16:15 -0400
Message-ID: <CADkTA4Mf0N=qi=eMUt1T6ueMCVx8jzj26vXy5e0Tf2C0CCuiNg@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-manilaclient: upgrade 1.27.0 -> 1.28.0
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
X-List-Received-Date: Mon, 26 Aug 2019 02:16:28 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Aug 20, 2019 at 5:22 AM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-manilaclient_git.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> index f733d56..a64c4d4 100644
> --- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> @@ -33,8 +33,8 @@ RDEPENDS_${PN} +=" \
>  SRCNAME = "manilaclient"
>  SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
>
> -PV = "1.27.0+git${SRCPV}"
> -SRCREV = "07564879ae4bdcb73e856b3aedcb79e4420fa7eb"
> +PV = "1.28.0+git${SRCPV}"
> +SRCREV = "3e3dfb1d5a401fb0e0003c6fab0a41bd3479b7c8"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools rmargparse
> --
> 2.17.1
>
>
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


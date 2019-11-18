Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A1E9AE00E0B; Sun, 17 Nov 2019 19:37:08 -0800 (PST)
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
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4BFEE00E04
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2019 19:37:07 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id f7so12315978edq.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2019 19:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FkA5szg6exxbZSQkNIigk7clBysObZZ9kvlhPwpbk4c=;
	b=TSy5biZ0eBxTnTbcUCyq7hglfqHCF8fqplPRUCcyFtCMCMDFHBLErJsrN9Tb50kTne
	vrl4dUlin8yChGDPs6uURch5Qpq7zv3SbHCuzZ20jhG2W7IUj5UnTIjl/WrPraEjJcTI
	u5UWuqTq78tUymYaPWD5CvJqQ/eqctJqDwmOFSMTrEyV6DBLU1AiZk4DoOtppfXb91QO
	SD05nK2IacQJxtgxFSSMRySC2QWe6/GfNxEIsJP3v+DzY1VP3Q9dNJZM+v/tbvojiy8z
	PJZNsNZ8od/lem/hCUDVHYdwUQPUvmo4kN/EyOAuz39a07peas+1DxJbFLlXhI75jOVp
	qtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FkA5szg6exxbZSQkNIigk7clBysObZZ9kvlhPwpbk4c=;
	b=E3eQzh5qH5ZcoZVBiny1kPS0Ukp5aNJLGC0PXzKJLPQWJ/20M8p1cj+XIBolfxnsYA
	8PQ7sBSC8Js5rL9I23mr6Tp2OHT9HRudH5hgRHnUMfjLNxR7oQiDOH6vD/aRgTqPDLn1
	ddR5UfytrxhALvg3QCWqw25RGFCCBcglBvlpg2ArQLcCyVY6SKwySRCaYdXgGhwZ8T/a
	+wOCgr95mjtWaRzQ7t+ufq0ZMLFlCUQUeDXAxIEhqZ5QBtaXcgxnUKnGdmr7bgzO9TQR
	Cv6SEUPU4k9Lpvt3ZWvAcQDhtKFS9qQgF20Q1HGF2nZlcP2KdUwvjSkSmEs2k2TbCWFE
	zjaQ==
X-Gm-Message-State: APjAAAXh/GLDpXsvplb5t5Hq+JsOjpsZa27ZsReHi95mQhdCMTw1nyhj
	6QJJ8FBHbEA9vLQNG8v3Hwy8lodx0t1jxGuEMPFLN13D
X-Google-Smtp-Source: APXvYqzrimLCBY/hbCyQCyYC6y47zG4+9q3lbf8e0iw05/MKDyl3LTpy+S4v/zDe+1vzjJNRAvGHalZOC70VUTAg+Og=
X-Received: by 2002:a17:906:4a0c:: with SMTP id
	w12mr23570284eju.306.1574048226771; 
	Sun, 17 Nov 2019 19:37:06 -0800 (PST)
MIME-Version: 1.0
References: <c8623b0b-96f2-a3b3-8cd8-8249a2f53455@3mdeb.com>
In-Reply-To: <c8623b0b-96f2-a3b3-8cd8-8249a2f53455@3mdeb.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 17 Nov 2019 22:36:55 -0500
Message-ID: <CADkTA4O4PUuSumcF7gdATc5y4rHwtDYjq0YOhb1UwNyNkSbvmQ@mail.gmail.com>
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>,
	piotr.krol@3mdeb.com
Subject: Re: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub
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
X-List-Received-Date: Mon, 18 Nov 2019 03:37:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 14, 2019 at 9:24 AM Norbert Kaminski
<norbert.kaminski@3mdeb.com> wrote:
>
>  From ea86f97c347f6637d85a6fdbf36943d43adfa18e Mon Sep 17 00:00:00 2001
> From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> Date: Tue, 12 Nov 2019 11:25:29 +0100
> Subject: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub

Maybe: "xen: fix pygrub runtime by adding xen-python to xen-pygrub
RDEPENDS"  as the shortlog ?

>
> The patch fixes a problem with importing the package xen.lowlevel.xc.
> RDEPENDS add the xen-python tool, which contains the package.

Can we expand on this message a bit ?

I assume that something from xen.lowlevel.xc is pulling in pygrub, and
that in turn requires xen-python? What is the actual on-target or boot
issue this then triggers ?

I'm not currently able to do Xen runtime tests (and hence can't see
this for myself), so I'm trying to understand the issue just from the
commit message (and failing at the moment).

Cheers,

Bruce

>
> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> ---
>   recipes-extended/xen/xen.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 628e52b..ba00d2a 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,6 +151,8 @@ RDEPENDS_${PN}-xentrace = "python"
>
>   RDEPENDS_${PN}-xen-watchdog = "bash"
>
> +RDEPENDS_${PN}-pygrub = "${PN}-python"
> +
>   PACKAGES = "\
>       ${PN}-base \
>       ${PN}-blktap \
> --
> 2.17.1
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


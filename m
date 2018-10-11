Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAB49E00A54; Thu, 11 Oct 2018 11:37:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30AE8E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:37:46 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id o14-v6so9176448ljj.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zEtiFeVIhHuVzNRbcd+g/NhBzYIJkbHw9ukmco4xdAM=;
	b=BRk2znt516dZUVzPHtsvARK808qESW/Nju21ULmx8qeKJpu9S3ULFYIfhhkSbNxjBS
	MD3plF2Q31igVUQj//suw5T+nKWBeEz+NeSNM9oby+NoZFnKg8Wmyi4kRiF417fssmM8
	E4TE8hJcOcP3bErmxulkdhKffwKlHbie51LxPkYWl2J6MMSuSfYK30rEhtT9tT9t+SCO
	IjyXM8p9kPAwCx+hYcsqBQWdcG3yzBJm/eLIKS+2PjjLAIk5ZbyYn5Fmym3Sgg1PHXq0
	ncZPU2kT88I8reU+YpWJ8wnTzqEfxNzzCg+ZEbxjfUDz/lq+LVpAKZi1dMI1/qjUpOEI
	9TgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zEtiFeVIhHuVzNRbcd+g/NhBzYIJkbHw9ukmco4xdAM=;
	b=sCW8nwXeBSWjv/kzoQJwiUR/UmpdfZr1uVdHvYj69lNwd14N/9aUHWKaon46rHdMiT
	nU+gkPqlEzpds5MUJNSWSHtl0QbgOhVeaUsamKB0omBRYa+EQS3SM9KES08ttjEw0ubl
	vimxwlnRY0Npu8FLmZ/M9btJAlA6eW9iSm8u55X0i9hyE72PiPut3CPRIy8hd5WDnIOL
	SM9TIn6hYkmabjWhzpHqpV6YJUpN503PSETfHvmVEO0Mqf2xpbPZWkDIcLuCVGAZFE5b
	7g0s7WdU4GDbp7m/iQ5R00DcO3DkjQr7kH+nqz8s6GZ09YpnY2O6Qt5OPEsaLaJZ8dpD
	7J3A==
X-Gm-Message-State: ABuFfohHnCcF1iEEl3ivoK6XBjPjyFjAq7f7C5JkASHzH+SIg6psfFU4
	ou0xlFplQaMNrc9nOlDb45gE4kdhfLBF03zvLZ8=
X-Google-Smtp-Source: ACcGV61PWRmjjlQUnifc4nagTF1ha0IeW0PtljlhO/Hc82s591BMPPdvibMF4ZPLtyNiohL8vsMclvQSOsFb3SuCR14=
X-Received: by 2002:a2e:58e:: with SMTP id
	136-v6mr2071960ljf.130.1539283065100; 
	Thu, 11 Oct 2018 11:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
	<1539154754-137572-3-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539154754-137572-3-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:37:33 -0400
Message-ID: <CADkTA4MAZGWJ6H5WYEXsn3NDyuJtkb51g-B44HQAt57Tx60TcA@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker-distribution: fix do package qa warning [textrel]
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
X-List-Received-Date: Thu, 11 Oct 2018 18:37:47 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Wed, Oct 10, 2018 at 3:00 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. After security flag PIE is enabled by default, we might met
> below QA warning on some arch, like aarch64, fix it by skip
> textrel QA check refer commit b689c72a of oe-core
>
> docker-distribution-v2.6.2-r0 do_package_qa: QA Issue: ELF binary
> 'work/aarch64-poky-linux/docker-distribution/v2.6.2-r0/packages-split/
> docker-registry/usr/sbin/registry' has relocations in .text [textrel]
>
> 2. This problem is caused since security_flags.inc is used by default.
>    so alternative work around is:
>       SECURITY_CFLAGS_pn-docker-distribution = "${SECURITY_NOPIE_CFLAGS}"
>       SECURITY_LDFLAGS_pn-docker-distribution = ""
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/docker-distribution/docker-distribution_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index d4f8098..2892556 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -57,7 +57,7 @@ do_install() {
>  }
>
>  INSANE_SKIP_${PN} += "ldflags already-stripped"
> -INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped"
> +INSANE_SKIP_${MLPREFIX}docker-registry += "ldflags already-stripped textrel"
>
>  FILES_docker-registry = "${sbindir}/*"
>  FILES_docker-registry += "${systemd_unitdir}/system/docker-registry.service"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


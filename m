Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84C47E00BFD; Mon, 26 Mar 2018 11:17:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D505E0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:17:19 -0700 (PDT)
Received: by mail-yw0-f173.google.com with SMTP id z82so6420077ywd.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=3VCc2E4dOaBHyULpeORrPYh94kzNANefqeC5pu5QA98=;
	b=HV7LTTl18zI0p4LGS+v6Da8Qwwc3TO0cUwMb00n0DwqDtqlRHMBXvgjoYTbF72dFNS
	eWPBpIRl9hU93Lmqx3onvQsXuQaMvTWA7wqgiur6i2n3xb12OQGoagxYDOB+TQSTLFiU
	SdrkRaEb3AY3X+tOi6SjuYMoq3e0S3lfNcKx0ya4IvYPMdLkn686ByMakjdtpPiDhujg
	grfqYpe15i0mWm1wCZeC6+tOIcgcaLU05y2SH0cfznjQmuZQ/e8wl8pOicePLd2oIw27
	HdT6r+0wVHnd1VX4ndEvYmSWcqPZiIPGQIo488QmIlNQ+YgB3xOGB+Xc+Vh2JDH6Xv0A
	14KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=3VCc2E4dOaBHyULpeORrPYh94kzNANefqeC5pu5QA98=;
	b=E6bLeWXuplJPdnuoCm8QTkaokCS9r2+vOD1cL/4U23jgau2alQuwZWiAcJ95wubsVf
	TNF7yMySaoDMd1Zwo1MuRavo6WqDmaeHtGgHgthXZwGBBOxF7HJ6cqszL1eVsP3B2Z8g
	veRFZoLTL1vRCHOhw953WZBj12xeJIJcNtKBDDeP4a7IaFKPrYlMfFeu8vOTQQSlTM/J
	5R4LzMxLYfoNHuOqGmV2QZC+YGOyR0fCx/0Q2uFS2shTQxgX1gXyu4u9RJRM1RNMOtqy
	LxebwlSdLM4NBOzKIkwnTAcBpAmBKudEpd0Qg4CldnNCCEUe+bHxrYcvTX72fH3TeGpK
	wrOg==
X-Gm-Message-State: AElRT7HHlft0vU5iMLEjGo07CBiVKMykNSLeY+1erza9Cno5RcVtfgZD
	W4HBV+d8nmaBn4JJ2zyLxPNc8M114OgSKZtEyCO7dw==
X-Google-Smtp-Source: AG47ELs5mV1JRyvMVolJQU5KxEbM8AMXZFqocEr/CDdOeUFOBpooH2zrHGrLyMCZiQU5NxfJ9B3X4iuJQG+a3lsxPuE=
X-Received: by 10.13.226.206 with SMTP id l197mr23999520ywe.490.1522088239331; 
	Mon, 26 Mar 2018 11:17:19 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:17:18
	-0700 (PDT)
In-Reply-To: <1521775736-38102-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:17:18 -0400
X-Google-Sender-Auth: dpLq8yL3RIttk8x2sYTPX7IB440
Message-ID: <CAPuovEJVZFNB458vy3x=EepxVU42_Q3wNb_kShWSALNacZw+HA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-paramiko: 2.4.0 -> 2.4.1
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
X-List-Received-Date: Mon, 26 Mar 2018 18:17:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-paramiko from 2.4.0 to 2.4.1.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce,

This one should be OK.

MarkA

>  .../python/{python-paramiko_2.4.0.bb => python-paramiko_2.4.1.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-paramiko_2.4.0.bb => python-paramiko_2.4.1.bb} (65%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
> similarity index 65%
> rename from meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> rename to meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
> index 45ad5d0..6906c41 100644
> --- a/meta-openstack/recipes-devtools/python/python-paramiko_2.4.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.4.1.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
>
> -SRC_URI[md5sum] = "ed6d085a5e5369817e49cf1315b32eba"
> -SRC_URI[sha256sum] = "486f637f0a33a4792e0e567be37426c287efaa8c4c4a45e3216f9ce7fd70b1fc"
> +SRC_URI[md5sum] = "f9fa1204f706767b6c179effa7c0fb9e"
> +SRC_URI[sha256sum] = "33e36775a6c71790ba7692a73f948b329cf9295a72b0102144b031114bd2a4f3"
>
>  inherit setuptools pypi
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


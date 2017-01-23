Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D52FE00405; Mon, 23 Jan 2017 12:35:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3B3DE003C1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 12:35:09 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id q71so13674028ywg.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 12:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VEORwbU60dMrSeLPxXueRsaqH6TyB6o4Un4zxSBQRm0=;
	b=jqGls2eqxnuRrhG8DcEgRDukV1TQ/6+fahNUbmJC1bvy7t04yuE8w8lR+yj1USS3qk
	9wPEy/EPRKOa/E1ATBtChBTJfBEyioN5OGI4hppoTKvq+LJbpFyVP++LDTzZFbWKPicQ
	DmnzH0kNwPnfBh62dyJx4CnjFZ3KFrVo4KACLQHWAIIww6b9oI5ug62BLo+YlQAmE2Gb
	tbDUw6GXGfzf4u4PF9oMsYWwEeoWO7BLECg5Hiazo+Kjv31QQ1IaXvt215xRg79pOmdW
	vWDDDuJSYU1WEQ5ywaNFhU57ZtTGOkI6M2F5qWB6DMkbs0gLo/ga7Lqdlm1fDjiUwBC7
	Xr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=VEORwbU60dMrSeLPxXueRsaqH6TyB6o4Un4zxSBQRm0=;
	b=acqaywfYzcWWphGxrknmzkBJItz7DmiNSbokockQlrC4SzA5mz8rH4A2g0runNRYPP
	BMFSSNLQAEZXT2nZl1F7zDDaekao2KRL+D8afbdY370oK1HYI/UuF3XDYHqp2MSwveVa
	ZWt8Y2Zly8gOd3E7EcNyNGB2NdUwAJJVUCl9y5Row4RRhr7/VOdsVhldBLaSlqtArDmi
	tEEeHjG4SH2zeqRHyA7SIHa9ZZ+9RqadvyslzaE+m34sy//yd65gVAvFEZ3deIE2+6sj
	8wrS0yuLuaIJ9Yo0lRPixf/VuYb7Ornk3KiXxh4Paq5v5mt74CvTqaBsCp2Kqsk0OxRs
	Ocpw==
X-Gm-Message-State: AIkVDXIvDJ9znn4UF8Ot/daHp6ObMn2hS4BrHXa0E/tS20aXW7owxFO97+P0vgwkaUWoj2cJbQfIxIaxClAEEA==
X-Received: by 10.13.253.71 with SMTP id n68mr23093644ywf.54.1485203708832;
	Mon, 23 Jan 2017 12:35:08 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Mon, 23 Jan 2017 12:35:08 -0800 (PST)
In-Reply-To: <1485183886-6350-1-git-send-email-mark.asselstine@windriver.com>
References: <1485183886-6350-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 23 Jan 2017 15:35:08 -0500
X-Google-Sender-Auth: W4oEdx8Xajy4MncA7_hHzb3_EOo
Message-ID: <CAPuovEKbuk_h79tr5Y3SSRBja2gWWaz4sYjPiwf1eZZGG4d2EA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-oslo.policy: uprev to latest stable/newton
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2017 20:35:11 -0000
Content-Type: text/plain; charset=UTF-8

Typo on the PV, will send a V2.

Mark

On Mon, Jan 23, 2017 at 10:04 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Updated runtime dependency list, otherwise all dependency versions are
> already in place.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
> index 01a9491..8021e5f 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.policy_git.bb
> @@ -5,11 +5,11 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -PV = "0.12.0+git${SRCPV}"
> -SRCREV = "dee7171326e138128486f1d2c3f7e639af875198"
> +PV = "0.14.0+git${SRCPV}"
> +SRCREV = "018c7475c9dd75da0f902bbe3ec5d01855fa50d6"
>
>  SRCNAME = "oslo.policy"
> -SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
> +SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/newton"
>
>  S = "${WORKDIR}/git"
>
> @@ -26,5 +26,6 @@ RDEPENDS_${PN} += " \
>          python-oslo.serialization \
>          python-oslo.utils \
>          python-six \
> +        python-pyyaml \
>          python-requests \
>  "
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


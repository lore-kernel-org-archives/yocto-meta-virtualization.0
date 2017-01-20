Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF7E7E003DB; Fri, 20 Jan 2017 12:35:26 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6316E0033D
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:35:23 -0800 (PST)
Received: by mail-yb0-f193.google.com with SMTP id j82so3409204ybg.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Jan 2017 12:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=F4nWhTvupBsyYsAxtK4Jb6H/CGVnJMDGECfFHC2TpWA=;
	b=SgWtSlKLt1z8gVU+pD/kb11bYE4ez0AC3WxWXgwVMCtxRJSE2yNhshGi1ahkBC/VIj
	epZDObFd/X3Y+QAPZjPtNbFYOxKD2RoHyHdQwy2j4d4tDCWmtQKPXpEyNh8nTzLBB5BZ
	Zs5jgOzcnCgyoTMQaE9DVABNVG2YqWgWbHm2Tv4FUy51rRMBjR5KIp8ZyemXpEdvjXZQ
	EYKe4cb5ZnobqFQ+Cr1UJchfSBMaROm33HvsHULHH6P+kuXv4Y5cSXZ3Mpy8MLEif4pK
	V59LW66Sycvsuko+Tk/PMtRcbxVvbpFl2ez//zKwULwrN7GwSl1yi2KsJDl6KfaOz4Ut
	c06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=F4nWhTvupBsyYsAxtK4Jb6H/CGVnJMDGECfFHC2TpWA=;
	b=QA2I8RzrbeGtFD/sj7I2JC2HNLfyTBdaItBm3Eaj8WFlsuSyKOORnzUHKFlorDuU0j
	qzn8m93xfDuKkKlqAX0EsprC2LgvTP4YoG0FD3hnDsSFcO8s6YmPG0Jg5S+CdyN8RN+G
	IiGa9wrDC7FQzPGF+ISEniD1FGLQjVE6XvNoxrK2NZJqRkywCCJy36S8uefQRlRINb/P
	dymtiLby/opSJ6zbjPfFJHxGMTTK2FgClcrMQlZurbyiXgDNp29iPUlOSof4ws94QSe8
	yOvtP6ZAgJwJtIF7yw8Rr7uq1jJLqcG/kIP9q6dWapX6J3AYl9ljFx/wo7rMl4vVVSSm
	RHEw==
X-Gm-Message-State: AIkVDXL5DUtLYFERnyMwpsY/gtIZyMcQYK2aVzI0k1IcMq4XTzo71IIAVR4WOvFDfwC0W1MtTnXvn04i4QG83A==
X-Received: by 10.37.110.11 with SMTP id j11mr12638087ybc.40.1484944522729;
	Fri, 20 Jan 2017 12:35:22 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Fri, 20 Jan 2017 12:35:22 -0800 (PST)
In-Reply-To: <1484900555-1364-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1484900555-1364-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 20 Jan 2017 15:35:22 -0500
X-Google-Sender-Auth: 9Z6_S5Y2glBTrt6IdagfH8cw1Wk
Message-ID: <CAPuovEJ0G8tPWfVygRUntwEeDxSs484+qO3PbGLuMb79qLeFGA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-swiftclient: 2.4.0 -> 3.2.0
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
X-List-Received-Date: Fri, 20 Jan 2017 20:35:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 20, 2017 at 3:22 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-swiftclient from 2.4.0 to 3.2.0.

3.2.0 is not on stable/newton so this is not desirable when we are in
the process of moving everything to newton. I would rather we move
this to the latest commit on stable/newton as I have been migrating
the other recipes. In which case the will be 3.1.0+gitXXXXX.

Mark

>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> index 5f423c4..2d5f83b 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
>
>  SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
>
> -PV = "2.4.0+git${SRCPV}"
> -SRCREV = "c9f79e641c6906e95095f3e0e505f9bd3f715bc2"
> +PV = "3.2.0+git${SRCPV}"
> +SRCREV = "5a620f83e88d1b52e013cedff4bc266bcf3c292a"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools python-dir
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


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DEBD7E00D17; Mon,  6 Nov 2017 05:53:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.196 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFFB5E00D03
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 05:53:11 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id z28so10917230qtz.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Nov 2017 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QAmoaTm4OxWOBAhgfaCgLEKGruTDzvm3G09ST/jmqrQ=;
	b=s3mnvKPjnRt49/QSOk8xFCFrC9UlNPAFOztmbnzf3WwTi3p+B6//soedF1f5FGJV8E
	pwW+hq0zsQ4xj+EbEtmWIfjS4QjoYvCOsh8uZC5hq8tNCsfKDMtBS5iJMmRuZBUOwA6H
	h+JZ/xHmw6mePw4GMPK+j7OCiiZwJRM5wufCL4CLtytIbKAaMlCGksUBSHekHcEspyEF
	uu6fIuyvQ6PZWIgYKBLwlilSVS5QFDw2+vKoZucKeZ8nOOn70oDuEAi+VfatUPEhpNWJ
	J9vkudize1sWPmSltpDti/7UF3o1gNsAYG+1ENKJeAmv+AmtntUQmeN2uqrP8ehaOQlG
	3rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QAmoaTm4OxWOBAhgfaCgLEKGruTDzvm3G09ST/jmqrQ=;
	b=FR18C8mK6xhmqros/DkZDcZhy7/++XVPZkCILiWsPKVsPoTrcsP7vQjzRkZb6kvslF
	rM05Upls5IQ5mSJQX8hTftXgpiVtsI1K2Jfoa5rMujECiIxiw2KfprFgr+IXlZ8IkdUr
	K7bzgFJ1D4NJ31/tH0zYgCtfMz1xhDWk4w816xsyyv4vl0uEVMsxghRlC4ZbzuejO/VP
	SgEZm88QV0HVqYBxhLFjD6eXQGTmMiVErOBfuvh9R89t78my1NQYWZ7VJhJR7Mcg6gnn
	gDOzJADw6r/0nE9+vFu1qeJy89n759cgrTbeiXFf869GEF2hCOrODiGt8Q0phPV9gsB6
	8FRw==
X-Gm-Message-State: AMCzsaU+J6QtxeSSH502P49/30l4lxuMncrHn5pL48UvEAT33kAkqt7c
	3Yzqeo025pxEIyMLcjklMOF6nRbhnTTRsaMhk5aBAA==
X-Google-Smtp-Source: ABhQp+T0kQyGt37/9yLP5c6V2WWyTQJjXABPQqMlwcBBnzwTKv9GoyN5LASBo4UbSRxLrPYqgu0unQvTU2dNxbyyx1U=
X-Received: by 10.200.3.111 with SMTP id w47mr22073958qtg.312.1509976390856;
	Mon, 06 Nov 2017 05:53:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Mon, 6 Nov 2017 05:53:10 -0800 (PST)
In-Reply-To: <1509810728-19704-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1509810728-19704-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2017 08:53:10 -0500
Message-ID: <CADkTA4O8G=vP9Gi2KQadAOoHaNO-X5q9_F-ZckP9LgDPJGixxg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH]python-heatclient: upgrade to 1.9.0
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
X-List-Received-Date: Mon, 06 Nov 2017 13:53:12 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Sat, Nov 4, 2017 at 11:52 AM, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:
> Upgrade python-heatclient from 0.6.0 to 1.9.0.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index 26d86be..6653b37 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>
>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>
> -PV = "0.6.0+git${SRCPV}"
> -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
> +PV = "1.9.0+git${SRCPV}"
> +SRCREV = "b80166d848dd26718cfe0627bfec22774213616b"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


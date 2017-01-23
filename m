Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1134BE0082E; Mon, 23 Jan 2017 06:01:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D8A5E00823
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 06:01:14 -0800 (PST)
Received: by mail-yw0-f196.google.com with SMTP id u68so17079204ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3hwii1/s8ZYSDWC1HElAd4yTk6yhsvQ7kKKg4UY7ZYg=;
	b=i/dgmDcon2IYQoWBK/bFPqi8+64dT4997qcAiYI9DgQcQ4NYPu4SZkqyquemsiIBLO
	KacT3atr2mqJmIpcpKIcCca1DCoDBU81WPa7O+OPQMwgTAC9yaUU24XZwDSYKC3v43QK
	c4iTH8XWrPVuJ/legsYcyPNRAwPia0LE8ZwMhmIsBw+fgNmZJgFml53YxErkOs3KEMsl
	bkDm4gl3oJuaS52U5LynLA+B85z1Rkfp1VOLucnDwoKxNV7HhSjLF1A8lbaUBZZ2RWum
	fRHf2HqC0fA0eykltvIwKsxLMMMwCQhRbbbUiPzQqxTOuSTlNa2Pg12FMmzhdhQ43fB0
	AqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=3hwii1/s8ZYSDWC1HElAd4yTk6yhsvQ7kKKg4UY7ZYg=;
	b=KSWUnyqxprE+ziwlQHiMitjmjUvXq6SyUcFS8Brxnai2ppsTlqSTuNVpe1LMs8Z24N
	EJUWPCvuES/PXrpK/N5f4qXhjfyqnymNOxsO8xl+OF1sfDKCGvBTPDgLE5osRVlRuuDh
	K5F17E9Y/rQxu+WhNub9T0y1mxyNnB+t5h35L2up3UG0ofDGqElC0yMRvW3deliQq2Km
	cY2CoQ2y8BqG+7v6f+6ApnAozzKemWAtIkO3Eh0Mnq9NWf+qpeyizwE7bQ6ZH4ROPdIs
	FmbwGTd+xdNxUUIJLrfbCwm7KvtaZWH73zYKNUaiPr9zqgfVXmvALTArC0CkVBw1/dwg
	MI0A==
X-Gm-Message-State: AIkVDXLzsyqmXYy/spy+D1ojCmF5moW7E/t6yyd1c3iP70dmM+ShH2JDJ1GPLpzl5hT6wC3lz55hlXRJKvYgcg==
X-Received: by 10.13.253.71 with SMTP id n68mr21682803ywf.54.1485180074349;
	Mon, 23 Jan 2017 06:01:14 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Mon, 23 Jan 2017 06:01:13 -0800 (PST)
In-Reply-To: <1485162147-6734-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1485162147-6734-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 23 Jan 2017 09:01:13 -0500
X-Google-Sender-Auth: jGh7s3uxU7CFvnQlwvHFCZdexBU
Message-ID: <CAPuovEK7wufkACFx21rz18HhhALqG_ELw31wFSei-XpCXdyBTQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-heatclient: 0.6.0 -> 1.7.0
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
X-List-Received-Date: Mon, 23 Jan 2017 14:01:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 4:02 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-heatclient from 0.6.0 to 1.7.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Huang, we need to ensure we stick to releases witch match
stable/newton and not go beyond. So for this package we should be
using the latest commit on the stable/newton branch and the version
will be 1.5.0+git${SRCPV}. The other uprev's look fine, although as we
proceed through the newton update we might find incompatibilities
which might result in some tweaking.

Just out of curiosity, what are your end goals for these
contributions? do you have a usecase for this repo that I can keep in
mind as I move things forward?

Mark


>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index 26d86be..711a36d 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>
>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>
> -PV = "0.6.0+git${SRCPV}"
> -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
> +PV = "1.7.0+git${SRCPV}"
> +SRCREV = "17dd3068e4d6fc10236290cc082908c439bcfead"
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


Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 383EFE0049D; Tue, 24 Jan 2017 05:36:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BD3CE00405
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 05:35:59 -0800 (PST)
Received: by mail-yw0-f195.google.com with SMTP id u68so20364435ywg.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jan 2017 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9amisO5s1r4P4AV7RJCdDOdz4jZCVfbxm2Gko/J9DgI=;
	b=tNbLfwayDm5D4RBiMowLWMLNNQHXNGBnu7hHXZ+6x82GNDZCJfjROnukQDHuAnV71X
	AaTCD1GnFAmBzAnalvX477p586f9Rvo/p6mw19bvGGlyx1To8EaK0v6locYT6XM2I7Rq
	K5cjmIc7DH0SaASC8zL43rgWvpWjwmHInpKc+I9M83L84g5S2DtmPapXVTbRLSQ6+kmC
	lHJ+UHEHC6pcfMpPiWnamt4tOxRFEqortuhq2++KI6Oli481jDArdhLh3MnGKHzzWz4Y
	HUJJkSRDthItADxJ0wcl/UJqZILsZLAu3s6l0+1mgja353sMTcok7d2gWVJ2Jdj50S9g
	nYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=9amisO5s1r4P4AV7RJCdDOdz4jZCVfbxm2Gko/J9DgI=;
	b=tEhFyrY3o0ygHppIqawsLg2+aCP5G5/S0TChE+INYkCVEq1fDeGTdMq50TX/KU5Mzr
	nvJvldj+505vW4oMn0AsBS55ys/h42mDMUUjsTT69bhUtmPoZBsAQAIXC4xe5J+zBJrs
	EJHiA+56DRhXJDHaOX/Tdmg/0vF78VhqWvkBVEet97FmLSYHnQhOUhi6ekIbsNvmYG6a
	5DJBWeauc5GHFY1/IOhO2bjt7+93ssnCvDbZRRWJa8EWDO3ZjeM0UnpLH5/n9s9IaK6v
	NTyaUefOo5l4U+qEWlaMSInVDlJqDdTdng6XFe1HTcK2jFJz9pGD2nP997PQX6cnxRrb
	NouQ==
X-Gm-Message-State: AIkVDXIkiTpTA7uLE9uDxKHi5JVhC6jEgaC32sdr3afbnYB130HuZPu85HLS3792GtvgzSq7af9wdQ8z0V0E7w==
X-Received: by 10.13.253.71 with SMTP id n68mr25600975ywf.54.1485264958374;
	Tue, 24 Jan 2017 05:35:58 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Tue, 24 Jan 2017 05:35:57 -0800 (PST)
In-Reply-To: <1485229876-743-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1485229876-743-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 24 Jan 2017 08:35:57 -0500
X-Google-Sender-Auth: w5avV8s1iLGeXW9AXwzYyvGHEn0
Message-ID: <CAPuovEKZu3v9aWmqrwtFb+Zj70MVUFATrcYn1RXs8NrE+EhUNg@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH v2] python-heatclient: 0.6.0 -> 1.5.0
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
X-List-Received-Date: Tue, 24 Jan 2017 13:36:01 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 10:51 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-heatclient from 0.6.0 to 1.5.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

As Bruce and I mentioned yesterday I have a queue of commits for core
openstack components such as this one. Once I am able to complete
tests I will send them out in a batch. So please do not send uprev's
for these. I will get them out as soon as I can but you doing these is
only duplicating work.

Mark

>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index 26d86be..22c6937 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -26,10 +26,10 @@ RDEPENDS_${PN} +="python-cliff \
>  PR = "r0"
>  SRCNAME = "heatclient"
>
> -SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
> +SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=stable/newton"
>
> -PV = "0.6.0+git${SRCPV}"
> -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
> +PV = "1.5.0+git${SRCPV}"
> +SRCREV = "3c3f8ee2c6c988c95c949cb20fa7969a7e4a9c1a"
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


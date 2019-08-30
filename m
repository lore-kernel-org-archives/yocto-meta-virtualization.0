Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 89F04E00E84; Thu, 29 Aug 2019 21:15:56 -0700 (PDT)
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
	*      [209.85.167.47 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FF2FE00E82
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:15:54 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id j4so4238967lfh.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pq4Nii09ScvkrYRji+FPOiFjObTBxhAlsTSoE05qN/w=;
	b=jAcpKZU4nxToKZiaXapZXIzqYjaqwfcW+kEgUNqsPEB2ch/7i3PTeapyM0C4c6fMuo
	IyMkBobSHvCPNLQC7Z9v/bYFndeR3dlPE82U9HXhxFV2bmxO7KrmiwQ4XXl2KywrcDQd
	3bpUD8xpLZ0a3KK4ZdZGzmEzdLuBE3tOrQKWIVsiCG2phhIjhkD/xua5/qSpevNfSHT5
	N3fbo7TWzXcqeDb4DyWG9AYQT9MiWKigS33cqyTglwLgpMPCzmw+lebx43mpsIijhvVl
	2ijIt5Wz9lFPTzz4mszXJVho35q1WGJX6QsG5rNa+zfVgw5eu1LASDWNe8+CFdTeT7vC
	ReLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pq4Nii09ScvkrYRji+FPOiFjObTBxhAlsTSoE05qN/w=;
	b=cv9AMRj7jhgC03o0N4bcdf4nRPWCPVDAcMr+N0RW78uOWVDOjdDZSQ21OhdNY0CJbI
	8pBCO6N/PPCPvfM0NbgnRAoNzRUgBOHdzcxg4ZNulVbwlIANIajqgAfXgLXBC/b/QS46
	dUzyMuMxpiSxgUMj8otGoMoJFBCx0GKupC0XNFNafyHX5uRecNWCKX2A5TnNsMIs7mtx
	w7Z4qYxWCDHhXbUkFOkoRV1RTpshX6H+7USyx2LwEX0JmK2iePzTxeaZX2m4GTthEJ1+
	4q2l7kMbikIAON9GMLD9TOPEKXPu2GdE1xjSCkt7wahn2SccLXuwMLNpaCLfGDzTPm2Q
	wXpw==
X-Gm-Message-State: APjAAAVtF/KKS94SBeir0fmGYcRZvQJnd5P8sejwFvb0H8e0JyX/R459
	yI0gOeQWT8E5XfszK4rZ3H47ihlUBRamBaUGDUQ=
X-Google-Smtp-Source: APXvYqxJdfUEDfbDOucM4KaxcDisBIt321HPqMtQE8U0SBu6T0/DoxG9rRF3jKZFkNkooerKOsqfFydZLVyVxm9TrRY=
X-Received: by 2002:ac2:447c:: with SMTP id y28mr7847482lfl.177.1567138553841; 
	Thu, 29 Aug 2019 21:15:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190826071224.30078-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190826071224.30078-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:15:42 -0400
Message-ID: <CADkTA4N4wq-84bpLPmrAjvk_xM_vtNuMGhiCxoVDP-8fNL_p9A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 04:15:56 -0000
Content-Type: text/plain; charset="UTF-8"

This had already been sent a few days ago. Make sure to be based on
the latest master. I've dropped it from the queue.

Cheers,

Bruce

On Mon, Aug 26, 2019 at 3:13 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-manilaclient_git.bb | 4 ++--
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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAB11E00D94; Thu, 28 Dec 2017 08:17:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.195 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43655E00D7B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:17:47 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id g81so20401482qke.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rc9vrjfIsSOZGMZBo8RdzGZ3/XvXtWEKrsoYzeRPJLA=;
	b=PpEelEoEJlXgGueqD2xJFjanETvJBW+cnPIIN75Ky6nRr5c/jUXw5t8/DY9lbG/2R8
	MqJhrDQZazruy2ZnXuR1wUuKTbIbAYVudsdJ2idAXwOy9Aac9nuwJk2Opx0UhtjGotGG
	0E2LgwyZgw/q+D9fRNiQ0DX+fruNCW2hLGL1SgeG1OX3cZE4CJtYLg77frcA5mm+rE97
	jbbootlXccqIGKBapNErkRNXxtRhLC9Dy4/SOkffZqjJsVUKAg7haTeOLLNK/A0sx74O
	xFrUQ4w3ulEeZXYdcGfrVdfAvdZ1ae2MPtD8hBIrsXCFa9LawuG7MFqpF+N1bDMZ9cED
	q1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rc9vrjfIsSOZGMZBo8RdzGZ3/XvXtWEKrsoYzeRPJLA=;
	b=KNnOVS67LzYu3WaMpcG3v/rcYpzDPviC+GdhkAr9xM0TtpkXhqzdPhLtz5kMY44GsZ
	wwopgWKIuaZVNLffjsxg9taBt0gb2CT+UGckWZBSkSR2tZwcZ93h2oC64hbvNoWwjdI0
	9VOgo39zBmnZ/iCmeHad7oQ45h/jh294Yyexg1lKbUuNYnnnXEXgaj7zPl5VojieS54U
	0Aqr0FJNDOEeNpT+BwL/yNFKmq8dBU+xs4YivTQ1Vhr1xUcViMZjX6kHvQnLgjzoNHri
	8mh2mc2K4a8mcSb+ZdpPKdpn3M1dCr4L71bF2eGCvio2IDhM8VsU7UJK3QvgXFdH4Teo
	iVmg==
X-Gm-Message-State: AKGB3mLSKVjbBbJ07AOUB541THnnpt94kWGq/tWywcZ1vpQxUfgAxMgR
	6FC1agg6t9x7U1LDWkjkpHaoya4rkYHn2unI+P2oTQ==
X-Google-Smtp-Source: ACJfBouYkbXSMBaXeJzSxMEesdm/eF2aHiz9EPuqeMLW9rgb800Ly0IdYLoFr98K5SCyC01ukPE5drsC0bKQRM+AYog=
X-Received: by 10.55.112.3 with SMTP id l3mr26821330qkc.94.1514477866744; Thu,
	28 Dec 2017 08:17:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 28 Dec 2017 08:17:46 -0800 (PST)
In-Reply-To: <1513976584-12906-1-git-send-email-mark.asselstine@windriver.com>
References: <1513976584-12906-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Dec 2017 12:17:46 -0400
Message-ID: <CADkTA4Mj=Twe=vGcYiOuwchdxXC8AX=pshb1Qx_=fME9aAwREQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: add missing RDEPENDS
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
X-List-Received-Date: Thu, 28 Dec 2017 16:17:47 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Dec 22, 2017 at 5:03 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> When attempting to create a container using
>
> lxc-create -t download -n test -- no-validate --dist ubuntu --release \
> xenial --arch amd64
>
> the container creation will fail due to missing 'xz' and in the case
> of 'tar' due to invalid options if the busybox version of 'tar' is
> used.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-containers/lxc/lxc_2.0.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-containers/lxc/lxc_2.0.8.bb b/recipes-containers/lxc/lxc_2.0.8.bb
> index b616e94..651eb72 100644
> --- a/recipes-containers/lxc/lxc_2.0.8.bb
> +++ b/recipes-containers/lxc/lxc_2.0.8.bb
> @@ -6,6 +6,8 @@ DEPENDS = "libxml2 libcap"
>  RDEPENDS_${PN} = " \
>                 rsync \
>                 gzip \
> +               xz \
> +               tar \
>                 libcap-bin \
>                 bridge-utils \
>                 dnsmasq \
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


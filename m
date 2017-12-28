Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB242E00D94; Thu, 28 Dec 2017 08:16:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55130E00D7B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:16:24 -0800 (PST)
Received: by mail-qk0-f195.google.com with SMTP id g81so20396885qke.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 28 Dec 2017 08:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1z7E7joI+53bzh/+m4G+UKDUHqXh09uBLGYoIAb8dQg=;
	b=U+noVaePIXroroQcbSEsHf1nR1IcMG+KNeOJyh1uXwqx3lxCngoBrF4xY7yabZ41Cv
	Ms4MkVi5J0Is8hlcZmZD3o5o2ApKwyHbfGKRLjmrfZEEUEkByXCYfJZJVCAcFmkBNCTL
	yhW7wwHsceJhMPkF2bKHdwcDTwl6qJLRl4qgLxvZaDtUPmMRmbFGQJArUzqz/vIJ4Faj
	ZnECe6Y4WBjkWfNWSHCqpztv/PQAbAJ8Y+p8Vh2btJbvx4WbSxmqY4tDOjPff46Y8t61
	uwW1huvtGmR2TopXZxVunQh2nE/u296BplEirj0ohNUAPMzUMarE2f8XOapSDxWiO0hF
	x6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1z7E7joI+53bzh/+m4G+UKDUHqXh09uBLGYoIAb8dQg=;
	b=Nn8Uc9IChcRSAQgSVsuR8VAkO7PDbY49CRV+EJkAQcovfMvlzaf9zV2QSf2WZc4I86
	3/OWk4M2APBJHR240IW4YobsykuPz859o3Mh7okD0gU+Dp1ceQyO2Anyj3lziyYVykSG
	9QwRl5hlje7YHvQvKofaRfBj3XAdA2cJRaJ1SYeFS2vmRJqNpjw47liR3/TGzLHGyZjD
	xzRqC8PnWbIf/McoU3mrYVGTv1vHqRg9VfbMc53wI9O97k1xYZ6bxE1y0RhJCnJLXEnm
	Ty4lHg6EWBKi2dHhe5kHnLfgae6W90kxYF5pJOQ+33i2jGmMigysIpydrcn1y4zGtWQ+
	AXcQ==
X-Gm-Message-State: AKGB3mJ9JpmDacj+P0fWW7gbg/UxSVUMmBU8CP8HVxEp20QciwhW5Xk2
	7HvhCUKAn5IsEYayZI5vzaMO557rDyhcdKoaoSVBwQ==
X-Google-Smtp-Source: ACJfBosRhb7To587UK5LkiNn3jQDA+C2i+wptifSVqo6KTnzFL71zJqzlBw3xjg56BirkRnho7cOohOt97GmVVGjHzI=
X-Received: by 10.55.94.130 with SMTP id s124mr21167417qkb.103.1514477783814; 
	Thu, 28 Dec 2017 08:16:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Thu, 28 Dec 2017 08:16:23 -0800 (PST)
In-Reply-To: <1513742590-8705-1-git-send-email-mark.asselstine@windriver.com>
References: <1513742590-8705-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Dec 2017 12:16:23 -0400
Message-ID: <CADkTA4N1QgELF6k8wWKG9QQdaY49_nkhxB4BjF=b8ZhkKyvLXA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] iptables: add to our list of RRECOMMENDS
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
X-List-Received-Date: Thu, 28 Dec 2017 16:16:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Dec 20, 2017 at 12:03 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Extend the list of RRECOMMENDS to include some essential kernel
> modules needed to make iptables minimally useful. Specifically include
> the common tables and conntrack, all of which are used by even basic
> iptables configurations. While at it I also made things more
> consistent for ipv4 vs ipv6.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/iptables/iptables_1.%.bbappend | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/iptables/iptables_1.%.bbappend b/recipes-extended/iptables/iptables_1.%.bbappend
> index 52a4c4f..8fd521c 100644
> --- a/recipes-extended/iptables/iptables_1.%.bbappend
> +++ b/recipes-extended/iptables/iptables_1.%.bbappend
> @@ -1,8 +1,19 @@
>  RRECOMMENDS_${PN} += "kernel-module-ip6-tables \
> +                      kernel-module-ip-tables \
>                        kernel-module-ip6table-filter \
> -                      kernel-module-xt-tcpudp \
> +                      kernel-module-iptable-filter \
> +                      kernel-module-ip6table-raw \
> +                      kernel-module-iptable-raw \
> +                      kernel-module-ip6table-nat \
> +                      kernel-module-iptable-nat \
> +                      kernel-module-ip6table-mangle \
> +                      kernel-module-iptable-magle \
> +                      kernel-module-ip6table-security \
> +                      kernel-module-iptable-security \
>                        kernel-module-ipt-reject \
>                        kernel-module-iptable-mangle \
>                        kernel-module-xt-checksum \
> +                      kernel-module-xt-conntrack \
>                        kernel-module-xt-state \
> +                      kernel-module-xt-tcpudp \
>                        "
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


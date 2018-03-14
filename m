Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0C9EE00F58; Wed, 14 Mar 2018 05:40:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1155E00823
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:40:37 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id v9-v6so4533795lfa.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o70GTK5rdaYda1MUHy1vza+u7tY4YV5TBITif2MbMCg=;
	b=rwkNgWXVaWVnybb+VxDzvhZcr54DVwKINSIwKsbMFSAvpk/fqTjkm0oy0cp8D1Q7ZK
	dk787u8g8k3bnS66VFfFLtx/qqlBjuWSD2cd5izYmUPpX69faPvhRX1g3MbnjSPQGyrT
	1LCdXMaQqRq1eK8AL2hqelLzPGd1OqSYx0IekzpPAJpWoHM/tqmg8ytc6JbL4EobEQjx
	vVRWYUGDD7SyQ6QznufeebgDJ2PZLruy59pEtZJ1gwt3F35pwSAjCxWQh21i4EEkShcS
	u1Y+g+IgZErrJjyS2bPyi8vCtkI6FDJWHMWyIeNkxHDKsK3u9JTT+cwCFHAUBwnjHCHP
	F4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o70GTK5rdaYda1MUHy1vza+u7tY4YV5TBITif2MbMCg=;
	b=skGGJxjsd/GQdKtLKbk7keIkP8PgdqPLdQSLeqW5NLVzRN/GP9yfc8McRWcdOU5SbB
	SufXB7Cs8FhRtZfQKIkRyQpsVyTwPtem8r+2dubS3mGgb87j/w4J4WGAXC94MHUGdNhy
	ICLXhavtaRnXcSsW+hGGOvvHchUUoI45BFBAK9BuNDSY4wa6mROa26HAIJ0maRDMwkEN
	OG+hVM+tTQu03JTUumpq4R7x3F5w5iLjAA6Qk8zA0xHb0IkCC0Ub58ASetN6DK0BsTSJ
	7yFjDwJ02MS/AuyZErrtgE+LpD/N/7m+7BGWQ31w6Xjethw/xhOrWHyqRKs2mvqYNl/p
	U4sg==
X-Gm-Message-State: AElRT7EHs3vNmFpv3gvxLLRktE5zgu1iwwMxkR3zItr78Qopsh6jzlbe
	DmAnpU3cehNKVwaT5e9qi8rgdRC2A0EbNxTri2Q=
X-Google-Smtp-Source: AG47ELuOk2LbCxnCqphvBfQxzxpyJ2X2ZLBjkoB3Ux0UwqSs71i8Mzj5RlqmYjfPYZgsaVN/vm+WjCMUTrC4uEVsoLo=
X-Received: by 10.46.20.30 with SMTP id u30mr3419109ljd.12.1521031236548; Wed,
	14 Mar 2018 05:40:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:40:36 -0700 (PDT)
In-Reply-To: <20180314083912.16564-1-pascal.bach@siemens.com>
References: <20180314083912.16564-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:40:36 -0400
Message-ID: <CADkTA4PV1WJiK50qz0bC5eo0_jwBaM+Kb-7j=WXAuzNgw9Nwuw@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: make aufs dependency depend on distro feature
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
X-List-Received-Date: Wed, 14 Mar 2018 12:40:38 -0000
Content-Type: text/plain; charset="UTF-8"

The problem is .. that this is now a magic distro feature that no one
knows about.

At a minimum, this new distro feature use needs to be documented in the layers
README.

Bruce

On Wed, Mar 14, 2018 at 4:39 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> Only include aufs-utils if the corresponding distro feature is enabled.
> Without that the aufs kernel driver is not included too.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  recipes-containers/docker/docker_git.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index 5c21138..206c884 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -64,8 +64,9 @@ DEPENDS = " \
>  PACKAGES =+ "${PN}-contrib"
>
>  DEPENDS_append_class-target = " lvm2"
> -RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
> -                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
> +RDEPENDS_${PN} = "util-linux iptables \
> +                  ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
> +                  ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
>                   "
>  RDEPENDS_${PN} += "virtual/containerd virtual/runc"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


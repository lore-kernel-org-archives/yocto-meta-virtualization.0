Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C06A0E00CD0; Fri,  1 Mar 2019 08:38:43 -0800 (PST)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3771E0048C
	for <meta-virtualization@yoctoproject.org>;
	Fri,  1 Mar 2019 08:38:42 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id 131so9281936lfa.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 01 Mar 2019 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hawe7mq7/TNGMMvbFYGWyRZX2n5wh65IQ5RMbywevpg=;
	b=iCF/X+84rzrJtY1Ili9B7n6EeY3A9+/Umip4FuDoUdnhtRGu9NjEYyt87va6dkNYgL
	AQ/5ozeP2bSq246twnQwSkjWSNMIGW17fNGrzDKpK4q6iMR4VymcfDcbgVMnU3j9RG43
	WVHZWpsqz0xl8GNoW2dj7sRmA+HFvB36zdZlsSJMjdwPtSVG/zFCKNPQC4OR3wB890QZ
	Um0U/lu23gYQPHqFDAQDq6X2o/01pL7KrThwUPgQfBFyMwCxikG4UgqJ0D7nAuaarkaG
	xyA3FlGOyKfit+JUR7upSg9FInBA14+B9doLYMFWAeaFor8sdjXwi2PBaIo2tOF1ysYR
	kEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hawe7mq7/TNGMMvbFYGWyRZX2n5wh65IQ5RMbywevpg=;
	b=FJvo0c7D2yPIsVEczPgICZRCVJKDiQfyXUgtus4ZT55wWfFhp9FxVIxRPZi/ZQy/73
	TLVL5TEvaWW9ih4KDqzGcIf88MyOJqYzLVW6GnticJSGNGovhAg+qA249cKFNkv6l5+W
	dG2/35CUjh+hacyWkwKungmE8ksW2634zGoV4mgVaSaKHJB6+lL2jpqcEFYNXcSD0rfV
	8AEfmUInYNURPllKqrVXUDYI+JLH9Qkeg5B3Bqmjnh7eDJcaGF+YME3d+IamyEg13fXg
	+gwPMq16PjSLxoT7YbnjTjnRX2Y+5XqqndFCotf1T148zivFqr8pK/3bj1b4E1Cr/IsJ
	9ZSg==
X-Gm-Message-State: APjAAAWt6gbseT41t0HOtUdsa1oFyUzu3Jc8svGwcFwc9RL/JqcWHNem
	a/r7hRkxn25GuCPYkH0Vj78bvpKWRfuTy1PKylP3U4saJx4=
X-Google-Smtp-Source: APXvYqwr0cWQh0idLBI6NYNupZ1mcymCVaq95DTBsqJ94QRn9rBN7aXUwpbOLV7aQuyOkSaN/3gaFyK1mNiSbcoftFY=
X-Received: by 2002:ac2:4243:: with SMTP id m3mr3486011lfl.5.1551458321537;
	Fri, 01 Mar 2019 08:38:41 -0800 (PST)
MIME-Version: 1.0
References: <1551253291-173385-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1551253291-173385-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Mar 2019 11:38:30 -0500
Message-ID: <CADkTA4P+wexhanqZwuN+QvaB3WSiwUQgkiu5zrYXXTW+ND1maQ@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services] [PATCH] kernel: Remove redundant config fragment
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
X-List-Received-Date: Fri, 01 Mar 2019 16:38:43 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Feb 27, 2019 at 2:41 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> This fixes 01a28c32acb2 ("linux/nf.cfg: CONFIG_NF_CONNTRACK_IPV4 was replaced by
> CONFIG_NF_CONNTRACK") which duplicates a config fragment and causes the
> following warning.
>
> Warning: Value of CONFIG_NF_CONNTRACK is defined multiple times within fragment
> tmp-glibc/work-shared/intel-x86-64/kernel-source/.kernel-meta/configs/v4.19/standard/intel-x86/nf.cfg:
> CONFIG_NF_CONNTRACK=y
> CONFIG_NF_CONNTRACK=y
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> index 1bf82ea..676a091 100644
> --- a/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> +++ b/meta-openstack/recipes-kernel/linux/linux-yocto/nf.cfg
> @@ -2,7 +2,6 @@ CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_NAT=m
>  CONFIG_NF_NAT_NEEDED=y
>  CONFIG_NF_NAT_PROTO_SCTP=m
> -CONFIG_NF_CONNTRACK=y
>  CONFIG_NF_CONNTRACK_PROC_COMPAT=y
>  CONFIG_NF_NAT_IPV4=m
>  CONFIG_IP_NF_NAT=m
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


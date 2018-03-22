Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAAF7E00A96; Wed, 21 Mar 2018 22:02:23 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AF50E00905
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Mar 2018 22:02:22 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id o102-v6so11180233lfg.8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Mar 2018 22:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MK1xCI7DUW71dcrKsZy2yTWp6ATk+NwMIHWoL5Z0yCk=;
	b=SmYaNMCJMk57dW1cuzrLDh/QwzOB2aDlf93xmZhT/IfE9OypgDtajy5DKWaDRsZ17e
	e47kKaPkuiS/mO/w9XPKrtAMIKzr/gCihVW5l+JoF5MxW5RbjHStX++PISJm1ITHy4JH
	puorN5yC4Sl2L62oZCdTms6v5Ty4zFlvi2CdGwRNE4jHGQPdFr7YwJqI65XjTjSxnVDb
	cuxgjuUpdVbNaCXPxoJnkyRiFyCvzd7scGid5deigHksbBwyFaK6DOve4c+DCliDs2Rs
	76pPCNl42ZNiXHxcREOiWh24wftqhk2KxXW5DEJdnxXlcS/P7JubjTWyK6ITJvmZmplW
	95fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MK1xCI7DUW71dcrKsZy2yTWp6ATk+NwMIHWoL5Z0yCk=;
	b=h4hZh+nN3bDA/+QSjB3TzSBjL2ZPou3BeacKqy9+Pn6SvfBCDhZdIb44UqYy/EfPKM
	Ik0XWP6kUjHAYjk9ogTNt24aM3ZoTMhaxBSbCbUSJzQlW+XN+YNGY5hssnxFUomclTPJ
	l3qFrDUaDRiAM9fc+JMfxsP5G0u/fnd2X8Td/lXiV3qiJ+HONYW9DBa4lqICsavUwIkN
	xC6Qzhzm7F2cqYJVYdVYYXMFsNI05wKptgG1pxJGbRi3AtKM2AFEi4uM+SOxZgm3S04L
	tM/N09n+h2Zd9SevHMf6FR6BEQls52jrD6Culy84ZyMiVu7QWFCVpC9paU9eMJTjqPnP
	PGiQ==
X-Gm-Message-State: AElRT7FelkTBBWFpXZ8OUtSKencO1JvamGqPoMir856cqyto37pIvNI6
	f9BHOPTcT4hSbmagyugHrL8mginSIX64kgw52w8=
X-Google-Smtp-Source: AG47ELsAa3x3GBxpmpWPY8xXKEFumTWsZ4swFAJsbIOV891P4DZIip/fMyPlxm/rgqz33itenNDVRs4hy0pf0vB0pjc=
X-Received: by 10.46.42.67 with SMTP id q64mr15983434ljq.133.1521694941323;
	Wed, 21 Mar 2018 22:02:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 21 Mar 2018 22:02:20 -0700 (PDT)
In-Reply-To: <20180322032718.353177-1-yunguo.wei@windriver.com>
References: <20180322032718.353177-1-yunguo.wei@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 22 Mar 2018 01:02:20 -0400
Message-ID: <CADkTA4N48OksSNJrEYhdOf-34ForTLMUPes3QCyHQBkG2t8TUg@mail.gmail.com>
To: Yunguo Wei <yunguo.wei@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] go-fsnotify: switch to new repository on github
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
X-List-Received-Date: Thu, 22 Mar 2018 05:02:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Mar 21, 2018 at 11:27 PM, Yunguo Wei <yunguo.wei@windriver.com> wrote:
> fsnotify is changed to new repository on gihub, so adapt this chanage
> accordingly to avoid fetch failure.
>
> Signed-off-by: Yunguo Wei <yunguo.wei@windriver.com>
> ---
>  recipes-devtools/go/go-fsnotify_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
> index e5bcf14..1d9fbdc 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c38914c9a7ab03bb2b96d4baaee10769"
>
>  SRCNAME = "fsnotify"
>
> -PKG_NAME = "github.com/go-fsnotify/${SRCNAME}"
> +PKG_NAME = "github.com/fsnotify/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
>  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
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


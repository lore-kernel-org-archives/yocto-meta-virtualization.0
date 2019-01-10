Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F111E00CC4; Thu, 10 Jan 2019 10:10:25 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28CACE00C46
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2019 10:10:24 -0800 (PST)
Received: by mail-lj1-f195.google.com with SMTP id u89-v6so10567231lje.1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Jan 2019 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0K3KyvWkdtpBdiEedSavjRi+SIlKtKIMygzNmSV5fX8=;
	b=iGNoc8Q5tKz9hwvdsTQw3fGvYyNszJQhgiFNIUGmZlxIxG+2GsNX1x3HFU9BKP9JZV
	V3Vn0GKBkcXG5VKUc89V79vJLNHkd6ES3PgjTJOIwg9ekHIs3/xdxqRP4+45SIm6qoi8
	v9YLUH9vlHqYP7YUSycEDzNxsnTvyD9L2b/MRK96FyzVCLYe/dyHHRCJNNHd4/z9/eUo
	GFp7YfWBVvFUDlkUlNEq5JQKDjcoipIfLMzP0VOFxECfKwCN4Ue2g3NQxJPWGkM87/Ux
	UWI2/hJacEe4eQR3oSuiEstms9LdACj3wWTjJlmDJePfPN7hMKrG6CqR2tdByG7IX0/S
	4KuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0K3KyvWkdtpBdiEedSavjRi+SIlKtKIMygzNmSV5fX8=;
	b=m2pi6JbXTMyJ1VZjjmiXxYhBZy6FHM91MBdkzITAx1DrNK2F4Q0os6B02sZuSxhKXq
	lBBDmhAG99XrsyTZxzXwqm9DfVNONvl75NcJcvTZVEbEMsahH4pInXEGJ13xDr7Z9mk5
	XmVRLPo0l9ufqCewr5iZnu2eZFmlXG8xnOhN0X8ch0yxlRbrnF7FLwwUe/J+Y2YFZC67
	M8PU+QoBKd4w4/bLEbP85cnane2WEt+lisdps72iNUEcmWyjF2mRPpJnyAEHjhl/DgpK
	pfNSecR++F3mpxtxkrr1PcBcMt3KO4E3JMfn/1Tcc7zx53gaoAzN5FBpsjPoNHxgkS/N
	diCQ==
X-Gm-Message-State: AJcUukcyTgsuKG/OjhvCwCx+317xQ6TH/r+oP4UaMJiamm6SjiFN333O
	pC9f9EoElRBnGWQbE6t3nQtEYkEbs9qDMRzQYMFNeg==
X-Google-Smtp-Source: ALg8bN7BRrb4pDEQ7jsAaA8X2w9N+/bUabANxWSwVZQLyuYgvWmqB4XdprkKG1SOAOGlAGap93suuLRz4WcLgH1bxrc=
X-Received: by 2002:a2e:5054:: with SMTP id
	v20-v6mr6624036ljd.45.1547143823022; 
	Thu, 10 Jan 2019 10:10:23 -0800 (PST)
MIME-Version: 1.0
References: <1547065198-24974-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1547065198-24974-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Jan 2019 13:10:12 -0500
Message-ID: <CADkTA4MvFNXTyLu-We7RT_YM529z7WQWTVTxbjRYvUjqD+0e5g@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux-yocto: cleanup lxc.cfg kernel config fragment
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
X-List-Received-Date: Thu, 10 Jan 2019 18:10:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jan 9, 2019 at 3:20 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> fixes:
>     WARNING: linux-yocto-4.18.21+gitAUTOINC+9e348b6f9d_db2d813869-r0
>     do_kernel_configcheck: [kernel config]: This BSP sets config
>     options that are not offered anywhere within this kernel:
>
>     CONFIG_EXT3_FS_XATTR
>     CONFIG_RESOURCE_COUNTERS
>     CONFIG_CGROUP_MEM_RES_CTLR
>     CONFIG_CLS_CGROUP
>     CONFIG_NETPRIO_CGROUP
>     CONFIG_DEVPTS_MULTIPLE_INSTANCES
>
> Configs were either dropped or renamed according to the updates made
> in the kernel, as capture below.
>
> CONFIG_RESOURCE_COUNTERS gone since kernel v3.19 via mainline
> commit 5b1efc027c0b51ca3e76f4e00c83358f8349f543.
>
> CONFIG_CGROUP_MEM_RES_CTLR renamed since kernel v3.6 via mainline
> commit c255a458055e459f65eb7b7f51dc5dbdd0caf1d8
>
> CONFIG_CLS_CGROUP never existed AFAICT it should have always
> been CONFIG_NET_CLS_CGROUP
>
> CONFIG_NETPRIO_CGROUP renamed since kernel v3.14 via mainline
> commit 86f8515f9721fa171483f0fe0391968fbb949cc9
>
> CONFIG_DEVPTS_MULTIPLE_INSTANCES removed since kernel v4.7 via mainline
> commit eedf265aa003b4781de24cfed40a655a664457e6
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index e5f1edc..9ff49f1 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -1,8 +1,7 @@
>  CONFIG_CGROUP_DEVICE=y
>  CONFIG_CPUSETS=y
>  CONFIG_PROC_PID_CPUSET=y
> -CONFIG_RESOURCE_COUNTERS=y
> -CONFIG_CGROUP_MEM_RES_CTLR=y
> +CONFIG_MEMCG=y
>  CONFIG_CGROUP_SCHED=y
>  CONFIG_FAIR_GROUP_SCHED=y
>  CONFIG_RT_GROUP_SCHED=y
> @@ -14,11 +13,9 @@ CONFIG_USER_NS=y
>  CONFIG_PID_NS=y
>  CONFIG_NET_NS=y
>
> -CONFIG_CLS_CGROUP=m
> +CONFIG_NET_CLS_CGROUP=m
>  CONFIG_BLK_CGROUP=y
> -CONFIG_NETPRIO_CGROUP=m
> -
> -CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
> +CONFIG_CGROUP_NET_PRIO=m
>
>  # Virtual drivers
>  CONFIG_HVC_DRIVER=y
> --
> 2.7.4
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


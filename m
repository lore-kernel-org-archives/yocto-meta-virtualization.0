Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D09ABE0030B; Mon,  1 Dec 2014 07:49:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.171 listed in list.dnswl.org]
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 719AAE0030B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  1 Dec 2014 07:49:28 -0800 (PST)
Received: by mail-vc0-f171.google.com with SMTP id hy4so4730916vcb.30
	for <meta-virtualization@yoctoproject.org>;
	Mon, 01 Dec 2014 07:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WYZik/870h2GtEYMSyypk98Nx/hRE4yc6LzdUqv8y5o=;
	b=iHQchWILvJz6+191qIE0Dm7X4iJYySk90am+rKiOQG9/1lXwrVDLx7iMEqEYeganTq
	jynA8zonq+6IWo7HSTQBVK443C50BM7Uhen3ovIXgx1gDcV8alLACjxJIc8FlekX6aIt
	NcECwEDq9p+/sDSiaInGyaQqDD69dg/jWRcQPFzgjh9y3V0BwbPfVRKFc4OTxUC+mof8
	Z4IHlygurJqX3HI/PfnF87kHKMLlM+Y/Z8kr0SkvpA/7C1aDZX4QOVXwqAXoWmmwu0pL
	tgE087G2RBMvVEPfvSwKEAn01B7ABeoAlo40tDLh6RcBMp8paD9uNzGwLgTAGpo2Wj8E
	z5wQ==
MIME-Version: 1.0
X-Received: by 10.53.13.204 with SMTP id fa12mr12829046vdd.16.1417448967683;
	Mon, 01 Dec 2014 07:49:27 -0800 (PST)
Received: by 10.52.114.225 with HTTP; Mon, 1 Dec 2014 07:49:27 -0800 (PST)
In-Reply-To: <1417441877-639-1-git-send-email-josep.puigdemont@enea.com>
References: <1417441877-639-1-git-send-email-josep.puigdemont@enea.com>
Date: Mon, 1 Dec 2014 10:49:27 -0500
Message-ID: <CADkTA4NCVBJGq_-imOi0QfwEFEmGn2Th-cmYO2LWj0zB1WjDvw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc.cfg: remove unnecessary kernel configuraitons.
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
X-List-Received-Date: Mon, 01 Dec 2014 15:49:36 -0000
Content-Type: text/plain; charset=UTF-8

merged!

Bruce

On Mon, Dec 1, 2014 at 8:51 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index f720ca6..e8aae6c 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -13,8 +13,6 @@ CONFIG_IPC_NS=y
>  CONFIG_USER_NS=y
>  CONFIG_PID_NS=y
>  CONFIG_NET_NS=y
> -CONFIG_SECCOMP=y
> -CONFIG_SECURITY_APPARMOR=y
>
>  CONFIG_CLS_CGROUP=m
>  CONFIG_BLK_CGROUP=m
> --
> 1.9.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


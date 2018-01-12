Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57B03E00E85; Fri, 12 Jan 2018 07:38:37 -0800 (PST)
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
	*      [209.85.216.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2A93E0085E
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jan 2018 07:38:36 -0800 (PST)
Received: by mail-qt0-f196.google.com with SMTP id a16so6478600qtj.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jan 2018 07:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WHzfNZhkSE344mguijpYuaa4U00RR0Zt/vs4HuERBPo=;
	b=Uqor13k28zN9xYw02ROaVlPFoSbAH8tEvXrq+Fsc2CATDcjFKNZDbESwJpja8HRHdN
	1LsHVOADMmoWITc7IUeoQTdJzv9MIyBLzNK5CjK5eX2XDiHBOgzZINQA7sVYeNM2j++C
	zL19WTyr8BJ49DtRFUMnxr8qjEPkmv8CpbK7fv89H9T9KOSanCFuSofjQR9S3bJx9Lo4
	dWAHwmvC2vd/xPVfyQl3QXrVgQ3E05saBOf5+dUHNmriGt1vNxQ+cMe3Co2R6Mvxjv0A
	/U2B4HWU59ZeZhcAgTurxpMsrwaE1r3qp9phjYikYJwwh4AWEwACjwHD41RIWZcGJSnK
	2jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WHzfNZhkSE344mguijpYuaa4U00RR0Zt/vs4HuERBPo=;
	b=GFOS1B8I2us6rLK4AEHFF3wtrhbqPcF/+O1teYrVrp/glnOSudq5qV4Mazfit0AbPl
	OpfB3/7zdrYV//HAFQ0j85pX5OaDkuHseG5KhxIceFUi+MZjCG1mEq5P7O1auxDUuzCQ
	tPrthpSgqRS3NNFQ2WY2pD0haAcFIwiYW9OgRtFXSf8Db/kZsbD58ysJ7JfWv8O84N1m
	BspBwkE16if+D2yd+1lVSj7uKsIDYxw8qnKF5aYyD0dmxsCo4qK6ZOV+sVm6Ub5mEBFo
	nJrj2rD0XTsIxRBnc2ObnYeDF5jbQZooKMFG7MnnRFQYWTUR2eN9qXJogq6Sn76uOVDR
	1n6Q==
X-Gm-Message-State: AKGB3mInOq98+mP/L123QEpCTTzeBHoTjUF4JKXqfrjTqhrjRbd2wVLi
	O9vtvmN0jbxXq7bXvjgpJI1aGj5wvecA6NWw+Ec=
X-Google-Smtp-Source: ACJfBosa45O+JqfNwSorH3mxYq5y5HQU6I+60dLA4zNclW3jC27VsFyVdxcoFnR1WLTxlAIMZtYtXeJtQMaswp5L6r0=
X-Received: by 10.200.13.8 with SMTP id q8mr36975447qti.120.1515771515420;
	Fri, 12 Jan 2018 07:38:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Fri, 12 Jan 2018 07:38:34 -0800 (PST)
In-Reply-To: <20171229012137.197092-1-hongzhi.song@windriver.com>
References: <20171229012137.197092-1-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Jan 2018 10:38:34 -0500
Message-ID: <CADkTA4ONyPQ8b5PAFRcMPgyjxHCoUUJWeRiMczzAEXgehSX=Uw@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] enable kernel CONFIG_NET_ACT_POLICE for openvswitch
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
X-List-Received-Date: Fri, 12 Jan 2018 15:38:37 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Thu, Dec 28, 2017 at 8:21 PM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> Setting 'CONFIG_NET_ACT_POLICE=m' meets demands of Qos,one of features of openswitch.
> This is a new police-mechanism called action-extension.
> It can build act_police.c into kernel as type of module.
> If you want to do traffic policing, a kind of action-extension, i.e. strict bandwidth limiting.
> This action replaces the existing policing module.
> User can set action-extension at userspace by tool of openvswitch
>
> If user set action-extension, exts->actions[i] will be called, and finally tcf_police()
> defined at act_police.c will be called.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  recipes-kernel/linux/linux-yocto/vswitch.cfg | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-kernel/linux/linux-yocto/vswitch.cfg b/recipes-kernel/linux/linux-yocto/vswitch.cfg
> index 0067504..b1fefc0 100644
> --- a/recipes-kernel/linux/linux-yocto/vswitch.cfg
> +++ b/recipes-kernel/linux/linux-yocto/vswitch.cfg
> @@ -1,2 +1,3 @@
>  CONFIG_OPENVSWITCH=m
>  CONFIG_NET_SCH_INGRESS=m
> +CONFIG_NET_ACT_POLICE=m
> --
> 2.13.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


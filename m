Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E18A3E00B30; Fri, 23 Mar 2018 06:11:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4F0FE008D2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 06:11:40 -0700 (PDT)
Received: by mail-yw0-f193.google.com with SMTP id r145so3931391ywe.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Mar 2018 06:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=PuV4yl43mgBUYnEcwXBwIZoar19+8iDBQ+sBc1yYSDE=;
	b=kj40cVO4ucnXt/zIYINkfzBy6BDrnLFcSvIai0BHIAb6LmDsY3sbOlvflIYc41ifJf
	tHSKqUYEcTZQoUUJl6ojTgKU9SQe7Jt0YNPuu8b35Of2dmEIF3YyTyemHhTepKdl3R3W
	0JXb274tTri78csBMKwhypbbwuxSfXRrZhQ31cRWAAdzTD+LK9JoTgO8fcgVFvl6bFVN
	9p3y9NWu6EYTQqqhlvheOO0ILl2qYhtEvmwTAafryth+/LdgbzqQM18Nh7Cs4RJ5YLhi
	HUpf42MqFRTE6D7GMdoIeAn+A5jsWjMfOzd2SnlCkTIKaoz7qjDa1seWkN2+ktHBsrtO
	GjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=PuV4yl43mgBUYnEcwXBwIZoar19+8iDBQ+sBc1yYSDE=;
	b=AQchIE4noXScQx6UE3QuvORelXrsGCceox6gH850vF5KIxCcOb3Izxis2A7Bk6B+C9
	Dmk8+qiGMMiQM/S0CR/abwYgUG/aHsnFA9szySMNPd6D1U8n+1P8Dl3o8Sxhp2KWNvwb
	TV2M9UAAp5PnZY/JttTsN0gtwypSStIVM1RunfsI0n5qDdUSZypxUn82zbg+MwyfI3aw
	GaWMy5z+9BuZZ5kDFxikYoI6xfBxen2iPG5MyCPwdNemKdvU288WOIXv0Qs0v+QFXFiA
	1C9zTXSjTsbE2Z8dnXIhujV+xROgXHKEO3NvmdNjY6CbjBmaXCzsV8iqwly33aUepClF
	mK/Q==
X-Gm-Message-State: AElRT7G6efDpl8ieaCiFld7kPfsb0E4HPvI8UtYO77+a7zkqwqc02pzJ
	d9RhBNBciaSVGi/CAw/Hon/SOBMcOdQz/VMyUgo=
X-Google-Smtp-Source: AG47ELuR3bduWhNJQEkXBDoo5pxphCUOUO5G1ZABEElBbsZDPXCnrPmOaPSTHnUPtKVNsbFyV1OcnR48w8RBLKRyJ/Y=
X-Received: by 10.129.145.209 with SMTP id i200mr16963207ywg.364.1521810699610;
	Fri, 23 Mar 2018 06:11:39 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 06:11:38
	-0700 (PDT)
In-Reply-To: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Fri, 23 Mar 2018 09:11:38 -0400
X-Google-Sender-Auth: FEbzEmSaYrpgqWxsgiFGtx1DCWU
Message-ID: <CAPuovE+SGSwYLxcjQkJF7cRzY1cfEkUb3nvKC6gPkT6-RAMjbA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-heatclient: 1.9.0 -> 1.14.0
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
X-List-Received-Date: Fri, 23 Mar 2018 13:11:42 -0000
Content-Type: text/plain; charset="UTF-8"

Bruce, I will have a look at these on Monday to ensure they don't
conflict with the uprev to OpenStack pike release. Unfortunately I
don't have time today.

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-heatclient from 1.9.0 to 1.14.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index 6653b37..baa1c2c 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>
>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>
> -PV = "1.9.0+git${SRCPV}"
> -SRCREV = "b80166d848dd26718cfe0627bfec22774213616b"
> +PV = "1.14.0+git${SRCPV}"
> +SRCREV = "2ce6aa19a3a8936bc7c9737efadacbb4ae737dab"
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


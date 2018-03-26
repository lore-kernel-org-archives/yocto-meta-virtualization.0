Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2144DE00BEB; Mon, 26 Mar 2018 11:20:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 982A4E0086B
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:20:47 -0700 (PDT)
Received: by mail-yw0-f177.google.com with SMTP id v68so6413079ywg.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=heEQlvGwA5hYTMVtnxoDVbn99BTTrQsGu//yvGGOvdI=;
	b=IGTzDc6ATw0CrzOhMYrztGHjhlq5cOam+fgCa/4rgQg914SqkQWYce4Tmp5CuHpqg2
	j4JWg9ePO6HSWrDHZ1vEaYNTOWRxUaDhYMthwHpgLNMjh7mpPRMbw/u4oDKoyRJbgjod
	H8JrElbqx1X6D2CSdSCkIzF322lBTyEzL0GDh5OXTznR25SKOIyVGI8LhgCZvqL6gz6P
	tpzIq+71MOX11nfcCjlCRH2wqoZAtbtoi+V0COifFHcGw6ANPbqmOoJeeF33QdKKbVbQ
	SjuhHlMdkjnPWTqPqyxpnp4c2ps/873mSo6ZpdutvyBehN1qsBjSJdy+5UTDTG4fyEZk
	EkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=heEQlvGwA5hYTMVtnxoDVbn99BTTrQsGu//yvGGOvdI=;
	b=oEoQF8aRH1NUojzixrfgEjeRX2ehpzdzrtq0JCN98XZdz7Y1GfKOMtH3SCOSZN/isi
	ddUk6Fg07YAmDvOT/3RSsAgwTDr5qvjo5aJ31ye1i1ShpXvRqUNCBawOd9nNxqbMy7Cp
	loBl0FYOoF0XgDXuuJo/cWoQqq5FdDwCxQ3ClnpKYbg6eCqgUQS1DXr7JugUq31M1Ukb
	dZC1Q5wSUl9ok0Fx4L6JV63USC5ig3kWBmfyIZskYtSjxpkd/V8eBEEaDkpJEYjDTpU+
	FskjPMo3DCR/mM4g6jgYXBMmRj313lMQci7dN1420PKiUcqoMA6XCUZVOCulRHwfCQNJ
	gSrw==
X-Gm-Message-State: AElRT7Ek8UvS5xqbUcUsbE/AkgHYPMQj/7qUskqocDS7L4sgaKYhOYHD
	tvwYctp0MSILSqubPmI0zDS6JAirlWzkL4yXkvc=
X-Google-Smtp-Source: AG47ELsz1rgPPM7gq1m67AzxSZizOnZ2w31cSBNLOcE6sQmnWsn+WnsFmmRwnR/zM0jgno5Tjun751zMgUm0OSqbmFk=
X-Received: by 10.13.212.200 with SMTP id w191mr10750227ywd.210.1522088446685; 
	Mon, 26 Mar 2018 11:20:46 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:20:45
	-0700 (PDT)
In-Reply-To: <1521775736-38102-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1521775736-38102-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1521775736-38102-6-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:20:45 -0400
X-Google-Sender-Auth: uiidfwmtHBiKnJyfgN4VY0-NnPQ
Message-ID: <CAPuovE+=Q5EbQ9rbf9-=_F3xcsZNYUMZnNLCPm3fXQamVFBktA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-repoze.lru: 0.6 -> 0.7
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
X-List-Received-Date: Mon, 26 Mar 2018 18:20:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 22, 2018 at 11:28 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-repoze.lru from 0.6 to 0.7.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce,

This one should be OK.

MarkA


>  .../python/{python-repoze.lru_0.6.bb => python-repoze.lru_0.7.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-repoze.lru_0.6.bb => python-repoze.lru_0.7.bb} (77%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
> similarity index 77%
> rename from meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> rename to meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
> index 3a169b0..264a1cb 100644
> --- a/meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.lru_0.7.bb
> @@ -8,7 +8,7 @@ SECTION = "devel/python"
>  LICENSE = "BSD-Modification-copyright"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
>
> -SRC_URI[md5sum] = "2c3b64b17a8e18b405f55d46173e14dd"
> -SRC_URI[sha256sum] = "0f7a323bf716d3cb6cb3910cd4fccbee0b3d3793322738566ecce163b01bbd31"
> +SRC_URI[md5sum] = "c08cc030387e0b1fc53c5c7d964b35e2"
> +SRC_URI[sha256sum] = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"
>
>  inherit setuptools pypi
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


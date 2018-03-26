Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D63B2E00C1B; Mon, 26 Mar 2018 11:25:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70D91E0084D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:25:25 -0700 (PDT)
Received: by mail-yw0-f172.google.com with SMTP id r145so6426577ywe.7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 26 Mar 2018 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ysQPJBIJTEdmSpqO496D0D6iD5vvDPgRVKXvn7DcKl8=;
	b=s0RNjZPFJe4dIubA65OJe243AqhKn5hFrJ4d4HqETV6w/y7mYdgGvhilJ486r3weZv
	xY1n7Rs2zcbT88XcNGkYilCoM+79lhzf3nKoVMy3nym1D6SkwjzFVBeBGYSXvgEjlsAN
	et99nisX7kgNVhZtFjznFS+wYJcK+V62ixyHegINUFJlxm79p0mHn7SzO593m6bnUxgB
	Qv9/78z0l9EdaFtqnBLpj4USSZsJHossvOacGof+ghC5y3aRh0o2EV3XhfMv6ZWe87hp
	Rt5M3DkRYX17KBxMvN7Gn73po7hSkM9BN9buKLKFhLcq7P1fwtMMLl9DCD26FEcXYMqX
	vwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ysQPJBIJTEdmSpqO496D0D6iD5vvDPgRVKXvn7DcKl8=;
	b=Shdmc9BEDUbUTv+GFpbujY/Ymmridj2ofKyltAaN37IxGf2g7jglG0iMb14eegtX6G
	8oMHEALoKeE5CgQ0CzRaldCwDFq6CKV3VDFXLdYQcG/eXZqNp9jfEMkew/mrDA1sMuN7
	krE+EOxaMejRvl1k1FuTgIj2Tn3Ve3qEMMqOExvY4Te1xwzf60njV4mIF1/gp2jQj+C8
	va5NujeKZmWjusQV97WweFkJIqW/jgL7scZU6AAioBzSYn7osn75VWzgHbXC2Nd0l/Zs
	QrnAT5GOBmBHGX6emi3mOXVUqSJEyV2YQsqX/1H0kLrLUh5FwWGkcBW0+9LoSMJ9whag
	6rdw==
X-Gm-Message-State: AElRT7FQUiJAKwhhk7qBcVmLA1l6UneY+Mw7NluNI+d1OHbIf6TIi+xx
	5t8WohHfVi7sF39/8zHSpJLaNHcMGWqswUN3HWs=
X-Google-Smtp-Source: AG47ELuUE7TCFfJuNUoY+kqS+9KqTzw1h9ig0BvLy6jYZeyQEiiTxd+QQ/x549u+7elV9aycNDSUGgXnW6BEOa7Bv7w=
X-Received: by 10.129.145.209 with SMTP id i200mr23862148ywg.364.1522088724665;
	Mon, 26 Mar 2018 11:25:24 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:25:24
	-0700 (PDT)
In-Reply-To: <1522030294-809-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522030294-809-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Mon, 26 Mar 2018 14:25:24 -0400
X-Google-Sender-Auth: 5KMFn8MSecFMAwK1U-zsFrqOynk
Message-ID: <CAPuovELHhM6ZkCCuGCuzjQRgVZ64czy5ckeSnfeADgWjJWn-eQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-stevedore: 1.27.1 -> 1.28.0
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
X-List-Received-Date: Mon, 26 Mar 2018 18:25:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 25, 2018 at 10:11 PM, Huang Qiyu
<huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-stevedore from 1.27.1 to 1.28.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce,

Should be safe to merge.

Mark

>  .../python/{python-stevedore_1.27.1.bb => python-stevedore_1.28.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-stevedore_1.27.1.bb => python-stevedore_1.28.0.bb} (75%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
> similarity index 75%
> rename from meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
> rename to meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
> index e1c0167..789d76b 100644
> --- a/meta-openstack/recipes-devtools/python/python-stevedore_1.27.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.28.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "80113d0f3b0f4d64107546dde410003a"
> -SRC_URI[sha256sum] = "236468dae36707069e8b3bdb455e9f1be090b1e6b937f4ac0c56a538d6f50be0"
> +SRC_URI[md5sum] = "b736a71431a2ff5831bbff4a6ccec0c1"
> +SRC_URI[sha256sum] = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f973d60b"
>
>  inherit setuptools rmargparse pypi
>
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


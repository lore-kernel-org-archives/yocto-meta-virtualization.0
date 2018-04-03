Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FF98E00BEB; Tue,  3 Apr 2018 07:03:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14E82E00BAA
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 07:03:28 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id q66so6161325ywg.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BlDvy7Czq+sCKI0iC7hL425WUbGwhIDRTn4F3Crn9J4=;
	b=GD+zwWk1YqWttkcefGjz2p1zX8erVsKOQhTKpsYcInXWJeT83rssGvq2UE2/3oNN33
	CQOHko8LVPUVlsr/PQ+w8b0hnmoksoEY618Vrvx/eZjS6TzBPyZEVnkxvyUUM4nefbIo
	6tL2F5lGwxkoDWUm+CNHWMzuzLpCrMJ2Yg6pIfCnq7oRE974y8jvgBIVT1fvGHaefIef
	ciUtVxva0IdqGpVGOFt7JS9B0VWWG9xCcBDK4YnVMYz+Mt/JrYo11h8V1zDKOT36gXWM
	Rxv/2Ro0WGtp/gmrDc3JCVpO6YHbIFCMIXE9JGpuxwYAe8aTDwhBSe6PMVBqJb7hhbYN
	cqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=BlDvy7Czq+sCKI0iC7hL425WUbGwhIDRTn4F3Crn9J4=;
	b=BFEBM8sS7EeZjC25/Cicakuad9nyKQErM0YY2iHPYGCE90kUnXJ2hjcm4gk8i4oaBd
	S/4z5gV1wVFPH+TXRlPKEa9wCN/rI0QZEeOjGXQh6Bh2NcXd6B/2nlu+jB/dbQSl3hNf
	cs1Kme6SsHzeHr4ObcfSwN6yN/2AsCnH9lC+7p2D4voZrVNGJ5lrj9xP0P7eR30N+3Bf
	MFrPwH9nJZMX/lfqzoUb2aRAkZuYhjE05hivW+gW2S6diygK6JkZbNb42roJja/kwHST
	KK/rw702xqDVByCkw5eq597M61A5iolxqL+ZHfp1nVL/SwglYg/W8vg7fF6/2qeAp8GI
	RVlA==
X-Gm-Message-State: ALQs6tCLhQUR62lKNtfJR3Hh9TKxOE7O6lI6b8BFYPZ/b0t3Yst0kBbH
	d0M8KVKpEkoO55oz5XQ49KnNFuyYMtuJ+IWBDMHx1A==
X-Google-Smtp-Source: AIpwx4+sPjHP/x3EFMn3xOx3e43wSK8R4V8i2s0if6mmbp0EXMtwMi6lBJdbZvnk9d2vC5RHQ0s+baC3niauoCoC0cs=
X-Received: by 10.129.145.209 with SMTP id i200mr7869795ywg.364.1522764208161; 
	Tue, 03 Apr 2018 07:03:28 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP;
	Tue, 3 Apr 2018 07:03:27 -0700 (PDT)
In-Reply-To: <1522402120-7482-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522402120-7482-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 3 Apr 2018 10:03:27 -0400
X-Google-Sender-Auth: Us6tS7q0ZUy5VS0-RXmznw9h4aw
Message-ID: <CAPuovE+N=9B56sKznUyBT7SJ9N6DsCJUxBqpU3p8CeCKppSMuQ@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-waitress: 1.0.1 -> 1.1.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:03:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> Upgrade python-waitress from 1.0.1 to 1.1.0.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce, this looks save to uprev.

Mark

>  .../python/{python-waitress_1.0.1.bb => python-waitress_1.1.0.bb}     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-waitress_1.0.1.bb => python-waitress_1.1.0.bb} (62%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> similarity index 62%
> rename from meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> rename to meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> index 49c637b..f85f3a4 100644
> --- a/meta-openstack/recipes-devtools/python/python-waitress_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-waitress_1.1.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
>
> -SRC_URI[md5sum] = "dda92358a7569669086155923a46e57c"
> -SRC_URI[sha256sum] = "2daacaece189ede6a23440afe03bda58089a6207f1d80a1e9497f979dfb741fc"
> +SRC_URI[md5sum] = "0f1eb7fdfdbf2e6d18decbda1733045c"
> +SRC_URI[sha256sum] = "d33cd3d62426c0f1b3cd84ee3d65779c7003aae3fc060dee60524d10a57f05a9"
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


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C676E0087C; Fri, 20 Feb 2015 19:13:31 -0800 (PST)
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
	*      [209.85.217.172 listed in list.dnswl.org]
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B975E00837
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Feb 2015 19:13:27 -0800 (PST)
Received: by lbjb6 with SMTP id b6so9687344lbj.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Feb 2015 19:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=D6l+Yy/5eosTRMOUOTi4fMnEGqdJZ8ck4muI20iEZcw=;
	b=eakEP+F51VPTJid+hZ4W61HMmccS0ZMqUNBu0yIAC1N0t+7em6FTRZBJZZNQJJ50Kb
	VxT47RTAI69QaHkrz5npijPbQOd6EoAK18fcD4TEREHhy3VUS2Bv54LVVowL5DUHCWgh
	LEBekyFlk59qZ1rHt+d6E5ein47aSSp+OuakTSyRTzk7UYZ9Fr13n3ankBEC/rcTAJaP
	HZtUwHv0ke0FfUmL+zmPky9ZybRpX9Dp5cHKpVMt+/D6welI8Si+fXTsDpsf+O9EqVC+
	0FI4YuVv+EdCHl2AlVZ59nIpn1Eodh16TqDezPtudLP+RX5KzrsC4awYIOjnk6yrDVpH
	OSJw==
MIME-Version: 1.0
X-Received: by 10.152.87.178 with SMTP id az18mr583927lab.122.1424488405514;
	Fri, 20 Feb 2015 19:13:25 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Fri, 20 Feb 2015 19:13:25 -0800 (PST)
In-Reply-To: <1424200164-25668-1-git-send-email-tudor.florea@enea.com>
References: <CADkTA4NfzJFSRbj2mx-G--amEt91EkE=Zw5bQUpRC82s-9brTw@mail.gmail.com>
	<1424200164-25668-1-git-send-email-tudor.florea@enea.com>
Date: Fri, 20 Feb 2015 22:13:25 -0500
Message-ID: <CADkTA4M+wd=R2+aXbSt5AOOrpU7_PAcgUJffUD1OwObxCAR5RA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 1/1] iproute2: remove patch already applied
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
X-List-Received-Date: Sat, 21 Feb 2015 03:13:31 -0000
Content-Type: text/plain; charset=UTF-8

Thanks. I've applied this patch, and will push it once build testing has
completed.

Bruce

On Tue, Feb 17, 2015 at 2:09 PM, Tudor Florea <tudor.florea@enea.com> wrote:
> Remove the patch 0003-Don-t-enforce-that-dev-already-exists.patch
> as the similar patch exist in poky git repo added by
> commit 673bb3cffc1fdedb7c25178233c8699650194545
> Author: Roy.Li <rongqing.li@windriver.com>
> Date:   Wed Oct 29 14:01:07 2014 +0800
>
> Signed-off-by: Tudor Florea <tudor.florea@enea.com>
> ---
>  ...003-Don-t-enforce-that-dev-already-exists.patch | 27 ----------------------
>  .../iproute2/iproute2_3.16.0.bbappend              |  2 --
>  2 files changed, 29 deletions(-)
>  delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch
>
> diff --git a/meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch b/meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch
> deleted file mode 100644
> index b296abe..0000000
> --- a/meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 4a5577fab7490573ceaafa6e4417cf03bca178f1 Mon Sep 17 00:00:00 2001
> -Message-Id: <4a5577fab7490573ceaafa6e4417cf03bca178f1.1407786415.git.agx@sigxcpu.org>
> -From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
> -Date: Mon, 11 Aug 2014 21:41:51 +0200
> -Subject: [PATCH] Don't enforce that dev already exists
> -
> -Commit 9a02651a87d0fd56e2e7eedd63921a050a42b3ec tried to make sure
> -the device can be looked up but that e.g. isn't true for
> -
> -  ip link add vnet10 type veth peer name vnet11
> -
> -where vnet10 isn't yet existent.
> ----
> - ip/iplink.c | 2 --
> - 1 file changed, 2 deletions(-)
> -
> ---- a/ip/iplink.c
> -+++ b/ip/iplink.c
> -@@ -571,8 +571,6 @@ int iplink_parse(int argc, char **argv,
> -                               duparg2("dev", *argv);
> -                       *dev = *argv;
> -                       dev_index = ll_name_to_index(*dev);
> --                      if (dev_index == 0)
> --                              invarg("Unknown device", *argv);
> -               }
> -               argc--; argv++;
> -       }
> diff --git a/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend b/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend
> index 8949646..2fde00d 100644
> --- a/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend
> +++ b/meta-openstack/recipes-support/iproute2/iproute2_3.16.0.bbappend
> @@ -2,5 +2,3 @@ FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
>
>  RRECOMMENDS_${PN} += "kernel-module-veth \
>         "
> -
> -SRC_URI += " file://0003-Don-t-enforce-that-dev-already-exists.patch"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 855FEE0078E; Mon, 16 Feb 2015 20:52:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B3EDE00779
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:52:47 -0800 (PST)
Received: by lbiz12 with SMTP id z12so2316468lbi.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3Ue2QAnnjgbgPb48MYjeuwvMgJ3mGcaHZmvi7UJt08E=;
	b=qoGy3sgunN3jRDmr+NOBvEPCz+g++PGvWU1Cetr6EbkMXfBOlE3sw9jbrxCcx0rrkV
	7qw7NoOIk6DpehsX4RjX0/4Gccn4I8lPSCym5mRYZUfYR4zf2QQRxByUn2l08SoA6vGa
	grn2PVdO2Jk3730CVZTAlmLY2qOrlP79wtA8m8mf+08yC+dvhPG71MTw90t0IUs6wg7l
	COMqe2C2XX0mWWQdTxGlVJz54k6a5Olii+oAu/7RgfJ0IJC5uUPVQkcRzH2XaNcSwuEj
	uqICmQXwpUlusXRjfRynY46oT0xeWBKCztJeLGuLpw69kpnN44Il+Kwxj6zLG1cawEXC
	QNgg==
MIME-Version: 1.0
X-Received: by 10.152.21.100 with SMTP id u4mr12960393lae.41.1424148766750;
	Mon, 16 Feb 2015 20:52:46 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Mon, 16 Feb 2015 20:52:46 -0800 (PST)
In-Reply-To: <1423823713-57878-4-git-send-email-tudor.florea@enea.com>
References: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
	<1423823713-57878-4-git-send-email-tudor.florea@enea.com>
Date: Mon, 16 Feb 2015 23:52:46 -0500
Message-ID: <CADkTA4NfzJFSRbj2mx-G--amEt91EkE=Zw5bQUpRC82s-9brTw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/3] iproute2: remove patch already applied
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
X-List-Received-Date: Tue, 17 Feb 2015 04:52:50 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 13, 2015 at 5:35 AM, Tudor Florea <tudor.florea@enea.com> wrote:
> Remove the patch 0003-Don-t-enforce-that-dev-already-exists.patch
> as the code is already applied.

We should be documenting the meta-oe, or upstream commit ID that made this
local bbappend no longer required.

Since the revisions of meta-openstack and meta-oe float, and are different for
everyone .. this is critical information.

So can we get the patch header updated with that information ?

Bruce

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


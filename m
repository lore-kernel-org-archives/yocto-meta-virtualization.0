Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F626E00BEA; Mon, 25 Jan 2016 15:24:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.223.194 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAC2BE00BE3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 15:24:31 -0800 (PST)
Received: by mail-io0-f194.google.com with SMTP id k127so14863327iok.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 15:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HDIVR3V67Qm4TL6arrzg7cLD5coBNFHxipWZ0LPvanU=;
	b=OSd2WPCt6hFK8FAGSstDvzbh/GjUlaaKV11uERk/2dZwe+vTQt7wq3LlLo56HgwJNm
	UAE3MniFPaI9n6o8YaB8CAGWTgQ0PjDDmavQrj0HxawpwOC8XwlXXfxRV7hWj3yIFsMP
	7N24hi0gX1oS5vOIRBcSQ5T3qZdA1rVjTLVw2zNVcAwOJ/6Ulk7D4uy6rDdHL6eRuDG+
	nEiP88kpvelJRIdZM4smop0TzARpgu69o+c3XQQrNkfLSNMssE9yv4FWslhaQRvNmgn5
	FumNUsBhbUAhJoJMXQZ3d1llHeZdpzSG8rcy0OeBp1+QF6La8VGlyTBPTZ3K6rUuLs4S
	bPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=HDIVR3V67Qm4TL6arrzg7cLD5coBNFHxipWZ0LPvanU=;
	b=cVniqjVeJ7p66xYwP36Dbkoup4gkePiSqvc7ySOv9eSKWqsNgFnPzRzeKaUlTJiSL+
	dqQ1DLJO+aMPxsRwCAgdLqwarmQ94xqBgW/7/6U4qXqe1FMuf2QaYumox2lr6264K20W
	xEqEZ0RU2WhKGQZnJKds8w9X7QuJicvE9iwzVT6x3IHzGIc4Wq0MrSh3Ovztw9jVlqbO
	jhdByYP0fJQSPzKPLCV9Pb7+XWH5axLHTJFRSxgm0043jdbyOprvx/3qG5Ri9cI/sBu/
	C4Fk0RAEKuM62hyRAhyQWSsDgwRFk2Ls7B50nblmOu68mJlAukPBsB9qm4M36F+cC8aM
	pnpA==
X-Gm-Message-State: AG10YOT1aANerdZl7OzytKPxqc51oJSpkWBNWqXefsPsBhT2EIzeWM4bBft5gXI4wwtxG8eQSH2nGXLvj1zdhg==
MIME-Version: 1.0
X-Received: by 10.107.12.22 with SMTP id w22mr23400700ioi.8.1453764270991;
	Mon, 25 Jan 2016 15:24:30 -0800 (PST)
Received: by 10.79.125.142 with HTTP; Mon, 25 Jan 2016 15:24:30 -0800 (PST)
In-Reply-To: <1453735752-966-2-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<1453735752-966-2-git-send-email-cardoe@cardoe.com>
Date: Mon, 25 Jan 2016 18:24:30 -0500
Message-ID: <CABZSBQcLHD9Kz56ysb-xe1jHWoAH7gvQYswOXsv4gmBJBJafeA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/5] xen: drop explicit DEPEND on libgcc
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
X-List-Received-Date: Mon, 25 Jan 2016 23:24:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 25, 2016 at 10:29 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> The ELFs that get built in the 'xen-xl' package do not have a NEEDED
> entry on libgcc. 'xen-base' is a meta package and itself should not
> depend on a library like this. Yocto checks the NEEDED of the dynamic
> section and automatically includes those libraries as dependencies.
>
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index c63cb2c..c0acbcd 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -54,7 +54,7 @@ DEPENDS = " \
>  RDEPENDS_${PN} = ""
>
>  RDEPENDS_${PN}-base = "\
> -    libgcc bash perl xz \
> +    bash perl xz \

Makes sense to remove from the meta package, +1.

>      ${PN}-blktap \
>      ${PN}-console \
>      ${PN}-libblktapctl \
> @@ -137,8 +137,6 @@ RDEPENDS_${PN}-xendomains = "\
>      ${PN}-xenstored \
>      "
>
> -RDEPENDS_${PN}-xl = "libgcc"
> -

The commit that added libgcc warned some operations may not work:

commit c93bc0c0185da21482164d9f76047715349cbb17
Author: Philip Tricca <flihp@twobit.us>
Date:   Thu Jan 23 03:19:33 2014 +0000

    xen: Add libgcc as runtime dependency of xen-xl package.

    Much of xl operates fine without libgcc but some operations complain
    that pthread_cancel won't work properly without libgcc_s.so.1
    installed. The exact text is:

    libgcc_s.so.1 must be installed for pthread_cancel to work

    Signed-off-by: Philip Tricca <flihp@twobit.us>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


Given the above warning, I went ahead a did a test. I took my image
which had libgcc-s installed anyways, moved /lib/libgcc-s.so.1 to
/tmp, then attempted to create a VM:

...
domainbuilder: detail: xc_dom_gnttab_hvm_seed: called, pfn=0x10f000
libxl: error: libxl_dm.c:1854:device_model_spawn_outcome: domain 4
device model: spawn failed (rc=-3)
libxl: error: libxl_create.c:1341:domcreate_devmodel_started: device
model did not start: -3
libxl: error: libxl_dm.c:1964:kill_device_model: Device Model already exited

libxl: error: libxl.c:1591:libxl__destroy_domid: non-existant domain 4
libxl: error: libxl.c:1549:domain_destroy_callback: unable to destroy
guest with domid 4
libxl: error: libxl.c:1476:domain_destroy_cb: destruction of domain 4 failed
libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted
...

So, I imagine that this patch is probably not wise, at least for my
environment :)  Although, it would appear that qemu pulls libgcc into
my image regardless.


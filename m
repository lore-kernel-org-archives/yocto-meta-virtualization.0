Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2519.1574716563479139938
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 13:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BClcf4MK;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50DA6E00E5C; Mon, 25 Nov 2019 13:16:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27D5AE00C0A
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 13:16:02 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id a67so14110670edf.11
        for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 13:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYC8UcU53YOkLHiqGq/WbMCbT6ZmXmxrQ3Fj2X3ZrMg=;
        b=BClcf4MKUU3xbXEBzljtkFhjEzyHpAd6OV0J8BMO3jCe804AVt+WNVFnmLK32WUIUT
         r88GakdwAX3TXK5E5vgOiXbhiNhgcLmXJ9rJs76/Yqdpa7Kh3wUgNq/5klwj2ryIlpNm
         UHFHmIRRuazJJ8vzDQocH4T6onvbmPnKU0xjtsTx+4ODXpCA39sqlPOtIWau4KNwv1yQ
         RXv1FunSPwwAeaw0O/f0nud7fE7DnQv8jAR6lqrVCf3k7nwNeIVLzVHTTJMLny0Lm27z
         Ox9tCdmlD9P22OvcNVwPBDZ6vfZ8byt36rJqmxvQvwBcLc6r5VcfdRA7R/JyjGqHfJmh
         yoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYC8UcU53YOkLHiqGq/WbMCbT6ZmXmxrQ3Fj2X3ZrMg=;
        b=IJ92/cg5D+dTqRn1n2y7FqCymc9LrqlxtoUEH2NzB0Mu3L2/jZjoTJcZXidGwIJwse
         u7OGaM8YoI57dXqR6c9LIAhNtE8ZKc1itgTndNMyhqJ4qwulaVL1+O2/k8deSam117my
         UKYQrTotjuLk3RgLhjVEc54g2cRoERNh9hmV99uwqQw4Mo4yHQ8YG928ByrcIPAcdES9
         LQA+1BIQf52AnA77smXAyLvg8/XBvrZCi+eQui8P8yyfSeRGri4XLRo3/qIWn28bnv0N
         XxvwJGvdfPHaX6pOed6MG4kn1yW8MmWo06N7KDqc2GNRPfD3z+QA9TF0hD33BYs9h5gP
         BceA==
X-Gm-Message-State: APjAAAW3J+vTAdhYuZ0jXRaIDsI6l4v7o10/dMV42tICvjjgw0ZzoRnY
	SIEbtUoP8VJ79wjK71HowJdb0LETrGzSbEtbpE6+U/Xb
X-Google-Smtp-Source: APXvYqwtWb67hWfrGInjYx4vLb2ZdR2gT8DYPBd2XFk6+ZLnJ78Iv5+VcIG4lFoGEHp3MKmksD3vL9zHKZoCROM0y3w=
X-Received: by 2002:a17:907:42d3:: with SMTP id ng3mr13651127ejb.9.1574716561068;
 Mon, 25 Nov 2019 13:16:01 -0800 (PST)
MIME-Version: 1.0
References: <2ed2e82f-ad3e-a61b-0511-69c47eb8cce2@3mdeb.com> <d82e5ef6-6ddd-4d21-9137-cbd8e9158370@3mdeb.com>
In-Reply-To: <d82e5ef6-6ddd-4d21-9137-cbd8e9158370@3mdeb.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 25 Nov 2019 16:15:49 -0500
Message-ID: <CADkTA4OGrbXRbDrqr6n5323vjxetAeheaXyMjFNJ2DOGi+sy9A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker.inc: Add xt-addrtype kernel module
To: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>, piotr.krol@3mdeb.com, 
	Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 22, 2019 at 9:36 AM Norbert Kaminski
<norbert.kaminski@3mdeb.com> wrote:
>
>  From 585f3e4a1da40528b2d8eba0bf46033fdf5e310d Mon Sep 17 00:00:00 2001
> From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> Date: Fri, 22 Nov 2019 11:27:18 +0100
> Subject: [PATCH] docker.inc: Add xt-addrtype kernel module
>
> Trying to use docker info and hello world container without this module
> causes a daemon error.
>
> docker info error log:
>
> Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the
> docker daemon running?
>
> dockerd error log:
>
> PREROUTING chain: iptables failed: iptables --wait -t nat -A PREROUTING -m
> addrtype --dst-type LOCAL -j DOCKER: iptables v1.8.3 (legacy): Couldn't
> load match `addrtype':No such file or directory

I guess most of us are running with "kernel-modules" in our packagegroups/image
installs and haven't noticed this.

I'm ok with the change, but something has corrupted your patch. How
was it sent ?

Bruce

>
> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
> ---
>   recipes-containers/docker/docker.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker.inc
> b/recipes-containers/docker/docker.inc
> index 0083902..32d4a2e 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -29,7 +29,7 @@ RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                    "
>   RDEPENDS_${PN} += "virtual/containerd virtual/runc"
>
> -RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat
> kernel-module-xt-addrtype"
>
>   PROVIDES += "virtual/docker"
>
> --
> 2.17.1
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4734): https://lists.yoctoproject.org/g/meta-virtualization/message/4734
> Mute This Topic: https://lists.yoctoproject.org/mt/61663735/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

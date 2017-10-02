Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 314CFE00B53; Mon,  2 Oct 2017 10:12:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47D93E00A9C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  2 Oct 2017 10:12:55 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id b21so2268145qte.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 02 Oct 2017 10:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Rq+FsX731pdrEmEInAR39Lv6zC8GRkpI2MfxnASIk4=;
	b=DhFU483MgRnWJYFzMFUMv25PPRZ0kGBunIP4S+WOdofCqRv7Y/EmnqLV2uKtnu/KDr
	BtD5FFdpHuqKgRbednYMmvsw2+t9nBSosyTCJSFogdx64xFuexYsqYZlQI3H5tMwVQLd
	OX2onhzYkZ31KjH4IKd/9un3nlaI8bvJFqzYKDb4I09mdwvq7Ooj6eQu+7tWEFkPdOfa
	c/EwHOFGowJ7U9+PJ3Q9Pgq/p7F8ij8johFkYtwuwFnxYWchmmGOPsm+c1DtW4UIa/ec
	VOjIzv9HMHkwbOeaepLWLjxCdvRjWz+kG+81iQRkHIdVTK22kzdbMbZmzd8fg4wiQ5Xl
	1Yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Rq+FsX731pdrEmEInAR39Lv6zC8GRkpI2MfxnASIk4=;
	b=WqdDzkW30vNiJ/UrIlS3d7ANAISrcyy76FrzEUCV8z+Y3oNG4eSdzi/YA++acUVWPI
	x+rb85sRQc/rKRkuzP+Veut3moAJOTjis5bxx5lOLzTVT8pBts/Nj0dcVZSvQOLcENwN
	WN5Z7iyRmWJWPM0o1sLV71Nce3ZIFFtrmD0kSssLNM7lDabG+UELBm7Qxep0DtIHTGV7
	zuEkhTj4sYgPTPkSwNkWE8Bz7ePBiQ7iUv97QDK2g2RogN5As+OEkg1c5KglTj34W2++
	rlj0sTn/DeE5k2J4qBom1J976m5o+cIWzR6DXM7kqALdlCpWtpcbHK6OjujoHwbx4Tap
	5tGg==
X-Gm-Message-State: AMCzsaWAQtoI240C7Gn43vcvC87JaFn9JZFr/DObQ7ycViXyuCtEVGfb
	HOyOBQuCBEdCRtV9lzipSay1/NDttu8RIr3wQO9w7w==
X-Google-Smtp-Source: AOwi7QCtSoHt5oUEMJLQSVJmIKcFMFEZRIz1Vbia7Mkh5L5U+Zz9GZ3d1mZlLY0qX7dg+vNK6+N2BiS5SGlIxELcTuE=
X-Received: by 10.237.59.77 with SMTP id q13mr20146205qte.80.1506964375216;
	Mon, 02 Oct 2017 10:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.208 with HTTP; Mon, 2 Oct 2017 10:12:54 -0700 (PDT)
In-Reply-To: <20170930030617.21104-1-Qi.Chen@windriver.com>
References: <20170930030617.21104-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 2 Oct 2017 13:12:54 -0400
Message-ID: <CADkTA4NNPF4v4nArrR94Wcxp+kJi3c-5WXinU=qrqjxp2AQruA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V4 1/3] sanity-meta-virt.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Mon, 02 Oct 2017 17:12:57 -0000
Content-Type: text/plain; charset="UTF-8"

v4 is merged.

Bruce

On Fri, Sep 29, 2017 at 11:06 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> Add a new class, sanity-meta-virt.bbclass, to check for whether necessary
> settings are available for bbappend files in this layer to be effective,
> and warn users if not.
>
> In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable users
> to explicitly skip the checking to avoid unwanted warnings.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  classes/sanity-meta-virt.bbclass | 10 ++++++++++
>  conf/layer.conf                  |  4 ++++
>  2 files changed, 14 insertions(+)
>  create mode 100644 classes/sanity-meta-virt.bbclass
>
> diff --git a/classes/sanity-meta-virt.bbclass b/classes/sanity-meta-virt.bbclass
> new file mode 100644
> index 0000000..bd2b717
> --- /dev/null
> +++ b/classes/sanity-meta-virt.bbclass
> @@ -0,0 +1,10 @@
> +addhandler virt_bbappend_distrocheck
> +virt_bbappend_distrocheck[eventmask] = "bb.event.ConfigParsed"
> +python virt_bbappend_distrocheck() {
> +    skip_check = e.data.getVar('SKIP_SANITY_BBAPPEND_CHECK') == "1"
> +    if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split() and not skip_check:
> +        bb.warn("You have included the meta-virtualization layer, but \
> +'virtualization' has not been enabled in your DISTRO_FEATURES. Some bbappend files \
> +may not take effect. See the meta-virtualization README for details on enabling \
> +virtualization support.")
> +}
> diff --git a/conf/layer.conf b/conf/layer.conf
> index be08a98..51ca8ee 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -22,3 +22,7 @@ require conf/distro/include/virt_security_flags.inc
>
>  PREFERRED_PROVIDER_virtual/runc ?= "runc-docker"
>  PREFERRED_PROVIDER_virtual/containerd ?= "containerd-docker"
> +
> +# Sanity check for meta-virtualization layer.
> +# Setting SKIP_SANITY_BBAPPEND_CHECK to "1" would skip the bbappend files check.
> +INHERIT += "sanity-meta-virt"
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


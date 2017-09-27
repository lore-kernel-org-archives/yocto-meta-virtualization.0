Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32C2EE00CB0; Wed, 27 Sep 2017 07:02:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.196 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99BA1E00CB0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Sep 2017 07:02:45 -0700 (PDT)
Received: by mail-yw0-f196.google.com with SMTP id v72so6808079ywa.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Sep 2017 07:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=54NaVaVMI4T61lKVAk0S3WV3e08sB4RkAox6NOoyc5k=;
	b=rteKQcP2/7to3DPvzyadoBrC+J8WGzDRsr+oD0OERL4TCgZYqTVfU1yPjKlrTsg1ZZ
	4gXgfjCtxeT9RHlKpdlaVRnxXj+4MP6WJvbK3EbONbH/6GV6epQIoaZNPrKuCcoitzkV
	e3QkSOOTQ8lb7m0sA01QyfwsuIfFPHVtCWbLXGsoA2fkiU8foJW0nugn6xBzw9Kasuev
	RC3XrF//KqdESD+GIWqWmv/WbDoDnNdGSPALlrwEUnTGsArOlC+zV3I+u8u0E0IIiorJ
	j2TgH3Fj9Lznbh6U3+xV+oEwhjMzwj+yYgI5w+bDY3FtK6guQJooF2HTrSsT2E6teIpD
	xnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=54NaVaVMI4T61lKVAk0S3WV3e08sB4RkAox6NOoyc5k=;
	b=K47IZPZ2zeU6tMWnOL+b1jk+snaWWw+Nw5FraiPqCc2+e17Ff9MyhsQ2n5fOWRGlFD
	xk8vbFIjJFfO3bJ5BzdwqBQMtnB0liGJBM3Qz2NxACuRZkZclEWSgDALST5C4F2otGGp
	F5ddwusTxhwjG7XPR3lTdzasTQSSaGdwNTl0+zfomXqZMS755qyNWVGbZnbeg55qXFGK
	azIxBypJ7sHal5bzMXpzHknYLmGjNTjK2sYlBD/LnqJIHx5swEEx4IcPPYuj4tmgKws8
	qwcs5LAIihu+mxomulKGG6MEifHu1LsAIlZO5DZIA3E9vgpJtfUB51AeFASuW6pBioet
	EnJQ==
X-Gm-Message-State: AHPjjUiXYhyPNBbPDhK/qH4G1sdC2mO50ycgQ1DK6K530xIH6LR8+Os0
	8oKaG25HphDp1755dIMwtCd1iP9dOQls8q4Q7dghdA==
X-Google-Smtp-Source: AOwi7QCZqiAcW+b98oBwp1xLsb1NkFugU7xkrOdR30Icxp0QOhQUBmqo2kXMrImg8Pp5Wt038WtJZHFG8ewBa0eEWKE=
X-Received: by 10.129.165.202 with SMTP id c193mr1005746ywh.171.1506520964558; 
	Wed, 27 Sep 2017 07:02:44 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.172.167 with HTTP; Wed, 27 Sep 2017 07:02:44 -0700 (PDT)
In-Reply-To: <20170926033105.15731-1-Qi.Chen@windriver.com>
References: <20170926033105.15731-1-Qi.Chen@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 27 Sep 2017 10:02:44 -0400
X-Google-Sender-Auth: UaSM-qgVhKUxLLBYoBTRFidOlfw
Message-ID: <CAPuovELG0+f+Y_CAm+2j9G9sjvE=PsiAHT9b0rG0_ech=MyqRQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V3 1/3] sanity-meta-virt.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Wed, 27 Sep 2017 14:02:46 -0000
Content-Type: text/plain; charset="UTF-8"

Any plans to send out a similar change for meta-cloud-services?

Mark

On Mon, Sep 25, 2017 at 11:31 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
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


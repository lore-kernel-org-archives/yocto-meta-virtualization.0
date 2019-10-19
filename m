Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21822E00D82; Fri, 18 Oct 2019 21:38:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54476E00D72
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:38:30 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id r2so6174702lfn.8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=alwQjdDsg/XpmLL41R+I/0q758Bk16Hz2t1GtzZnXzg=;
	b=t/+3/Nn79qv76OrZZSHYryOZR7cf12mqilWRcr/tnfykcQcuOgM2aCmSE9AMipMQ+3
	Zd1IOgoub9lEAONodLymTZJk4aYswyKBhgJm5nM9l3Q26UvYGZIP08kZxguNbLCgm9Ua
	3coO4CIQx6PS7EK7nRyNLXXtif7ms5yyn6eaIXYPCftrD+1y7DUvI8hUioaM2xdiRMhj
	UjGaHrPLoOZYq2rBUquT1u3NVPg5VTFQLpDjbi5Iml4Cf8WVSOpf9oiJbbeFQeGBQfuL
	lO4JTdzMtMN8JfbD7jeeyZ1doIppmUGwUIsS25Xk0GM3yckXGUHXlDKeqvtyyGGhtZJg
	NiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=alwQjdDsg/XpmLL41R+I/0q758Bk16Hz2t1GtzZnXzg=;
	b=G1qDaEQVafBLJv4js4cYdx0yPguQWUqn6u2uHoEt2lwUMyXqnHcWsXDUgbaopjUXVX
	3C+Y3i6gGsX2lhrY4T2mIoI2uxt7e+U+rqD0jkTmbj42GKt+PswWSNJ4goqQpB3URLMY
	W0iXsVIOJd7QmoyKH+cc6ObNcrzt0eItSfWO3GialLeycqgAp59qppf2WSgsuj61krGE
	lcrR3R4witPk8rvgiaNWk7sFDNtHu1y/f+iRyb2WVY6fTEbHov+RtUq3Zh5CZp0lNyEG
	7nsXOM2ljIkYMCW5whJnRcV5v/r0DZWWOPfFjOXvz5Hc3hK2u/oUOhvQPuwzDyNFsAzD
	mkWQ==
X-Gm-Message-State: APjAAAWf8SmpKQpSkvIfpqfGhXYAJuf9ulYAEVWUTqt/UZ8pmDzSf4Yl
	RjCz1326NbVhDo2Izz9/Ej1U3U6PgzjtAhurG4HPH4soBgI=
X-Google-Smtp-Source: APXvYqy24chZtr4qODOgQ3pZrlxwsN6GeUqzS89r0pIzvlikrZtSFJknkelEPmUTm4crzf/KTBAqhU3ZWrPbTk8uYEI=
X-Received: by 2002:a19:ac04:: with SMTP id g4mr8090135lfc.63.1571459909176;
	Fri, 18 Oct 2019 21:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191018082022.7664-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191018082022.7664-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 19 Oct 2019 00:38:17 -0400
Message-ID: <CADkTA4Nzou_9f2ORUGsggzs9X9mtKAufuyjRBiBdhvoN+TBEHg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-httpretty: upgrade 0.9.6 -> 0.9.7
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
X-List-Received-Date: Sat, 19 Oct 2019 04:38:31 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Oct 18, 2019 at 4:20 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-httpretty.inc           | 4 ++--
>  .../python/{python-httpretty_0.9.6.bb => python-httpretty_0.9.7.bb}   | 0
>  .../python/{python3-httpretty_0.9.6.bb => python3-httpretty_0.9.7.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httpretty_0.9.6.bb => python-httpretty_0.9.7.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-httpretty_0.9.6.bb => python3-httpretty_0.9.7.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty.inc b/meta-openstack/recipes-devtools/python/python-httpretty.inc
> index f39e283..97bd6b3 100644
> --- a/meta-openstack/recipes-devtools/python/python-httpretty.inc
> +++ b/meta-openstack/recipes-devtools/python/python-httpretty.inc
> @@ -7,8 +7,8 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
>
> -SRC_URI[md5sum] = "3b881b519e0f405caaf8aaa63f3508c0"
> -SRC_URI[sha256sum] = "01b52d45077e702eda491f4fe75328d3468fd886aed5dcc530003e7b2b5939dc"
> +SRC_URI[md5sum] = "2fc3d0dc986200be95ce8ad3ef56bc04"
> +SRC_URI[sha256sum] = "66216f26b9d2c52e81808f3e674a6fb65d4bf719721394a1a9be926177e55fbe"
>
>  inherit pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.7.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-httpretty_0.9.6.bb
> rename to meta-openstack/recipes-devtools/python/python-httpretty_0.9.7.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb b/meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-httpretty_0.9.6.bb
> rename to meta-openstack/recipes-devtools/python/python3-httpretty_0.9.7.bb
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


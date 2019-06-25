Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5C85E00D36; Mon, 24 Jun 2019 21:08:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7960BE00D30
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 21:08:10 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id i21so14749681ljj.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 24 Jun 2019 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0PrimMw62v5v2BVkYTuv7Mvt/NE/8lKs6IclLqGNmCE=;
	b=i+buQ5caC57K2SpEoQJTqOef1J0cxh1ODaVUmS87kqB2Uy4Kur2RHTljLgD18fS577
	oEoa3IVdWoUiveRsxRWBfPEp81v4XgwC3rb5NZlOaiUE/8RqlEACHVIiOR05FdbKR8Vd
	ldqdrahd29hsAjKWMT8ciiDF1xYC56aiP6tTZ+GCrpcu4B7+GJl5I6CEzcfhhYbNuhOr
	gU/vI0TqWDGmMCO5YCyWsJ9LHGkfoJ5IfiC42mSz4z2zJ9OP14i/c6emRaFF9FL/GbdC
	EXRD6Gmb+IVH5z4w91MKDnjuX20mhLJa8L/+dmxefmCbxS1MPn6A4RQF5SDbVJR7yCef
	EGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0PrimMw62v5v2BVkYTuv7Mvt/NE/8lKs6IclLqGNmCE=;
	b=Bxdq5s85qAEctVj9qvve3fypPo0puuEj8jJ0zJityd4sk5i9wm5LnLkbT/e3ZXEHgx
	J3Hhc8AAC5b15gObVAVNvRyu0vtdzBgsAbVk5kPh4cej7DCHe/ggGyHJ5Lx/ZQG6BXxu
	ZyucehHQmkvbnl4A50nIN2c+DMPC513QVP+MAKWEI58tWPzMzu2MyzdqKio1aT9yXSks
	hhhkKBHnJa22pC9Kfi6wao8h5GyUZvgGqPlpr3w2xu+qmzSvpBaFF3RdLirivQ0WnvXY
	Vb6AURRab8IflXUkaPC+cKcA+2L+oOsZB/E76VIXiIQnuX5lKlmo6dudZccR0E/Htwvm
	D9AQ==
X-Gm-Message-State: APjAAAWQ1sqC2WQtTALOpHVVn+Hdp3K9Xu1ZyIv707YLeNwImxwmI8V0
	5B1gF1O6FN+3iXuMD06MoeXBAkS4sK0kb/81ZFNMULII
X-Google-Smtp-Source: APXvYqyQX/17w3wXxd5dW8Fdax368d+3RWF8LA1C44lbXiB8V4Yy2upoyRroWxHow6igsdZH/0P0hsCjw0i+RdNKEKs=
X-Received: by 2002:a2e:5cc8:: with SMTP id
	q191mr55303652ljb.118.1561435689300; 
	Mon, 24 Jun 2019 21:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190624124738.32563-1-stefan@agner.ch>
In-Reply-To: <20190624124738.32563-1-stefan@agner.ch>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 25 Jun 2019 00:07:57 -0400
Message-ID: <CADkTA4MQ84YKdmuYY-d7XkMpqkMdfcZ84O0ffU6d=ejJK7kMVA@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: meta-virtualization@yoctoproject.org,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] docker: readd docker-init to RRECOMMENDS
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
X-List-Received-Date: Tue, 25 Jun 2019 04:08:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 8:47 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> If docker run --init is used docker expects docker-init to be
> present. However, it has been removed by commit d19fda374317
> ("docker: consolidate common depends/options"). Readd docker-init
> to RRECOMMENDS to make sure its typically deployed.
>

The more I think about it, this should either just be a RDEPENDS all the time ..
or a PACKAGECONFIG RDEPENDS.

Since it is functionality that docker may look for, the RRECOMMENDS seems
to weak.

Making it a packageconfig gives us the most flexibility, since it hasn't been
installed since I did the re-work, and no one else has noticed :D So if we make
it a packageconfig, it is trivial to add for anyone that wants it, and we can
consider making it a default packageconfig in the fall release.

Bruce

> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  recipes-containers/docker/docker.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 168d296..e4ff353 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -29,7 +29,7 @@ RDEPENDS_${PN} = "util-linux util-linux-unshare iptables \
>                   "
>  RDEPENDS_${PN} += "virtual/containerd virtual/runc"
>
> -RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
> +RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat docker-init"
>
>  inherit pkgconfig
>  PACKAGECONFIG ??= ""
> --
> 2.13.6
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


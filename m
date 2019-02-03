Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AFA6EE00D2C; Sat,  2 Feb 2019 19:43:13 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.171 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 119F6E00BAB
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Feb 2019 19:43:12 -0800 (PST)
Received: by mail-lj1-f171.google.com with SMTP id u89-v6so9043829lje.1
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Feb 2019 19:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JdHBVy3FrFq782ae7umDjQ27LsU8e6Ip1ETp3srlmhE=;
	b=LzlvtQv02EQdKfPfxhY2DU86q/eimXB/AINN0R/CNlLUyfF4uDwtlkXwHz20tWoC1S
	tgd5xDMirlhoOV+CFsdfSqh6e0Vx2gmEkCZHMIPmWqZn22fX23NwgRXHMNr0uEB1jftY
	qhI8rgf4SytyP0B+xUwVphfCx1UAARIISV2ypTu5+8qhLTLv7ipO+F35H6dB3csjSdOy
	6Onpw1vt8XJkq86MwxepaiA7oaQjSSTeiu1A7kS2ZjPojRAANhSf/4uxiwqqkZhBDmhV
	aeIAi0BoHbrQ3+LI7o2VThrQXRP0jytNHJycrr5fmuU2mbKNj9YFCac/KwLZpWl3DcY7
	VccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JdHBVy3FrFq782ae7umDjQ27LsU8e6Ip1ETp3srlmhE=;
	b=pENvmHGhyaU/TNMmXnKsDO8CEnSm5TyEKv0JpB5926cAlC62ELDxESVm+kK2d6+YjK
	pLioGw8ekz0m8fitmz/YqYgzsbiLEDMUE19CrBuAhJUebpZM69YqdOQ5FDdDllm56x07
	BOP30WZEr9tdE8JUTonChzQCkKcjumoAWVm3img33crldpZ/fNtgXLp1GyplJg+V1Eip
	B+21IEG97KrYGLDS8m+l8BAK3/9C5muqLAjInDQ1EbvI+ZzdeFny/r3v/1HbEDifDrcW
	uw6/SmfBvbXbLm+TSgOEgX9NajqVBceCEl5e7Z6SKU/CeDAn7YyMW9EE981aNvAbtemT
	0oCg==
X-Gm-Message-State: AHQUAub+Sp+FooyE2HrC34g+niB6ODsc9a3osr8zMow6Dsa1ChwMmjYz
	FMbPoKeL3+IjIxv7/rRZRmfyYOF0bf3iOcs9cgI=
X-Google-Smtp-Source: AHgI3IaCzXFba5+6paTK9/f7iHHpqdAC/5xn2I01jiV3vKLTB/sKyh9dU4ePk0eQ2n7vJnFDj5uRBnxAzmJAflRmDp4=
X-Received: by 2002:a2e:551:: with SMTP id 78-v6mr14539656ljf.82.1549165391861;
	Sat, 02 Feb 2019 19:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
	<20190130004249.20870-4-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190130004249.20870-4-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Feb 2019 22:43:00 -0500
Message-ID: <CADkTA4MT7093d9AB47m3W25LXpOkyD60T+HSBCE88y2bnj-v=g@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [patch]:python-webob:upgrade to 1.8.5
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
X-List-Received-Date: Sun, 03 Feb 2019 03:43:13 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jan 29, 2019 at 7:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-webob from 1.8.2 to 1.8.5
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-webob_1.8.2.bb => python-webob_1.8.5.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-devtools/python/{python-webob_1.8.2.bb => python-webob_1.8.5.bb} (68%)
>
> diff --git a/recipes-devtools/python/python-webob_1.8.2.bb b/recipes-devtools/python/python-webob_1.8.5.bb
> similarity index 68%
> rename from recipes-devtools/python/python-webob_1.8.2.bb
> rename to recipes-devtools/python/python-webob_1.8.5.bb
> index 6fdfbd5..0ce928a 100644
> --- a/recipes-devtools/python/python-webob_1.8.2.bb
> +++ b/recipes-devtools/python/python-webob_1.8.5.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
>
>  PYPI_PACKAGE = "WebOb"
>
> -SRC_URI[md5sum] = "d04756e6683fedddba52eafbe9adf404"
> -SRC_URI[sha256sum] = "1fe722f2ab857685fc96edec567dc40b1875b21219b3b348e58cd8c4d5ea7df3"
> +SRC_URI[md5sum] = "1761f416e8cf53f6fb674149cc223bd1"
> +SRC_URI[sha256sum] = "05aaab7975e0ee8af2026325d656e5ce14a71f1883c52276181821d6d5bf7086"
>
>  inherit setuptools pypi
>
> --
> 2.17.2
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


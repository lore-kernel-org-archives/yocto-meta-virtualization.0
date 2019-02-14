Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9CFFE00B92; Thu, 14 Feb 2019 06:15:00 -0800 (PST)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07972E0048C
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:14:57 -0800 (PST)
Received: by mail-lj1-f194.google.com with SMTP id l7-v6so5351817ljg.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5sjWkBKuzTguzkGCE7aQ/wWCO6SUeWyT7Eu5SiXekWY=;
	b=lQjD1J96GOKmfxuVUYdFoZ9jjfTuPoBaVakKnL072vjlRddZ4MnyVitbz9M6ifZIgr
	s6IkHIkygyDXZeJsnAo1DrIOQ56oPoqlYs93r7HWYt3vm3/bamMNMtGw4Wt7C2ICEkns
	ejNueoZe0//QRb7tr2JceudY9NMseITLA+N9RbhS+xbHgrbOIA0mDGQyNkjnmYG/eea6
	Ri88omxtvIWsYOUcwCAcR2z7bkSFf+gvHX2G0W1W4d2V9ixOn71AGE7SjSDpqVk19OPT
	GZ0NM8bliyLefeSMfKzZlBVz3VmFrTyK9wzOFbc6OA+3byGw8zCX008c9hLaf2Uv4Q9I
	VltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5sjWkBKuzTguzkGCE7aQ/wWCO6SUeWyT7Eu5SiXekWY=;
	b=kMG9vvy6YXwAFAc/Hdsq3V3FEONqG4IvmiDUmJwcdJP4qNszFUEz0l1gCd2UaTbPUw
	R/SSaPrNC/OMaZLVhsJkhI0kBLeU46EIV+/P9zsXkdC/zJKtbd8VXqp/PGfLT6J4+LCl
	ic+GN9NJHYoRGa42Lqn2bqfk4/cuGslpSkp6Oji/J+hR+4kdIP6/1/O5WASz77WA9W3S
	eRIjuQysBhYHpGM3Gw+VevonsN11c6/CpcdCkFxoexyQo28vTDasn8u0GE4L+5j2FjyN
	viQiwawBneZTtVFpFjQcrEUSID3yvHE790pGAcMjFJsOI5+Tm2YWEIxytt43YMaxvwXs
	8TcA==
X-Gm-Message-State: AHQUAuZBBuetwx5hYTBGN9cUvC+Sd0xnNQm0vCsKm8v2wE8bxBcaiM2h
	qZ9gNqFoA7o5Thgc0ON6qjgBgxCk4o6ow5GJnXoduJLILeY=
X-Google-Smtp-Source: AHgI3IaMzQCRtZ9sdaefpqx6fVz7d2nO0TA7ocaUX+6BxqkUVQTmEX6jmDGU4GdQwD5YqVOEg8LkR9dDzs3hnpHK/KA=
X-Received: by 2002:a2e:8e8e:: with SMTP id
	z14-v6mr2579880ljk.84.1550153696745; 
	Thu, 14 Feb 2019 06:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20190214064809.20897-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190214064809.20897-1-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Feb 2019 09:14:45 -0500
Message-ID: <CADkTA4OHi1A0_ft5H8WRjOUSXL5K8chC=NOd8821gOzwqVbyUw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-kombu:upgrade to 4.3.0
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
X-List-Received-Date: Thu, 14 Feb 2019 14:15:00 -0000
Content-Type: text/plain; charset="UTF-8"

What branch is this for ? I'm seeing python-kombu 4.2.2 in master, so
this patch doesn't apply.

Bruce

On Thu, Feb 14, 2019 at 1:47 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-kombu from 4.2.0 to 4.3.0
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-kombu_4.2.0.bb => python-kombu_4.3.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.2.0.bb => python-kombu_4.3.0.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.3.0.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.3.0.bb
> index 47cb5bf..fbbe06a 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.3.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "cb7e668936cd5ffc3232b72a2a4f931f"
> -SRC_URI[sha256sum] = "d601c47312833c0f6f4aaf037f293b2627398d4cf8526e6ba0360287294ee1fb"
> +SRC_URI[md5sum] = "db169da20da23dc7be78681498600ef6"
> +SRC_URI[sha256sum] = "529df9e0ecc0bad9fc2b376c3ce4796c41b482cf697b78b71aea6ebe7ca353c8"
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


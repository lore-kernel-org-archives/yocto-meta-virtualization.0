Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D709EE00E0D; Thu,  5 Sep 2019 07:09:52 -0700 (PDT)
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
	*      [209.85.167.46 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7C26E00BF8
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:09:50 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id u13so2134591lfm.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nWcTq6XGsHF5UySvv7VhoCRt/3qA5ubloFOfQkapjbs=;
	b=Otv72h0I0a6wz9D9Rv7thur8EG8sh/Ea/Y3KCRrcR4wvH+6++sJugGJP+ZIzEsl/iF
	4rvi+b3CahezC05yxD5CXR8WPTk3Wb5SzoQdFiBfyviTJbrz1MX9bFvLzRyYyC2+p5af
	Huiomz4ECzYUzSoJzsShpG7arS5MdoeGykOJllzH/MhY0zl69C3rWwkpjx6MYm2rHYPj
	67oKyEhyrhaL5JP4Z8KLWw3SdJ27tvWc6yFf2r9O1JskiB1phN/JGIwaJyUrIwmhnLi7
	6trb/+zF73EO5BzdhxQWGpj757U46tnyZikWujjY3qNXm8hXUyHSMD4UygmI9UYtn7e8
	NirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nWcTq6XGsHF5UySvv7VhoCRt/3qA5ubloFOfQkapjbs=;
	b=S2QuC3/2LxtqiLoITO4tklTgU6rhapjILXBZw52xzYEF6ZJzVzd1qCnV3aBuO6pGZ6
	keu7k2aV3vM0ABbv3XOAbihTDNAdXSVdsVTaEo5u3dSVCZoa7Ul23kh4mVUhU/jZr/Mg
	c9qaYFIfGXbAWDK+/y9cbZ9JvRCQGBpMTvmJU5Fkp6hN60qFU0v0QScgRokvCRBfFPM+
	uS/ucuqA2u4LAm9XSkDRI65GA1+1gXVLM73BQ348x9JZgcSUbT4IwVJWgR/Mx+zDZGrd
	T6YSwpGCQRMe/VLvFgUPXLmciHS6vA7a2Iclp5Zex7qCYZvPFXvN9gQkL0v5rpL8gBH0
	M+Cw==
X-Gm-Message-State: APjAAAUIApOSCCBGSdBqpSqcWLg5yS+KcpYVrLNkB1MWQZ/TKf40B30j
	WIb+cD+pDQ4Ud2cQ5foocIaxJ2UmudhXltIT2A8=
X-Google-Smtp-Source: APXvYqzTSJayZ0xXHVOUqMdnd9ZmKfJHqNV+njDG2DvFo1JRXCOuujIbKvm2357HBgOK7GAWTiHxAQiatlOPj4ReMpE=
X-Received: by 2002:ac2:4117:: with SMTP id b23mr2607669lfi.36.1567692589469; 
	Thu, 05 Sep 2019 07:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190905031454.39639-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190905031454.39639-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 10:09:38 -0400
Message-ID: <CADkTA4OtTOBKmh7Qb9TUrva2fmt-gFbi9yO9BHuQBtkD35PhVg@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-mox3:upgrade 0.27.0 -> 0.28.0
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
X-List-Received-Date: Thu, 05 Sep 2019 14:09:52 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Sep 4, 2019 at 11:15 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-mox3_0.27.0.bb => python-mox3_0.28.0.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-mox3_0.27.0.bb => python-mox3_0.28.0.bb} (75%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
> similarity index 75%
> rename from meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
> rename to meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
> index 215c63f..28ffe16 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.27.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.28.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRC_URI[md5sum] = "fa4fd9d9a12c388707c1579e2a6338dc"
> -SRC_URI[sha256sum] = "210ccaf5829de3e133f0fb8ab798cdb82663aae09b715130fc4765f18234162a"
> +SRC_URI[md5sum] = "c930d8479996541b04447a67e96e4a62"
> +SRC_URI[sha256sum] = "8094868e70f814b4a526ecc592365437bc93a7dd60341321344987b3e8dba49d"
>
>  inherit setuptools pypi
>
> --
> 2.17.1
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


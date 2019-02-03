Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09F82E00CB0; Sat,  2 Feb 2019 19:43:25 -0800 (PST)
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
	*      [209.85.167.44 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A596E00546
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Feb 2019 19:43:24 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id a16so7900056lfg.3
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Feb 2019 19:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yBjEqHAIHTnYFWKnsgiOUm1fVyfXrCSVjFIMqqf+gTk=;
	b=aRgGb9OgyQ3BpvryARbAhyRGQu99QbsgXnGPpmzq/ED/6+HYfGUE3R2DaK+s3Kkpk9
	N8IJJk6cDvts2yWaYzhTfAqhv3PaFUF7MHyVEJ4NYQBlyv3gHFeYCd/qggskS0CD3ugm
	V61tshhJ6XY1tlX+a3OI5x3CWb80zPrWIZLpz8WVIh5rVaazFcEBtB79UwdB6ANDY9kH
	jbx3qSPOQ1kKhOd4Y0C8A7sSckaFklo2N+x/fj1GfCIsVcVVvk3wPeQyw8YZ6fBUuT1S
	YjPTOt3tFV+uw2hZdI9QtroPaniklWBbIqtmbWN2OM+XJp4gMydP3TzCq0OjC116/YUH
	2EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yBjEqHAIHTnYFWKnsgiOUm1fVyfXrCSVjFIMqqf+gTk=;
	b=qb46A2mwFIqhg+uOPhvU899vVtwV63VuHWu4QEEOKWUzwqaBG8A2sknLXMtAi2Vgae
	ObMySaCWa9Kl2kqD34k7o2s1DnD+0V3nYguZIKsH0WUGeNSU6gxXbKOdJNl5ZY9pN9QE
	y8B++EbGdN+uMqhgb72vD8UK1m+5S7IUDn89Sv7Pz8lZY+DzFOlv3InTVJe6NY0yxcC6
	eUVcHDmAWRWvzPYHxg/B5dobSOIRjh8GkTqNK1tG+QZu2jU9r6jpCcehywR8LcQrE2jP
	X6VjWPduSfXEKxCtEX5hpjk+zfQlwS7pcEIJBxC4JigaxuLVWRjrTMKrQfbAvC432jNg
	dE1w==
X-Gm-Message-State: AHQUAuZTlEH76dz23au7T6fgE33ePDVrFqcK45zxQnsts9zJFlQs69B9
	71lPpepcu4SGaALPXjn6+OqlqoCjVVdP8abnf/8PE5Zl
X-Google-Smtp-Source: AHgI3IZ+5G47JFcmJxEFk011FnIejV+6Xm+c3J1SZXcfQ5BEm/PlwVP+G9V3yRXi4ke2b5vZlFayTOo1yBZhAL3WI40=
X-Received: by 2002:a19:520b:: with SMTP id m11mr2394953lfb.2.1549165403004;
	Sat, 02 Feb 2019 19:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20190130004249.20870-1-hongl.fnst@cn.fujitsu.com>
	<20190130004249.20870-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190130004249.20870-2-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Feb 2019 22:43:11 -0500
Message-ID: <CADkTA4OajG=95SErqXWX36M7uurer50NWFffC0KS8b8Ad+43Zw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-kombu:upgrade to 4.2.0
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
X-List-Received-Date: Sun, 03 Feb 2019 03:43:25 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Jan 29, 2019 at 7:43 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-kombu from 4.2.0 to 4.2.2
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-kombu_4.2.0.bb => python-kombu_4.2.2.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.2.0.bb => python-kombu_4.2.2.bb} (70%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
> similarity index 70%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
> index 47cb5bf..3cf1035 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.2.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>
> -SRC_URI[md5sum] = "cb7e668936cd5ffc3232b72a2a4f931f"
> -SRC_URI[sha256sum] = "d601c47312833c0f6f4aaf037f293b2627398d4cf8526e6ba0360287294ee1fb"
> +SRC_URI[md5sum] = "0c98ce669cb7a05c5046ea6009c77cba"
> +SRC_URI[sha256sum] = "52763f41077e25fe7e2f17b8319d8a7b7ab953a888c49d9e4e0464fceb716896"
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


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C02EBE00D89; Thu, 29 Aug 2019 21:19:04 -0700 (PDT)
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
	*      [209.85.167.43 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
	[209.85.167.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64E4EE00C78
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:03 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id u29so4245753lfk.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qUmukqTIkvPVtp7zrWZK4fHvbnBfIaQP7YIBYi8QpYw=;
	b=EiMhb4Isd6vPANEl5xk/l9KaPqI4TinhzC73UoTtGp7C/dagIaATkwaRU77COU7olg
	gymWFe/9ZaMhf/joRdFESgjD2WOlqdkhqp56W2zqBUv1/4FGG5kGRxjMshl6H1JfV5xY
	ryct5I9AqgtuVYcjeeD9jrY9evfAbMHov7DtPIXo9Rw7eYOrFemgAInwosn3Y7uL7hWA
	YYJeWfh3CCaHx/vHvztQdgh8Ina3Xljtv8wCp9cHkTt6I7cLs+oVde0h4v+yOrfIhvMM
	wBWOIjoT6dWS0+ScPtvhaSqTmU2bOx/v+U8g9CvkApWEoTJDPicUpsmSju5eqTPRtQX6
	Szkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qUmukqTIkvPVtp7zrWZK4fHvbnBfIaQP7YIBYi8QpYw=;
	b=GASmouYXfOKu/3VLfdyqI6oy5H84t+F6LRaFtqKd7m7WbukWhQ1d9OX45+IRX78UW3
	owHoK3EWx6fqMMfBT4DfgPcJJ1ROdsqU0IiJGtFcw4EO+QZE/6nswVhjy3c31PHAPb3/
	4OAc/1FW3ymE05uvgybDAEHZCnTXcgYL8HEQSyLKdWJ7KaRqO69fJ16i11SteqMx3sOq
	tNsEx25uo7jARMl4OeTtH7woUnsuX6eFBkgl4OIM1s0/pI6AgzUjozIQ78OLLoW8HAsq
	wf2xwvBb4Sz9bxsdwX0SXPK0MPkn+Olu/+HALkWbEsH5x6EZb7Qj2/Xa9Ci0o1XAal+b
	MxzQ==
X-Gm-Message-State: APjAAAU8W7zrngqGKJ2sl2MTpZ50M9hsvrBRgANNVX1F6fIJaGaEcyNv
	pLIc8qmLSh/Dh+QSxjfxAnKhErpMUKRQBixstkw=
X-Google-Smtp-Source: APXvYqyRWTLyeoxV8w8TUAlY+b1T1vqDYeHI3ZO8i6UmmuGCYe7V0P3l1e5rPRhpDpSe6mxPeruJX0fEjYTCa6L0t18=
X-Received: by 2002:ac2:5323:: with SMTP id f3mr4694514lfh.36.1567138742317;
	Thu, 29 Aug 2019 21:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <1566798350-114744-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566798350-114744-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:18:51 -0400
Message-ID: <CADkTA4MkzxJXC=+a78-Cm+a7MQLe7fcCwsPgNQNJmMcwH-KZpA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-kombu: Python3 version fix
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
X-List-Received-Date: Fri, 30 Aug 2019 04:19:04 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 1:46 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Specifies the major Python version being built using PYTHON_PN
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-kombu.inc       | 4 +++-
>  meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb  | 2 +-
>  meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
> index 3053f71..9918281 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu.inc
> +++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
> @@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>  SRC_URI[md5sum] = "4eb5f1e6f669e04f5bd0c627c7467156"
>  SRC_URI[sha256sum] = "e5f0312dfb9011bebbf528ccaf118a6c2b5c3b8244451f08381fb23e7715809b"
>
> +inherit pypi
> +
>  FILES_${PN}-doc += "${datadir}/${SRCNAME}"
>
>  RDEPENDS_${PN} = " \
> -        python-amqp \
> +        ${PYTHON_PN}-amqp \
>          "
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
> index 28b6258..8c5c4d6 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-kombu_4.6.4.bb
> @@ -1,3 +1,3 @@
> -inherit setuptools pypi
> +inherit setuptools
>  require python-kombu.inc
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
> index fc752d9..11b0826 100644
> --- a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.4.bb
> @@ -1,2 +1,2 @@
> -inherit setuptools3 pypi
> +inherit setuptools3
>  require python-kombu.inc
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


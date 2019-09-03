Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28B17E00E49; Tue,  3 Sep 2019 12:56:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D549EE00E49
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 12:56:03 -0700 (PDT)
Received: by mail-lj1-f193.google.com with SMTP id u14so10733826ljj.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LLRdCIzeauS+bH8b2uYanZ84rBeN3XQYiMW2Nq2X4UQ=;
	b=Qk2jMGncs1AjUWTQ0Kwae6ZPQu3zrBfdto7PXvatwxS+s5/KF4mYqMEpZ1PWEDnQhQ
	/9Km4dXIhGmaSo7Cb4bakITgSum12PZdvIC16C6/3Ke3d7YcOE6pwj5+LxCrVQJhPeNU
	oTIiAi+h7j76bY4qin38/gBOktbgXC03jKgfcuuZt+Sp7hEVGhhVMsg0bPw7f1iUCYnW
	jRplx6qicuFrhUjHbIGzZikRaCWcC2ixN1wqct3SRqfacz8tdJpAqOj0r7PvEWoDb2aB
	rQtwk4RUdvardd+R4ojUMt+MrXkBMfI3Fsr/e6hJcDSMNnm8lprP8HI6fBFQDk9b74dy
	kPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LLRdCIzeauS+bH8b2uYanZ84rBeN3XQYiMW2Nq2X4UQ=;
	b=cMsyxh0vfII75IVr8tiv3Grzgpd/Th56vGI8FzQxH6QpzVcz23Ci3E+Kmrhud90gsT
	pwlKYO+2b1wsSAHRGq/XIsMYEpkogmNYNGQMEHGL4V8mRnRUV65thT02Sv1/KYe1uB+V
	zZJAboabHAUokxIMsVXCzN+o9/DqY3BtD2YGJ7kvMIHVfAW4nbqdrZuV2ZvLGF1+lpBG
	kZSiUZnkGVWPJp6Ih2udwbuNGAQi5LF//DwYyWN5MxxRbX8WhZWTuby4mMeBMJLd4g92
	jN3cYHupXHGWKLU/r0lSiEp0PjMHQdPGF+akfVj5kfVW5yoTZ6lsOi6qiFu1sF9mDEZR
	Ks9g==
X-Gm-Message-State: APjAAAXOR7x5lEm8axC6V1O+tgTotvIVYSc8uogSD5ZHnSuDTOW3kMOr
	8VZ0Imu5L++mJq1z7lCFwRfWe9MGpHKULVpoOOW8lJ4T
X-Google-Smtp-Source: APXvYqxPiICUPANwwPSS2q+FqtmFU01aRDMjNZ9eiaPTl49UFxmnXyUPhCK9JorzNMGZ2Khgye4CULDLV57tEEja9u8=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr20816654ljg.78.1567540562024; 
	Tue, 03 Sep 2019 12:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190830064639.19268-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190830064639.19268-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 15:55:51 -0400
Message-ID: <CADkTA4MCwqAYF79WOUc17FB5VhQhyBzirXBZCvituX34ZkXxvA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-paramiko: Add python3 version
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
X-List-Received-Date: Tue, 03 Sep 2019 19:56:20 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Aug 30, 2019 at 2:51 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-paramiko.inc | 12 ++++++++++++
>  .../recipes-devtools/python/python-paramiko_2.6.0.bb       | 14 ++------------
>  .../recipes-devtools/python/python3-paramiko_2.6.0.bb      |  2 ++
>  3 files changed, 16 insertions(+), 12 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-paramiko.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-paramiko.inc b/meta-openstack/recipes-devtools/python/python-paramiko.inc
> new file mode 100644
> index 0000000..da47c79
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "SSH2 protocol library"
> +HOMEPAGE = "https://github.com/paramiko/paramiko/"
> +SECTION = "devel/python"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
> +
> +SRC_URI[md5sum] = "f729a45c9122bf975b9177ec5aaa3791"
> +SRC_URI[sha256sum] = "f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto"
> diff --git a/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb b/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
> index 2b2c8e8..fedbf86 100644
> --- a/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paramiko_2.6.0.bb
> @@ -1,12 +1,2 @@
> -DESCRIPTION = "SSH2 protocol library"
> -HOMEPAGE = "https://github.com/paramiko/paramiko/"
> -SECTION = "devel/python"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
> -
> -SRC_URI[md5sum] = "f729a45c9122bf975b9177ec5aaa3791"
> -SRC_URI[sha256sum] = "f4b2edfa0d226b70bd4ca31ea7e389325990283da23465d572ed1f70a7583041"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-pycrypto"
> +inherit setuptools
> +require python-paramiko.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb b/meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb
> new file mode 100644
> index 0000000..97e56e1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-paramiko_2.6.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-paramiko.inc
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


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4234DE00D33; Tue,  3 Sep 2019 14:09:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B0EFE00D35
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 14:09:05 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id u14so10926790ljj.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 14:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ig2vg9F2xQwo9ZpjQqlrDWZEf913OFQhHw3s//KwTos=;
	b=TnIYA+rbNKnFjxg6zwWTxuVDWl0ON98EZQagN5rks2bkrV4VQG+Ea9r1KAQyldQPzB
	j0d+mIT6iVNDYAR1QUxnSwGqNiUfofIY7lLr3Rxan5Zi6NV8I6gaR9Wi2je8awL5pKeW
	5YN8SUYKt+2HsM8v/MYS6/AfV86l6lHZOyZloxDenfsUx8YnxpZXrpM88xqOSjbbNk9M
	ZCEbYj3g9T+2rJTSZagw3JglX6oS/g5OMaYrhNV9azO3D2DdGTGyvZEHbX/6ZIry1Ri7
	YGvk1mkhklZoPnYpxdUcqzGPRMjdYzDXX9AAzs30ekKlXe0SXVN/+8bqevtqmwZKKs53
	vT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ig2vg9F2xQwo9ZpjQqlrDWZEf913OFQhHw3s//KwTos=;
	b=Y888RcRljaMScmTNo/VnZiuoL6Dj4XLkfHOH1WqnKPSotXt7KyH4DwUd2SxK3oLpCj
	l4WENl8ERwAH9yB5iqlcvgp6d4JH5hZXe7R079LtTohxwgI0OIde8EcwqrCQAxCNlIbU
	PC1BeJE+/T8wSfXeVl6RAMWO/6fHWWGWCX/gG/0bR+asrb/k0v2xNvedN9mSAshgRkMv
	nf7uVCq+WAgWY7+OSdHQRTxvslN83Fw4wud9tMReTGPyXe2/hF3eRaSDhhO3ZFmVyj2k
	/aNB3FBMCWg1Uk3VLDizfcPbF9ugWSBQqn9FhJLNgbKxMhyq74orr2A/qSVoXK3AlOzI
	GlIA==
X-Gm-Message-State: APjAAAVkjffliq+++2oqSGELVZf0UxunWyo7YiQTuHKl03AyIpYhv+g1
	gyfRQqzNsQ/Fn0/6RvPQS8Q6zdUQ1qDzylsKLmyK59tA
X-Google-Smtp-Source: APXvYqyetbB2DbcFRBDlc5WzRO6YQVu/XdDGfO0aHtPZmTPZbRpikQar+rViCCT0H6S0/mAnC0Kz/8LAUHJrGej7pEk=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr14617191ljh.104.1567544944507;
	Tue, 03 Sep 2019 14:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190827035254.7969-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190827035254.7969-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 17:08:53 -0400
Message-ID: <CADkTA4PkN4g=-pmtMLu719Psh-weFwXmgbV_OyvChifSaEzXog@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-croniter: Add python3 version
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
X-List-Received-Date: Tue, 03 Sep 2019 21:09:08 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 11:55 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-croniter.inc     | 19 +++++++++++++++++++
>  .../python/python-croniter_0.3.30.bb                | 21 +--------------------
>  .../python/python3-croniter_0.3.30.bb               |  2 ++
>  3 files changed, 22 insertions(+), 20 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-croniter.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-croniter.inc b/meta-openstack/recipes-devtools/python/python-croniter.inc
> new file mode 100644
> index 0000000..885aa9e
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-croniter.inc
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
> +HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
> +
> +# Archived version so we have to overwrite what the pypi class will derive
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
> +SRC_URI[sha256sum] = "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-dateutil \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
> index 2859441..c5cb414 100644
> --- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
> +++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.30.bb
> @@ -1,21 +1,2 @@
> -DESCRIPTION = "croniter provides iteration for datetime object with cron like format"
> -HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
> -
> -# Archived version so we have to overwrite what the pypi class will derive
> -PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "e4a8987521b144c4c2149d4adde8f55c"
> -SRC_URI[sha256sum] = "538adeb3a7f7816c3cdec6db974c441620d764c25ff4ed0146ee7296b8a50590"
> -
>  inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-dateutil \
> -        "
> +require python-croniter.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb b/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
> new file mode 100644
> index 0000000..6ec5a00
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-croniter_0.3.30.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3 pypi
> +require python-croniter.inc
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


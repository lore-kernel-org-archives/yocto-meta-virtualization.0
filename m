Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 165DEE00D67; Tue,  3 Sep 2019 14:08:51 -0700 (PDT)
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
	*      [209.85.208.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
	[209.85.208.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67909E00D33
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 14:08:50 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id t14so17534211lji.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 14:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NMn/dv7jhkeErG77YjRQCUhzOa3FmBV5CopAEPDDSuU=;
	b=s0/LOvaNd4clCuO3Ez0Y5Yqv1WtJYmuvsrkLNhP/AQJj/IvBmRqvy17sXlm72tGHMy
	5EAqhQ9WE6/TtRu23rclFT7eP/kYLEh1iaZcuAjNvKJTEhDblRNk12rb12OJNLpFf8hd
	VU0/U7IgGWO1cX9Xa/5FOZaeoWOYnSyX9A/69ZyTbpVYYxMIgdRukaA9HzXerzxjVNSk
	3jtXcmT+xRe3IsHQSNY2vKdUz41I1xpT8fbGtx9/5d5/t+CotQwUdy9O8gBbJgzMhky2
	3t2EfI2vH+TLjAtxsPnINdWHiW3jtUVeSTl24SJjgBnogb9iKjZcYb4lYfVpSkebyUzG
	Ofug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NMn/dv7jhkeErG77YjRQCUhzOa3FmBV5CopAEPDDSuU=;
	b=TFb7WawPYmHna4trCva5ZsYkGbyC8VUSiTX8SiG3EsmwW3C/Hee/1cMsNaBJmDtVm3
	AFE7lNK4bhvsz08BAZ7gP9LNiHNmxctz2I9Up7taHowD1DxlZNB9YQlvMdq/QV30PIaE
	UnvH1Owv/td1y8iSyZQK4BcFAglnVgR+XWlWz6GD4FVS8P9Yjd2XlVjq9uhc7okg/lL4
	BcDCHXttcq9VgrLOkpMU81tpATEqcHChGtV3U1//Z2jTWNTgPVVsgs4Q2K06dyzW9oii
	NTI/1m5a0qRngxdhbt15E9Z2tyZ2SJnfPVpCPZua3aAc43AQGBNfQXWRrN1EzPQHxiCa
	qPTw==
X-Gm-Message-State: APjAAAXhUQNB0SOeOxj/NctbxT1VTMCIE1pXIySM3x8bSml1lAtsHLNt
	Oouxmp91stD+meHzTlA2m9eE2+aVbriSBW3Ad8M=
X-Google-Smtp-Source: APXvYqxgAT7er5XB9ky0qd0gOmsTNU9e+z6LGkv+4D/Ttr1pYkB8SGYTLmE3NrPvS1JkwUEVcEG0pRzhyKRt4JxlNcI=
X-Received: by 2002:a2e:9196:: with SMTP id f22mr20968774ljg.78.1567544929303; 
	Tue, 03 Sep 2019 14:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190827034456.7837-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190827034456.7837-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 17:08:38 -0400
Message-ID: <CADkTA4PrCGbPi3=cY8Lo3CvOV8W=84DqSV4hOcBs9RQa0ZsSHw@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-contextlib2: Add python3 version
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
X-List-Received-Date: Tue, 03 Sep 2019 21:08:51 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 11:45 PM Zang Ruochen
<zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-contextlib2.inc      | 16 ++++++++++++++++
>  .../recipes-devtools/python/python-contextlib2_0.5.5.bb | 17 +----------------
>  .../python/python3-contextlib2_0.5.5.bb                 |  3 +++
>  3 files changed, 20 insertions(+), 16 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-contextlib2.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2.inc b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> new file mode 100644
> index 0000000..0a45008
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Backports and enhancements for the contextlib module"
> +HOMEPAGE = "http://contextlib2.readthedocs.org/"
> +SECTION = "devel/python"
> +LICENSE = "PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
> +
> +SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
> +SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        "
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
> index af9270e..c6a5c9b 100644
> --- a/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
> @@ -1,18 +1,3 @@
> -DESCRIPTION = "Backports and enhancements for the contextlib module"
> -HOMEPAGE = "http://contextlib2.readthedocs.org/"
> -SECTION = "devel/python"
> -LICENSE = "PSF"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
> -
> -SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
> -SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
> -
>  inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        "
> +require python-contextlib2.inc
>
> diff --git a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
> new file mode 100644
> index 0000000..db5fa53
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
> @@ -0,0 +1,3 @@
> +inherit setuptools3 pypi
> +require python-contextlib2.inc
> +
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


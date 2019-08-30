Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07747E00DFF; Thu, 29 Aug 2019 21:19:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.167.47 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 647A9E00C78
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:16 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id q27so4235824lfo.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p21bDDWK4/C4nuQw7gO/Z2lTUem4pt6Cc39Tn7MIOWk=;
	b=Z1diDhOJdtoeZc3mkqzXalKQbmMpd58MEmIE4dlFBqZJayWFEioGxyu4I/VvcQCbNB
	mVFPUnZ1LmlgNdKBje7y30514GUjPeuJOhdQ1haUsqb1aIMZw8O8x3mXKsT0AXylNpsa
	5NsjC5uDcCW/gMj5N+tUu5kvgx/DEM77N48q8FtdxkrQZgZaIArRpgLl3xwlTqU8geOn
	Suu2Yked62lqFYTI3OkhlbWXmvvPULR1RAVK8zF1G3TlaeDoOnpFwPP4Fjm9I72x0uoO
	9JXztitStzvHUHJGHlzC6C7SkWSTVrU5aABMzQTq+UZsW6OGBh2uoadjOdLnMVwgl1Gt
	oM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p21bDDWK4/C4nuQw7gO/Z2lTUem4pt6Cc39Tn7MIOWk=;
	b=grnWgwfJDHMK7vafkXfCWw5Xhllqg5DAWxXzVF304OhhyjeI4SuD1Wvvpr6QMDGlJ+
	73guSy9jYuoLloGJ5OJcQqGAU0zbr+avgmTXpGiimA8BLqcLZP7BMXTwslhEJb3+mjH4
	ZTSuJnEATgPFGle3VMIy8EsiH3zw1jHX65HX0lLliKK/0XWsd0v78R6TVKf8mpAfceZ/
	fC7AUo/ys7fadiDK/OaGCcxGrrBCGDrbWAmGKxK5ElsqGPug9gLF/iGox2zcBadYqI4B
	bScuiNFebZMW3aYQ9mr7vMDWi0DM0hg07nZ5DsrRAP+CfHoa0P4K9uikh2SAABLhfrJ5
	IMXA==
X-Gm-Message-State: APjAAAX3NNU0/Nfxq+FNiQGQ8CyjelZgkPQrTN21SQDLENA3U2Z6+vEr
	JDhHQ/Y4cMkK9sFPTMKrza0dSfLeXTQw23xymno=
X-Google-Smtp-Source: APXvYqz03Vk3e0kdowjJ+NPBA/2tXa9lqrsYea3OLIN/lMwAT3agd0NGhPisZ4MlMbK45nUKPZsDO4netyYFvTOKyks=
X-Received: by 2002:a19:4959:: with SMTP id l25mr8302107lfj.140.1567138755256; 
	Thu, 29 Aug 2019 21:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <1566798419-114849-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1566798419-114849-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:19:04 -0400
Message-ID: <CADkTA4PJUS=XVdNUZi-DJwMqMQNXdZJ1nEbZekcwfD0wC2SyYA@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-keystoneauth1: Add python3 version
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
X-List-Received-Date: Fri, 30 Aug 2019 04:19:17 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 1:47 AM Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Providing a python3 version of python-keystoneauth1.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-keystoneauth1.inc           | 27 +++++++++++++++++
>  .../python/python-keystoneauth1_3.17.0.bb     | 29 ++-----------------
>  .../python/python3-keystoneauth1_3.17.0.bb    |  2 ++
>  3 files changed, 31 insertions(+), 27 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> new file mode 100644
> index 0000000..3d6309d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Authentication Library for OpenStack Identity"
> +HOMEPAGE = "https://pypi.python.org/pypi/keystoneauth1"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
> +
> +SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
> +SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
> +
> +inherit pypi
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-pbr \
> +        ${PYTHON_PN}-iso8601 \
> +        ${PYTHON_PN}-requests \
> +        ${PYTHON_PN}-six \
> +        ${PYTHON_PN}-stevedore \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> index 18115b2..f244f7d 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> @@ -1,27 +1,2 @@
> -DESCRIPTION = "Authentication Library for OpenStack Identity"
> -HOMEPAGE = "https://pypi.python.org/pypi/keystoneauth1"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
> -
> -SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
> -SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-iso8601 \
> -        python-requests \
> -        python-six \
> -        python-stevedore \
> -        "
> +inherit setuptools
> +require python-keystoneauth1.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
> new file mode 100644
> index 0000000..75adf3d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-keystoneauth1.inc
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


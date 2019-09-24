Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AB30E00D83; Tue, 24 Sep 2019 14:55:27 -0700 (PDT)
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
	*      [209.85.166.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B555E00D75
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:26 -0700 (PDT)
Received: by mail-io1-f66.google.com with SMTP id n197so8265470iod.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cPBCG3Dcd6DbokDyDao/7OoRirT6EtWvK2mcAfv0zbM=;
	b=G7xoMhETpTxRXkItagTnJJKljXc/Y8l60Bb0AAc13stY7JcqkgwPcLVw1cQHpwkL72
	WMk+3DOME9OSSLs9kZhjjqaN3uQKQ0zCAiZmVhXzxciiTdMBiYoZ8kHv/cJRm1f4Z4Gi
	fNuj/IkS66n7tHxTR+l1FD3vbFdltK4edco6GP7q8gjTvR6EjUUAhGwY5SqXXB3muqOC
	/fPNgfViuuyN3TJejt0ytNLpVck/TQBbfILcc0NXwQKMqzpuPNkxA8u1im8a+YT5G9/C
	g3ZXvC2/TT/FqY5tpo+MW0TuSPWmZjv6Y/lHVhpQtUnfOIHasi+/w3AYJDISGzw8OgnL
	u3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cPBCG3Dcd6DbokDyDao/7OoRirT6EtWvK2mcAfv0zbM=;
	b=spfRwQabRsmRWsyKizfc/QLW74nL1ftwSUk0GHNnMtBAKu25rcA6pLYloR59r7Lg+x
	u2D6eZgaLDsRWY8fdBXA9L+UH+GSG1mesEXthCvKJSnIgCcVFhYcb7D4T2PTafGNaEgf
	gnTJZcOA0g3D6g4S/Uuo2kv9jk44Lo0H/dANeh42rPLMXWWzdeJ2Iba92BeGb2qfB9AA
	lCTTa5kpukr4Oz31dXTljAqGU6Zc2qrkRKFZCxSs2b1FY+oQ/U4+nHhb+zatx52tv7ka
	PzAw7yFHQlsDxReGKodNe5GneQ+NfrRbdhjw4Xs4KwT9KuB972gztfmVta+S39xMp/Vg
	Qfyg==
X-Gm-Message-State: APjAAAUw9Z0+5s8Qm2BTtu1ra/7DFlAws81pdDCypLUFjJDEGYclbDaT
	4wOd68xICxpPR0YeqHeax0UO3k/FK7RCdA==
X-Google-Smtp-Source: APXvYqycjbsPpx1lEdGukHv8Eu2ggQGm1WFfUn5NRuJdHUN/kxCfnDRAZOa0KG/fiq3AI2mgVRbJeg==
X-Received: by 2002:a6b:5d18:: with SMTP id r24mr5871598iob.285.1569362125393; 
	Tue, 24 Sep 2019 14:55:25 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	f12sm3413550iob.58.2019.09.24.14.55.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 14:55:24 -0700 (PDT)
Date: Tue, 24 Sep 2019 17:55:22 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190924215521.GC54158@gmail.com>
References: <20190923084422.27655-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190923084422.27655-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-testscenarios: Add python3 version
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
X-List-Received-Date: Tue, 24 Sep 2019 21:55:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


merged

Bruce

In message: [meta-virtualization] [PATCH] python-testscenarios: Add python3 version
on 23/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-testscenarios.inc                | 24 ++++++++++++++++++++
>  .../python/python-testscenarios_0.5.0.bb           | 26 ++--------------------
>  .../python/python3-testscenarios_0.5.0.bb          |  2 ++
>  3 files changed, 28 insertions(+), 24 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-testscenarios.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios.inc b/meta-openstack/recipes-devtools/python/python-testscenarios.inc
> new file mode 100644
> index 0000000..1008f11
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-testscenarios.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
> +HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
> +
> +SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
> +SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
> +
> +inherit pypi
> +
> +DEPENDS += "\
> +    ${PYTHON_PN}-pbr \
> +    "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    ${PYTHON_PN}-pbr-native \
> +    "
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-testtools \
> +    ${PYTHON_PN}-pbr \
> +    "
> diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> index 18971d6..868a5b9 100644
> --- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> @@ -1,24 +1,2 @@
> -DESCRIPTION = "testscenarios: a pyunit extension for dependency injection"
> -HOMEPAGE = "https://pypi.python.org/pypi/testscenarios"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://BSD;md5=0805e4f024d089a52dca0671a65b8b66"
> -
> -SRC_URI[md5sum] = "859073d9e7b049aee2e6704c51f6001a"
> -SRC_URI[sha256sum] = "c257cb6b90ea7e6f8fef3158121d430543412c9a87df30b5dde6ec8b9b57a2b6"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += "\
> -    python-pbr \
> -    "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -    python-pbr-native \
> -    "
> -
> -RDEPENDS_${PN} += "\
> -    python-testtools \
> -    python-pbr \
> -    "
> +inherit setuptools
> +require python-testscenarios.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
> new file mode 100644
> index 0000000..6f7d418
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-testscenarios_0.5.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-testscenarios.inc
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


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69870E00D77; Thu,  5 Sep 2019 07:04:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  3.5 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48A05E00C4F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:04:32 -0700 (PDT)
Received: by mail-io1-f67.google.com with SMTP id r26so5090586ioh.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FcvvHnc+eRXr4Ru5YIycvyGuf2G/WAr0vtsbO/1PjPc=;
	b=rzrWI2ySMpGCXPldRSCpiwmw7Dd3FrYfxON5G5DQpKEoBkbt6yxaMXlSOiwa8UIbph
	PLfXEqtiSN78U9shkN5hFgcY99AtP9AwXZrnIVu6t1mEIHijtRX7V05DdiMK/necdExL
	gsxZZBIunTjflnifZHtFSvGrclb47KSvOzw+gdJJv3BRpXIZV94ZGxsPLWbOWoq5FJig
	D485JjLTorywNudT1jKNJ/nf3FV3yHTX0L2KGelPMAU2P6gCC3Gy83B5rKY7UOrSbMaz
	kpgcQ8h48A5GDyOjbx/j+UX5BkDbRWBjtLchwYs73M60F/6q6uc3ryZhljfjS6GOM6ev
	cJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FcvvHnc+eRXr4Ru5YIycvyGuf2G/WAr0vtsbO/1PjPc=;
	b=b1gFipH9i3RFQeFCQivfccD/wAIxubWGsQzdgWSZG9sEJdmBnJZQz/Atl/SnvwNt/r
	p6gJGaZsIkU9NrIt/+TTyyzysUesVteWbdR6QybS5CNGGhZcsqhzaqJfmk9/OiGwLDeL
	kblV+HQrbuV3rUYnuqd6D5uO0Wfw3+SzkcbNigyJz7tKf4ggUWbVzM9OOiykRDIfDJdn
	czHueo89NEdTmoJapEajkPmnpBXdGKAM/AQAcrEMJmFoV+w4Ydrx3+Z/bWLG+vT0C8dV
	dscXQ5Ntb8tsipRlfEiWl8DjIvq6Nm+EAFvWpsZq+Tekwvqx7eMrQEWfXt4UceWuc4ri
	rXMg==
X-Gm-Message-State: APjAAAUBlYn+uxxW9Eenkks29xK4vQrDUXMA3Z480upndn84inmtntRA
	mn3IeEOggapl+ZtyVviOJH9NxFa1/9I=
X-Google-Smtp-Source: APXvYqwzM5mEL3d0lvMVitTYuj96gn0aXOnCfTuLsYxZPmjJSFz1HQP4Rtf9apLK7G3TjMXWfvmzLg==
X-Received: by 2002:a02:cf10:: with SMTP id q16mr4204333jar.89.1567692271267; 
	Thu, 05 Sep 2019 07:04:31 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id t5sm1793216ios.33.2019.09.05.07.04.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 07:04:30 -0700 (PDT)
Date: Thu, 5 Sep 2019 10:04:28 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190905140425.GA46597@gmail.com>
References: <20190904023822.1788-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190904023822.1788-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-fasteners: Add python3 version
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
X-List-Received-Date: Thu, 05 Sep 2019 14:04:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-fasteners: Add python3 version
on 04/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-fasteners.inc   | 24 ++++++++++++++++++++
>  .../python/python-fasteners_git.bb                 | 26 +---------------------
>  .../python/python3-fasteners_git.bb                |  2 ++
>  3 files changed, 27 insertions(+), 25 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-fasteners.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-fasteners.inc b/meta-openstack/recipes-devtools/python/python-fasteners.inc
> new file mode 100644
> index 0000000..6e5e5f0
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-fasteners.inc
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "A python package that provides useful locks."
> +HOMEPAGE = "https://github.com/harlowja/fasteners"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
> +
> +SRCNAME = "fasteners"
> +
> +PV = "0.15+git${SRCPV}"
> +SRCREV = "75148cb679c351966cd4ad5e9d177048a0ea8380"
> +
> +SRC_URI = "git://github.com/harlowja/${SRCNAME}.git"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        ${PYTHON_PN}-pbr \
> +        "
> +
> +# RDEPENDS_default:
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-pbr \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-fasteners_git.bb b/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
> index 2dd3698..3a7326b 100644
> --- a/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-fasteners_git.bb
> @@ -1,26 +1,2 @@
> -DESCRIPTION = "A python package that provides useful locks."
> -HOMEPAGE = "https://github.com/harlowja/fasteners"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
> -
> -SRCNAME = "fasteners"
> -
> -PV = "0.15+git${SRCPV}"
> -SRCREV = "75148cb679c351966cd4ad5e9d177048a0ea8380"
> -
> -SRC_URI = "git://github.com/harlowja/${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
>  inherit setuptools
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# RDEPENDS_default:
> -RDEPENDS_${PN} += " \
> -        python-pbr \
> -        "
> +require python-fasteners.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb b/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
> new file mode 100644
> index 0000000..9b2053c
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-fasteners_git.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-fasteners.inc
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


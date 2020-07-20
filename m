Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.2325.1595271091044792120
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 11:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mcJm8iuX;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E55A2E01ED0; Mon, 20 Jul 2020 11:51:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75D92E01ECE
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:51:28 -0700 (PDT)
Received: by mail-qk1-f193.google.com with SMTP id u64so3315029qka.12
        for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OBI3DAUC3K1M6bAy0MhbXrXh6qrbECsUYjPcIpgbFX0=;
        b=mcJm8iuXjH1djtQdGeQUl2AW6dySu2k9IMPu3fA5uEWFVoKofFJ/cUxaQ5olbDzSYw
         LXyYdRVaGoiHVxCQUR+rhtL0SV0K8U3PczTcQsgZJ26Oi73ajTZolkcMKIcBvEpatRZX
         slNAwm6t/jWPnVEqxb31vPqLubiyfzLQEQ1y+q1rkOrlcQ0eZxg3LQb2porysCMWOcqa
         qk7HtneRnrlm509bVL731iMRNgCUDqgIp0gYvgPSHs8WOQO0c1/fMV/5h4a0qmPx7h+M
         rhwnmr+ccTeH6s14LQJXB05DCIsGPRQxq7jiQchvtPzdxHmtcXO5mMsmxIyjFag2c1jW
         LauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OBI3DAUC3K1M6bAy0MhbXrXh6qrbECsUYjPcIpgbFX0=;
        b=fcF4F2MZ1r0tQYNVa6lz8naK9IbKW2QPgPIl3m5XZ3qGDoLUpBdoLeWUZPmxbB40cE
         oBRUo+WYxmwl5XW7gabwZLc8KsB7hk1/ASTGAGWtfslb8QqgD5JGBmNh5iaZV62NEFKe
         l99Ewg7XG6NC/kToYsSNwq2pMVu0kJKEedx3/dvkCgqvPmXtgjQl6WnT8DNnfUZI6b/q
         PYfC4sUvktz8GX39ILXtxDsyipcx2ZJFVofksZj03rFGZT0A3dbVPAv/s+kZJb8hx+rw
         vHBXyaHjXxychqIXFISZ/pcSDKdfcVL+SZphiSwyD/XcC8dDe4Qtb89jvbwKKQfTnpoE
         FpzQ==
X-Gm-Message-State: AOAM532qhOOn/6yGQZdWBwPCpJRJlPwtoGEcvUGW/LD4igq+PzEwjuL8
	LbzkORWtC0p5uj5HwYL2FjQ=
X-Google-Smtp-Source: ABdhPJyTaXtBG3teIO47gbTH4Ncmk8Gql/Img6HCrlWV5mzaL3RLa3eIvJDiTjh4LK/4cKdECuHgWg==
X-Received: by 2002:a05:620a:992:: with SMTP id x18mr22640668qkx.273.1595271087413;
        Mon, 20 Jul 2020 11:51:27 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id u71sm370270qka.40.2020.07.20.11.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 11:51:26 -0700 (PDT)
Date: Mon, 20 Jul 2020 14:51:25 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-cephclient: Consolidate in a single file
Message-ID: <20200720185124.GB40605@gmail.com>
References: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1594928524-4453-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python3-cephclient: Consolidate in a single file
on 17/07/2020 zangrc wrote:

> Consolidate inc and bb files into a single bb file.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-cephclient.inc              | 26 -----------------
>  .../python/python3-cephclient_0.1.0.5.bb      | 28 +++++++++++++++++--
>  2 files changed, 26 insertions(+), 28 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-cephclient.inc
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-cephclient.inc b/meta-openstack/recipes-devtools/python/python-cephclient.inc
> deleted file mode 100644
> index e8e0d0a..0000000
> --- a/meta-openstack/recipes-devtools/python/python-cephclient.inc
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DESCRIPTION = "A client library in python for the Ceph REST API."
> -HOMEPAGE = "https://github.com/dmsimard/python-cephclient"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> -
> -PYPI_PACKAGE = "python-cephclient"
> -PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "e3746607f1af1573a241b4995c10c938"
> -SRC_URI[sha256sum] = "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a9c1348466961134b"
> -
> -inherit pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        ${PYTHON_PN}-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        ${PYTHON_PN}-lxml \
> -        ${PYTHON_PN}-requests \
> -        ${PYTHON_PN}-cython \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb b/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb
> index e05c1d5..65e84bf 100644
> --- a/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-cephclient_0.1.0.5.bb
> @@ -1,2 +1,26 @@
> -require python-cephclient.inc
> -inherit setuptools3
> +DESCRIPTION = "A client library in python for the Ceph REST API."
> +HOMEPAGE = "https://github.com/dmsimard/python-cephclient"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +
> +PYPI_PACKAGE = "python-cephclient"
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/p/${PYPI_PACKAGE}/${PYPI_PACKAGE}-v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "e3746607f1af1573a241b4995c10c938"
> +SRC_URI[sha256sum] = "9776b786da2aebdc0439ea2f809cc8923f52bc0cf610f77a9c1348466961134b"
> +
> +inherit setuptools3 pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-lxml \
> +        ${PYTHON_PN}-requests \
> +        ${PYTHON_PN}-cython \
> +        "
> -- 
> 2.25.1
> 
> 
> 

> 


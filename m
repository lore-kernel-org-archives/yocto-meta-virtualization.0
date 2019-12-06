Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.8724.1575659510605679911
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 11:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gdFbxKd8;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2412FE01156; Fri,  6 Dec 2019 11:11:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F156FE00B7A
	for <meta-virtualization@yoctoproject.org>; Fri,  6 Dec 2019 11:11:45 -0800 (PST)
Received: by mail-qt1-f196.google.com with SMTP id k11so8156346qtm.3
        for <meta-virtualization@yoctoproject.org>; Fri, 06 Dec 2019 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=j88wDNaKnIxUqRSBBRwZGmRtsMHvyIQElC8THzbOWcI=;
        b=gdFbxKd8AaPp2Z/F0d0fze2UlDq+8x/GjfMdZR1OQ41MO4rG5+HkNARneAN1mwKTZD
         szgyo+QBBPJgpaGRjKmmq3rRn3JcdaTupf3GTMMAwgaZP7A0zJ9+LbCW1AI3SaxmSDY3
         pyIUNATa75qPvVF0EMCiM2H39u90At0W97d+PRiLN0bZMCOoFlCaBrBdo9CpEV8zq+lv
         Jl4sksU0nQ1CRZ+k2Lrg18P1yT/vEcjvaHEPl8xRxQ+U0ot/WyTZ8Kr5SV/gZqSeksBF
         HnqG5Rowfmq+UTKT0yRbtG7UXqtBcCtONz/DaaPACA/2vmQ8+pH5Tj6LYY9HdPZkoxjF
         1H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j88wDNaKnIxUqRSBBRwZGmRtsMHvyIQElC8THzbOWcI=;
        b=LNflTvmp9hqECxylhT/61ms8DocSvJEOyZ/CPDAppwulsUHJwC1iC2HBK3M6o2PyY1
         /VGTLJief5OEpSsZkCu3gH8tcdtxkmnLqoSfbwKR/LC4tKgr6YLzvj1auKCI86xmc5D+
         J4jS4PJ0HPGNvKRcq2vWSAB6nWuF1mpTWm45JqHJdDHUzuDQsWwUzYUeVGqjBKYRhaV2
         ajRe5u0WeA74J/rCLAno83lWIZtCzFLqkZpTW4M3cNxzvMYn2fw8dCrXprHJp0AYNo0d
         cDpaAs2nV0OD7WNXj3ZiLBGMwj4MsfgQ5VFFtMDi6HTM0lu8PZ6fp0qVlJZaSoXn1ufL
         Xt4g==
X-Gm-Message-State: APjAAAURx29kt1qir5FzlHXCyXhRzrW0hjpa/efLGWoyRA54BlsQ6Mkh
	C/cE7OfSpy4+8PheK8T2Z2nvQu9OVZg13w==
X-Google-Smtp-Source: APXvYqzAaxtEJuSsDkmJ/tpOyF74Vxm5G9u2hcguv3bHehd1jWkDKZTohlWx8xq62HxuvJFv3gd2CQ==
X-Received: by 2002:ac8:38f1:: with SMTP id g46mr14080569qtc.256.1575659504393;
        Fri, 06 Dec 2019 11:11:44 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id j16sm6686683qta.59.2019.12.06.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 11:11:43 -0800 (PST)
Date: Fri, 6 Dec 2019 14:11:41 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-sysv-ipc: Add python3 version
Message-ID: <20191206191140.GB37280@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191204035852.16100-1-zangrc.fnst@cn.fujitsu.com>
 <20191204040556.25181-1-zangrc.fnst@cn.fujitsu.com>
 <20191204055437.18844-1-zangrc.fnst@cn.fujitsu.com>
 <20191204061500.21656-1-zangrc.fnst@cn.fujitsu.com>
 <20191204065144.23509-1-zangrc.fnst@cn.fujitsu.com>
 <20191204065803.27766-1-zangrc.fnst@cn.fujitsu.com>
 <20191204070442.29175-1-zangrc.fnst@cn.fujitsu.com>
 <20191204071851.31039-1-zangrc.fnst@cn.fujitsu.com>
 <20191204072831.16645-1-zangrc.fnst@cn.fujitsu.com>
 <20191204074649.31626-1-zangrc.fnst@cn.fujitsu.com>
 <20191204075204.550-1-zangrc.fnst@cn.fujitsu.com>
 <20191204080802.2535-1-zangrc.fnst@cn.fujitsu.com>
 <20191204081304.6241-1-zangrc.fnst@cn.fujitsu.com>
 <20191204082111.7582-1-zangrc.fnst@cn.fujitsu.com>
 <20191205011229.12675-1-zangrc.fnst@cn.fujitsu.com>
 <20191205012006.14387-1-zangrc.fnst@cn.fujitsu.com>
 <20191205014334.14042-1-zangrc.fnst@cn.fujitsu.com>
 <20191205015641.17194-1-zangrc.fnst@cn.fujitsu.com>
 <20191205021306.27153-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These python3 additions are now merged.

Thanks for the series.

Bruce


In message: [meta-virtualization] [PATCH] python-sysv-ipc: Add python3 version
on 05/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-sysv-ipc.inc                | 22 +++++++++++++++++
>  .../python/python-sysv-ipc_0.6.8.bb           | 24 ++-----------------
>  .../python/python3-sysv-ipc_0.6.8.bb          |  2 ++
>  3 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc b/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
> new file mode 100644
> index 0000000..47ecf2c
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-sysv-ipc.inc
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "System V IPC primitives (semaphores, shared memory and message queues) for Python"
> +HOMEPAGE = "http://semanchuk.com/philip/sysv_ipc/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9d6e34e7b47096d7c19c1e3be707374e"
> +
> +PYPI_PACKAGE = "sysv_ipc"
> +
> +SRC_URI[md5sum] = "c6cf5b4aa7cd3e07fd4b5661530eca8c"
> +SRC_URI[sha256sum] = "0af73375a85c5d9d487c2f14f208812600bd81e4046437ebaf55746b3aade00e"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
> index c46cfcb..08a2ee0 100644
> --- a/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sysv-ipc_0.6.8.bb
> @@ -1,22 +1,2 @@
> -DESCRIPTION = "System V IPC primitives (semaphores, shared memory and message queues) for Python"
> -HOMEPAGE = "http://semanchuk.com/philip/sysv_ipc/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=9d6e34e7b47096d7c19c1e3be707374e"
> -
> -PYPI_PACKAGE = "sysv_ipc"
> -
> -SRC_URI[md5sum] = "c6cf5b4aa7cd3e07fd4b5661530eca8c"
> -SRC_URI[sha256sum] = "0af73375a85c5d9d487c2f14f208812600bd81e4046437ebaf55746b3aade00e"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> +require python-sysv-ipc.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
> new file mode 100644
> index 0000000..0e3dcd1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-sysv-ipc_0.6.8.bb
> @@ -0,0 +1,2 @@
> +require python-sysv-ipc.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4828): https://lists.yoctoproject.org/g/meta-virtualization/message/4828
> Mute This Topic: https://lists.yoctoproject.org/mt/66706238/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-singledispatch: Add python3 version
on 05/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-singledispatch.inc                 | 10 ++++++++++
>  .../python/python-singledispatch_3.4.0.3.bb          | 12 ++----------
>  .../python/python3-singledispatch_3.4.0.3.bb         |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-singledispatch.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch.inc b/meta-openstack/recipes-devtools/python/python-singledispatch.inc
> new file mode 100644
> index 0000000..3ea5026
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-singledispatch.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "functools.singledispatch from Python 3.4 to Python 2.6"
> +HOMEPAGE = "https://pypi.python.org/pypi/singledistpatch"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
> +
> +SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
> +SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> index 1c92a99..47c6698 100644
> --- a/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-singledispatch_3.4.0.3.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "functools.singledispatch from Python 3.4 to Python 2.6"
> -HOMEPAGE = "https://pypi.python.org/pypi/singledistpatch"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=ee3cd67264adc7eb07981f3644dc17dc"
> -
> -SRC_URI[md5sum] = "af2fc6a3d6cc5a02d0bf54d909785fcb"
> -SRC_URI[sha256sum] = "5b06af87df13818d14f08a028e42f566640aef80805c3b50c5056b086e3c2b9c"
> -
> -inherit setuptools pypi
> +require python-singledispatch.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb b/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb
> new file mode 100644
> index 0000000..0f4b483
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-singledispatch_3.4.0.3.bb
> @@ -0,0 +1,2 @@
> +require python-singledispatch.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4827): https://lists.yoctoproject.org/g/meta-virtualization/message/4827
> Mute This Topic: https://lists.yoctoproject.org/mt/66692375/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-saharaclient: Add python3 version
on 05/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-saharaclient.inc            | 28 +++++++++++++++++
>  .../python/python-saharaclient_git.bb         | 30 +------------------
>  .../python/python3-saharaclient_git.bb        |  2 ++
>  3 files changed, 31 insertions(+), 29 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-saharaclient.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient.inc b/meta-openstack/recipes-devtools/python/python-saharaclient.inc
> new file mode 100644
> index 0000000..91549ae
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-saharaclient.inc
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "CLI and python client library for OpenStack Sahara"
> +HOMEPAGE = "https://launchpad.net/sahara"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        ${PYTHON_PN}-pbr \
> +        "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +"
> +
> +RDEPENDS_${PN} += " \
> +	${PYTHON_PN}-pbr \
> +	"
> +
> +SRCNAME = "saharaclient"
> +
> +SRC_URI = "git://github.com/openstack/python-saharaclient.git;branch=master"
> +
> +PV = "2.3.0+git${SRCPV}"
> +SRCREV = "3107b452467537f4eef3d9ecfb5e35d110d19662"
> +S = "${WORKDIR}/git"
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> index 0d571c9..4b9587f 100644
> --- a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> @@ -1,30 +1,2 @@
> -DESCRIPTION = "CLI and python client library for OpenStack Sahara"
> -HOMEPAGE = "https://launchpad.net/sahara"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> -
> -DEPENDS += " \
> -        python-pip \
> -        python-pbr \
> -        "
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -"
> -
> -RDEPENDS_${PN} += " \
> -	python-pbr \
> -	"
> -
> -SRCNAME = "saharaclient"
> -
> -SRC_URI = "git://github.com/openstack/python-saharaclient.git;branch=master"
> -
> -PV = "2.3.0+git${SRCPV}"
> -SRCREV = "3107b452467537f4eef3d9ecfb5e35d110d19662"
> -S = "${WORKDIR}/git"
> -
> +require python-saharaclient.inc
>  inherit setuptools
> -
> diff --git a/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
> new file mode 100644
> index 0000000..806cd76
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-saharaclient_git.bb
> @@ -0,0 +1,2 @@
> +require python-saharaclient.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4826): https://lists.yoctoproject.org/g/meta-virtualization/message/4826
> Mute This Topic: https://lists.yoctoproject.org/mt/66673666/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-rtslib-fb: Add python3 version
on 05/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-rtslib-fb.inc               | 20 +++++++++++++++++
>  .../python/python-rtslib-fb_2.1.51.bb         | 22 ++-----------------
>  .../python/python3-rtslib-fb_2.1.51.bb        |  2 ++
>  3 files changed, 24 insertions(+), 20 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc b/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
> new file mode 100644
> index 0000000..e14f33d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-rtslib-fb.inc
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "API for Linux kernel SCSI target (aka LIO)"
> +HOMEPAGE = "http://github.com/agrover/rtslib-fb"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=867c358d5dbac2602d0c0f850f731e62"
> +
> +SRC_URI[md5sum] = "4ec7575eb90b7c5a91bbea2962f0e036"
> +SRC_URI[sha256sum] = "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571cbbb809229fd5553e"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
> index 46d6cc4..5e4d074 100644
> --- a/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rtslib-fb_2.1.51.bb
> @@ -1,20 +1,2 @@
> -DESCRIPTION = "API for Linux kernel SCSI target (aka LIO)"
> -HOMEPAGE = "http://github.com/agrover/rtslib-fb"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=867c358d5dbac2602d0c0f850f731e62"
> -
> -SRC_URI[md5sum] = "4ec7575eb90b7c5a91bbea2962f0e036"
> -SRC_URI[sha256sum] = "1902c581d6e04b7813f3cd1b11e2abc796205f646c39571cbbb809229fd5553e"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> +require python-rtslib-fb.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
> new file mode 100644
> index 0000000..571b68c
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-rtslib-fb_2.1.51.bb
> @@ -0,0 +1,2 @@
> +require python-rtslib-fb.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4825): https://lists.yoctoproject.org/g/meta-virtualization/message/4825
> Mute This Topic: https://lists.yoctoproject.org/mt/66661474/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-rjsmin: Add python3 version
on 05/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-rjsmin.inc   | 15 +++++++++++++++
>  .../python/python-rjsmin_1.0.12.bb              | 17 ++---------------
>  .../python/python3-rjsmin_1.0.12.bb             |  2 ++
>  3 files changed, 19 insertions(+), 15 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-rjsmin.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin.inc b/meta-openstack/recipes-devtools/python/python-rjsmin.inc
> new file mode 100644
> index 0000000..0305a33
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-rjsmin.inc
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "rJSmin is a javascript minifier written in python."
> +HOMEPAGE = "http://opensource.perlig.de/rjsmin/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[md5sum] = "9f67e133c88df5497d3da847603da9bf"
> +SRC_URI[sha256sum] = "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e50c7c02e4401386f1"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += " \
> +        "
> +
> +CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
> index 508390a..528c4a0 100644
> --- a/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rjsmin_1.0.12.bb
> @@ -1,15 +1,2 @@
> -DESCRIPTION = "rJSmin is a javascript minifier written in python."
> -HOMEPAGE = "http://opensource.perlig.de/rjsmin/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> -
> -SRC_URI[md5sum] = "9f67e133c88df5497d3da847603da9bf"
> -SRC_URI[sha256sum] = "dd9591aa73500b08b7db24367f8d32c6470021f39d5ab4e50c7c02e4401386f1"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -        "
> -
> -CLEANBROKEN = "1"
> +require python-rjsmin.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
> new file mode 100644
> index 0000000..9890e14
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-rjsmin_1.0.12.bb
> @@ -0,0 +1,2 @@
> +require python-rjsmin.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4824): https://lists.yoctoproject.org/g/meta-virtualization/message/4824
> Mute This Topic: https://lists.yoctoproject.org/mt/66657796/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-retrying: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-retrying.inc                | 20 +++++++++++++++++
>  .../python/python-retrying_1.3.3.bb           | 22 ++-----------------
>  .../python/python3-retrying_1.3.3.bb          |  2 ++
>  3 files changed, 24 insertions(+), 20 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-retrying.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-retrying.inc b/meta-openstack/recipes-devtools/python/python-retrying.inc
> new file mode 100644
> index 0000000..b33dc90
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-retrying.inc
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Retrying"
> +HOMEPAGE = "https://github.com/rholder/retrying"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
> +
> +SRC_URI[md5sum] = "2a126aeef8b21324ecdeac15ff46ef17"
> +SRC_URI[sha256sum] = "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24b37367b0bb41973b"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb b/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
> index 55c94d9..19bf62c 100644
> --- a/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-retrying_1.3.3.bb
> @@ -1,20 +1,2 @@
> -DESCRIPTION = "Retrying"
> -HOMEPAGE = "https://github.com/rholder/retrying"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"
> -
> -SRC_URI[md5sum] = "2a126aeef8b21324ecdeac15ff46ef17"
> -SRC_URI[sha256sum] = "08c039560a6da2fe4f2c426d0766e284d3b736e355f8dd24b37367b0bb41973b"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> +require python-retrying.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
> new file mode 100644
> index 0000000..9f001fe
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-retrying_1.3.3.bb
> @@ -0,0 +1,2 @@
> +require python-retrying.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4821): https://lists.yoctoproject.org/g/meta-virtualization/message/4821
> Mute This Topic: https://lists.yoctoproject.org/mt/66403968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-repoze.who: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-repoze.who.inc              | 22 +++++++++++++++++
>  .../python/python-repoze.who_2.2.bb           | 24 ++-----------------
>  .../python/python3-repoze.who_2.2.bb          |  2 ++
>  3 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.who.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who.inc b/meta-openstack/recipes-devtools/python/python-repoze.who.inc
> new file mode 100644
> index 0000000..1981e03
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.who.inc
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "An identification and authentication framework for WSGI"
> +HOMEPAGE = "http://repoze.org/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-Modification"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
> +
> +SRC_URI[md5sum] = "c677ac4d4a32b6f6880a8f9cf20adffb"
> +SRC_URI[sha256sum] = "322629ec7c779dce4700e8f3ba531002b724d2429178c1cbb0dc169255dc9a8b"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-pip \
> +    ${PYTHON_PN}-zopeinterface \
> +    "
> diff --git a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> index 3ee8f25..236b8f9 100644
> --- a/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-repoze.who_2.2.bb
> @@ -1,22 +1,2 @@
> -DESCRIPTION = "An identification and authentication framework for WSGI"
> -HOMEPAGE = "http://repoze.org/"
> -SECTION = "devel/python"
> -LICENSE = "BSD-Modification"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2c33cdbc6bc9ae6e5d64152fdb754292"
> -
> -SRC_URI[md5sum] = "c677ac4d4a32b6f6880a8f9cf20adffb"
> -SRC_URI[sha256sum] = "322629ec7c779dce4700e8f3ba531002b724d2429178c1cbb0dc169255dc9a8b"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -    python-pip \
> -    python-zopeinterface \
> -    "
> +require python-repoze.who.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
> new file mode 100644
> index 0000000..ee7c23d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-repoze.who_2.2.bb
> @@ -0,0 +1,2 @@
> +require python-repoze.who.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4820): https://lists.yoctoproject.org/g/meta-virtualization/message/4820
> Mute This Topic: https://lists.yoctoproject.org/mt/66398922/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-rcssmin: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-rcssmin.inc  | 15 +++++++++++++++
>  .../python/python-rcssmin_1.0.6.bb              | 17 ++---------------
>  .../python/python3-rcssmin_1.0.6.bb             |  2 ++
>  3 files changed, 19 insertions(+), 15 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-rcssmin.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin.inc b/meta-openstack/recipes-devtools/python/python-rcssmin.inc
> new file mode 100644
> index 0000000..c897395
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-rcssmin.inc
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "RCSSmin is a CSS minifier."
> +HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> +
> +SRC_URI[md5sum] = "467d56503ce386c0b0e52f69ac143a9a"
> +SRC_URI[sha256sum] = "ca87b695d3d7864157773a61263e5abb96006e9ff0e021eff90cbe0e1ba18270"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += " \
> +        "
> +
> +CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
> index e1b4a55..9b7624b 100644
> --- a/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rcssmin_1.0.6.bb
> @@ -1,15 +1,2 @@
> -DESCRIPTION = "RCSSmin is a CSS minifier."
> -HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> -
> -SRC_URI[md5sum] = "467d56503ce386c0b0e52f69ac143a9a"
> -SRC_URI[sha256sum] = "ca87b695d3d7864157773a61263e5abb96006e9ff0e021eff90cbe0e1ba18270"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += " \
> -        "
> -
> -CLEANBROKEN = "1"
> +require python-rcssmin.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb b/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
> new file mode 100644
> index 0000000..56347b5
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-rcssmin_1.0.6.bb
> @@ -0,0 +1,2 @@
> +require python-rcssmin.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4819): https://lists.yoctoproject.org/g/meta-virtualization/message/4819
> Mute This Topic: https://lists.yoctoproject.org/mt/66395045/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-python-editor: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-python-editor.inc           | 20 +++++++++++++++++
>  .../python/python-python-editor_git.bb        | 22 +------------------
>  .../python/python3-python-editor_git.bb       |  2 ++
>  3 files changed, 23 insertions(+), 21 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-python-editor.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-python-editor_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-python-editor.inc b/meta-openstack/recipes-devtools/python/python-python-editor.inc
> new file mode 100644
> index 0000000..07692a3
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-python-editor.inc
> @@ -0,0 +1,20 @@
> +DESCRIPTION = "Programmatically open an editor, capture the result"
> +HOMEPAGE = "https://github.com/fmoo/python-editor"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> +
> +PV = "0.4+git${SRCPV}"
> +SRCREV = "d6fa2a6bb3106a1ba00fe40f9af62e4ddc539e1e"
> +
> +SRCNAME = "python-editor"
> +SRC_URI = "git://github.com/fmoo/${SRCNAME}.git"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-python-editor_git.bb b/meta-openstack/recipes-devtools/python/python-python-editor_git.bb
> index db668d7..322aca4 100644
> --- a/meta-openstack/recipes-devtools/python/python-python-editor_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-python-editor_git.bb
> @@ -1,22 +1,2 @@
> -DESCRIPTION = "Programmatically open an editor, capture the result"
> -HOMEPAGE = "https://github.com/fmoo/python-editor"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
> -
> -PV = "0.4+git${SRCPV}"
> -SRCREV = "d6fa2a6bb3106a1ba00fe40f9af62e4ddc539e1e"
> -
> -SRCNAME = "python-editor"
> -SRC_URI = "git://github.com/fmoo/${SRCNAME}.git"
> -
> -S = "${WORKDIR}/git"
> -
> +require python-python-editor.inc
>  inherit setuptools
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -RDEPENDS_${PN} += " \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-python-editor_git.bb b/meta-openstack/recipes-devtools/python/python3-python-editor_git.bb
> new file mode 100644
> index 0000000..7529398
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-python-editor_git.bb
> @@ -0,0 +1,2 @@
> +require python-python-editor.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4818): https://lists.yoctoproject.org/g/meta-virtualization/message/4818
> Mute This Topic: https://lists.yoctoproject.org/mt/66383518/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pytest-salt: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pytest-salt.inc             | 21 +++++++++++++++++
>  .../python/python-pytest-salt_2017.7.0.bb     | 23 +------------------
>  .../python/python3-pytest-salt_2017.7.0.bb    |  2 ++
>  3 files changed, 24 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pytest-salt.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt.inc b/meta-openstack/recipes-devtools/python/python-pytest-salt.inc
> new file mode 100644
> index 0000000..1f82763
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pytest-salt.inc
> @@ -0,0 +1,21 @@
> +SUMMARY = "This pytest plugin will allow the Salt Daemons to be used in tests."
> +HOMEPAGE = "https://github.com/saltstack/pytest-salt"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
> +
> +SRCNAME = "pytest-salt"
> +SRC_URI = "git://github.com/saltstack/${SRCNAME}.git;branch=master"
> +
> +SRC_URI[md5sum] = "c598d7db87ea52cdeb067d7596b3b0b1"
> +SRC_URI[sha256sum] = "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c41135d754cc5b65e2494"
> +
> +SRCREV = "feb5031f80cf84b113ebe69543cdd44b6a373d21"
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} = " \
> +    ${PYTHON_PN}-pytest \
> +    ${PYTHON_PN}-pytest-tempdir \
> +    ${PYTHON_PN}-pytest-helpers-namespace \
> +    ${PYTHON_PN}-psutil \
> +    "
> diff --git a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
> index e2cf1cd..e599e77 100644
> --- a/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pytest-salt_2017.7.0.bb
> @@ -1,23 +1,2 @@
> -SUMMARY = "This pytest plugin will allow the Salt Daemons to be used in tests."
> -HOMEPAGE = "https://github.com/saltstack/pytest-salt"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fa818a259cbed7ce8bc2a22d35a464fc"
> -
> -SRCNAME = "pytest-salt"
> -SRC_URI = "git://github.com/saltstack/${SRCNAME}.git;branch=master"
> -
> -SRC_URI[md5sum] = "c598d7db87ea52cdeb067d7596b3b0b1"
> -SRC_URI[sha256sum] = "7052459cda9fbdbbfff9a25b24243b0b96cf56835a2c41135d754cc5b65e2494"
> -
> -SRCREV = "feb5031f80cf84b113ebe69543cdd44b6a373d21"
> -S = "${WORKDIR}/git"
> -
> +require python-pytest-salt.inc
>  inherit setuptools
> -
> -RDEPENDS_${PN} = " \
> -    python-pytest \
> -    python-pytest-tempdir \
> -    python-pytest-helpers-namespace \
> -    python-psutil \
> -    "
> diff --git a/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb
> new file mode 100644
> index 0000000..4e33265
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pytest-salt_2017.7.0.bb
> @@ -0,0 +1,2 @@
> +require python-pytest-salt.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4817): https://lists.yoctoproject.org/g/meta-virtualization/message/4817
> Mute This Topic: https://lists.yoctoproject.org/mt/66379672/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pysnmp: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pysnmp.inc    | 14 ++++++++++++++
>  .../python/python-pysnmp_4.2.5.bb                | 16 ++--------------
>  .../python/python3-pysnmp_4.2.5.bb               |  2 ++
>  3 files changed, 18 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pysnmp.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp.inc b/meta-openstack/recipes-devtools/python/python-pysnmp.inc
> new file mode 100644
> index 0000000..1a9ca0f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pysnmp.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
> +HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
> +
> +SRC_URI[md5sum] = "1f75d3e392a050e84348904fc1be3212"
> +SRC_URI[sha256sum] = "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b4b4d897150f7077f"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-pycrypto \
> +                   ${PYTHON_PN}-pyasn1 \
> +"
> diff --git a/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb b/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
> index dc2f5bf..2c41514 100644
> --- a/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pysnmp_4.2.5.bb
> @@ -1,14 +1,2 @@
> -DESCRIPTION = "A pure-Python SNMPv1/v2c/v3 library"
> -HOMEPAGE = "https://pypi.python.org/pypi/pysnmp"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ae098273b2cf8b4af164ac20e32bddf7"
> -
> -SRC_URI[md5sum] = "1f75d3e392a050e84348904fc1be3212"
> -SRC_URI[sha256sum] = "c46e65d99a604f690b3d5800e2f6e26e1ed9a3c7f7e17e7b4b4d897150f7077f"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-pycrypto \
> -                   python-pyasn1 \
> -"
> +require python-pysnmp.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
> new file mode 100644
> index 0000000..b31eb5a
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pysnmp_4.2.5.bb
> @@ -0,0 +1,2 @@
> +require python-pysnmp.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4816): https://lists.yoctoproject.org/g/meta-virtualization/message/4816
> Mute This Topic: https://lists.yoctoproject.org/mt/66365659/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pyflakes: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pyflakes.inc  | 14 ++++++++++++++
>  .../python/python-pyflakes_0.7.3.bb              | 16 ++--------------
>  .../python/python3-pyflakes_0.7.3.bb             |  2 ++
>  3 files changed, 18 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pyflakes.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes.inc b/meta-openstack/recipes-devtools/python/python-pyflakes.inc
> new file mode 100644
> index 0000000..df92d80
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pyflakes.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "passive checker of Python programs"
> +HOMEPAGE = "https://github.com/dreamhost/cliff"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
> +
> +SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
> +SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
> +            ${PYTHON_PN}-cmd2 \
> +            ${PYTHON_PN}-pyparsing"
> diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> index 81bca36..78a2e09 100644
> --- a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> @@ -1,14 +1,2 @@
> -DESCRIPTION = "passive checker of Python programs"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
> -
> -SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
> -SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing"
> \ No newline at end of file
> +require python-pyflakes.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb b/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
> new file mode 100644
> index 0000000..cc9e864
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pyflakes_0.7.3.bb
> @@ -0,0 +1,2 @@
> +require python-pyflakes.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4815): https://lists.yoctoproject.org/g/meta-virtualization/message/4815
> Mute This Topic: https://lists.yoctoproject.org/mt/66358719/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pathlib: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-pathlib.inc                 | 23 +++++++++++++++++
>  .../python/python-pathlib_1.0.1.bb            | 25 ++-----------------
>  .../python/python3-pathlib_1.0.1.bb           |  2 ++
>  3 files changed, 27 insertions(+), 23 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pathlib.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pathlib.inc b/meta-openstack/recipes-devtools/python/python-pathlib.inc
> new file mode 100644
> index 0000000..1df01f3
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pathlib.inc
> @@ -0,0 +1,23 @@
> +SUMMARY = "Object-oriented filesystem paths"
> +DESCRIPTION = "pathlib offers a set of classes to handle filesystem paths. \
> +It offers the following advantages over using string objects: \
> +- No more cumbersome use of os and os.path functions. \
> +- Embodies the semantics of different path types. \
> +- Well-defined semantics, eliminating any warts or ambiguities. \
> +"
> +HOMEPAGE = "https://pypi.python.org/pypi/pathlib"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b6557c860f0fc867aeab30afd649753"
> +
> +SRC_URI[md5sum] = "5099ed48be9b1ee29b31c82819240537"
> +SRC_URI[sha256sum] = "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
> +
> +inherit pypi
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +"
> +
> +RDEPENDS_${PN} += " \
> +"
> diff --git a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
> index 21c02a2..02aafbf 100644
> --- a/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
> @@ -1,23 +1,2 @@
> -SUMMARY = "Object-oriented filesystem paths"
> -DESCRIPTION = "pathlib offers a set of classes to handle filesystem paths. \
> -It offers the following advantages over using string objects: \
> -- No more cumbersome use of os and os.path functions. \
> -- Embodies the semantics of different path types. \
> -- Well-defined semantics, eliminating any warts or ambiguities. \
> -"
> -HOMEPAGE = "https://pypi.python.org/pypi/pathlib"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b6557c860f0fc867aeab30afd649753"
> -
> -SRC_URI[md5sum] = "5099ed48be9b1ee29b31c82819240537"
> -SRC_URI[sha256sum] = "6940718dfc3eff4258203ad5021090933e5c04707d5ca8cc9e73c94a7894ea9f"
> -
> -inherit setuptools pypi
> -
> -DEPENDS += " \
> -        python-pip \
> -"
> -
> -RDEPENDS_${PN} += " \
> -"
> +require python-pathlib.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb b/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
> new file mode 100644
> index 0000000..afed21e
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pathlib_1.0.1.bb
> @@ -0,0 +1,2 @@
> +require python-pathlib.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4814): https://lists.yoctoproject.org/g/meta-virtualization/message/4814
> Mute This Topic: https://lists.yoctoproject.org/mt/66342908/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-paste: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-paste.inc       | 12 ++++++++++++
>  .../recipes-devtools/python/python-paste_2.0.2.bb  | 14 ++------------
>  .../recipes-devtools/python/python3-paste_2.0.2.bb |  2 ++
>  3 files changed, 16 insertions(+), 12 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-paste.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-paste.inc b/meta-openstack/recipes-devtools/python/python-paste.inc
> new file mode 100644
> index 0000000..64ebc27
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-paste.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Tools for using a Web Server Gateway Interface stack"
> +HOMEPAGE = "http://pythonpaste.org/"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
> +
> +PYPI_PACKAGE = "Paste"
> +
> +SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
> +SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
> index d20283c..e82dd2a 100644
> --- a/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-paste_2.0.2.bb
> @@ -1,12 +1,2 @@
> -DESCRIPTION = "Tools for using a Web Server Gateway Interface stack"
> -HOMEPAGE = "http://pythonpaste.org/"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
> -
> -PYPI_PACKAGE = "Paste"
> -
> -SRC_URI[md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
> -SRC_URI[sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
> -
> -inherit setuptools pypi
> +require python-paste.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb b/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
> new file mode 100644
> index 0000000..c35d59e
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-paste_2.0.2.bb
> @@ -0,0 +1,2 @@
> +require python-paste.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4813): https://lists.yoctoproject.org/g/meta-virtualization/message/4813
> Mute This Topic: https://lists.yoctoproject.org/mt/66333592/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-pam: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pam.inc           | 10 ++++++++++
>  .../recipes-devtools/python/python-pam_0.1.4.bb      | 12 ++----------
>  .../recipes-devtools/python/python3-pam_0.1.4.bb     |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pam.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pam.inc b/meta-openstack/recipes-devtools/python/python-pam.inc
> new file mode 100644
> index 0000000..4fddfbc
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pam.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "PAM interface using ctypes"
> +HOMEPAGE = "http://atlee.ca/software/pam"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://setup.py;beginline=13;endline=13;md5=8ecc573c355c5eb26b2a4a4f3f62684d"
> +
> +SRC_URI[md5sum] = "4c5247af579352bb6882dac64be10a33"
> +SRC_URI[sha256sum] = "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640af1597c2a1dde226b"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb b/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
> index c818d5f..b583d30 100644
> --- a/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pam_0.1.4.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "PAM interface using ctypes"
> -HOMEPAGE = "http://atlee.ca/software/pam"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=13;endline=13;md5=8ecc573c355c5eb26b2a4a4f3f62684d"
> -
> -SRC_URI[md5sum] = "4c5247af579352bb6882dac64be10a33"
> -SRC_URI[sha256sum] = "35e88575afc37a2a5f96e20b22fa55d3e3213370d4ce640af1597c2a1dde226b"
> -
> -inherit setuptools pypi
> +require python-pam.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb b/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
> new file mode 100644
> index 0000000..e62079f
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pam_0.1.4.bb
> @@ -0,0 +1,2 @@
> +require python-pam.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4812): https://lists.yoctoproject.org/g/meta-virtualization/message/4812
> Mute This Topic: https://lists.yoctoproject.org/mt/66324704/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-ovs: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-ovs.inc           | 10 ++++++++++
>  .../recipes-devtools/python/python-ovs_2.7.2.bb      | 12 ++----------
>  .../recipes-devtools/python/python3-ovs_2.7.2.bb     |  2 ++
>  3 files changed, 14 insertions(+), 10 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-ovs.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-ovs.inc b/meta-openstack/recipes-devtools/python/python-ovs.inc
> new file mode 100644
> index 0000000..d9303f2
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-ovs.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "Open vSwitch library"
> +HOMEPAGE = "https://pypi.python.org/pypi/ovs"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
> +
> +SRC_URI[md5sum] = "8551ed58f4e5878db9a599e2d7792d98"
> +SRC_URI[sha256sum] = "24cc9e324b03ba8d5799f07edf6c8eef013d6cbf741707f42200b1674fd60928"
> +
> +inherit pypi
> diff --git a/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb b/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb
> index 2ec9a6e..cd3685d 100644
> --- a/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-ovs_2.7.2.bb
> @@ -1,10 +1,2 @@
> -DESCRIPTION = "Open vSwitch library"
> -HOMEPAGE = "https://pypi.python.org/pypi/ovs"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
> -
> -SRC_URI[md5sum] = "8551ed58f4e5878db9a599e2d7792d98"
> -SRC_URI[sha256sum] = "24cc9e324b03ba8d5799f07edf6c8eef013d6cbf741707f42200b1674fd60928"
> -
> -inherit setuptools pypi
> +require python-ovs.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb b/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
> new file mode 100644
> index 0000000..9c9b82b
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-ovs_2.7.2.bb
> @@ -0,0 +1,2 @@
> +require python-ovs.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4811): https://lists.yoctoproject.org/g/meta-virtualization/message/4811
> Mute This Topic: https://lists.yoctoproject.org/mt/66265798/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-ordereddict: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-ordereddict.inc             | 21 +++++++++++++++++
>  .../python/python-ordereddict_1.1.bb          | 23 ++-----------------
>  .../python/python3-ordereddict_1.1.bb         |  2 ++
>  3 files changed, 25 insertions(+), 21 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-ordereddict.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-ordereddict.inc b/meta-openstack/recipes-devtools/python/python-ordereddict.inc
> new file mode 100644
> index 0000000..fff4bf6
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-ordereddict.inc
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "A drop-in substitute for Py2.7's new collections.OrderedDict that works in Python 2.4-2.6."
> +HOMEPAGE = "https://pypi.python.org/pypi/ordereddict"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7f0267460024072a9bbf135ee87a41b8"
> +
> +SRC_URI[md5sum] = "a0ed854ee442051b249bfad0f638bbec"
> +SRC_URI[sha256sum] = "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-pip \
> +    "
> diff --git a/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb b/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
> index 6102ecb..9aa3f3e 100644
> --- a/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-ordereddict_1.1.bb
> @@ -1,21 +1,2 @@
> -DESCRIPTION = "A drop-in substitute for Py2.7's new collections.OrderedDict that works in Python 2.4-2.6."
> -HOMEPAGE = "https://pypi.python.org/pypi/ordereddict"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=7f0267460024072a9bbf135ee87a41b8"
> -
> -SRC_URI[md5sum] = "a0ed854ee442051b249bfad0f638bbec"
> -SRC_URI[sha256sum] = "1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -    python-pip \
> -    "
> +require python-ordereddict.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb b/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
> new file mode 100644
> index 0000000..46c08d0
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-ordereddict_1.1.bb
> @@ -0,0 +1,2 @@
> +require python-ordereddict.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4810): https://lists.yoctoproject.org/g/meta-virtualization/message/4810
> Mute This Topic: https://lists.yoctoproject.org/mt/66234172/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-memcache: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python-memcache.inc                | 22 +++++++++++++++++
>  .../python/python-memcache_1.2.9.bb           | 24 ++-----------------
>  .../python/python3-memcache_1.2.9.bb          |  2 ++
>  3 files changed, 26 insertions(+), 22 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-memcache.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-memcache.inc b/meta-openstack/recipes-devtools/python/python-memcache.inc
> new file mode 100644
> index 0000000..61fe67d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-memcache.inc
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "A comprehensive, fast, pure Python memcached client"
> +HOMEPAGE = "https://github.com/Pinterest/pymemcache"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e8538d10fb74087ea2dc61033b6ebf9f"
> +
> +PYPI_PACKAGE = "pymemcache"
> +
> +SRC_URI[md5sum] = "215510250997423a2a57da061b1bd592"
> +SRC_URI[sha256sum] = "05fd71f0337384024cc3d1340d35fd0d46307cf711eac9365b0eb166812bb121"
> +
> +inherit pypi
> +
> +# DEPENDS_default: python-pip
> +
> +DEPENDS += " \
> +        ${PYTHON_PN}-pip \
> +        "
> +
> +# RDEPENDS_default: 
> +RDEPENDS_${PN} += " \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
> index 96ca87e..2027c2a 100644
> --- a/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
> +++ b/meta-openstack/recipes-devtools/python/python-memcache_1.2.9.bb
> @@ -1,22 +1,2 @@
> -DESCRIPTION = "A comprehensive, fast, pure Python memcached client"
> -HOMEPAGE = "https://github.com/Pinterest/pymemcache"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e8538d10fb74087ea2dc61033b6ebf9f"
> -
> -PYPI_PACKAGE = "pymemcache"
> -
> -SRC_URI[md5sum] = "215510250997423a2a57da061b1bd592"
> -SRC_URI[sha256sum] = "05fd71f0337384024cc3d1340d35fd0d46307cf711eac9365b0eb166812bb121"
> -
> -inherit setuptools pypi
> -
> -# DEPENDS_default: python-pip
> -
> -DEPENDS += " \
> -        python-pip \
> -        "
> -
> -# RDEPENDS_default: 
> -RDEPENDS_${PN} += " \
> -        "
> +require python-memcache.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb b/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
> new file mode 100644
> index 0000000..08ecb7b
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-memcache_1.2.9.bb
> @@ -0,0 +1,2 @@
> +require python-memcache.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4809): https://lists.yoctoproject.org/g/meta-virtualization/message/4809
> Mute This Topic: https://lists.yoctoproject.org/mt/66206682/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization] [PATCH] python-mccabe: Add python3 version
on 04/12/2019 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-mccabe.inc    | 14 ++++++++++++++
>  .../python/python-mccabe_0.2.1.bb                | 16 ++--------------
>  .../python/python3-mccabe_0.2.1.bb               |  2 ++
>  3 files changed, 18 insertions(+), 14 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-mccabe.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-mccabe.inc b/meta-openstack/recipes-devtools/python/python-mccabe.inc
> new file mode 100644
> index 0000000..5f5e91d
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-mccabe.inc
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "McCabe checker, plugin for flake8"
> +HOMEPAGE = "https://github.com/dreamhost/cliff"
> +SECTION = "devel/python"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
> +
> +SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
> +SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-prettytable \
> +            ${PYTHON_PN}-cmd2 \
> +            ${PYTHON_PN}-pyparsing"
> diff --git a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> index fac44d9..68c2238 100644
> --- a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> @@ -1,14 +1,2 @@
> -DESCRIPTION = "McCabe checker, plugin for flake8"
> -HOMEPAGE = "https://github.com/dreamhost/cliff"
> -SECTION = "devel/python"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
> -
> -SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
> -SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} += "python-prettytable \
> -            python-cmd2 \
> -            python-pyparsing"
> \ No newline at end of file
> +require python-mccabe.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb b/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
> new file mode 100644
> index 0000000..8af8ec5
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-mccabe_0.2.1.bb
> @@ -0,0 +1,2 @@
> +require python-mccabe.inc
> +inherit setuptools3
> -- 
> 2.20.1
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4808): https://lists.yoctoproject.org/g/meta-virtualization/message/4808
> Mute This Topic: https://lists.yoctoproject.org/mt/66206614/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



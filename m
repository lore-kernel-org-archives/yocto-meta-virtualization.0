Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4595C433F5
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 22:14:49 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.24751.1643580888614566066
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 30 Jan 2022 14:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HfMcoVON;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id b35so10089889qkp.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 30 Jan 2022 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=+KoUZ6pCJUGTx4l8FXcYM7x0UyLc+S8mn8Flmrhk74Q=;
        b=HfMcoVONCdPw1OYU8sl+pY5VhO4XnKtqsC8GCGr/w4m/uSZOwtEaz7Zxce3izq6UHZ
         5OuDFwr+Hzn4beetqv3BNRH2oW40voep3U2W8ss8t4e2XdXfxvtejNGpiQSuUMT549tw
         zUnxv1wratr+UumO+r8WXHhgLnMhiJ83mNIeY8xJpaYeJVCYucsUgbHNOwNV749dW6nP
         99EYJNll6uaRNAeuxCNUw8bE130CbGpZkNJ6Tisff95WvfDy7979J80qN6QMhGog79py
         GigIsxrq0LxLvSkXTpPzOaGG/gJfFk8+o/sTIGL78+VFzFD5kK5O0xM4UUyFrNu4r5MV
         1pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+KoUZ6pCJUGTx4l8FXcYM7x0UyLc+S8mn8Flmrhk74Q=;
        b=aCkUMNSTGlSiEPpbTKEGlvIqNRoYwhg9M3gSvXRYeWfXUe+cBeSmPUS1dnecTHNjmk
         29OFH0/epVM+GSjfZKG2MmpyojR7pLwGo72jFy/9gLu4VnWNylQZgmTCMay6wUylU67X
         AmRrifx6xCHb2KZiYsbKU9XJokEh4grGKcf1FhYLKBe6Ysbuc8hvXx0RzoOyv2aEUb3K
         PxA24VhQN1+vTwaZPF9TktNhOMVcW+g1jZFopUeJI5WtQNLcZUjIDeokuTALI9sGqcYC
         8hzHzU+VWeXgg2o1+Hdc7AJBd3JJe31njQbvwKWdKaYTMxWYplalNxE7H4dR2jeWYNzH
         X3CA==
X-Gm-Message-State: AOAM531Uc1RlF0PYd5tIOTNdusn+fGz5Sl4vGNqKPtYTWO0foGsjgwRY
	m8gF52uey+c91dqSZxith2MrQFAWyD8caw==
X-Google-Smtp-Source: 
 ABdhPJyzBKX5bX8Nt6M9ZgtPgWKVzl6G8hSOtSWZ4L2exJ7Cxw+kez8Wv7Yn/YhtChbv243EsFyWuw==
X-Received: by 2002:a05:620a:141a:: with SMTP id
 d26mr11385430qkj.403.1643580887412;
        Sun, 30 Jan 2022 14:14:47 -0800 (PST)
Received: from gmail.com
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 c7sm7715015qkp.98.2022.01.30.14.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 14:14:46 -0800 (PST)
Date: Sun, 30 Jan 2022 17:14:45 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy <wangmy@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][PATCH 6/8]
 python3-termcolor: inherit setuptools3 not distutils
Message-ID: <20220130221442.GA21283@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1642569125-18758-3-git-send-email-wangmy@fujitsu.com>
 <1642569125-18758-4-git-send-email-wangmy@fujitsu.com>
 <1642569125-18758-2-git-send-email-wangmy@fujitsu.com>
 <1642569125-18758-1-git-send-email-wangmy@fujitsu.com>
 <1642569168-18815-1-git-send-email-wangmy@fujitsu.com>
 <1642569194-18853-3-git-send-email-wangmy@fujitsu.com>
 <1642569194-18853-2-git-send-email-wangmy@fujitsu.com>
 <1642569194-18853-1-git-send-email-wangmy@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 30 Jan 2022 22:14:49 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7039

Thanks for the update, the series is now applied.

Bruce

In message: [meta-virtualization][meta-cloud-services][PATCH 6/8] python3-termcolor: inherit setuptools3 not distutils
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-termcolor_1.1.0.bb          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
> index a8d50097..127287a7 100644
> --- a/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-termcolor_1.1.0.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
>  SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
>  SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
>  
> -inherit distutils3 pypi
> +inherit setuptools3 pypi
>  
>  DEPENDS += " \
>          python3-pip \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7022): https://lists.yoctoproject.org/g/meta-virtualization/message/7022
> Mute This Topic: https://lists.yoctoproject.org/mt/88528859/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 7/8] mod-wsgi: inherit setuptools3-base not distutils3-base
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> index 910bba1b..b0daf54d 100644
> --- a/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> +++ b/meta-openstack/recipes-support/mod-wsgi/mod-wsgi_git.bb
> @@ -20,7 +20,7 @@ SRC_URI = "\
>  	file://configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch \        
>  	"
>  
> -inherit autotools-brokensep distutils3-base
> +inherit autotools-brokensep setuptools3-base
>  
>  DEPENDS += "apache2-native apache2 python3"
>  RDEPENDS:${PN} = "python3"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7021): https://lists.yoctoproject.org/g/meta-virtualization/message/7021
> Mute This Topic: https://lists.yoctoproject.org/mt/88528858/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 8/8] python3-novnc: update 0.5.1 -> 1.3.0
on 19/01/2022 wangmy wrote:

> refresh python-distutils.patch
> 
> License-Update:
> -year updated to 2019
> -file of the noVNC core library changed
> -the HTML, CSS, font and images files that included with the noVNC
>  source distibution changed
> -URL of history changed
> -files and projects that have been incorporated into
>  the noVNC core library changed
> -license texts changed
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python-distutils.patch                                | 4 ++--
>  .../python/{python-novnc_git.bb => python3-novnc_git.bb}  | 8 +++-----
>  2 files changed, 5 insertions(+), 7 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-novnc => python3-novnc}/python-distutils.patch (91%)
>  rename meta-openstack/recipes-devtools/python/{python-novnc_git.bb => python3-novnc_git.bb} (68%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-novnc/python-distutils.patch b/meta-openstack/recipes-devtools/python/python3-novnc/python-distutils.patch
> similarity index 91%
> rename from meta-openstack/recipes-devtools/python/python-novnc/python-distutils.patch
> rename to meta-openstack/recipes-devtools/python/python3-novnc/python-distutils.patch
> index ef3393f3..85befc9f 100644
> --- a/meta-openstack/recipes-devtools/python/python-novnc/python-distutils.patch
> +++ b/meta-openstack/recipes-devtools/python/python3-novnc/python-distutils.patch
> @@ -1,13 +1,13 @@
>  Index: git/setup.py
>  ===================================================================
>  --- /dev/null
> -+++ git/setup.py
> ++++ b/setup.py
>  @@ -0,0 +1,14 @@
>  +#!/usr/bin/env python
>  +
>  +from distutils.core import setup
>  +
> -+setup(name='python-novnc',
> ++setup(name='python3-novnc',
>  +      version='2012.1~e3',
>  +      description='NoVNC python libraries',
>  +      author='Ghe Rivero',
> diff --git a/meta-openstack/recipes-devtools/python/python-novnc_git.bb b/meta-openstack/recipes-devtools/python/python3-novnc_git.bb
> similarity index 68%
> rename from meta-openstack/recipes-devtools/python/python-novnc_git.bb
> rename to meta-openstack/recipes-devtools/python/python3-novnc_git.bb
> index da5f048e..b41b5876 100644
> --- a/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-novnc_git.bb
> @@ -2,13 +2,11 @@ DESCRIPTION = "This package contains the core python parts of NoVNC"
>  HOMEPAGE = "https://github.com/kanaka/noVNC"
>  SECTION = "devel/python"
>  
> -PR = "r0"
> -
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6458695fb66dcd893becb5f9f912715e"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=99aebbcc36b17df855fad64d4b792bff"
>  
> -SRCREV = "3b8ec46fd26d644e6edbea4f46e630929297e448"
> -PV = "0.5.1+git${SRCPV}"
> +SRCREV = "463c39e4af98ec4106b87bbea17e1605aa4c6180"
> +PV = "1.3.0"
>  
>  SRC_URI = "git://github.com/kanaka/noVNC.git;branch=master;protocol=https \
>             file://python-distutils.patch"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7020): https://lists.yoctoproject.org/g/meta-virtualization/message/7020
> Mute This Topic: https://lists.yoctoproject.org/mt/88528857/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 5/8] python3-mimeparse: inherit setuptools3 not distutils
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-mimeparse_1.6.0.bb          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb b/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
> index da87dfdb..ae7bd430 100644
> --- a/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-mimeparse_1.6.0.bb
> @@ -9,7 +9,7 @@ PYPI_PACKAGE = "python-mimeparse"
>  SRC_URI[md5sum] = "a32ae1df93be1ddb581d1c0fa124bab4"
>  SRC_URI[sha256sum] = "76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78"
>  
> -inherit distutils3 pypi setuptools3
> +inherit pypi setuptools3
>  
>  DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --prefix=${prefix} \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7019): https://lists.yoctoproject.org/g/meta-virtualization/message/7019
> Mute This Topic: https://lists.yoctoproject.org/mt/88528850/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 1/8] python-novnc: inherit setuptools3 not distutils
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-novnc_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-novnc_git.bb b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> index 50041ac9..da5f048e 100644
> --- a/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-novnc_git.bb
> @@ -15,6 +15,6 @@ SRC_URI = "git://github.com/kanaka/noVNC.git;branch=master;protocol=https \
>  
>  S = "${WORKDIR}/git"
>  
> -inherit distutils3
> +inherit setuptools3
>  
> -DEPENDS += " python-websockify"
> +DEPENDS += " python3-websockify"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7015): https://lists.yoctoproject.org/g/meta-virtualization/message/7015
> Mute This Topic: https://lists.yoctoproject.org/mt/88528832/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 2/8] python3-fixtures: inherit setuptools3 not distutils
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-fixtures_3.0.0.bb           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
> index 6cd0d810..a9335317 100644
> --- a/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-fixtures_3.0.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=239e2f4698b85aad5ed39bae5d2ef226"
>  SRC_URI[md5sum] = "cd6345b497a62fad739efee66346c2e0"
>  SRC_URI[sha256sum] = "fcf0d60234f1544da717a9738325812de1f42c2fa085e2d9252d8fff5712b2ef"
>  
> -inherit distutils3 pypi
> +inherit setuptools3 pypi
>  
>  DISTUTILS_INSTALL_ARGS = "--root=${D} \
>      --prefix=${prefix} \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7018): https://lists.yoctoproject.org/g/meta-virtualization/message/7018
> Mute This Topic: https://lists.yoctoproject.org/mt/88528836/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 4/8] python3-lockfile: inherit setuptools3 not distutils
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-devtools/python/python3-lockfile_0.12.2.bb          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb b/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
> index 81e1f22b..ba446380 100644
> --- a/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-lockfile_0.12.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2340dffbbfea534b58f1349984eeef72"
>  SRC_URI[md5sum] = "a6a1a82957a23afdf44cfdd039b65ff9"
>  SRC_URI[sha256sum] = "6aed02de03cba24efabcd600b30540140634fc06cfa603822d508d5361e9f799"
>  
> -inherit distutils3 pypi
> +inherit setuptools3 pypi
>  
>  DEPENDS += "\
>      python3-pbr \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7016): https://lists.yoctoproject.org/g/meta-virtualization/message/7016
> Mute This Topic: https://lists.yoctoproject.org/mt/88528834/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][meta-cloud-services][PATCH 3/8] python3-ipaddr: inherit setuptools3 not distutils
on 19/01/2022 wangmy wrote:

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb b/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
> index 2706954a..bb236eb8 100644
> --- a/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-ipaddr_2.2.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e7e54827196088e6e96b33e9aec35c4a"
>  SRC_URI[md5sum] = "f88353e40dec06410acfa075b8209b27"
>  SRC_URI[sha256sum] = "4092dfe667588d16aa12b59acb7c8a4024e5dcb23a681cd0b0b602373eca88d6"
>  
> -inherit distutils3 pypi
> +inherit setuptools3 pypi
>  
>  DEPENDS += " \
>          python3-pip \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7017): https://lists.yoctoproject.org/g/meta-virtualization/message/7017
> Mute This Topic: https://lists.yoctoproject.org/mt/88528835/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 




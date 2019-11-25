Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2450.1574716347701800594
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 Nov 2019 13:12:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OkJ2Jzx2;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51033E00F6F; Mon, 25 Nov 2019 13:12:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,FSL_HELO_FAKE,RCVD_IN_DNSWL_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  2.8 FSL_HELO_FAKE FSL_HELO_FAKE
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C773EE00DAF
	for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 13:12:26 -0800 (PST)
Received: by mail-qt1-f196.google.com with SMTP id t20so18839490qtn.9
        for <meta-virtualization@yoctoproject.org>; Mon, 25 Nov 2019 13:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u5gPL+2daqCSj5wervQ652iOB9RXY6LEzT6OOKCYiag=;
        b=OkJ2Jzx288aFjv7X/+NweWDlAdafz+qrcKQ5ZGMifL1LcTru9Bz3SfWsOpQcuocO3o
         JM0g1qeqa4Xd30XOcYnmQ0Ij8g48Dh6z0bgH1AFEuOn/fI8vpltpDtIimM34Kn5M78/+
         B0xznZi5bfkbEf3Y7nwDxUsGoH0U7UHopQ+WoA1/X6Lhr4mIBi7XVxLORKtXrlRIn14l
         69LTYzG6nNCC5h9L6MTLDi9dfKpdq7HLASmEs2iL7Eem+VLMtQIVVoTOA5J6CY+c5h4b
         r4/JUA1VRQqCBwg8hHatMcTAPy/etDHK9PWMbga9LLaMZLF5OBoV5qCJx7Pi39o6vTvs
         pkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u5gPL+2daqCSj5wervQ652iOB9RXY6LEzT6OOKCYiag=;
        b=N3aXrm5zVEdoBt0yi5JJ6RBf+RAZtNcrzahUxL+6gMD5+qgCEwSwhHdd7kq6715XGx
         TS3GH4dfswfU20K9dMZDQbPVE6QntAu8tvufi04RySWQlR/Ghl9Jb/yFPo46KagVYY0+
         ZPrETMh0WouD5bUUYP4MhBLD8dU+fU95ZDULUx0oQP66br1pHKD8CMU8mRfOBwi8SayJ
         d4OfA+xxvHJtQrhnTnLEY7554zBMMUsT+cO4ZaZIF+ooJ6IV797N/SyVtDbUqh8dK3lB
         fEOU/SGrnD8JDJL7Lm7KczrONGyNTDfcPMpTK1hx/4x2dqNpCc7Od+Z8M7kLO5DNbAbL
         +llw==
X-Gm-Message-State: APjAAAXUAtbxz6UgINeOOYuX6/gBSlvi9/R6o676WVG8e+cP8UIVjZxP
	TrihE8VWB8rpIfeawyyYOla2kvLWJpc=
X-Google-Smtp-Source: APXvYqzxNqwkTuUbHf0pdkYYXxOANCFrYK8z0VPJLf2b9dVscHcN4j7LIAZwgJdw0sjtLauidlWIkA==
X-Received: by 2002:ac8:45c2:: with SMTP id e2mr31143846qto.366.1574716345864;
        Mon, 25 Nov 2019 13:12:25 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id o3sm3963452qkg.100.2019.11.25.13.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 13:12:25 -0800 (PST)
Date: Mon, 25 Nov 2019 16:12:23 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
Message-ID: <20191125211220.GA28355@gmail.com>
References: <20191122074510.1992-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20191122074510.1992-1-Qi.Chen@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH] python3-docker-compose: remove maximum version requirements
on 22/11/2019 Chen Qi wrote:

> Remove maximum version requirements for docker-compose so that it
> does not require old version recipes.

Which oe-core versions of the packages are newer than the maximum values
listed in docer compose ?

I'd like to log that in this commit log .. since that is the justification
for the patch.

Bruce

> 
> The current one has been tested against https://docs.docker.com/compose/gettingstarted/.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...upport-newer-minor-version-of-reques.patch | 44 --------------
>  ...-remove-maximum-version-requirements.patch | 58 +++++++++++++++++++
>  .../python3-docker-compose_1.21.2.bb          |  2 +-
>  3 files changed, 59 insertions(+), 45 deletions(-)
>  delete mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>  create mode 100644 recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> 
> diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
> deleted file mode 100644
> index 48a6f25..0000000
> --- a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
> -From: Li Zhou <li.zhou@windriver.com>
> -Date: Thu, 10 Oct 2019 15:46:20 +0800
> -Subject: [PATCH] docker-compose: support newer minor version of requests
> -
> -Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ----
> - requirements.txt | 2 +-
> - setup.py         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/requirements.txt b/requirements.txt
> -index 93a0cce..42bde41 100644
> ---- a/requirements.txt
> -+++ b/requirements.txt
> -@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
> - pypiwin32==220; sys_platform == 'win32' and python_version >= '3.6'
> - PySocks==1.6.7
> - PyYAML==3.12
> --requests==2.18.4
> -+requests==2.19.1
> - six==1.10.0
> - texttable==0.9.1
> - urllib3==1.21.1
> -diff --git a/setup.py b/setup.py
> -index 422ba54..a74ee0f 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -33,7 +33,7 @@ install_requires = [
> -     'cached-property >= 1.2.0, < 2',
> -     'docopt >= 0.6.1, < 0.7',
> -     'PyYAML >= 3.10, < 4',
> --    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
> -+    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.20',
> -     'texttable >= 0.9.0, < 0.10',
> -     'websocket-client >= 0.32.0, < 1.0',
> -     'docker >= 3.3.0, < 4.0',
> --- 
> -1.9.1
> -
> diff --git a/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> new file mode 100644
> index 0000000..54835ff
> --- /dev/null
> +++ b/recipes-containers/docker-compose/files/0001-setup.py-remove-maximum-version-requirements.patch
> @@ -0,0 +1,58 @@
> +From 2685716409c560cdf94aee6262ed8c32ad137133 Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Fri, 22 Nov 2019 09:24:58 +0800
> +Subject: [PATCH] setup.py: remove maximum version requirements
> +
> +Remove maximum version requirements so that docker-compose will not
> +require old version recipes.
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + setup.py | 22 +++++++++++-----------
> + 1 file changed, 11 insertions(+), 11 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 422ba54..c2b4556 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -30,16 +30,16 @@ def find_version(*file_paths):
> + 
> + 
> + install_requires = [
> +-    'cached-property >= 1.2.0, < 2',
> +-    'docopt >= 0.6.1, < 0.7',
> +-    'PyYAML >= 3.10, < 4',
> +-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
> +-    'texttable >= 0.9.0, < 0.10',
> +-    'websocket-client >= 0.32.0, < 1.0',
> +-    'docker >= 3.3.0, < 4.0',
> +-    'dockerpty >= 0.4.1, < 0.5',
> +-    'six >= 1.3.0, < 2',
> +-    'jsonschema >= 2.5.1, < 3',
> ++    'cached-property >= 1.2.0',
> ++    'docopt >= 0.6.1',
> ++    'PyYAML >= 3.10',
> ++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0',
> ++    'texttable >= 0.9.0',
> ++    'websocket-client >= 0.32.0',
> ++    'docker >= 3.3.0',
> ++    'dockerpty >= 0.4.1',
> ++    'six >= 1.3.0',
> ++    'jsonschema >= 2.5.1',
> + ]
> + 
> + 
> +@@ -56,7 +56,7 @@ extras_require = {
> +     ':python_version < "3.5"': ['backports.ssl_match_hostname >= 3.5'],
> +     ':python_version < "3.3"': ['ipaddress >= 1.0.16'],
> +     ':sys_platform == "win32"': ['colorama >= 0.3.9, < 0.4'],
> +-    'socks': ['PySocks >= 1.5.6, != 1.5.7, < 2'],
> ++    'socks': ['PySocks >= 1.5.6, != 1.5.7'],
> + }
> + 
> + 
> +-- 
> +2.17.1
> +
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> index a7f7b1c..a895005 100644
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://www.docker.com/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>  
> -SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
> +SRC_URI += "file://0001-setup.py-remove-maximum-version-requirements.patch"
>  
>  inherit pypi setuptools3
>  
> -- 
> 2.17.1
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4733): https://lists.yoctoproject.org/g/meta-virtualization/message/4733
> Mute This Topic: https://lists.yoctoproject.org/mt/61564429/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


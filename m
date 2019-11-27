Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1154.1574895463820218711
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 14:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ECR8QA1E;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB970E01080; Wed, 27 Nov 2019 14:57:43 -0800 (PST)
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
	*      [209.85.208.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EC0DE00E45
	for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 14:57:40 -0800 (PST)
Received: by mail-ed1-f65.google.com with SMTP id p59so21085114edp.7
        for <meta-virtualization@yoctoproject.org>; Wed, 27 Nov 2019 14:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eXZX4EYzM7RWM2nNApzxhfCzE2AT6xP4QgwV2Xo0+WU=;
        b=ECR8QA1EoS51+zhpHs0+vYud2WNrMTMoimf4vM+gibL6ZTKpHPvYicOeMnBgEedV9y
         ynGKK7Igu/L/QhhC9AeZz0IL0l7SKJy0pVJwzJE/9Bu/LxVyKpYumWpTaboFNtft4+OL
         LUnPN4LzSP7WseSMMrMPkUdK2ts/Br1pfQRCcKtp6VqzQCHb9r0Rx45IRmc5jtr0zUuI
         rTur7P2Sc3b7kG/v0n4z1nPKrOI+Er2AxHSzKn57GhQR2GNGXOl/XmwUj3M8YswzxGLi
         SvLaDbbElEFjII+YzrEo/79KYqldNMBOKjBDzhoBm48jEw/lUTpDh6Y96lobHc15P87o
         sg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXZX4EYzM7RWM2nNApzxhfCzE2AT6xP4QgwV2Xo0+WU=;
        b=OGEaW1hnwq35RI54ssKN5DNganTJaDBB12Z7j7bem+2DIilRcvTNcMt6taWt9k6RNn
         XreCTV05WMLR75A0BwZMJmFhNqGh+CLVdC44U7aTji28/sIpG8bY47p5Zxai3O/n/QFh
         CWlytc+pgfqYpmTN09rq9nJ/8CdglMskbtTx+ViRB1aruQkz7SMRWmbcx3EDLwfRwUmP
         fNQBar96rR6a0a178mHGFOUZBcp4ygDCRBgcPg9PlFjfScs/kg+e6ScR/luBgVFMJK0O
         gOPjFFR6zxTN8CUtgof3kLiknUhdPgVP0WCBngq17zoT4FHu5VS2Wk1rhmyxhSm19L0d
         OLQw==
X-Gm-Message-State: APjAAAWkUMtGTBAksRGFEJvAeDKYEFOd+IjvEGxAdCJYiZIs4nmJZOnn
	IcQRv5z9rfgiFE5VA8pbumG90PaYwKDdMPZXFXY=
X-Google-Smtp-Source: APXvYqzR5Bm2jgOo9Bb5440gTfwfxl4OE2JvO0a59LbS1cUoR7DCXeO4cSGKCIQgdSdalbpsVCEFPhOtgHaQ5fXT78U=
X-Received: by 2002:a05:6402:2036:: with SMTP id ay22mr29486060edb.303.1574895459899;
 Wed, 27 Nov 2019 14:57:39 -0800 (PST)
MIME-Version: 1.0
References: <20191126011216.15333-1-Qi.Chen@windriver.com>
In-Reply-To: <20191126011216.15333-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 27 Nov 2019 17:57:28 -0500
Message-ID: <CADkTA4NwG0UO9v+RA9XM3NWgzTDNs7vcV__yFdcMnPZbRb2J4g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH V2] python3-docker-compose: remove maximum version requirements
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

v2 is merged to master.

Bruce

On Mon, Nov 25, 2019 at 8:12 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Remove maximum version requirements for docker-compose so that it
> does not require old version recipes.
>
> The old version recipes required are as below.
> * PyYAML
> * requests
> * urllib3
> * idna
> * jsonschema
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
> View/Reply Online (#4747): https://lists.yoctoproject.org/g/meta-virtualization/message/4747
> Mute This Topic: https://lists.yoctoproject.org/mt/61952169/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

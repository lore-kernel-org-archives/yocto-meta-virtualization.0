Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0122E00D77; Fri, 18 Oct 2019 21:32:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	*  1.8 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3025E00874
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:32:58 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id p4so7320714qkf.5
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5/RpX7kePGFJB71ZKzTzEdHwpCfxqnPmEkhH9a4VKJk=;
	b=OBj1/dy8a8GQ68Ne88SI5Lfsk4iuIG/b+RjPPTPkH0zM86Xb37PZSLcr6EayM81UI3
	J2wTVbBJQd3c6xoj9E5d6OBq1HnI6h564+Vvj7KhOQbdld+OX9dkSwKPzZ0LPz3jbgG9
	ytv+rYFfL4qsdVwkuqZup5JFlpwoq/kUJeBn3ch9cICFzG+5wjUqVjdJwe4EUY5GidJv
	8cEpnW6xywpblisPYFiDLtyuE9pWZo2Tujs4kQKe8u/bvP1Vgqz4orr21JsqbIANMKbS
	Ln5IjXkvKQvz+LNftJ2uUOlY9v+hlwdbkGhF33cnR8Ww5wFFbcWOVxszskyYKT1hokA7
	ff4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5/RpX7kePGFJB71ZKzTzEdHwpCfxqnPmEkhH9a4VKJk=;
	b=eDwB+h1I/nU6JStV1vDdQduBD6A05Kr+P9oBkT875yUF8v7+d0Xiu9mNldVDxRTyCC
	upRmlQRKqsn0GyBKiPxtL6QcJVxge4V1r357vrDQqNhLFg/4I9AuYrmV4mIDBpZ6dRfc
	X/UInESU5cyvQRw49ZKxpyEaQ9ZkTghWYTV7b64M3jZF36GFJGdBvUkFfXd5088BDNx3
	9386pPuXm8DKv8AuofkutZNaSK/IMehyk2/EHO+cyrkOYhx7Vpy6LD8Hjw78x7dvY0ky
	Gl71fHZ/hcSgLBkFVxD8ZmCt9hgxqflNpf2QzAgIjVMrTwyzhCQYFvuU3xeFkcTpj6ca
	OW5A==
X-Gm-Message-State: APjAAAV+wO/JweXXwFuGcKTfedNk3HQv+guxDsUCaeWsWQGR3aRFZPlT
	93KPHBRSSE6B0IoxwC7ReGGzEPFrQEgDFQ==
X-Google-Smtp-Source: APXvYqxjYb3wp08rAUaa+RkztvzNOSSRcYMzWs2SoYloq09Kr7w29E0TyudnKBIXe4Z2WmFZzYVThA==
X-Received: by 2002:a37:de0c:: with SMTP id h12mr7678295qkj.495.1571459577603; 
	Fri, 18 Oct 2019 21:32:57 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	r7sm3845979qkf.124.2019.10.18.21.32.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 18 Oct 2019 21:32:56 -0700 (PDT)
Date: Sat, 19 Oct 2019 00:32:54 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Message-ID: <20191019043251.GA41881@gmail.com>
References: <1571290754-166048-1-git-send-email-li.zhou@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1571290754-166048-1-git-send-email-li.zhou@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python3-docker-compose: upgrade to version 1.21.2
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
X-List-Received-Date: Sat, 19 Oct 2019 04:33:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python3-docker-compose: upgrade to version 1.21.2
on 17/10/2019 Li Zhou wrote:

> The python3-docker-compose_1.16.1 requires 'docker<3.0, >=2.5.1', while
> python3-docker 3.4.0 is provided. Error occurs when running
> 'docker-compose --version'.
> Upgrade to python3-docker-compose_1.21.2 to make it work.
> 
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  .../0001-Allow-newer-versions-of-requests.patch    | 32 ----------------
>  ...ose-support-newer-minor-version-of-reques.patch | 44 ++++++++++++++++++++++
>  ..._1.16.1.bb => python3-docker-compose_1.21.2.bb} |  6 +--
>  3 files changed, 47 insertions(+), 35 deletions(-)
>  delete mode 100644 recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
>  create mode 100644 recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
>  rename recipes-containers/docker-compose/{python3-docker-compose_1.16.1.bb => python3-docker-compose_1.21.2.bb} (75%)
> 
> diff --git a/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch b/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
> deleted file mode 100644
> index 6fc7bb4..0000000
> --- a/recipes-containers/docker-compose/files/0001-Allow-newer-versions-of-requests.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 15cf1a31f5af8f09531bb837b92bd6ea49bd1744 Mon Sep 17 00:00:00 2001
> -From: Pascal Bach <pascal.bach@siemens.com>
> -Date: Wed, 13 Sep 2017 08:41:21 +0200
> -Subject: [PATCH] Allow newer versions of requests
> -
> -docker compose has strict requirements to use requests < 2.12
> -
> -However it works without issues with newer versions, so this patch removes the check.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ----
> - setup.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/setup.py b/setup.py
> -index 192a0f6..f444757 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -33,7 +33,7 @@ install_requires = [
> -     'cached-property >= 1.2.0, < 2',
> -     'docopt >= 0.6.1, < 0.7',
> -     'PyYAML >= 3.10, < 4',
> --    'requests >= 2.6.1, != 2.11.0, < 2.12',
> -+    'requests >= 2.6.1, != 2.11.0',
> -     'texttable >= 0.9.0, < 0.10',
> -     'websocket-client >= 0.32.0, < 1.0',
> -     'docker >= 2.5.1, < 3.0',
> --- 
> -2.1.4
> -
> diff --git a/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
> new file mode 100644
> index 0000000..48a6f25
> --- /dev/null
> +++ b/recipes-containers/docker-compose/files/0001-docker-compose-support-newer-minor-version-of-reques.patch
> @@ -0,0 +1,44 @@
> +From b4655b5e7f1e5b87a758dfd7af01a49a40ed148a Mon Sep 17 00:00:00 2001
> +From: Li Zhou <li.zhou@windriver.com>
> +Date: Thu, 10 Oct 2019 15:46:20 +0800
> +Subject: [PATCH] docker-compose: support newer minor version of requests
> +
> +Signed-off-by: Ofek Lev <ofekmeister@gmail.com>
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + requirements.txt | 2 +-
> + setup.py         | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/requirements.txt b/requirements.txt
> +index 93a0cce..42bde41 100644
> +--- a/requirements.txt
> ++++ b/requirements.txt
> +@@ -16,7 +16,7 @@ pypiwin32==219; sys_platform == 'win32' and python_version < '3.6'
> + pypiwin32==220; sys_platform == 'win32' and python_version >= '3.6'
> + PySocks==1.6.7
> + PyYAML==3.12
> +-requests==2.18.4
> ++requests==2.19.1
> + six==1.10.0
> + texttable==0.9.1
> + urllib3==1.21.1
> +diff --git a/setup.py b/setup.py
> +index 422ba54..a74ee0f 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -33,7 +33,7 @@ install_requires = [
> +     'cached-property >= 1.2.0, < 2',
> +     'docopt >= 0.6.1, < 0.7',
> +     'PyYAML >= 3.10, < 4',
> +-    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.19',
> ++    'requests >= 2.6.1, != 2.11.0, != 2.12.2, != 2.18.0, < 2.20',
> +     'texttable >= 0.9.0, < 0.10',
> +     'websocket-client >= 0.32.0, < 1.0',
> +     'docker >= 3.3.0, < 4.0',
> +-- 
> +1.9.1
> +
> diff --git a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> similarity index 75%
> rename from recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
> rename to recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> index 851c251..a7f7b1c 100644
> --- a/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.21.2.bb
> @@ -3,12 +3,12 @@ HOMEPAGE = "https://www.docker.com/"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
>  
> -SRC_URI += "file://0001-Allow-newer-versions-of-requests.patch"
> +SRC_URI += "file://0001-docker-compose-support-newer-minor-version-of-reques.patch"
>  
>  inherit pypi setuptools3
>  
> -SRC_URI[md5sum] = "8dcadf09143600fcb573b43f446c8f9a"
> -SRC_URI[sha256sum] = "fb46a6a2c4d193a3ff1e4d7208eea920b629c81dc92257c87f3f93095cfb0bdf"
> +SRC_URI[md5sum] = "a243f59b2d286c41ff6ed1c4d4b50996"
> +SRC_URI[sha256sum] = "68b07193755440d5f8d4f47e6f3484212afc255d5b785a81353ea1e9298c1c2c"
>  
>  RDEPENDS_${PN} = "\
>    ${PYTHON_PN}-cached-property \
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


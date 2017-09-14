Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99C32E00CC6; Thu, 14 Sep 2017 13:00:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	HTML_OBFUSCATE_10_20, 
	RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.52 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.52 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.1 HTML_OBFUSCATE_10_20 BODY: Message is 10% to 20% HTML obfuscation
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1234E00C45
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:00:09 -0700 (PDT)
Received: by mail-vk0-f52.google.com with SMTP id i1so183842vke.12
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1Srdp5hDyhvCp5qV/Eglmt3IaUivPBfGT5UH3UaOBno=;
	b=vPu4BOzNc0wTW+BDjHzWIfktYmT+lXKq113pCpTD7mB8lkxJijMP4jgLp128GKCEy/
	OpQRHfShTwtVWHh4t5isetstg3Fdk2UiGwwhuGIYNdMv+joL3bGY8S601FfAHCnJp8eh
	aF8lSRjAaxy8fI1aoiUW3be0u/mvCmmNe6e6UfdD+GxzHDWWomdpwP8IvFtL3aDoD+Cu
	7LQ5A64WvjqZvkjD3GKo7X5VUNPETqgROA3gcCcqSfW2jffm6URPHOxeqsXj/qC8Zb78
	4Lk2nUZ4ZhbtXUvHoxPRTEtC2tR5isrrOW1Z2gM1/lZydOl1EfDCyv4cOSyZ2d73aNHT
	FMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1Srdp5hDyhvCp5qV/Eglmt3IaUivPBfGT5UH3UaOBno=;
	b=lLodpOIAaJecdoYNqU7ON6TSsysLrbaCixZxGO9u2xIgNO5E9UCBEKwRvr4WmsnCMq
	CTgp8cqLN2CzVfL8ACx8/3mSs1Gps/BmlsBRAUBSFkq1/z10otqDbdvBvO8SHsAFtd/s
	fF/hQcbcbiXhN4/6h78+uD1tec6et0QUzdV2Ct/kSkrpDjfsGnwWQg8iSbsuN7Ohh1b2
	VxdMHCRh1bCxxx63RjI8BFtyY5XYw330+BhokLVgmTq9P8L6hbwApvwkkSxa2ZpXFJ/y
	VWGjwCJIfdFZhLaEU/21VL32slnSothasjd0Sd4r1HleXKqdCjS+9tT9zXpUGYS/mHcl
	64LQ==
X-Gm-Message-State: AHPjjUj0RAYxELaInxPIRWAPCS8p2HliOL/czoA5jByQfXDS9arWUX2b
	Xi+hOWijP/5wUzAcirx2WFLyLj8cTbKVOu+IWaY=
X-Google-Smtp-Source: AOwi7QD1CJQX3Nta1QTv2SGpritnr0RVeqThziKb4uPqA1qZPWNA2a4FuQNG2IMbVLalXne0JOX0GpiTSmSNKeVZUy4=
X-Received: by 10.31.33.87 with SMTP id h84mr17245275vkh.101.1505419208453;
	Thu, 14 Sep 2017 13:00:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.59.18 with HTTP; Thu, 14 Sep 2017 13:00:07 -0700 (PDT)
In-Reply-To: <1505286002-4595-1-git-send-email-pascal.bach@siemens.com>
References: <1505286002-4595-1-git-send-email-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Sep 2017 16:00:07 -0400
Message-ID: <CADkTA4PxGbodV76RUr8sRSsgciypJRgwK54wA0iWMHWH=LW=kA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python3-docker-compose: add version 1.16.1 + dependencies
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
X-List-Received-Date: Thu, 14 Sep 2017 20:00:11 -0000
Content-Type: multipart/alternative; boundary="001a11c00044287b1505592bb97c"

--001a11c00044287b1505592bb97c
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 3:00 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> This requires some packages as well as the pypi.bbclass from meta-python.
>
> It uses Python 3 as I don't think it makes sense to use Python 2 anymore.
>

What about 'python3-docopt' ?

I only see it in meta-homeassistant, are you getting it from somewhere else
?
ERROR: Nothing RPROVIDES 'python3-docopt' (but
/home/bruce/b/layers/meta-virtualization/recipes-containers/docker-compose/
python3-docker-compose_1.16.1.bb RDEPENDS on or otherwise requires it)

Bruce


>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../0001-Allow-newer-versions-of-requests.patch    | 32
> ++++++++++++++++++++++
>  .../python3-docker-compose_1.16.1.bb               | 31
> +++++++++++++++++++++
>  .../python/python3-cached-property_1.3.0.bb        |  9 ++++++
>  recipes-devtools/python/python3-colorama_0.3.9.bb  |  9 ++++++
>  .../python/python3-docker-pycreds_0.2.1.bb         |  9 ++++++
>  recipes-devtools/python/python3-docker_2.5.1.bb    | 11 ++++++++
>  recipes-devtools/python/python3-dockerpty_0.4.1.bb |  9 ++++++
>  recipes-devtools/python/python3-texttable_0.9.1.bb |  9 ++++++
>  .../python/python3-websocket-client_0.44.0.bb      | 11 ++++++++
>  9 files changed, 130 insertions(+)
>  create mode 100644 recipes-containers/docker-compose/files/0001-Allow-
> newer-versions-of-requests.patch
>  create mode 100644 recipes-containers/docker-compose/python3-docker-
> compose_1.16.1.bb
>  create mode 100644 recipes-devtools/python/python
> 3-cached-property_1.3.0.bb
>  create mode 100644 recipes-devtools/python/python3-colorama_0.3.9.bb
>  create mode 100644 recipes-devtools/python/python
> 3-docker-pycreds_0.2.1.bb
>  create mode 100644 recipes-devtools/python/python3-docker_2.5.1.bb
>  create mode 100644 recipes-devtools/python/python3-dockerpty_0.4.1.bb
>  create mode 100644 recipes-devtools/python/python3-texttable_0.9.1.bb
>  create mode 100644 recipes-devtools/python/python
> 3-websocket-client_0.44.0.bb
>
> diff --git a/recipes-containers/docker-compose/files/0001-Allow-
> newer-versions-of-requests.patch b/recipes-containers/docker-
> compose/files/0001-Allow-newer-versions-of-requests.patch
> new file mode 100644
> index 0000000..6fc7bb4
> --- /dev/null
> +++ b/recipes-containers/docker-compose/files/0001-Allow-
> newer-versions-of-requests.patch
> @@ -0,0 +1,32 @@
> +From 15cf1a31f5af8f09531bb837b92bd6ea49bd1744 Mon Sep 17 00:00:00 2001
> +From: Pascal Bach <pascal.bach@siemens.com>
> +Date: Wed, 13 Sep 2017 08:41:21 +0200
> +Subject: [PATCH] Allow newer versions of requests
> +
> +docker compose has strict requirements to use requests < 2.12
> +
> +However it works without issues with newer versions, so this patch
> removes the check.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 192a0f6..f444757 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -33,7 +33,7 @@ install_requires = [
> +     'cached-property >= 1.2.0, < 2',
> +     'docopt >= 0.6.1, < 0.7',
> +     'PyYAML >= 3.10, < 4',
> +-    'requests >= 2.6.1, != 2.11.0, < 2.12',
> ++    'requests >= 2.6.1, != 2.11.0',
> +     'texttable >= 0.9.0, < 0.10',
> +     'websocket-client >= 0.32.0, < 1.0',
> +     'docker >= 2.5.1, < 3.0',
> +--
> +2.1.4
> +
> diff --git a/recipes-containers/docker-compose/python3-docker-
> compose_1.16.1.bb b/recipes-containers/docker-compose/python3-docker-
> compose_1.16.1.bb
> new file mode 100644
> index 0000000..50e76b7
> --- /dev/null
> +++ b/recipes-containers/docker-compose/python3-docker-compose_1.16.1.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Multi-container orchestration for Docker"
> +HOMEPAGE = "https://www.docker.com/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=435b266b3899aa8a959f17d41c56def8"
> +
> +SRC_URI += "file://0001-Allow-newer-versions-of-requests.patch"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "8dcadf09143600fcb573b43f446c8f9a"
> +SRC_URI[sha256sum] = "fb46a6a2c4d193a3ff1e4d7208eea9
> 20b629c81dc92257c87f3f93095cfb0bdf"
> +
> +RDEPENDS_${PN} = "\
> +  ${PYTHON_PN}-cached-property \
> +  ${PYTHON_PN}-certifi \
> +  ${PYTHON_PN}-chardet \
> +  ${PYTHON_PN}-colorama \
> +  ${PYTHON_PN}-docker \
> +  ${PYTHON_PN}-docker-pycreds \
> +  ${PYTHON_PN}-dockerpty \
> +  ${PYTHON_PN}-docopt \
> +  ${PYTHON_PN}-enum \
> +  ${PYTHON_PN}-idna \
> +  ${PYTHON_PN}-jsonschema \
> +  ${PYTHON_PN}-pyyaml \
> +  ${PYTHON_PN}-requests \
> +  ${PYTHON_PN}-six \
> +  ${PYTHON_PN}-texttable \
> +  ${PYTHON_PN}-urllib3 \
> +  ${PYTHON_PN}-websocket-client \
> +  "
> diff --git a/recipes-devtools/python/python3-cached-property_1.3.0.bb
> b/recipes-devtools/python/python3-cached-property_1.3.0.bb
> new file mode 100644
> index 0000000..f01aabd
> --- /dev/null
> +++ b/recipes-devtools/python/python3-cached-property_1.3.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "A decorator for caching properties in classes."
> +HOMEPAGE = "https://github.com/pydanny/cached-property"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=db7ff60c4e14f58534201242803d8abc"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "4a6039f7418007275505e355359396a8"
> +SRC_URI[sha256sum] = "458e78b1c7286ece887d92c9bee829
> da85717994c5e3ddd253a40467f488bc81"
> diff --git a/recipes-devtools/python/python3-colorama_0.3.9.bb
> b/recipes-devtools/python/python3-colorama_0.3.9.bb
> new file mode 100644
> index 0000000..458b0db
> --- /dev/null
> +++ b/recipes-devtools/python/python3-colorama_0.3.9.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Cross-platform colored terminal text."
> +HOMEPAGE = "https://github.com/tartley/colorama"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14d0b64047ed8f510b51ce04959953
> 58"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "3a0e415259690f4dd7455c2683ee5850"
> +SRC_URI[sha256sum] = "48eb22f4f8461b1df5734a074b5704
> 2430fb06e1d61bd1e11b078c0fe6d7a1f1"
> diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> new file mode 100644
> index 0000000..4038410
> --- /dev/null
> +++ b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Python bindings for the docker credentials store API"
> +HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
> +SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b81215304
> 13250c6cd4ffed2c1cf085f335262f7348"
> diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb
> b/recipes-devtools/python/python3-docker_2.5.1.bb
> new file mode 100644
> index 0000000..ff8f89e
> --- /dev/null
> +++ b/recipes-devtools/python/python3-docker_2.5.1.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "A Python library for the Docker Engine API."
> +HOMEPAGE = "https://github.com/docker/docker-py"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
> +SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952
> a62847137f4674f2439320ede16d6db880"
> +
> +DEPENDS += "${PYTHON_PN}-pip-native"
> diff --git a/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> new file mode 100644
> index 0000000..a40f2a3
> --- /dev/null
> +++ b/recipes-devtools/python/python3-dockerpty_0.4.1.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "Python library to use the pseudo-tty of a docker container"
> +HOMEPAGE = "https://github.com/d11wtq/dockerpty"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=afaf767baa20ac524dc12f1071ca493a"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "028bacb34536f3ee6a2ccd668c27e8e4"
> +SRC_URI[sha256sum] = "69a9d69d573a0daa31bcd1c0774eee
> d5c15c295fe719c61aca550ed1393156ce"
> diff --git a/recipes-devtools/python/python3-texttable_0.9.1.bb
> b/recipes-devtools/python/python3-texttable_0.9.1.bb
> new file mode 100644
> index 0000000..25e402f
> --- /dev/null
> +++ b/recipes-devtools/python/python3-texttable_0.9.1.bb
> @@ -0,0 +1,9 @@
> +SUMMARY = "module for creating simple ASCII tables"
> +HOMEPAGE = "https://github.com/foutaise/texttable/"
> +LICENSE = "LGPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[md5sum] = "a712b5a5464d51c5fc43c64d9d2cd0de"
> +SRC_URI[sha256sum] = "119041773ff03596b56392532f9315
> cb3a3116e404fd6f36e76a7dc088d95c79"
> diff --git a/recipes-devtools/python/python3-websocket-client_0.44.0.bb
> b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
> new file mode 100644
> index 0000000..8dfc95f
> --- /dev/null
> +++ b/recipes-devtools/python/python3-websocket-client_0.44.0.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "WebSocket client for python. hybi13 is supported."
> +HOMEPAGE = "https://github.com/websocket-client/websocket-client.git"
> +LICENSE = "LGPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=18b09a20dd186af4fd60f1a08311628c"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "websocket_client"
> +
> +SRC_URI[md5sum] = "73d87aa16a2212da448b30aca9c5bf3b"
> +SRC_URI[sha256sum] = "15f585566e2ea7459136a632b9785a
> a081093064391878a448c382415e948d72"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c00044287b1505592bb97c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Sep 13, 2017 at 3:00 AM, Pascal Bach <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:pascal.bach@siemens.com" target=3D"_blank">pascal.bach@siemen=
s.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This requires some packages as well as the pypi.bbclass from meta-pyt=
hon.<br>
<br>
It uses Python 3 as I don&#39;t think it makes sense to use Python 2 anymor=
e.<br></blockquote><div><br></div><div>What about &#39;python3-docopt&#39; =
?<br><br></div><div>I only see it in meta-homeassistant, are you getting it=
 from somewhere else ?</div><div><span class=3D"gmail-s1">ERROR</span><span=
 class=3D"gmail-s2">: </span><span class=3D"gmail-s1">Nothing RPROVIDES &#3=
9;python3-docopt&#39; (but /home/bruce/b/layers/meta-virtualization/recipes=
-containers/docker-compose/<a href=3D"http://python3-docker-compose_1.16.1.=
bb">python3-docker-compose_1.16.1.bb</a> RDEPENDS on or otherwise requires =
it)</span><br></div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">p=
ascal.bach@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Allow-newer-versions-<wbr>of-requests.patch=C2=A0 =C2=A0 | 3=
2 ++++++++++++++++++++++<br>
=C2=A0.../<a href=3D"http://python3-docker-compose_1.16.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-docker-compose_1.<wbr>16.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 31 +++++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-cached-property_1.3.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-cached-<wbr>property_1.3.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 ++++++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python3-colorama_0.3.9.bb" =
rel=3D"noreferrer" target=3D"_blank">python<wbr>3-colorama_0.3.9.bb</a>=C2=
=A0 |=C2=A0 9 ++++++<br>
=C2=A0.../python/<a href=3D"http://python3-docker-pycreds_0.2.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-docker-<wbr>pycreds_0.2.1.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 ++++++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python<wbr>3-docker_2.5.1.bb</a>=C2=A0 =
=C2=A0 | 11 ++++++++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python3-dockerpty_0.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python<wbr>3-dockerpty_0.4.1.bb</a> |=
=C2=A0 9 ++++++<br>
=C2=A0recipes-devtools/python/<a href=3D"http://python3-texttable_0.9.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python<wbr>3-texttable_0.9.1.bb</a> |=
=C2=A0 9 ++++++<br>
=C2=A0.../python/<a href=3D"http://python3-websocket-client_0.44.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-websocket-<wbr>client_0.44.0.bb</=
a>=C2=A0 =C2=A0 =C2=A0 | 11 ++++++++<br>
=C2=A09 files changed, 130 insertions(+)<br>
=C2=A0create mode 100644 recipes-containers/docker-<wbr>compose/files/0001-=
Allow-<wbr>newer-versions-of-requests.<wbr>patch<br>
=C2=A0create mode 100644 recipes-containers/docker-<wbr>compose/<a href=3D"=
http://python3-docker-compose_1.16.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-docker-<wbr>compose_1.16.1.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
cached-property_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3=
-cached-property_1.3.0.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
colorama_0.3.9.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-colora=
ma_0.3.9.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
docker-pycreds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-=
docker-pycreds_0.2.1.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
docker_2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-docker_2=
.5.1.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
dockerpty_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-docke=
rpty_0.4.1.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
texttable_0.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr>3-textt=
able_0.9.1.bb</a><br>
=C2=A0create mode 100644 recipes-devtools/python/<a href=3D"http://python3-=
websocket-client_0.44.0.bb" rel=3D"noreferrer" target=3D"_blank">python<wbr=
>3-websocket-client_0.44.0.bb</a><br>
<br>
diff --git a/recipes-containers/docker-<wbr>compose/files/0001-Allow-<wbr>n=
ewer-versions-of-requests.<wbr>patch b/recipes-containers/docker-<wbr>compo=
se/files/0001-Allow-<wbr>newer-versions-of-requests.<wbr>patch<br>
new file mode 100644<br>
index 0000000..6fc7bb4<br>
--- /dev/null<br>
+++ b/recipes-containers/docker-<wbr>compose/files/0001-Allow-<wbr>newer-ve=
rsions-of-requests.<wbr>patch<br>
@@ -0,0 +1,32 @@<br>
+From 15cf1a31f5af8f09531bb837b92bd6<wbr>ea49bd1744 Mon Sep 17 00:00:00 200=
1<br>
+From: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">pascal.ba=
ch@siemens.com</a>&gt;<br>
+Date: Wed, 13 Sep 2017 08:41:21 +0200<br>
+Subject: [PATCH] Allow newer versions of requests<br>
+<br>
+docker compose has strict requirements to use requests &lt; 2.12<br>
+<br>
+However it works without issues with newer versions, so this patch removes=
 the check.<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Pascal Bach &lt;<a href=3D"mailto:pascal.bach@siemens.com">=
pascal.bach@siemens.com</a>&gt;<br>
+---<br>
+ setup.py | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 192a0f6..f444757 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -33,7 +33,7 @@ install_requires =3D [<br>
+=C2=A0 =C2=A0 =C2=A0&#39;cached-property &gt;=3D 1.2.0, &lt; 2&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;docopt &gt;=3D 0.6.1, &lt; 0.7&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;PyYAML &gt;=3D 3.10, &lt; 4&#39;,<br>
+-=C2=A0 =C2=A0 &#39;requests &gt;=3D 2.6.1, !=3D 2.11.0, &lt; 2.12&#39;,<b=
r>
++=C2=A0 =C2=A0 &#39;requests &gt;=3D 2.6.1, !=3D 2.11.0&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;texttable &gt;=3D 0.9.0, &lt; 0.10&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;websocket-client &gt;=3D 0.32.0, &lt; 1.0&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0&#39;docker &gt;=3D 2.5.1, &lt; 3.0&#39;,<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/recipes-containers/docker-<wbr>compose/<a href=3D"http://pytho=
n3-docker-compose_1.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-d=
ocker-<wbr>compose_1.16.1.bb</a> b/recipes-containers/docker-<wbr>compose/<=
a href=3D"http://python3-docker-compose_1.16.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-docker-<wbr>compose_1.16.1.bb</a><br>
new file mode 100644<br>
index 0000000..50e76b7<br>
--- /dev/null<br>
+++ b/recipes-containers/docker-<wbr>compose/<a href=3D"http://python3-dock=
er-compose_1.16.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-docker-<=
wbr>compose_1.16.1.bb</a><br>
@@ -0,0 +1,31 @@<br>
+SUMMARY =3D &quot;Multi-container orchestration for Docker&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://www.docker.com/" rel=3D"noreferrer" =
target=3D"_blank">https://www.docker.com/</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>435b266b3899aa8a959f1=
7d41c56de<wbr>f8&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://0001-Allow-newer-<wbr>versions-of-requests.patch=
&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>8dcadf09143600fcb573b43f446c8f<wbr>9a&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>fb46a6a2c4d193a3ff1e4d7208eea9<wbr>20b62=
9c81dc92257c87f3f93095cfb<wbr>0bdf&quot;<br>
+<br>
+RDEPENDS_${PN} =3D &quot;\<br>
+=C2=A0 ${PYTHON_PN}-cached-property \<br>
+=C2=A0 ${PYTHON_PN}-certifi \<br>
+=C2=A0 ${PYTHON_PN}-chardet \<br>
+=C2=A0 ${PYTHON_PN}-colorama \<br>
+=C2=A0 ${PYTHON_PN}-docker \<br>
+=C2=A0 ${PYTHON_PN}-docker-pycreds \<br>
+=C2=A0 ${PYTHON_PN}-dockerpty \<br>
+=C2=A0 ${PYTHON_PN}-docopt \<br>
+=C2=A0 ${PYTHON_PN}-enum \<br>
+=C2=A0 ${PYTHON_PN}-idna \<br>
+=C2=A0 ${PYTHON_PN}-jsonschema \<br>
+=C2=A0 ${PYTHON_PN}-pyyaml \<br>
+=C2=A0 ${PYTHON_PN}-requests \<br>
+=C2=A0 ${PYTHON_PN}-six \<br>
+=C2=A0 ${PYTHON_PN}-texttable \<br>
+=C2=A0 ${PYTHON_PN}-urllib3 \<br>
+=C2=A0 ${PYTHON_PN}-websocket-client \<br>
+=C2=A0 &quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-cached-prope=
rty_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-cached-prop=
erty_1.3.0.bb</a> b/recipes-devtools/python/<a href=3D"http://python3-cache=
d-property_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-cach=
ed-property_1.3.0.bb</a><br>
new file mode 100644<br>
index 0000000..f01aabd<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-cached-property_1.3=
.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-cached-property_1.=
3.0.bb</a><br>
@@ -0,0 +1,9 @@<br>
+SUMMARY =3D &quot;A decorator for caching properties in classes.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/pydanny/cached-property" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/pydanny/<wbr>cached=
-property</a>&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>db7ff60c4e14f58534201=
242803d8a<wbr>bc&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>4a6039f7418007275505e355359396<wbr>a8&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>458e78b1c7286ece887d92c9bee829<wbr>da857=
17994c5e3ddd253a40467f488<wbr>bc81&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-colorama_0.3=
.9.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-colorama_0.3.9.bb<=
/a> b/recipes-devtools/python/<a href=3D"http://python3-colorama_0.3.9.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-colorama_0.3.9.bb</a><br>
new file mode 100644<br>
index 0000000..458b0db<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-colorama_0.3.9.bb" =
rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-colorama_0.3.9.bb</a><br>
@@ -0,0 +1,9 @@<br>
+SUMMARY =3D &quot;Cross-platform colored terminal text.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/tartley/colorama" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/tartley/<wbr>colorama</a>&=
quot;<br>
+LICENSE =3D &quot;BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D<wbr>14d0b64047ed8f510=
b51ce04959953<wbr>58&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>3a0e415259690f4dd7455c2683ee58<wbr>50&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>48eb22f4f8461b1df5734a074b5704<wbr>2430f=
b06e1d61bd1e11b078c0fe6d7<wbr>a1f1&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-docker-pycre=
ds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-pycre=
ds_0.2.1.bb</a> b/recipes-devtools/python/<a href=3D"http://python3-docker-=
pycreds_0.2.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-=
pycreds_0.2.1.bb</a><br>
new file mode 100644<br>
index 0000000..4038410<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-docker-pycreds_0.2.=
1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker-pycreds_0.2.=
1.bb</a><br>
@@ -0,0 +1,9 @@<br>
+SUMMARY =3D &quot;Python bindings for the docker credentials store API&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/shin-/dockerpy-creds" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/shin-/<wbr>dockerpy-cr=
eds</a>&quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>3b83ef96387f14655fc85=
4ddc3c6bd<wbr>57&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>0d80d5aebab771faf7e422b759c305<wbr>5b&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>93833a2cf280b7d8abbe1b81215304<wbr>13250=
c6cd4ffed2c1cf085f335262f<wbr>7348&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1=
.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker_2.5.1.bb</a> =
b/recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">pyth<wbr>on3-docker_2.5.1.bb</a><br>
new file mode 100644<br>
index 0000000..ff8f89e<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-docker_2.5.1.bb" re=
l=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-docker_2.5.1.bb</a><br>
@@ -0,0 +1,11 @@<br>
+SUMMARY =3D &quot;A Python library for the Docker Engine API.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/docker/docker-py" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/docker/<wbr>docker-py</a>&=
quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>34f3846f940453127309b=
920eeb896<wbr>60&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>7d917152976df075e6e90ee853df64<wbr>1f&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>b876e6909d8d2360e0540364c3a952<wbr>a6284=
7137f4674f2439320ede16d6d<wbr>b880&quot;<br>
+<br>
+DEPENDS +=3D &quot;${PYTHON_PN}-pip-native&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-dockerpty_0.=
4.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-dockerpty_0.4.1.b=
b</a> b/recipes-devtools/python/<a href=3D"http://python3-dockerpty_0.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-dockerpty_0.4.1.bb</a>=
<br>
new file mode 100644<br>
index 0000000..a40f2a3<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-dockerpty_0.4.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-dockerpty_0.4.1.bb</a><b=
r>
@@ -0,0 +1,9 @@<br>
+SUMMARY =3D &quot;Python library to use the pseudo-tty of a docker contain=
er&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/d11wtq/dockerpty" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/d11wtq/<wbr>dockerpty</a>&=
quot;<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>afaf767baa20ac524dc12=
f1071ca49<wbr>3a&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>028bacb34536f3ee6a2ccd668c27e8<wbr>e4&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>69a9d69d573a0daa31bcd1c0774eee<wbr>d5c15=
c295fe719c61aca550ed13931<wbr>56ce&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-texttable_0.=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-texttable_0.9.1.b=
b</a> b/recipes-devtools/python/<a href=3D"http://python3-texttable_0.9.1.b=
b" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-texttable_0.9.1.bb</a>=
<br>
new file mode 100644<br>
index 0000000..25e402f<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-texttable_0.9.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-texttable_0.9.1.bb</a><b=
r>
@@ -0,0 +1,9 @@<br>
+SUMMARY =3D &quot;module for creating simple ASCII tables&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/foutaise/texttable/" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/foutaise/<wbr>texttabl=
e/</a>&quot;<br>
+LICENSE =3D &quot;LGPL-3.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>e6a600fd5e1d9cbde2d98=
3680233ad<wbr>02&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>a712b5a5464d51c5fc43c64d9d2cd0<wbr>de&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>119041773ff03596b56392532f9315<wbr>cb3a3=
116e404fd6f36e76a7dc088d9<wbr>5c79&quot;<br>
diff --git a/recipes-devtools/python/<a href=3D"http://python3-websocket-cl=
ient_0.44.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-websocket=
-client_0.44.0.bb</a> b/recipes-devtools/python/<a href=3D"http://python3-w=
ebsocket-client_0.44.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on=
3-websocket-client_0.44.0.bb</a><br>
new file mode 100644<br>
index 0000000..8dfc95f<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/<a href=3D"http://python3-websocket-client_0.=
44.0.bb" rel=3D"noreferrer" target=3D"_blank">pyth<wbr>on3-websocket-client=
_0.44.0.bb</a><br>
@@ -0,0 +1,11 @@<br>
+SUMMARY =3D &quot;WebSocket client for python. hybi13 is supported.&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/websocket-client/websocke=
t-client.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/webso=
cket-<wbr>client/websocket-client.git</a>&quot;<br>
+LICENSE =3D &quot;LGPL-3.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>18b09a20dd186af4fd60f=
1a0831162<wbr>8c&quot;<br>
+<br>
+inherit pypi setuptools3<br>
+<br>
+PYPI_PACKAGE =3D &quot;websocket_client&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<wbr>73d87aa16a2212da448b30aca9c5bf<wbr>3b&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>15f585566e2ea7459136a632b9785a<wbr>a0810=
93064391878a448c382415e94<wbr>8d72&quot;<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11c00044287b1505592bb97c--

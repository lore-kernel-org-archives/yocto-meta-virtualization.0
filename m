Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 20291E00D14; Fri, 21 Dec 2018 05:47:15 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.52 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B6D0E0097C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Dec 2018 05:47:14 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id l10so3946231lfh.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 21 Dec 2018 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=evPkBV3tqsUi47bUvUGQcLc/DjvADfqJvf5Luk/hIGo=;
	b=WyB8fOIvSB3BqeRh88AGOMyriUBjcEBysIrkcu864tLP/yhcSD8GPBYl3xp0k4t44a
	ID+xIUEXMJkrevMVQxd++b72RmumPz50Aw1c5NnJ3TU/XERHDCBRyK9uyFt6APQN/mAG
	a0E5ql93JR7gOXzfI01BDMRwvKmpJRyFwPrTV0saqPTJdxGqNSuEPBKEilF+HYB7SF7e
	llX8Mh9FOqEBzZn3TgjVFVJG/EzuOETCJoQxfgMiYGyBE8YHh1Yqi24TG/GqyKhYGdth
	/S8pdPt9phwVrvTI/XQ9Cd4h0fVfG5KIL2t79J+/GkgU+hsWlonePKMKV6xydrwNp5lg
	XDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=evPkBV3tqsUi47bUvUGQcLc/DjvADfqJvf5Luk/hIGo=;
	b=nyoG9DVonYzizUPfyKo6z3qnTSxtGkFvmmlvEIZR7v4s5gvP6Omaxu93QBn7SXpaGb
	ya8MpBdocXdxjqF+MWihwChe/2FG1JH86ZtEXiSp560JSF20Gu8GMc71sPJJL/03v0bH
	NZQ4y78pTvxpJubbcOKizqz7HuY0OOYDYZnZ2YvOc2bhJ9OV5IYdG/P3sN/pH3Wh4aJA
	854+g6GpPF2LcD+/6/AagOb3VJWdSs/I+gjMAX+miv5T86SlwpzBaqy+DYocFKtupo4d
	VQ9p06Z5vwC49uCOmFP/xpkCIaRFPebPWfeVErkUKgSrBO0BUJSLJ/C4hmCDASqzxiPs
	Llsg==
X-Gm-Message-State: AA+aEWaVCHS5INnukEduaKRTD64MMKpHzEwdyqC0KBp4MbKeRfcZltlC
	9rQ0GJPQuryi9yoZQNwdjEx6g14qGZg+Omj/uBI=
X-Google-Smtp-Source: AFSGD/WOOylteLqAJXl8509yj9T7uO3ujv0zmCcNUVtl5xyOdnkyMhY2wzILYctIJ7arVfA661Q0Z56Wr8/x2X0rPCc=
X-Received: by 2002:a19:5059:: with SMTP id z25mr1477563lfj.120.1545400033080; 
	Fri, 21 Dec 2018 05:47:13 -0800 (PST)
MIME-Version: 1.0
References: <1544733664-26667-1-git-send-email-tyu@cisco.com>
In-Reply-To: <1544733664-26667-1-git-send-email-tyu@cisco.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Dec 2018 08:47:01 -0500
Message-ID: <CADkTA4Pbmpd79KgXQP-viaFFN_P6_o6sxqJ1nxEQxjZB5d=T2g@mail.gmail.com>
To: tyu@cisco.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] add the py2 version for python-docker and python-docker-pycreds packages
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
X-List-Received-Date: Fri, 21 Dec 2018 13:47:15 -0000
Content-Type: text/plain; charset="UTF-8"

sorry for the delay, I was waiting to see if anyone else had comments
and then forgot to loop back to this!

The change looks good to me, and tested ok in my setup.

This is now merged.

Bruce
On Thu, Dec 13, 2018 at 3:41 PM Ting Yu <tyu@cisco.com> wrote:
>
> add the py2 version for python-docker and python-docker-pycreds packages.
> add python-six and python-backport_ssl (for ph2 only) as python-docker dependencies.
>
> verify the connection to docker engine at run time -
> >>> import docker
> >>> client = docker.from_env()
> >>> client.images.list()
> [<Image: 'hello-world:latest'>]
>
> ---
>  recipes-devtools/python/python-docker-pycreds.inc       |  7 +++++++
>  recipes-devtools/python/python-docker-pycreds_0.3.0.bb  |  3 +++
>  recipes-devtools/python/python-docker.inc               | 14 ++++++++++++++
>  recipes-devtools/python/python-docker_3.4.0.bb          |  6 ++++++
>  recipes-devtools/python/python3-docker-pycreds_0.3.0.bb |  8 +-------
>  recipes-devtools/python/python3-docker_3.4.0.bb         | 16 +---------------
>  6 files changed, 32 insertions(+), 22 deletions(-)
>  create mode 100644 recipes-devtools/python/python-docker-pycreds.inc
>  create mode 100644 recipes-devtools/python/python-docker-pycreds_0.3.0.bb
>  create mode 100644 recipes-devtools/python/python-docker.inc
>  create mode 100644 recipes-devtools/python/python-docker_3.4.0.bb
>
> diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recipes-devtools/python/python-docker-pycreds.inc
> new file mode 100644
> index 0000000..ca0995f
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker-pycreds.inc
> @@ -0,0 +1,7 @@
> +SUMMARY = "Python bindings for the docker credentials store API"
> +HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
> +SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba2c3bcbacb5a314449c040b0b814355bbff"
> diff --git a/recipes-devtools/python/python-docker-pycreds_0.3.0.bb b/recipes-devtools/python/python-docker-pycreds_0.3.0.bb
> new file mode 100644
> index 0000000..6dc4521
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker-pycreds_0.3.0.bb
> @@ -0,0 +1,3 @@
> +inherit pypi setuptools
> +require python-docker-pycreds.inc
> +
> diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
> new file mode 100644
> index 0000000..eec7cda
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker.inc
> @@ -0,0 +1,14 @@
> +SUMMARY = "A Python library for the Docker Engine API."
> +HOMEPAGE = "https://github.com/docker/docker-py"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
> +
> +SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
> +SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
> +
> +RDEPENDS_${PN} += " \
> +       ${PYTHON_PN}-six \
> +       ${PYTHON_PN}-docker-pycreds \
> +       ${PYTHON_PN}-requests \
> +       ${PYTHON_PN}-websocket-client \
> +"
> diff --git a/recipes-devtools/python/python-docker_3.4.0.bb b/recipes-devtools/python/python-docker_3.4.0.bb
> new file mode 100644
> index 0000000..a964254
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker_3.4.0.bb
> @@ -0,0 +1,6 @@
> +inherit pypi setuptools
> +require python-docker.inc
> +
> +RDEPENDS_${PN} += " \
> +                   python-backports-ssl \
> +                  "
> diff --git a/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
> index 4d39f52..75a83e0 100644
> --- a/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
> +++ b/recipes-devtools/python/python3-docker-pycreds_0.3.0.bb
> @@ -1,9 +1,3 @@
> -SUMMARY = "Python bindings for the docker credentials store API"
> -HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
>  inherit pypi setuptools3
> +require python-docker-pycreds.inc
>
> -SRC_URI[md5sum] = "2370ea3b62198b788a26231ab58844af"
> -SRC_URI[sha256sum] = "8b0e956c8d206f832b06aa93a710ba2c3bcbacb5a314449c040b0b814355bbff"
> diff --git a/recipes-devtools/python/python3-docker_3.4.0.bb b/recipes-devtools/python/python3-docker_3.4.0.bb
> index 6e81302..052cbe8 100644
> --- a/recipes-devtools/python/python3-docker_3.4.0.bb
> +++ b/recipes-devtools/python/python3-docker_3.4.0.bb
> @@ -1,17 +1,3 @@
> -SUMMARY = "A Python library for the Docker Engine API."
> -HOMEPAGE = "https://github.com/docker/docker-py"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
> -
>  inherit pypi setuptools3
> -
> -SRC_URI[md5sum] = "02491d168c048cdb99cc20d0b352ea0f"
> -SRC_URI[sha256sum] = "e9cc39e24905e67ba9e2df14c94488f5cf030fb72ae1c60de505ce5ea90503f7"
> -
>  DEPENDS += "${PYTHON_PN}-pip-native"
> -
> -RDEPENDS_${PN} += " \
> -       python3-docker-pycreds \
> -       python3-requests \
> -       python3-websocket-client \
> -"
> +require python-docker.inc
> --
> 2.7.4
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


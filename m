Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 41F32E00D08; Tue, 29 Jan 2019 23:04:43 -0800 (PST)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C02EE00CDF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2019 23:04:42 -0800 (PST)
Received: by mail-lj1-f194.google.com with SMTP id n18-v6so19740853lji.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2019 23:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WGzOKoRGdvbrWbiufGfpk426+RlyNLy/53GtGKigRX0=;
	b=AjW4T3pWj7oqBZABoeYqt3zVBRQprcaFXr+roX+i1o9uutUSdoBwJoH8HsFrE2Zd9r
	GDTaWizmthzMYROnzYPX0GXEpJmz44zLM7D/tqRc4HlNhTzg3g8XbdkJpH6m358uH/ZO
	UWUmPVEBmn2sXVREzCisjE9QnmBRSiBsmAxuhQMGhKPyyGCOFlP0WyQH7TgJ35GRBujC
	wL3ZG1D6wJLpKzjF2kZmmXGFVKCnfwsD9uL02Q87oF4qoQ9Ag2nmcoTi8QL0lLqHOlYj
	HNTv0e6r0qshK4OXvsFmh4dGcjS34Atk06pbMRXCwoQOxUP2VHCViDsI+qJTK56J7+aG
	I+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WGzOKoRGdvbrWbiufGfpk426+RlyNLy/53GtGKigRX0=;
	b=Tqj/rgrFy+dOo+301GvAqxT3xMz3quNyKhDwAaMHMzBK2wWOoJoSKCapoLQp8KIuR/
	eG3taaRwjuRsAQHjVyNq0Te24wXWuaCGS1yD/3LFW82SM92amllDY9bTdBXMdDomREKW
	8Skex4u/d+AEuYot1AHulhapl3XLyNhAnIzz/17TXevTLSjZIQ33ygJDFbR4E1HTPHVJ
	zjT4EnpnhXWByhwNeGMBX3DGvJhlt2xtfiNmpWgO8qAn2dsZw5ZSI+tIScSHrNTm4xd7
	CL5jPqWeCQjYa42YFiV7rhW0Vb5W9+bAh4ZMv854fnOqN63jsvw3FkIcmfsth57v2szW
	exMQ==
X-Gm-Message-State: AJcUukekmB+n1UAzHV7gyDg2AH35v6tqmrgqzXocVpEbRF0BvRF31v5h
	7TezUpYRcrimpFvGQweBmg6EbGb6qr24LIqkW0c=
X-Google-Smtp-Source: ALg8bN4gf0mX2RsKSk2VEZ6l1/MnPkufBLahBDJdgnRjPN2o5+veYWhpdNWg7JbohCPyIwx/bbfsM77jXfwwMITRhyk=
X-Received: by 2002:a2e:4784:: with SMTP id
	u126-v6mr23295651lja.124.1548831881176; 
	Tue, 29 Jan 2019 23:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20190125131920.5173-1-dbensoussan@synapticon.com>
In-Reply-To: <20190125131920.5173-1-dbensoussan@synapticon.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 30 Jan 2019 02:04:27 -0500
Message-ID: <CADkTA4PAv-Ez7A9H57=MdWHqEYw_DmLQpRKeG9MyrjXup0POYg@mail.gmail.com>
To: David Bensoussan <minipada@gmail.com>
Cc: David Bensoussan <dbensoussan@synapticon.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-docker-pycreds & python-docker: Add recipe for python2
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
X-List-Received-Date: Wed, 30 Jan 2019 07:04:43 -0000
Content-Type: text/plain; charset="UTF-8"

What branch is this for ? The following is already on master:

commit cbefd4d88c0878c259c53c02a61b713679379124
Author: Ting Yu <tyu@cisco.com>
Date:   Thu Dec 13 20:41:04 2018 +0000

    add the py2 version for python-docker and python-docker-pycreds packages

    add the py2 version for python-docker and python-docker-pycreds packages.
    add python-six and python-backport_ssl (for ph2 only) as
python-docker dependencies.

    verify the connection to docker engine at run time -
    >>> import docker
    >>> client = docker.from_env()
    >>> client.images.list()
    [<Image: 'hello-world:latest'>]

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

:000000 100644 0000000 ca0995f A
recipes-devtools/python/python-docker-pycreds.inc

Which obviously will conflict with the python-docker-pycreds.inc that
you have below.

Cheers,

Bruce

On Fri, Jan 25, 2019 at 8:19 AM David Bensoussan <minipada@gmail.com> wrote:
>
> ---
>  recipes-devtools/python/python-docker-pycreds.inc   |  7 +++++++
>  .../python/python-docker-pycreds_0.2.1.bb           |  3 +++
>  recipes-devtools/python/python-docker.inc           |  5 +++++
>  recipes-devtools/python/python-docker_2.5.1.bb      | 11 +++++++++++
>  .../python/python3-docker-pycreds_0.2.1.bb          |  8 +-------
>  recipes-devtools/python/python3-docker_2.5.1.bb     | 13 +++----------
>  6 files changed, 30 insertions(+), 17 deletions(-)
>  create mode 100644 recipes-devtools/python/python-docker-pycreds.inc
>  create mode 100644 recipes-devtools/python/python-docker-pycreds_0.2.1.bb
>  create mode 100644 recipes-devtools/python/python-docker.inc
>  create mode 100644 recipes-devtools/python/python-docker_2.5.1.bb
>
> diff --git a/recipes-devtools/python/python-docker-pycreds.inc b/recipes-devtools/python/python-docker-pycreds.inc
> new file mode 100644
> index 0000000..e76267d
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker-pycreds.inc
> @@ -0,0 +1,7 @@
> +SUMMARY = "Python bindings for the docker credentials store API"
> +HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> +
> +SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
> +SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
> diff --git a/recipes-devtools/python/python-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
> new file mode 100644
> index 0000000..f6ddc8d
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker-pycreds_0.2.1.bb
> @@ -0,0 +1,3 @@
> +inherit pypi setuptools
> +
> +require python-docker-pycreds.inc
> diff --git a/recipes-devtools/python/python-docker.inc b/recipes-devtools/python/python-docker.inc
> new file mode 100644
> index 0000000..f23b537
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker.inc
> @@ -0,0 +1,5 @@
> +SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
> +SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
> +
> +DEPENDS += "${PYTHON_PN}-pip-native"
> +
> diff --git a/recipes-devtools/python/python-docker_2.5.1.bb b/recipes-devtools/python/python-docker_2.5.1.bb
> new file mode 100644
> index 0000000..9dc83e8
> --- /dev/null
> +++ b/recipes-devtools/python/python-docker_2.5.1.bb
> @@ -0,0 +1,11 @@
> +inherit pypi setuptools
> +
> +RDEPENDS_${PN} += " \
> +       python-backports-ssl \
> +       python-docker-pycreds \
> +       python-requests \
> +       python-websocket-client \
> +"
> +
> +require python-docker.inc
> +
> diff --git a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> index 4038410..52423d2 100644
> --- a/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> +++ b/recipes-devtools/python/python3-docker-pycreds_0.2.1.bb
> @@ -1,9 +1,3 @@
> -SUMMARY = "Python bindings for the docker credentials store API"
> -HOMEPAGE = "https://github.com/shin-/dockerpy-creds"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -
>  inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "0d80d5aebab771faf7e422b759c3055b"
> -SRC_URI[sha256sum] = "93833a2cf280b7d8abbe1b8121530413250c6cd4ffed2c1cf085f335262f7348"
> +require python-docker-pycreds.inc
> diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_2.5.1.bb
> index 341d95c..0dca028 100644
> --- a/recipes-devtools/python/python3-docker_2.5.1.bb
> +++ b/recipes-devtools/python/python3-docker_2.5.1.bb
> @@ -1,17 +1,10 @@
> -SUMMARY = "A Python library for the Docker Engine API."
> -HOMEPAGE = "https://github.com/docker/docker-py"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
> -
>  inherit pypi setuptools3
>
> -SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
> -SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
> -
> -DEPENDS += "${PYTHON_PN}-pip-native"
> -
>  RDEPENDS_${PN} += " \
>         python3-docker-pycreds \
>         python3-requests \
>         python3-websocket-client \
>  "
> +
> +require python-docker.inc
> +
> --
> 2.17.1
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


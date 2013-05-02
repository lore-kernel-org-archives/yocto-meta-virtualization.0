Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0F656E00312
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 May 2013 13:37:53 -0700 (PDT)
Received: by mail-lb0-f176.google.com with SMTP id v20so938192lbc.21
	for <meta-virtualization@yoctoproject.org>;
	Thu, 02 May 2013 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=q6iX5OXzFlhKsP1BwqzS3UlefqrV8nYdst2I9IDd+gQ=;
	b=kBpBTMQALpuqSBJ+Xtv895ZVRsMOleM5CBdFq8B+inCV0mmb8mVLNX/qRtHpaOklAL
	Kmmu8W7G6eMeNRcxbd5uKKtngbiwW/8qTBLNnwx66d3Y1L8x0C46ZE7xsTd2vQKoQLI6
	jC+EUQjNKsllcIR5pfrAvIfjyoow4H9WqoMBSbX6LaKA8Slr++8J68KvGJpjiqXcf5Cg
	KjjrHJ6s/So0CtqDOGwGs/xYe8Dbg44UttY+luGfvKlWfi6hd5gTPjIwbMi++XVL1s1m
	PLqdGQ1MDXUgU8MIeSlLtFZpQqdOQVzVB6MX3yBiWSEWrLojwTpkpYok7jKwXJFBQmOY
	+YyA==
MIME-Version: 1.0
X-Received: by 10.112.61.6 with SMTP id l6mr3215219lbr.57.1367527072911; Thu,
	02 May 2013 13:37:52 -0700 (PDT)
Received: by 10.112.2.9 with HTTP; Thu, 2 May 2013 13:37:52 -0700 (PDT)
In-Reply-To: <1367522283-26916-1-git-send-email-yao.zhao@windriver.com>
References: <1367522283-26916-1-git-send-email-yao.zhao@windriver.com>
Date: Thu, 2 May 2013 16:37:52 -0400
Message-ID: <CADkTA4OGRpHXLQTg-qAo5X8Y+dV5AXOCic54sZzNchOm-p55mA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yao Zhao <yao.zhao@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] fix libvirt-python build problem
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
X-List-Received-Date: Thu, 02 May 2013 20:37:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

What's the head of your meta-virtualization ? It looks like you are missing:

commit 7040db74c375ef55d1b040f53071be29590882de
Author: Mihai Prica <mihai.prica@intel.com>
Date:   Thu Apr 18 18:10:42 2013 +0300

    libvirt: Changed python bindings install location

    The libvirt-python files were installed to dist-packages and this
    is not part of sys.path in yocto so they were not available to
    python. Changed this to site-packages.

    Signed-off-by: Mihai Prica <mihai.prica@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

After that change, the following line in your patch fails:

-FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/.debug/"

Since the line is now:

FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug/"

Can you double check and resend ?

At the same time, can you also update the log to show the "build problem" that
the patch is fixing?

Cheers,

Bruce


On Thu, May 2, 2013 at 3:18 PM, Yao Zhao <yao.zhao@windriver.com> wrote:
> remove python_incdir.patch and inherit pythonnative.
> use PACKAGECONFIG instead of EXTRA_OECONF.
> enable python in full PACKAGECONFIG.
>
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc |   21 ++++++++++++---------
>  recipes-extended/libvirt/libvirt_1.0.3.bb   |    2 +-
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 49d15fb..d4cc5f3 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -1,14 +1,17 @@
> -inherit python-dir
> +inherit pythonnative python-dir
>
> -# Enable the Python tool support
> -EXTRA_OECONF += "--with-python=yes --with-python-inc-dir=-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}"
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +export BUILD_SYS
> +export HOST_SYS
>
> -SRC_URI += " file://python_incdir.patch"
> -
> -DEPENDS  += "python python-native"
> +PACKAGECONFIG += "python"
> +PACKAGECONFIG[python] = "--with-python,--without-python,python,"
>  RDEPENDS_${PN}-python += "python"
>  PACKAGECONFIG_${PN}-python[xen] = ",,,xen-python"
>
> -PACKAGES += "${PN}-python-dbg ${PN}-python"
> -FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/.debug/"
> -FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/dist-packages"
> +PACKAGES += "${PN}-python-staticdev ${PN}-python-dev ${PN}-python-dbg ${PN}-python"
> +FILES_${PN}-python-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
> +FILES_${PN}-python-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
> +FILES_${PN}-python-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
> +FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index c1c000e..33087ce 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -106,7 +106,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>
>  # full config
>  PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
> -                  polkit lxc test remote macvtap libvirtd netcf"
> +                  polkit lxc test remote macvtap libvirtd netcf python"
>
>  PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


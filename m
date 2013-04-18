Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79771E01473
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2013 08:47:11 -0700 (PDT)
Received: by mail-la0-f43.google.com with SMTP id eg20so2674589lab.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2013 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=E3hdZGHAPXr7XNotbtzU0TCYxJwFhogPw2cHVjEorfU=;
	b=E9LGBN+yr0LCrGa7Uqy0rYQymkmf784oqoUyWGSCof9jwqex+hf/9mSDQGDTooP+KM
	DPuPU/b3VzuqQoKe4hAZ2o/17kDFwQXDAXVNnKmVSVEX8dV8Y37e+WCLysA09dkoLavK
	1JwcWTLaMaNeYtjdaYDhxcOuaI3br+Xx5CesIql9TRiiQ6vDcPDxfPjpoxoav3DA/qb3
	UIAwsqtxqT15Uz94CVCg4ghslOzbEDYP2kh63cHlEWNs4ri3S7O4qkr+iEuR6DV20xt+
	65rvqDTgfQ3KaFbIdYrN2DTeuboJ29ivdS3biBUSOBfsDR94SlVCzktugpQtBydAPKds
	ksBQ==
MIME-Version: 1.0
X-Received: by 10.152.116.73 with SMTP id ju9mr6149398lab.54.1366300030225;
	Thu, 18 Apr 2013 08:47:10 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Thu, 18 Apr 2013 08:47:10 -0700 (PDT)
In-Reply-To: <1366297842-10846-2-git-send-email-mihai.prica@intel.com>
References: <1366297842-10846-1-git-send-email-mihai.prica@intel.com>
	<1366297842-10846-2-git-send-email-mihai.prica@intel.com>
Date: Thu, 18 Apr 2013 11:47:10 -0400
Message-ID: <CADkTA4N87FqdCv2SS9va3xw-n4eEyxB0PqmWKhGQuLo_qs0m_Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] libvirt: Changed python bindings install location
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
X-List-Received-Date: Thu, 18 Apr 2013 15:47:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 18, 2013 at 11:10 AM, Mihai Prica <mihai.prica@intel.com> wrote:
> The libvirt-python files were installed to dist-packages and this
> is not part of sys.path in yocto so they were not detected. Changed
> this to site-packages.

By detected, you mean python couldn't import and use them at runtime on the
target ?

Bruce

>
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc        |    4 ++--
>  .../libvirt/libvirt/python_incdir.patch            |   15 +++++++++------
>  2 files changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
> index 49d15fb..297e90c 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -10,5 +10,5 @@ RDEPENDS_${PN}-python += "python"
>  PACKAGECONFIG_${PN}-python[xen] = ",,,xen-python"
>
>  PACKAGES += "${PN}-python-dbg ${PN}-python"
> -FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/dist-packages/.debug/"
> -FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/dist-packages"
> +FILES_${PN}-python-dbg += "${libdir}/${PYTHON_DIR}/site-packages/.debug/"
> +FILES_${PN}-python += "${libdir}/${PYTHON_DIR}/site-packages"
> diff --git a/recipes-extended/libvirt/libvirt/python_incdir.patch b/recipes-extended/libvirt/libvirt/python_incdir.patch
> index 6c77b09..5b78c13 100644
> --- a/recipes-extended/libvirt/libvirt/python_incdir.patch
> +++ b/recipes-extended/libvirt/libvirt/python_incdir.patch
> @@ -1,8 +1,8 @@
> -Index: libvirt-0.10.2/configure.ac
> +Index: libvirt-1.0.3/configure.ac
>  ===================================================================
> ---- libvirt-0.10.2.orig/configure.ac   2012-10-29 11:59:27.091615491 +0200
> -+++ libvirt-0.10.2/configure.ac        2012-10-29 12:09:50.067603647 +0200
> -@@ -2397,6 +2397,11 @@
> +--- libvirt-1.0.3.orig/configure.ac
> ++++ libvirt-1.0.3/configure.ac
> +@@ -1878,6 +1878,11 @@ fi
>
>   PYTHON_VERSION=
>   PYTHON_INCLUDES=
> @@ -14,9 +14,12 @@ Index: libvirt-0.10.2/configure.ac
>   if test "$with_python" != "no" ; then
>       if test -x "$with_python/bin/python"
>       then
> -@@ -2422,29 +2427,30 @@
> -         AM_PATH_PYTHON(,, [:])
> +@@ -1901,31 +1906,32 @@ if test "$with_python" != "no" ; then
>
> +     if test "$with_python" = "yes" ; then
> +         AM_PATH_PYTHON(,, [:])
> +-
> ++        pyexecdir=$prefix/lib/python$PYTHON_VERSION/site-packages
>           if test "$PYTHON" != : ; then
>  -            PYTHON_CONFIG="$PYTHON-config"
>  -
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0379AE00CF5; Wed, 15 Nov 2017 13:01:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45F4BE00C11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:01:17 -0800 (PST)
Received: by mail-qt0-f194.google.com with SMTP id 8so37634668qtv.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 13:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wcFL19uIJIHUlxlOq5EyjSeGUnkjSQrVkMHQeH5CCZk=;
	b=Gs5E7wLmLJTdkgkPfVY0nqsTXmB03cL+VeuBIV3HKKeC2V73ZTsugjc0DFgWhYeRm8
	qTBLbS3p/720IN6Wal/9Mf0OnfcbomJnuznohzT54oLUyi4o1J04+IdH+UMPO0GXQux6
	TzQOhVfFq9SOS1lELqng2ph4ju/9izaIG8ACJ04vsDCN9fuD5hxAZg0YirFnOW0KYCHw
	OsiOKuYnmFgpmINCPXHcFi/hkQfTWHyqP1Yjsgx2WUaniWaLvmkMO5sB70NIWt/P53mj
	cMa7/bHeWC/9sB7d4Wa830xBLQSaf3EX28+xAw9q5KxF0pJnXhzRYEsdix8j2l2/s8Q5
	45pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wcFL19uIJIHUlxlOq5EyjSeGUnkjSQrVkMHQeH5CCZk=;
	b=JQUUgPC5c1Z1QnUi+e3+NbXV0E+IQ968tgvmV8L5FckUaxMJqoP7+sOEhcETjAabMg
	Y6a+fke2U9m9QvCxzlA3wyd3VxB/OF26XCb9Kq0+8VLu+EHpjzSVjNnSBuTAcP1kSiQ0
	yQSF/xsrqdQ/6kFp8OI0M2GQoMBCGXoHEsg+5gYU5Lp0mtNx/PXdp1CKaWFkafjYulx0
	QhBFVgf8UDZoLDfqc5AAVZHmU3OQ4d3NhS4RZ7RotJoWwF2oUtH4hkKwoQMJxWdPV1WY
	vbAmT6eBj+LS/4UJ9FDgWcHys7WwgkAX23NNZw+Q/b/kBObT4VyYcipSCsG5SbEWHJMX
	K/zg==
X-Gm-Message-State: AJaThX4JfirJNDLeBWNoyq6D2P7L3sOsDvaz+LixdYhknu1XZijhKEOq
	OcuFqV2FXmOGOVtn13wPCj4pmzDqPYY8bc2ZlFY=
X-Google-Smtp-Source: AGs4zMb2XCa5iYVpFn1mLX4tRVhGNYc9NtlPTWRIb1r1OxkWwFusQg8UuKbWWB91Y27VuglpTJC/ZWPBz1iw0wkHtLQ=
X-Received: by 10.55.15.90 with SMTP id z87mr26365111qkg.141.1510779677390;
	Wed, 15 Nov 2017 13:01:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Wed, 15 Nov 2017 13:01:16 -0800 (PST)
In-Reply-To: <1510682106-19326-1-git-send-email-mark.asselstine@windriver.com>
References: <1510682106-19326-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Nov 2017 16:01:16 -0500
Message-ID: <CADkTA4OoXRe20Mj1kgz1tachUed_TWcjuT+BSSRR+rimB1NZ5w@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-*: switch remaining pypi recipes to use the pypi class
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
X-List-Received-Date: Wed, 15 Nov 2017 21:01:19 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Nov 14, 2017 at 12:55 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Cleanup the various python-* recipes which download from pypi. The
> biggest change is to "inherit pypi" which should result in us always
> using current pypi best practices. This will for example ensure we are
> using https and not http which is apparently going to be disabled
> soon.
>
> Where the default behavior in the pypi class wasn't sufficient we make
> use of the PYPI_* variables to overwrite the defaults.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/python/python-gevent_1.0.1.bb    |  7 +------
>  recipes-devtools/python/python-m2crypto_0.22.3.bb | 11 +++++------
>  recipes-devtools/python/python-sphinx_1.4.1.bb    |  9 ++-------
>  3 files changed, 8 insertions(+), 19 deletions(-)
>
> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
> index 47f1267..7f1d262 100644
> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
> @@ -11,15 +11,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2dbb33d00e1fd31c7041460a81ac0bd2"
>  DEPENDS += "python-greenlet libevent"
>  RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
>
> -SRCNAME = "gevent"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
>  SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  SRC_URI += "file://libev-conf.patch"
> diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> index 95d6eec..2c2625d 100644
> --- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> +++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> @@ -13,23 +13,22 @@ DESCRIPTION = "\
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
>
> -SRCNAME = "M2Crypto"
> -SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
> +PYPI_PACKAGE = "M2Crypto"
> +
> +SRC_URI += " \
>             file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
>  "
>
>  SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
>  SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
>
>  DEPENDS += "openssl swig-native"
>
>  DISTUTILS_BUILD_ARGS += "build_ext -I${STAGING_INCDIR}"
>
> -inherit setuptools
> +inherit setuptools pypi
>
>  SWIG_FEATURES_x86-64 = "-D__x86_64__"
>  SWIG_FEATURES ?= ""
> diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
> index 835b369..476ff97 100644
> --- a/recipes-devtools/python/python-sphinx_1.4.1.bb
> +++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
> @@ -4,14 +4,9 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
>
> -PR = "r0"
> -SRCNAME = "Sphinx"
> -
> -SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +PYPI_PACKAGE = "Sphinx"
>
>  SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
>  SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
>
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> -
> -inherit setuptools
> +inherit setuptools pypi
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12D63E00DE3; Mon, 29 Jan 2018 07:16:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78200E00D17
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Jan 2018 07:16:47 -0800 (PST)
Received: by mail-lf0-f52.google.com with SMTP id f136so10488288lff.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 29 Jan 2018 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u4ZoXAIzl4hMQ5BULlRMHUU9hEF+ZLAE15fhBaB003M=;
	b=PxR607Cx886y+R0hD2jPRLfmoiEzP1hStflJC7Wq5Lhz5sIAfTx4w5L9+RTB8UDuhX
	8TKidKsHQ6zbJczvUFYfKecyLXagWJ848QZyYwmhMkevO4ru3VxVFasjJuFHSOJKNARc
	HCNVZgOjlq8tXTYMmrgc1gXSF4Lzh7gNavtJyP4ZRDa66mvuowng/dW2E4PZrsEurKbV
	busSNp6i+Ouvz768AmlGEqOUFNz5tRY8VJf1s7SjdbZBxhT+T+n17W7v6cSuv7vDcEba
	Nw4uLVNCnIUQXrauPPQOmuKlOIa/nzlqIiu7DC94mx2qz8UvN7f8d4LZBsoPvrrB0sNt
	iN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u4ZoXAIzl4hMQ5BULlRMHUU9hEF+ZLAE15fhBaB003M=;
	b=I5Z3vJSpYF0mA2lsaq3qWn1HlebPxEfHYXBMfD2loPfvLX5k3447uuUopT5x2To3zH
	l+0vsGbajvn50CXmKy6h8nZCyAYUCeJrnvELEvNnjU7IXRd4gNFpgXOh0qgbcesWsYNB
	Pt3m2ooRmCSToguMgnKLv9hRorFnfktHBlykcQq52x2ek44y9NOPhmoeJMcBo0Yd3S40
	6DeasnhbCVCLtHGTUGQPhaxK+f7Gc+b47wG2bycqt0g5uSis7b+MZHAfQxf0+A8WyNTc
	0/RizH2OrH3XG/LCX24nkq7aq9Orq+EMMCD7Q0tgy84m/wMXOz2rnbk+KphZN8vjdVix
	OOzQ==
X-Gm-Message-State: AKwxytfhEiDDMTQOHj4RZwCV5m1tTRgMn+CxSxX4fQ4wM/XwCNVxThdP
	Fdgsodtq9v5exv29DiUXV7+zgBEXImdOo1IGpSQ=
X-Google-Smtp-Source: AH8x2250f5eAPhZK2WxWFignNArd7cg8QDQQHHiOaa9IOEM41U4VhbQ1CW01cLkpCIPbQWC+b8CPwwOytEzRtrCHStE=
X-Received: by 10.25.38.77 with SMTP id m74mr14928135lfm.13.1517239006232;
	Mon, 29 Jan 2018 07:16:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Mon, 29 Jan 2018 07:16:45 -0800 (PST)
In-Reply-To: <1516743840-3647-1-git-send-email-mober.at@gmail.com>
References: <1516743840-3647-1-git-send-email-mober.at@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 29 Jan 2018 10:16:45 -0500
Message-ID: <CADkTA4MMrStjCXotzHobsHVuqssrgFci3H25jfR=xKxh7O6Hew@mail.gmail.com>
To: Martin Oberhuber <mober.at@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [jethro][PATCH] Fix docker-registry downloads by using https://pypi.python.org
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
X-List-Received-Date: Mon, 29 Jan 2018 15:16:49 -0000
Content-Type: text/plain; charset="UTF-8"

merged to jethro.

Bruce

On Tue, Jan 23, 2018 at 4:44 PM, Martin Oberhuber <mober.at@gmail.com> wrote:
> The docker-registry recipe depends on a couple of Python packages
> which use a SRC_URI with http:// protocol. In jethro, this leads
> to an error message "ERROR 403: SSL is required" when building.
>
> In jethro, the issue is fixed by converting affected http:// URIs
> to https. Note that morty or later do not show the build error
> although they use http.
>
> Signed-off-by: Martin Oberhuber <mober.at@gmail.com>
> ---
>  recipes-devtools/python/python-gevent_1.0.1.bb    | 4 ++--
>  recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
>  recipes-devtools/python/python-requests_2.3.0.bb  | 2 +-
>  recipes-devtools/python/python-sphinx_1.3.1.bb    | 2 +-
>  recipes-devtools/python/python-webob_1.4.1.bb     | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
> index 47f1267..f706423 100644
> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
> @@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
>
>  SRCNAME = "gevent"
>
> -SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
>  SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
>  SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
>
> @@ -30,4 +30,4 @@ SRC_URI += "file://gevent-allow-ssl-v2-or-v3-certificates.patch"
>  # so always force a cross compile
>  do_configure_append() {
>         sed -i -e 's/^cross_compiling=no/cross_compiling=yes/' ${S}/libev/configure
> -}
> \ No newline at end of file
> +}
> diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> index 3325455..c5d4fe6 100644
> --- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
> +++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
> @@ -14,7 +14,7 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
>
>  SRCNAME = "M2Crypto"
> -SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "573f21aaac7d5c9549798e72ffcefedd"
>  SRC_URI[sha256sum] = "6071bfc817d94723e9b458a010d565365104f84aa73f7fe11919871f7562ff72"
> diff --git a/recipes-devtools/python/python-requests_2.3.0.bb b/recipes-devtools/python/python-requests_2.3.0.bb
> index 6f38bf1..3639228 100644
> --- a/recipes-devtools/python/python-requests_2.3.0.bb
> +++ b/recipes-devtools/python/python-requests_2.3.0.bb
> @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7869e52c8275537186de35e3cd5f9ec"
>  PR = "r0"
>  SRCNAME = "requests"
>
> -SRC_URI = "http://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/r/requests/${SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "7449ffdc8ec9ac37bbcd286003c80f00"
>  SRC_URI[sha256sum] = "1c1473875d846fe563d70868acf05b1953a4472f4695b7b3566d1d978957b8fc"
> diff --git a/recipes-devtools/python/python-sphinx_1.3.1.bb b/recipes-devtools/python/python-sphinx_1.3.1.bb
> index fe8ad94..d8cef30 100644
> --- a/recipes-devtools/python/python-sphinx_1.3.1.bb
> +++ b/recipes-devtools/python/python-sphinx_1.3.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6dd095eaa1e7a662b279daf80ecad7e6"
>  PR = "r0"
>  SRCNAME = "Sphinx"
>
> -SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "8786a194acf9673464c5455b11fd4332"
>  SRC_URI[sha256sum] = "1a6e5130c2b42d2de301693c299f78cc4bd3501e78b610c08e45efc70e2b5114"
> diff --git a/recipes-devtools/python/python-webob_1.4.1.bb b/recipes-devtools/python/python-webob_1.4.1.bb
> index 18b3806..e566363 100644
> --- a/recipes-devtools/python/python-webob_1.4.1.bb
> +++ b/recipes-devtools/python/python-webob_1.4.1.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
>  PR = "r0"
>  SRCNAME = "WebOb"
>
> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>
>  SRC_URI[md5sum] = "a5c6e8ba5431756e6a5d5ec56047ec94"
>  SRC_URI[sha256sum] = "12f8b98390befc47336d2c0e5bad9cc48609d808eabb3f8675dc1027a3a9e9db"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


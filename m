Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7685EE0077E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Dec 2013 11:10:39 -0800 (PST)
Received: by mail-pd0-f174.google.com with SMTP id y13so25348974pdi.33
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Dec 2013 11:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pv6p2NbVxyN/Mk5Hgu/d9E+kB8EUf1jPyrP6XGh0H8w=;
	b=NWz2EvFm7RnLaUZquAGZiBNt3ScNJEPeMOnBS4E+OkbaOF7fl/1rcs6MCGWMGoeZAy
	YUMxGQbeF81+Z2lJAhxQV/cKBGNds4XBG2f26/dBLATAfyoiAbGHPFwtfgn+zwePv3lL
	kSJg5F73O2z9tGLlE20khZ4AVLTgoTn5HqktHppRgTB1q+xuYfK2yhKyH6SNOpjb+rT8
	eubfExhxODlXkcKF7bUdAWyfl7acdoWc0bGjUQkpj4iDO9onKYqyBal3inGnqYmZ6dWN
	fzSAr9iM4emBnv3HEV1GjuOCodCJ+f7emSKAhymvfq45DJ2/2Bzga5yS3FrW+cPZMHSb
	agyA==
MIME-Version: 1.0
X-Received: by 10.66.250.163 with SMTP id zd3mr90572099pac.109.1386270638894; 
	Thu, 05 Dec 2013 11:10:38 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Thu, 5 Dec 2013 11:10:38 -0800 (PST)
In-Reply-To: <1386179341-19457-2-git-send-email-denis@eukrea.com>
References: <1386179341-19457-1-git-send-email-denis@eukrea.com>
	<1386179341-19457-2-git-send-email-denis@eukrea.com>
Date: Thu, 5 Dec 2013 14:10:38 -0500
Message-ID: <CADkTA4OYOeJ0eXCrCQZPRR=SGZM-w+Op62sTo8YcMVJ4Jy2N-A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Denis Carikli <denis@eukrea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] python-babel: add native support.
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
X-List-Received-Date: Thu, 05 Dec 2013 19:10:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Out of curiosity, what is using the native version of the package ? I'd like
to get that in the commit log.

Bruce

On Wed, Dec 4, 2013 at 12:49 PM, Denis Carikli <denis@eukrea.com> wrote:
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
>  .../recipes-devtools/python/python-babel_1.3.bb    |    1 +
>  .../recipes-devtools/python/python-pytz_2013.8.bb  |    2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
> index cf2b7a8..11b79d8 100644
> --- a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
> @@ -18,3 +18,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
>
> +BBCLASSEXTEND = "native"
> diff --git a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> index cee4fc2..c5c3fce 100644
> --- a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
> @@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "58552e870aa2c0a1fa3b4ef923f00fbf3e55afaa87f8d31244d44f188d
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
> +
> +BBCLASSEXTEND = "native"
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


Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6B89E004D1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 05:56:02 -0800 (PST)
Received: by mail-qc0-f172.google.com with SMTP id b25so9723355qca.17
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 05:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=wN9p0ifq3P+oXaN1qxbFJXRHvY23UzgQPowbnDtN6MA=;
	b=Id6UgaVyKnvbv2dv3xBcsVvZufcELpl/DQX6DfNdGeMesVGoLGGXVkQiZoWnWuh5av
	4eKUmo6ppeUvrzPz2s8tyUMgCzlOIhzpVRr7sQ3N5WSftWVLpFa1mZBnEHptDTGq2SY3
	Z8OjFQrUIPA6yavAJ+trMnhJI+12mqUgR/F8jAt7sZ0MCnsIEVP2d8+q7ef/qxJfC3VO
	R4WvOoXywiAwTPyJCa6Fs7CS6WUYEbBSl8jaiw97Bmm2CbnD03b9TcWoUCmIglUDmJyh
	j9TOjvMo+9yOvQ6T1YaF+NlLDcC/fYLL7RvAKrZFU82x4TvV5oDgCZ9Qa67Wa8HGUGVd
	2zNw==
X-Received: by 10.224.183.194 with SMTP id ch2mr34863932qab.24.1357394162243; 
	Sat, 05 Jan 2013 05:56:02 -0800 (PST)
Received: from [172.16.140.44] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id z16sm17523750qac.19.2013.01.05.05.56.00
	(version=SSLv3 cipher=OTHER); Sat, 05 Jan 2013 05:56:01 -0800 (PST)
Message-ID: <50E830EF.6030102@gmail.com>
Date: Sat, 05 Jan 2013 14:55:59 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: lei.yang@windriver.com
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
In-Reply-To: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Update the netcat with debian patches to fix some error
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
X-List-Received-Date: Sat, 05 Jan 2013 13:56:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> I know we have the patches in debian dir in the previous version,
> but I meet lots of patch error.so I change it to debian.org version
>
> The background I do this change is:
> I'm a kvm tester,without patches it will meet error when I do the migrate
> testing with  -incoming "exec:nc -l 5200" it meets error:
> "nc: Protocol no available."
>
> You can reproduce it simplely with "nc -l 5200" on your board
>
> Lei
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---

[snip]

> +do_compile() {
> +	cd ${S}
> +        while read line; do patch -p1 <debian/patches/$line; done <debian/patches/series

Is this line really needed ?
I cant seem to find any file called debian/patches/* in ${S}.

> +	pkgrel=4
> +	oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""

I assume this has been tested with package_rpm as well.

> +}
> +
> +do_install() {
> +	install -d ${D}${bindir}
> +	install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> +}
> +
> +ALTERNATIVE_${PN} = "nc"
> +ALTERNATIVE_PRIORITY = "101"
> +
> +BBCLASSEXTEND = "nativesdk"
> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb b/recipes-networking/netcat/openbsd-netcat_1.6.bb
> deleted file mode 100644
> index 1ae3f37..0000000
> --- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "OpenBSD Netcat"
> -HOMEPAGE = "http://code.google.com/p/openbsd-netcat/"
> -SECTION = "console/network"
> -LICENSE = "BSD-3-Clause"
> -PR = "r0"
> -
> -SRCREV = "5"
> -
> -SRC_URI = "svn://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http"
> -S = "${WORKDIR}/trunk"
> -
> -inherit update-alternatives gettext
> -
> -do_configure[noexec] = "1"
> -
> -do_compile() {
> -	cd ${S}
> -	oe_runmake
> -}
> -
> -do_install() {
> -	install -d ${D}${bindir}
> -	install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> -}
> -
> -ALTERNATIVE_${PN} = "nc"
> -ALTERNATIVE_PRIORITY = "101"
> -
> -BBCLASSEXTEND = "nativesdk"
>



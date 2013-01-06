Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 171A8E013F7
	for <meta-virtualization@yoctoproject.org>;
	Sun,  6 Jan 2013 03:58:53 -0800 (PST)
Received: by mail-qc0-f172.google.com with SMTP id b25so10866761qca.31
	for <meta-virtualization@yoctoproject.org>;
	Sun, 06 Jan 2013 03:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=UWx4z4Hh2mk0puo/JTj+5SlM1NJf8Hjmj/T5wPJYZJQ=;
	b=siO95LIMZ9kSriysiIAcMfe2VLUtqccKX7IpBCM3TsLf3LE9A6nrzHn12sXKR71dWx
	1u8Tz9oSFhp06XevVHEaglhyC1cqpjqbq9F9I0MEVllAIKXRSrHotIlz6jPtQZ0lpT6S
	GelXfPITTwVn4Q7RcWmawbyVWAKMPayy5Y9xgpP/ITwUpzQYmyYcJ1hXgDiFSUpHyBaI
	DqZe58G8ZJBg1wfhg8glCQ9sD4bLkm5Pgs1DVA30jOMgprz/i1m95u+ZVGNdApt/bzxS
	1N/qSEMsvECWYjF2PEkF06MmmGlN/T7zywNKhGngS1YnH6LkH3gHCi0FZHzu5p5uIl1I
	sumw==
X-Received: by 10.224.179.211 with SMTP id br19mr37413403qab.43.1357473531964; 
	Sun, 06 Jan 2013 03:58:51 -0800 (PST)
Received: from [79.102.210.67] (c-4f66d243-74736162.cust.telenor.se.
	[79.102.210.67])
	by mx.google.com with ESMTPS id jy4sm14657291qeb.12.2013.01.06.03.58.49
	(version=SSLv3 cipher=OTHER); Sun, 06 Jan 2013 03:58:51 -0800 (PST)
Message-ID: <50E966F7.1040909@gmail.com>
Date: Sun, 06 Jan 2013 12:58:47 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: lei.yang@windriver.com
References: <1357460412-11889-1-git-send-email-lei.yang@windriver.com>
In-Reply-To: <1357460412-11889-1-git-send-email-lei.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org, Joe.MacDonald@windriver.com
Subject: Re: [meta-networking][PATCH] Add netcat-openbsd for virtualization (libvirt virt-test)
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
X-List-Received-Date: Sun, 06 Jan 2013 11:58:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2013 09:20 AM, lei.yang@windriver.com wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> The netcat-openbsd in meta-virtualization layer has bugs.
> This update version will fix "nc: Protocol no available." error.
> As bruce point, we want to keep netcat in the meta-networking,
> which meta-virtualization will depend on
>
> Lei
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>   .../recipes-support/netcat/netcat-openbsd_1.89.bb  |   29 ++++++++++++++++++++
>   meta-networking/recipes-support/netcat/netcat.inc  |    6 ++++
>   .../recipes-support/netcat/netcat_0.7.1.bb         |   11 +++----
>   3 files changed, 40 insertions(+), 6 deletions(-)
>   create mode 100644 meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
>   create mode 100644 meta-networking/recipes-support/netcat/netcat.inc
>
> diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> new file mode 100644
> index 0000000..9fe406c
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.89.bb
> @@ -0,0 +1,29 @@
> +require netcat.inc
> +DESCRIPTION = "OpenBSD Netcat"
> +HOMEPAGE = "http://ftp.debian.org"
> +LICENSE = "BSD-3-Clause"
> +PR = "r0"
> +
> +SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz;name=netcat \
> +           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz;name=netcat-patch"
> +
> +SRC_URI[netcat.md5sum] = "7238ce15aae43069e96ba7faf03f153e"
> +SRC_URI[netcat.sha256sum] = "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
> +SRC_URI[netcat-patch.md5sum] = "00c65aa22243b76998174c733cbb64cc"
> +SRC_URI[netcat-patch.sha256sum] = "d5b6b2bd9788114bdcfbb71acad0263720b4fdc41529e287adf451b8610f84f1"
> +
> +S = "${WORKDIR}/${PN}-${PV}.orig"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> +	cd ${S}
> +        while read line; do patch -p1 <debian/patches/$line; done <debian/patches/series
> +	pkgrel=4
> +	oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
> +}
> +
> +do_install() {
> +        install -d ${D}${bindir}
> +        install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
> +}
> diff --git a/meta-networking/recipes-support/netcat/netcat.inc b/meta-networking/recipes-support/netcat/netcat.inc
> new file mode 100644
> index 0000000..4098668
> --- /dev/null
> +++ b/meta-networking/recipes-support/netcat/netcat.inc
> @@ -0,0 +1,6 @@
> +SECTION = "console/network"
> +inherit update-alternatives gettext
> +
> +ALTERNATIVE_${PN} = "nc"
> +ALTERNATIVE_PRIORITY = "100"

This means that both versions of netcat have alt. prio 100. what happens 
when both are installed on the rootfs at the same time. where does the 
symlink point ?
What does bitbake make of this ?

> +
> diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> index c5ab85d..e09202b 100644
> --- a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> +++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
> @@ -1,21 +1,20 @@
> +require netcat.inc
>   DESCRIPTION = "GNU Netcat"
>   HOMEPAGE = "http://netcat.sourceforge.net"
> -SECTION = "console/network"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
>
>   SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
>   SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
>
> -inherit autotools update-alternatives gettext
> +inherit autotools
>
>   do_install_append() {
> -	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
> +        install -d ${D}${bindir}
> +        mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
>   }
>
> -ALTERNATIVE_${PN} = "nc"
> -ALTERNATIVE_PRIORITY = "100"
>



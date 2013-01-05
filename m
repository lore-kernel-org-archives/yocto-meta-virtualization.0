Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0784CE004D1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 03:38:27 -0800 (PST)
Received: by mail-qc0-f172.google.com with SMTP id b25so9590301qca.17
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 03:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=3nAv+uHgKc0rh7c0JqzzF6rv0GrBbHa60RPMtkIQuYc=;
	b=vvccP/wC7iyOwj0XSHEnb7YA++wj129PNJUkQw0AsJQsCX6BT1ZDAXjzaGgzMS7iqd
	RGoioU1SeFVLKFy52tDJdJEW+3kKTN8zJu/YbYdseKbVNlsx5qxoorR/4evnaJkWH5Ba
	p76klWC2PNHJikFRCqSdKx7vY6AwPFg5VJQcdxTeRUM+Jb9hLwf5ZTA7c3tlWSaCfnj/
	DT+NpGW4IYiNur7Cs4uRGjAgzIIH+/OJ97qPTOxkd5OuMW1EEYZ5Q3nJM9k4NU8Q97Dr
	3rbP7zDz9QsvxfyG4YgUPPLHDna19lvVdtdHY8ti/RB+cvaS3HhfjCzGQ8yWi/Mvm4dt
	zLOg==
X-Received: by 10.224.186.82 with SMTP id cr18mr36392369qab.64.1357385907464; 
	Sat, 05 Jan 2013 03:38:27 -0800 (PST)
Received: from [172.16.140.44] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id cy2sm13221984qeb.9.2013.01.05.03.38.26
	(version=SSLv3 cipher=OTHER); Sat, 05 Jan 2013 03:38:26 -0800 (PST)
Message-ID: <50E810B0.8060709@gmail.com>
Date: Sat, 05 Jan 2013 12:38:24 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: lei.yang@windriver.com
References: <1357375543-2001-1-git-send-email-lei.yang@windriver.com>
In-Reply-To: <1357375543-2001-1-git-send-email-lei.yang@windriver.com>
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
X-List-Received-Date: Sat, 05 Jan 2013 11:38:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 01/05/2013 09:45 AM, lei.yang@windriver.com wrote:
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

Hi Lei,

Thanks for the patch, your .patch file needs an upstream status, if its 
to be kept in the meta-virt layer.

please see:
https://wiki.yoctoproject.org/wiki/Best_Known_Methods_(BKMs)_for_Package_Updating#Patch_Upstreaming

>
> Lei
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt_1.0.0.bb          |    2 +-
>   .../netcat-openbsd/netcat-openbsd_1.89-4.patch     | 2793 ++++++++++++++++++++
>   recipes-networking/netcat/netcat-openbsd_1.89.bb   |   32 +
>   recipes-networking/netcat/openbsd-netcat_1.6.bb    |   29 -
>   4 files changed, 2826 insertions(+), 30 deletions(-)
>   create mode 100644 recipes-networking/netcat/netcat-openbsd/netcat-openbsd_1.89-4.patch
>   create mode 100644 recipes-networking/netcat/netcat-openbsd_1.89.bb
>   delete mode 100644 recipes-networking/netcat/openbsd-netcat_1.6.bb
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.0.bb
> index 5374237..90d7dbb 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.0.bb
> @@ -11,7 +11,7 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
>   # These might be included by PACKAGECONFIG
>   #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
>
> -RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq openbsd-netcat"
> +RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
>   RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
>   RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>

[snip]

> diff --git a/recipes-networking/netcat/netcat-openbsd_1.89.bb b/recipes-networking/netcat/netcat-openbsd_1.89.bb
> new file mode 100644
> index 0000000..392a3fd
> --- /dev/null
> +++ b/recipes-networking/netcat/netcat-openbsd_1.89.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "OpenBSD Netcat"
> +HOMEPAGE = "http://ftp.debian.org"
> +SECTION = "console/network"
> +LICENSE = "BSD-3-Clause"
> +PR = "r0"
> +
> +SRC_URI = "http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89.orig.tar.gz \
> +           file://netcat-openbsd_1.89-4.patch"

Hmm,
I suspect there is no difference between above .patch file and upstream:
http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz

Please reference the patch from this location to keep code size in 
meta-virt low.


> +SRC_URI[md5sum] = "7238ce15aae43069e96ba7faf03f153e"
> +SRC_URI[sha256sum] = "72e844dde8a2a7cba61971d493758dbea9ef0b164bccef15fd4a36490dc77f2b"
> +
> +S = "${WORKDIR}/${PN}-${PV}.orig"
> +inherit update-alternatives gettext
> +
> +do_configure[noexec] = "1"
> +
> +do_compile() {
> +	cd ${S}
> +	while read line; do patch -p1 <debian/patches/$line; done <debian/patches/series
> +	pkgrel=4
> +	oe_runmake CFLAGS="$CFLAGS -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
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



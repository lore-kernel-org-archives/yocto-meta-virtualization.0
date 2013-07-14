Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83F20E013C2
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 20:07:06 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6E374JV007607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sat, 13 Jul 2013 20:07:05 -0700 (PDT)
Received: from bruce-ashfields-macbook.local (128.224.23.134) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sat, 13 Jul 2013 20:07:03 -0700
Message-ID: <51E215D6.1040104@windriver.com>
Date: Sat, 13 Jul 2013 23:07:02 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Mark Asselstine <mark.asselstine@windriver.com>
References: <1373731892-9124-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1373731892-9124-1-git-send-email-mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: create lxc cache directory
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
X-List-Received-Date: Sun, 14 Jul 2013 03:07:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-07-13 12:11 PM, Mark Asselstine wrote:
> Many LXC templates expect the cache directory to exist and use it without
> necessarily checking if it exists. Normally the Makefile would create this
> directory but since /var/cache is volatile we must use the volatile system to
> create this directory at boot, or when the package is installed.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> If templates are expecting longer term cache they will need to be
> modified accordingly since this cache directory will not survive
> reboots...

Fine with me.

Merged.

Bruce

>
>   recipes-containers/lxc/lxc_0.9.0.bb | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 30316bb..563131f 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -3,7 +3,7 @@ SECTION = "console/utils"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>   PRIORITY = "optional"
> -PR = "r2"
> +PR = "r3"
>   DEPENDS = "libxml2 libcap"
>   RDEPENDS_${PN} = " \
>   		rsync \
> @@ -47,3 +47,19 @@ FILES_${PN}-doc = "${mandir} ${infodir}"
>   # For LXC the docdir only contains example configuration files and should be included in the lxc package
>   FILES_${PN} += "${docdir}"
>   FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
> +
> +do_install_append() {
> +	# The /var/cache/lxc directory created by the Makefile
> +	# is wiped out in volatile, we need to create this at boot.
> +	rm -rf ${D}${localstatedir}/cache
> +	install -d ${D}${sysconfdir}/default/volatiles
> +	echo "d root root 0755 ${localstatedir}/cache/lxc none" \
> +	     > ${D}${sysconfdir}/default/volatiles/99_lxc
> +
> +}
> +
> +pkg_postinst_${PN}() {
> +	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> +		/etc/init.d/populate-volatile.sh update
> +	fi
> +}
>



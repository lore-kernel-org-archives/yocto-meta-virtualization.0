Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 526D9E0045D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 00:43:08 -0800 (PST)
Received: from [172.16.140.29] (172.16.140.29) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.2.318.1;
	Tue, 22 Jan 2013 09:43:05 +0100
Message-ID: <50FE5110.7090104@enea.com>
Date: Tue, 22 Jan 2013 09:42:56 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <lei.yang@windriver.com>
References: <1358762433-11853-1-git-send-email-lei.yang@windriver.com>
In-Reply-To: <1358762433-11853-1-git-send-email-lei.yang@windriver.com>
X-Originating-IP: [172.16.140.29]
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] multipath-tools: Add multipath-tools recipe
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
X-List-Received-Date: Tue, 22 Jan 2013 08:43:08 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On Mon 21 Jan 2013 11:00:33 AM CET, lei.yang@windriver.com wrote:
> From: Lei Yang <lei.yang@windriver.com>
>
> This packages provides:
> - multipath: scans the system for multipathed devices, assembles
> - multipathd: waits for maps events then execs multipath
> - kpartx: maps linear devmaps to device partitions, which makes
> multipath maps partionable
> ......
>
> Now,It can be used for kvm disk img partion for me.
>
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>   .../multipath-tools/multipath-tools_git.bb         |   46 ++++++++++++++++++++
>   1 files changed, 46 insertions(+), 0 deletions(-)
>   create mode 100644 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
>
> diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> new file mode 100644
> index 0000000..e9509d3
> --- /dev/null
> +++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "Tools to Manage Multipathed Devices with the device-mapper"
> +DESCRIPTION = "This package provides the tools to manage multipathed devices by \
> +instructing the device-mapper multipath module what to do"
> +
> +HOMEPAGE = "http://christophe.varoqui.free.fr/"
> +DEPENDS = "readline libaio lvm2"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7be2873b6270e45abacc503abbe2aa3d"
> +S="${WORKDIR}/git"
> +
> +
> +SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
> +
> +SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
> +PV = "0.4.9+gitr${SRCPV}"
> +
> +inherit autotools
> +
> +EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
> +
> +PACKAGES =+ "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd libmultipath-dev libmpathpersist-dev"
> +
> +
> +RDEPENDS_${PN} += "libmpathpersist mpathpersist kpartx libmultipath multipath multipathd"
> +

Is RDEPENDS on udev not mandatory ?

> +do_install_append () {
> +	ln -sf libmpathpersist.so.0 ${D}${libdir}/libmpathpersist.so
> +	ln -sf libmultipath.so.0 ${D}${libdir}/libmultipath.so
> +}
> +
> +ALLOW_EMPTY_${PN} = "1"
> +FILES_${PN}     = ""
> +
> +FILES_libmpathpersist = "${libdir}/libmpathpersist*.so.0"
> +FILES_mpathpersist = "${sbindir}/mpathpersist"
> +FILES_kpartx = "${sbindir}/kpartx ${base_libdir}/udev/"
> +FILES_libmultipath = "${libdir}/libcheck*.so ${libdir}/libpri*.so ${libdir}/libmultipath*.so.0"
> +FILES_multipath = "${sbindir}/multipath ${sysconfdir}"
> +FILES_multipathd = "${sbindir}/multipathd ${base_libdir}"
> +
> +#put the symbol link lib in -dev
> +FILES_libmultipath-dev = "${libdir}/libmultipath*.so"
> +FILES_libmpathpersist-dev = "${libdir}/libmpathpersist*.so"
> +
> +

Whats the intended destination for this recipe ?
If not accepted in meta-oe, We'll be happy to merge it in 
meta-virtualization.

Br,
David


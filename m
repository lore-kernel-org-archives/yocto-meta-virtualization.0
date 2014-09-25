Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A003E0086E; Thu, 25 Sep 2014 03:38:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A9CCAE0086A
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Sep 2014 03:38:39 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.175) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 25 Sep 2014 12:38:37 +0200
Date: Thu, 25 Sep 2014 12:38:37 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Olivia Yin <r63875@freescale.com>
Message-ID: <20140925103837.GA2163@iapetus.enea.se>
References: <1411633276-18572-1-git-send-email-r63875@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1411633276-18572-1-git-send-email-r63875@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: uprev to v1.2.8
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
X-List-Received-Date: Thu, 25 Sep 2014 10:38:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 25, 2014 at 04:21:16PM +0800, Olivia Yin wrote:
> ---
>  .../libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb}      | 17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_1.2.4.bb => libvirt_1.2.8.bb} (91%)
> 
> diff --git a/recipes-extended/libvirt/libvirt_1.2.4.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
> similarity index 91%
> rename from recipes-extended/libvirt/libvirt_1.2.4.bb
> rename to recipes-extended/libvirt/libvirt_1.2.8.bb
> index 56b4d4b..cdcd54b 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.4.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
> @@ -24,16 +24,12 @@ RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
>  RCONFLICTS_${PN}_libvirtd = "connman"
>  
>  SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
> -           file://tools-add-libvirt-net-rpc-to-virt-host-validate-when.patch \
>             file://libvirtd.sh \
>             file://libvirtd.conf \
> -           file://runptest.patch \
> -           file://run-ptest \
> -           file://tests-allow-separated-src-and-build-dirs.patch \
>            "
>  
> -SRC_URI[libvirt.md5sum] = "da7a9ca519df45a460659189fe0024e6"
> -SRC_URI[libvirt.sha256sum] = "e43ac5f6b2baeafcd01777be03a897e636f8d48c0cdfb4c4cbb80d45faa9e875"
> +SRC_URI[libvirt.md5sum] = "75114991290f7c8f01dd5223431b9c00"
> +SRC_URI[libvirt.sha256sum] = "0049940b013ea5858b53d9b540c9df9cc3c8cb08750acfd96e9991a1f709e100"
>  
>  inherit autotools gettext update-rc.d pkgconfig ptest
>  
> @@ -68,10 +64,6 @@ ac_cv_path_LVS=/usr/sbin/lvs \
>  ac_cv_path_PARTED=/usr/sbin/parted \
>  ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
>  
> -# Ensure that libvirt uses polkit rather than policykit, whether the host has
> -# pkcheck installed or not, and ensure the path is correct per our config.
> -CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
> -
>  # Some other possible paths we are not yet setting
>  #ac_cv_path_RPCGEN=
>  #ac_cv_path_XSLTPROC=
> @@ -80,6 +72,7 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
>  #ac_cv_path_EBTABLES_PATH=
>  #ac_cv_path_PKG_CONFIG=
>  #ac_cv_path_ac_pt_PKG_CONFIG
> +#ac_cv_path_PKCHECK_PATH=
>  #ac_cv_path_POLKIT_AUTH=
>  #ac_cv_path_DTRACE=
>  #ac_cv_path_ISCSIADM=
> @@ -172,7 +165,6 @@ PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EB
>  PACKAGECONFIG[python] = ",,python,"
>  PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
>  PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
> -PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
>  PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
>  
>  # Enable the Python tool support
> @@ -203,9 +195,6 @@ do_install_append() {
>  	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
>  	echo "d root root 0755 ${localstatedir}/run/libvirt/qemu none" \
>  	     >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> -
> -	# Add hook support for libvirt
> -	mkdir -p ${D}/etc/libvirt/hooks 
>  }
>  
>  EXTRA_OEMAKE = "BUILD_DIR=${B} DEST_DIR=${D}${PTEST_PATH} PTEST_DIR=${PTEST_PATH}"

Apart from the version upgrade, there are many things being removed from the
recipe, like patches, ptests, numactl configuration.... could you explain a bit
the purpose of the removal?

Thank you,

/Josep

> -- 
> 2.1.0.27.g96db324
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


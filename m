Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33C8AE009AA; Tue, 24 Jul 2018 05:49:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21A2AE0080A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Jul 2018 05:49:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6OCmxLY009141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Jul 2018 05:48:59 -0700
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 24 Jul 2018 05:48:58 -0700
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
References: <20180724110856.925-1-zhe.he@windriver.com>
	<20180724110856.925-2-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <dd708394-86ef-a6fb-f8fa-7fd5332ea0e2@windriver.com>
Date: Tue, 24 Jul 2018 20:48:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180724110856.925-2-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH] libvirt: Remove unsupported configure options and fix warning
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
X-List-Received-Date: Tue, 24 Jul 2018 12:49:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore.

Zhe

On 2018年07月24日 19:08, He Zhe wrote:
> xen and xen-inotify have been removed from upstream. We change
> PACKAGECONFIG accordingly.
>
> pkg_postinst has been deprecated, use pkg_postinst_ontarget instead.
>
> WARNING: wrlinux-image-ovp-kvm-1.0-r0 do_rootfs: Intentionally failing
> postinstall scriptlets of ['libvirt'] to defer them to first boot is
> deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_4.3.0.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.3.0.bb
> index edd5261..e6dac5d 100644
> --- a/recipes-extended/libvirt/libvirt_4.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_4.3.0.bb
> @@ -175,7 +175,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
>  PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                     remote macvtap libvirtd netcf udev python ebtables \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                    "
>  
> @@ -183,10 +183,8 @@ PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>  #
>  PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
> -PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
>  PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
> -PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
>  PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
>  PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
>  PACKAGECONFIG[vmware] = "--with-vmware,--without-vmware,,"
> @@ -305,7 +303,7 @@ do_install_ptest() {
>  	done
>  }
>  
> -pkg_postinst_libvirt() {
> +pkg_postinst_ontarget_${PN}() {
>          if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
>                  /etc/init.d/populate-volatile.sh update
>          fi



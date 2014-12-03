Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 75349E0093A; Wed,  3 Dec 2014 07:22:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB203E00920
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Dec 2014 07:22:10 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id hv19so8112301lab.28
	for <meta-virtualization@yoctoproject.org>;
	Wed, 03 Dec 2014 07:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+ogq/JOHM4fy4h6qi9EHqnRNmlvoEGZ/uO5iWWoulqA=;
	b=PyY+unpq914gCBC+p+2EEwk9dAWtYsKPwU7Pi1olerEA3lx6Fsdwv1jqKuwBK8ddOQ
	efT+TJiWFMnQVZU5PBrHqY1NH0qf/GH+NAkNoeER9IwrNuOUIpxt37DBd1aoYBdVUjw5
	Spn1jIkfSiwssm5un4b6doq7pFw755wxvbx+EtoW7MhbETmNEQtCnK1e2HI1ukFpXFlR
	iGWIjXofz0pC5W+7SGv/Gd9CnIDrrgkMxapbUeMKs4Cov2ZP8x6I3slcLUc5i0FTrtUv
	ooxSM8dSNtGWXeVJcCtJ9SfiFylwNX/gNoAxOxMYpRWuWApOE1F+kLxAc+DUYcQxXiCq
	qK+Q==
MIME-Version: 1.0
X-Received: by 10.152.203.199 with SMTP id ks7mr4736229lac.31.1417620129330;
	Wed, 03 Dec 2014 07:22:09 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 3 Dec 2014 07:22:09 -0800 (PST)
In-Reply-To: <1417592481-7620-1-git-send-email-wenzong.fan@windriver.com>
References: <1417592481-7620-1-git-send-email-wenzong.fan@windriver.com>
Date: Wed, 3 Dec 2014 10:22:09 -0500
Message-ID: <CADkTA4NW_g0fmLB1xVgTuyFe4eM9eOuG1EX=8-L5h8rRTFa5jg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wenzong.fan@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: add PACKAGECONFIG for audit, libcap-ng
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
X-List-Received-Date: Wed, 03 Dec 2014 15:22:17 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 3, 2014 at 2:41 AM,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Add PACKAGECONFIG for audit, libcap-ng, otherwise there would be
> warnings like below:
>
> WARN: libvirt: libvirt-virsh rdepends on audit, but it isn't a build dependency?
> WARN: libvirt: libvirt-virsh rdepends on libcap-ng, but it isn't a build dependency?
> WARN: libvirt: libvirt rdepends on audit, but it isn't a build dependency?
> WARN: libvirt: libvirt rdepends on libcap-ng, but it isn't a build dependency?
> WARN: libvirt: libvirt-libvirtd rdepends on audit, but it isn't a build dependency?
> WARN: libvirt: libvirt-libvirtd rdepends on libcap-ng, but it isn't a build dependency?
>
> Both audit and libcap-ng should be enabled/disabled along with selinux
> since all of them are from meta-selinux.

merged.

Bruce

>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.8.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.8.bb b/recipes-extended/libvirt/libvirt_1.2.8.bb
> index 57ae613..0f4b29f 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.8.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.8.bb
> @@ -138,7 +138,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
>  # full config
>  PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                     remote macvtap libvirtd netcf udev python ebtables \
> -                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                    "
> @@ -174,6 +174,8 @@ PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
>  PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
>  PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
>  PACKAGECONFIG[fuse] = "--with-fuse,--without-fuse,fuse,"
> +PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit,"
> +PACKAGECONFIG[libcap-ng] = "--with-capnp,--without-capng,libcap-ng,"
>
>  # Enable the Python tool support
>  require libvirt-python.inc
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


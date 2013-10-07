Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57998E006EA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Oct 2013 10:22:17 -0700 (PDT)
Received: from host60.citrix.com ([66.165.176.60] helo=[172.16.1.10])
	by www.twobit.us with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VTEVc-0005He-5R; Mon, 07 Oct 2013 17:22:16 +0000
Message-ID: <5252ED8D.4000600@twobit.us>
Date: Mon, 07 Oct 2013 13:21:17 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1381094537-11576-1-git-send-email-cjp256@gmail.com>
	<1381094537-11576-4-git-send-email-cjp256@gmail.com>
In-Reply-To: <1381094537-11576-4-git-send-email-cjp256@gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 66.165.176.60
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] xen-guest-image-minimal: example image for a PV/HVM/PVHVM xen guest built with the 'xen-guest' kernel fragment.
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
X-List-Received-Date: Mon, 07 Oct 2013 17:22:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm a bit confused about this one. Maybe it's my misunderstanding. Questions in line:

On 10/06/2013 05:22 PM, Chris Patterson wrote:
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-extended/images/xen-guest-image-minimal.bb | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 recipes-extended/images/xen-guest-image-minimal.bb
> 
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb b/recipes-extended/images/xen-guest-image-minimal.bb
> new file mode 100644
> index 0000000..05b0b61
> --- /dev/null
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION = "A Xen PV guest image."
> +
> +inherit core-image
> +
> +IMAGE_INSTALL += " \
> +    packagegroup-core-boot \
> +    kernel-module-xen-acpi-processor \
> +    kernel-module-xen-blkback \
> +    kernel-module-xen-netback \
> +    kernel-module-xen-pciback \

For a minimal guest I'd expect you wouldn't want any of the *back drivers. Did you mean for these to be the *front drivers?

Cheers,
- Philip

> +    kernel-module-xen-pcifront \
> +    "
> +
> +IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-fbdev', '', d)}"
> +IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', ' xf86-video-vesa', '', d)}"
> +
> +LICENSE = "MIT"
> +
> +SYSLINUX_KERNEL_ARGS ?= "LABEL=boot ramdisk_size=32768 root=/dev/ram0 rootimg=rootfs.img rw console=hvc0 console=tty0 panic=10 debugshell=5"
> +
> +# syslinux is not required for PV guest configuration, but for HVM
> +build_syslinux_cfg () {
> +	echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
> +	echo "DEFAULT boot" >> ${SYSLINUXCFG}
> +	echo "TIMEOUT 10" >> ${SYSLINUXCFG}
> +	echo "PROMPT 1" >> ${SYSLINUXCFG}
> +	echo "LABEL boot" >> ${SYSLINUXCFG}
> +	echo "  KERNEL /vmlinuz" >> ${SYSLINUXCFG}
> +	echo "  INITRD /initrd" >> ${SYSLINUXCFG}
> +	echo "  APPEND ${SYSLINUX_KERNEL_ARGS}" >> ${SYSLINUXCFG}
> +}
> 



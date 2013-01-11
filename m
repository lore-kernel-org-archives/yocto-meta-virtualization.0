Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 793A2E006D2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 11 Jan 2013 09:16:29 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0BHGQri028652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jan 2013 09:16:27 -0800 (PST)
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 11 Jan 2013 09:16:26 -0800
Message-ID: <50F04908.2020103@windriver.com>
Date: Sat, 12 Jan 2013 01:16:56 +0800
From: Lei Yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <1357921647-17864-1-git-send-email-mihai.prica@intel.com>
	<1357921647-17864-2-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1357921647-17864-2-git-send-email-mihai.prica@intel.com>
X-Originating-IP: [128.224.158.164]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2 2/2] Created new target:kvm-image-minimal
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: lei.yang@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2013 17:16:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2013 12:27 AM, Mihai Prica wrote:
> Signed-off-by: Mihai Prica<mihai.prica@intel.com>
> ---
>   recipes-extended/images/kvm-image-minimal.bb |   28 ++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 recipes-extended/images/kvm-image-minimal.bb
>
> diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
> new file mode 100644
> index 0000000..275c43b
> --- /dev/null
> +++ b/recipes-extended/images/kvm-image-minimal.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "A minimal kvm image"
> +
> +IMAGE_INSTALL = " \
> +    packagegroup-core-boot \
> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> +    qemu \
> +    libvirt \
> +    libvirt-libvirtd \
> +    libvirt-virsh \
> +    "
> +
> +IMAGE_FEATURES += "ssh-server-openssh"
> +
> +IMAGE_LINGUAS = " "
> +
> +LICENSE = "MIT"
> +
> +inherit core-image
> +
> +IMAGE_ROOTFS_SIZE = "8192"
> +
> +ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> +
> +PACKAGE_INSTALL_ATTEMPTONLY = "\
Hi Mibai

can you explain "PACKAGE_INSTALL_ATTEMPTONLY " to me, I just see this 
variable first time

Lei
:-)

> +    kernel-module-kvm \
> +    kernel-module-kvm-intel \
> +    kernel-module-kvm-amd \
> +    "



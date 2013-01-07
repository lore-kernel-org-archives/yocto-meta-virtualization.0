Return-Path: <ray.danks@se-eng.com>
Received: from judge.camp.se-eng.com
	(75-148-42-21-Colorado.hfc.comcastbusiness.net [75.148.42.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2ECDE01275
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 09:26:28 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id 128641380F1
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 10:26:28 -0700 (MST)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0P8LhPWyf3du for <meta-virtualization@yoctoproject.org>; 
	Mon,  7 Jan 2013 10:26:26 -0700 (MST)
Received: from [172.20.202.50] (beast.camp.se-eng.com [172.20.202.50])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 198901380EA
	for <meta-virtualization@yoctoproject.org>;
	Mon,  7 Jan 2013 10:26:25 -0700 (MST)
Message-ID: <50EB053F.2040809@se-eng.com>
Date: Mon, 07 Jan 2013 10:26:23 -0700
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: meta-virtualization@yoctoproject.org
References: <1357560505-24122-1-git-send-email-mihai.prica@intel.com>
	<1357560505-24122-2-git-send-email-mihai.prica@intel.com>
In-Reply-To: <1357560505-24122-2-git-send-email-mihai.prica@intel.com>
Subject: Re: [PATCH 1/2] linux-yocto: added kernel configuration for KVM
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ray.danks@se-eng.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 17:26:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm going to show my lack of knowledge in this area, but I know this is 
going to come up when I push a xen.cfg that I apparently never added.

Is it possible to do something along the lines of PACKAGE_CONFIG in the 
linux-yocto.bbappend?  For example, in the libvirt package one can use 
PACKAGE_CONFIG to construct a "minimal" build of libvirt.  What would be 
the method for one to do the same in this package?

Yes, I imagine that worst case there can be a SRC_URI_distro definition 
that includes only the .scc files required for that "minimal" image 
build, but it seems like we want to keep away from that as much as 
possible being that this isn't a distro layer.

Thanks,
Ray

On 01/07/2013 05:08 AM, Mihai Prica wrote:
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   recipes-kernel/linux/linux-yocto/kvm-enable.scc |    4 ++++
>   recipes-kernel/linux/linux-yocto/kvm.cfg        |    4 ++++
>   recipes-kernel/linux/linux-yocto_3.4.bbappend   |    1 +
>   3 files changed, 9 insertions(+)
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm-enable.scc
>   create mode 100644 recipes-kernel/linux/linux-yocto/kvm.cfg
>
> diff --git a/recipes-kernel/linux/linux-yocto/kvm-enable.scc b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> new file mode 100644
> index 0000000..0b5f4fc
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm-enable.scc
> @@ -0,0 +1,4 @@
> +define KFEATURE_DESCRIPTION "Enable KVM host support"
> +define KFEATURE_COMPATIBILITY board
> +
> +kconf non-hardware kvm.cfg
> diff --git a/recipes-kernel/linux/linux-yocto/kvm.cfg b/recipes-kernel/linux/linux-yocto/kvm.cfg
> new file mode 100644
> index 0000000..0cfcf58
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-yocto/kvm.cfg
> @@ -0,0 +1,4 @@
> +CONFIG_KVM=y
> +CONFIG_KVM_INTEL=y
> +CONFIG_KVM_AMD=y
> +CONFIG_TUN=y
> diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> index 5b163ff..71bead2 100644
> --- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
> @@ -4,5 +4,6 @@ SRC_URI += "file://xt-checksum.scc \
>               file://ebtables.scc \
>   	    file://vswitch.scc \
>   	    file://lxc.scc \
> +            file://kvm-enable.scc \
>   	    "
>   



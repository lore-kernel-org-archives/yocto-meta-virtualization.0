Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6A07E00561
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Nov 2013 20:31:33 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAK4VWCs029489
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Nov 2013 20:31:32 -0800 (PST)
Received: from server.local (128.224.21.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 19 Nov 2013 20:31:32 -0800
Message-ID: <528C3B28.2030902@windriver.com>
Date: Tue, 19 Nov 2013 23:31:36 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Yang Shi <yang.shi@windriver.com>, <meta-virtualization@yoctoproject.org>
References: <1384882809-21394-1-git-send-email-yang.shi@windriver.com>
In-Reply-To: <1384882809-21394-1-git-send-email-yang.shi@windriver.com>
Subject: Re: [PATCH] libvirt: Correct IP_PATH
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
X-List-Received-Date: Wed, 20 Nov 2013 04:31:35 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2013, 12:40 PM, Yang Shi wrote:
> ip is installed into /sbin/ip, but the default path used by libvirt is /bin/ip,
> so override IP_PATH in configure.

Merged. Thanks Yang.

Bruce

>
> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>   recipes-extended/libvirt/libvirt_1.1.2.bb |    3 ++-
>   1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
> index 4bdade8..598d7ef 100644
> --- a/recipes-extended/libvirt/libvirt_1.1.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
> @@ -117,7 +117,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>   #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
>
>   # full config
> -PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx \
> +PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
>                      polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
>                      {@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>                     "
> @@ -150,6 +150,7 @@ PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux,"
>   PACKAGECONFIG[ebtables] = "ac_cv_path_EBTABLES_PATH=/sbin/ebtables,ac_cv_path_EBTABLES_PATH=,ebtables,ebtables"
>   PACKAGECONFIG[python] = "--with-python,--without-python,python,"
>   PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
> +PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
>
>   # Enable the Python tool support
>   require libvirt-python.inc
>



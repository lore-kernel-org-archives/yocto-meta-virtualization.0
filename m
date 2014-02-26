Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7A59E008FA
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:36:12 -0800 (PST)
Received: by mail-lb0-f175.google.com with SMTP id w7so968054lbi.34
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aKHaaNUNcR601BmzNN/4Y1fC7RmM6JizmcDdt8ZVBCI=;
	b=FbDy7SmzNJtnB2DEn0LjNSDYRyF7IpSM2curlZFRUGduYIvxHbNUjz9VWRRZWkJAWp
	3fRoaSe3raL9iZQe6bd0AfP658ZP66a59NQ7ajT3IF9WxWOgdQ4MDzWISNUiDlg3bf9D
	QFTNdJaBKMkxUFdrmLHuSOup1mukP0Wvo3yBNNWS1bmiy45rYlro4G1OmVDeS8g8Afrt
	uLGwE5Lv+eBrnkA7rm+2MjdQAVvmlEiIfl2KbSwQvYGTFwtsw4Xt+EVwroFA1qiRf6S1
	WaBP4mjwnq8cVNXuL/PxAzGyXBNx+5BdQcsLZgn+NrFlDsZVCKGZnUZ7ivBiLtIIiAnn
	warw==
MIME-Version: 1.0
X-Received: by 10.112.129.168 with SMTP id nx8mr3342611lbb.37.1393443371329;
	Wed, 26 Feb 2014 11:36:11 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 26 Feb 2014 11:36:11 -0800 (PST)
In-Reply-To: <1393409277-17451-6-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<1393409277-17451-6-git-send-email-jonas.eriksson@enea.com>
Date: Wed, 26 Feb 2014 14:36:11 -0500
Message-ID: <CADkTA4P4WZzqe=4x2J3J0wNJtero4_LTTPLXp6fsEYGpTKSMrw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 5/5] libvirt: Disable polkit driver when there is no x11
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
X-List-Received-Date: Wed, 26 Feb 2014 19:36:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> To avoid having the default build of libvirt depend on virtual/x11
> through polkit and consolekit, check for x11 in DISTRO_FEATURES before
> enabling the polkit support in the default PKG_CONFIG.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
> index a75cc45..2841fcb 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.1.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
> @@ -109,11 +109,12 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>  #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
>
>  # full config
> -PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 polkit test \
> +PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 test \
>                     remote macvtap libvirtd netcf udev python ebtables \
>                     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'lxc', 'lxc', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                    "
>
>  # enable,disable,depends,rdepends
> --
> 1.9.rc1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


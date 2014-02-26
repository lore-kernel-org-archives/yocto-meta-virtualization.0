Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E7A2E008F9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:35:56 -0800 (PST)
Received: by mail-lb0-f172.google.com with SMTP id c11so976169lbj.31
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VGSto6RxJ9sSIXdJDiavFn6ASkvbwGdimReLB3eNobE=;
	b=sHvf5NwdvbFlp1fBHPKvl5SquNz8IQq9sOalFJRWmdd+2SmzLt2pq2FYi9HXUHOU7I
	PY0K1O/wSCbZQoKCXCz1PBe4hdhwQUl+5h3oasnrR7b6sW/Es2wwPk3kwP4fw6i71t8E
	s9WqKcjx64RIfBasU/24Um3ufr3XdRSyIZekpixeWx5tyxWrt5mx9NtFWCwjdZC8DRgk
	41liThNDbZMM1+KqXgl4SD/86Zkt/8rCzoOW6shjJgVjIFxMS9ptz1KPH8ytn9ZhibMl
	yx2GBCx54lPF03RlQolOg107lRVhS7uGWGvMy+MRFdc0ZS3GU+zA1i/LMrqqc82YM776
	RAew==
MIME-Version: 1.0
X-Received: by 10.152.205.197 with SMTP id li5mr2616165lac.50.1393443355555;
	Wed, 26 Feb 2014 11:35:55 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 26 Feb 2014 11:35:55 -0800 (PST)
In-Reply-To: <1393409277-17451-3-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<1393409277-17451-3-git-send-email-jonas.eriksson@enea.com>
Date: Wed, 26 Feb 2014 14:35:55 -0500
Message-ID: <CADkTA4NrvLSnNHP8uOrOfKpuOGGose=5MawVB_dexOkwEmKD9A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/5] libvirt: Fix selinux DISTRO_FEATURE check
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
X-List-Received-Date: Wed, 26 Feb 2014 19:35:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> It seems that a $ was forgotten in the DISTRO_FEATURE check for selinux.

ooops! :)


Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
> index d30f09d..76d3f42 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.1.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
> @@ -111,7 +111,7 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>  # full config
>  PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
>                     polkit lxc test remote macvtap libvirtd netcf udev python ebtables \
> -                   {@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
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


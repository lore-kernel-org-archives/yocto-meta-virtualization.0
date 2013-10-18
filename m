Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DBC2FE016E9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2013 08:07:02 -0700 (PDT)
Received: by mail-la0-f45.google.com with SMTP id eh20so837653lab.18
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2013 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9muSloRFZg2TSp06wAnldTYr3IELW2pZC9JHe4o+JIg=;
	b=eQE+zFC/Jltee80JcHIodPVNDdu3Zm8COXovJ4jGX1dIz2BBAZIpnZ5v9TElOhJe0h
	883wFBze2ma3GccvCnSBEkmeVGRpwlbmr7ZlALJxNs9mRdIh538E46g5PET4kNq2nhqW
	fqv3OxEhbIoQ+X/IkBo2Jyqe7Q7PVXMv3ZCe05zFIC9Qo5MU3HlBjL7K9oIsRsOTZGYA
	SyHTBsHyjkJhrs2EfhmMHwW0pzrfBkTa26uG3w8JsVqvh+qtKxF14A3DiUjEEKV3Nmd3
	1SEk2Kg85wb8PBp94KQpW/M/Vvkkc9ULV8MAwL7iszCTfeYSu2CRWkm5/x/DhMJOy0IM
	+cpw==
MIME-Version: 1.0
X-Received: by 10.112.11.20 with SMTP id m20mr413437lbb.56.1382108821424; Fri,
	18 Oct 2013 08:07:01 -0700 (PDT)
Received: by 10.112.14.200 with HTTP; Fri, 18 Oct 2013 08:07:01 -0700 (PDT)
In-Reply-To: <1382038164-21363-1-git-send-email-yang.shi@windriver.com>
References: <1382038164-21363-1-git-send-email-yang.shi@windriver.com>
Date: Fri, 18 Oct 2013 11:07:01 -0400
Message-ID: <CADkTA4MKRcX=+qDYEpY4+vWTAjDV3PkD=3g_5-v3ji7VaOtH5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yang Shi <yang.shi@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: Fix wrong depend for libxl
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
X-List-Received-Date: Fri, 18 Oct 2013 15:07:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Yang,

Merged with a minor change to the commit log.

Bruce

On Thu, Oct 17, 2013 at 3:29 PM, Yang Shi <yang.shi@windriver.com> wrote:
> xen is not the right dependancy for --with-libxl/--without-libxl, replace
> it to libxl.
>
> Signed-off-by: Yang Shi <yang.shi@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.1.2.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.1.2.bb b/recipes-extended/libvirt/libvirt_1.1.2.bb
> index 819072d..ca34b3c 100644
> --- a/recipes-extended/libvirt/libvirt_1.1.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.1.2.bb
> @@ -131,7 +131,7 @@ PACKAGECONFIG[qemu] = "--with-qemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>  PACKAGECONFIG[xen] = "--with-xen,--without-xen,xen,"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
> -PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,xen,"
> +PACKAGECONFIG[libxl] = "--with-libxl=${STAGING_DIR_TARGET}/lib,--without-libxl,libxl,"
>  PACKAGECONFIG[xen-inotify] = "--with-xen-inotify,--without-xen-inotify,xen,"
>  PACKAGECONFIG[uml] = "--with-uml, --without-uml,,"
>  PACKAGECONFIG[openvz] = "--with-openvz,--without-openvz,,"
> --
> 1.7.5.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


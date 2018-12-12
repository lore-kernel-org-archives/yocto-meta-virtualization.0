Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59831E009B2; Wed, 12 Dec 2018 11:16:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 159B1E008C6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2018 11:16:51 -0800 (PST)
Received: by mail-lf1-f68.google.com with SMTP id b20so14365165lfa.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Dec 2018 11:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kgNdjV13GC1zH1i7BQITS9dULJavJV1bGN8VjHKNRS0=;
	b=R/XSa8qGjXAtSzpfig6KIYLCQBqfpih9lKblMYadYOALmVSYBh4ipaOh/CERGyVB6r
	CAPNXmQn5vajkLOpeaIDP/UnEuoCckKhBbfEqqVpV76d5ORfhqE0sG0oVMy0PJnHIdYq
	rIn/Ko9twVInSDJT1P+3iLkLK2auiyjsNGWQW4xagsevcaVqQ0PPhC4ZM5kK8s4w6FFV
	w6zupJ/r7KDZ/U70k8GCMzIFSfCLX2mHe3AM0yXQzLlfCeQU0IFd1800COzUoTLuZltU
	rq8B7h733se6aOQDXD1yOqb5ArVQagdMeOc6D44mi6RnG670GWqmA5eNFMQrF3coBeaw
	/GeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kgNdjV13GC1zH1i7BQITS9dULJavJV1bGN8VjHKNRS0=;
	b=H+EWOyAC6p0PkJrjGjjAnP1V1AtaGyJN7TQOj0mAG4G+EkIOoVuatwEHmz+mWXjFXo
	YCH9spBrxEGUpyLI9ZWnzw8Y/5YOqgdE45QF3zM+psfJIk+EbO6kCt7DGHTIRGcb4WUS
	J1rgYUHOAGaAiE4jyK0Kv09YximR28o0aUrZlgc4ZefduX3i4YTFDyxDbF2P/CUQswIY
	TXqn8w6tDwHAy1LWHl9A6GRCy2b5A7au9Ytd7vJBZTnAEGflQnZclJymRjeMDJ3pzqU9
	KPKIaEAE4U1kWUJEVIoxFctHLsfy5mL+EfnVW5/4HJBGi29jx6B5xC6evgA9pm/pc5eS
	K10g==
X-Gm-Message-State: AA+aEWYHzUVI5iKvDIOiCeg6jG2OPSJRO3MLXSvSvxD9MB1zuiZIgFAg
	Iq6iXDYL33+VU0KhGKdJbMtIXUHJi38mcB7leUnEiA==
X-Google-Smtp-Source: AFSGD/Xes8AVDZZVgxbHCixcnIJLNmFjc5BrIU6a0kJINTGnENsHFmiM44Qk4lHE0vohZFpMvkkHW7TgswdywaCzjj8=
X-Received: by 2002:a19:c203:: with SMTP id l3mr1085213lfc.113.1544642210625; 
	Wed, 12 Dec 2018 11:16:50 -0800 (PST)
MIME-Version: 1.0
References: <1543803601-13184-1-git-send-email-chin.huat.ang@intel.com>
In-Reply-To: <1543803601-13184-1-git-send-email-chin.huat.ang@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Dec 2018 14:16:38 -0500
Message-ID: <CADkTA4OFPO8BMRKrcQhv3sbb=h6sH0NuAZaUwCc5zc95Mkho7A@mail.gmail.com>
To: chin.huat.ang@intel.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/2] lxc: remove virtio kernel configs
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
X-List-Received-Date: Wed, 12 Dec 2018 19:16:53 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce
On Sun, Dec 2, 2018 at 9:20 PM Chin Huat Ang <chin.huat.ang@intel.com> wrote:
>
> The script lxc-checkconfig doesn't seem to report virtio related kernel
> configs as required, so remove them from lxc.cfg instead.
>
> Signed-off-by: Chin Huat Ang <chin.huat.ang@intel.com>
> ---
>  recipes-kernel/linux/linux-yocto/lxc.cfg | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg b/recipes-kernel/linux/linux-yocto/lxc.cfg
> index c25d60f..e5f1edc 100644
> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
> @@ -21,18 +21,7 @@ CONFIG_NETPRIO_CGROUP=m
>  CONFIG_DEVPTS_MULTIPLE_INSTANCES=y
>
>  # Virtual drivers
> -CONFIG_VIRTIO_BLK=y
> -CONFIG_SCSI_VIRTIO=y
> -CONFIG_VIRTIO_NET=m
>  CONFIG_HVC_DRIVER=y
> -CONFIG_VIRTIO_CONSOLE=y
> -CONFIG_HW_RANDOM_VIRTIO=m
> -CONFIG_VIRTIO=y
> -CONFIG_VIRTIO_RING=y
> -CONFIG_VIRTIO_PCI=y
> -CONFIG_VIRTIO_BALLOON=y
> -CONFIG_VIRTIO_MMIO=y
> -
>
>  # Base support for live boot
>  CONFIG_BLK_DEV_LOOP=y
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9F70BE00BAA; Mon,  5 May 2014 21:24:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.177 listed in list.dnswl.org]
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5833E00B5D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 May 2014 21:24:18 -0700 (PDT)
Received: by mail-lb0-f177.google.com with SMTP id z11so5811344lbi.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 May 2014 21:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A7mB94o7Y8LZNhYWOxu3sIh7PReffC9E1U0npFUip0M=;
	b=QGuF6hl5MA9Yh78xFpFxi2sy1mhOvBQjUm4XydZANEXzZmJHqiRy4sRFlHlpntXocy
	RgL2p5tE6YxAgsZk/kA8XPD4TYVEMQUS6bkvqslpn4ctCtukJbp5Mg58bb27BUi4MRm4
	BTEVmho5u344jetCk+1LhSHTDxDTpiP69g2FyH5X2oMdYmIPvrUr/xLySX2G0RAI+Bxn
	bu3Vzg+luf7c//4vzxV64Vufugjp8p0apv6rF4gJFyYAF2DAJcjKMbe8rcXzMkeL644Y
	mnXOpF8Ltc6l9hfy2c+y/B6QDMHf+YEK3aUQyoInNc1rkm69n5tCq4fyRHux9RayHcnh
	IVQQ==
MIME-Version: 1.0
X-Received: by 10.112.4.106 with SMTP id j10mr20375399lbj.7.1399350256976;
	Mon, 05 May 2014 21:24:16 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Mon, 5 May 2014 21:24:16 -0700 (PDT)
In-Reply-To: <1399322582-18219-1-git-send-email-jslater@windriver.com>
References: <1399322582-18219-1-git-send-email-jslater@windriver.com>
Date: Tue, 6 May 2014 00:24:16 -0400
Message-ID: <CADkTA4MNWpuLVp8hEfzT0qx7L2b8WcAKUqXFUSQS3--U8J32AA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [meta-virt][PATCH 1/1] libvirt: force use of libssh2
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
X-List-Received-Date: Tue, 06 May 2014 04:24:21 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Joe. I've queued both the libvirt changes. If no one objects,
I'll push thenm
in the morning.

Bruce

On Mon, May 5, 2014 at 4:43 PM, Joe Slater <jslater@windriver.com> wrote:
> We add a PACKAGECONFIG[] to deterministically build with
> or without libssh2 and add ssh2 to PACKAGECONFIG, so we will
> always use it.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.2.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
> index a66a6ad..eaa880c 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
> @@ -134,6 +134,7 @@ PRIVATE_LIBS_${PN}-ptest = " \
>  # full config
>  PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                     remote macvtap libvirtd netcf udev python ebtables \
> +                   ssh2 \
>                     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
> @@ -169,6 +170,7 @@ PACKAGECONFIG[python] = ",,python,"
>  PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,cyrus-sasl"
>  PACKAGECONFIG[iproute2] = "ac_cv_path_IP_PATH=/sbin/ip,ac_cv_path_IP_PATH=,iproute2,iproute2"
>  PACKAGECONFIG[numactl] = "--with-numactl,--without-numactl,numactl,"
> +PACKAGECONFIG[ssh2] = "--with-ssh2,--without-ssh2,libssh2,"
>
>  # Enable the Python tool support
>  require libvirt-python.inc
> --
> 1.7.3.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


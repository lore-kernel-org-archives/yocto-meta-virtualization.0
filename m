Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3EC0EE00D18; Tue, 22 Dec 2015 08:28:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	UPPERCASE_50_75 autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.182 listed in list.dnswl.org]
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21341E00825
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 08:28:22 -0800 (PST)
Received: by mail-io0-f182.google.com with SMTP id q126so191328938iof.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Dec 2015 08:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xMBrx84Rb6v71LC12gqzh82hVpOp4i1pFJxra0prr6w=;
	b=WoQHijaTJL6NTvYdU+lYmCJ8XodSmvvebeQ+ht1qoLAX/VbUPzjmcY8iPYkkF+OWr8
	dHoFojinye0FIy3alZSgR8+jbL1btwSEzi/0NoltummRyJSd5e28aAv8V7JTFnEK52cK
	bE9uDAwArt9mVA6odCS++UN5BfPfG/FQXE6R3zgKNFJRgvPQT6/lhaxCl5cA0f35sW3i
	FMakalYhShEV8kNlg0rsBLeHiAvSP6Y4S1U+a4qX9l820eEHkKGXNCkkXZjfzQML2qe5
	KTBHgaHuLnEzUBJUhL6R2Nh+p6xgILgDLTxJvTnoeiJY1rgIDXLWIi7QRW4uFxMYns61
	32GA==
MIME-Version: 1.0
X-Received: by 10.107.12.22 with SMTP id w22mr31121570ioi.8.1450801702201;
	Tue, 22 Dec 2015 08:28:22 -0800 (PST)
Received: by 10.79.112.213 with HTTP; Tue, 22 Dec 2015 08:28:22 -0800 (PST)
In-Reply-To: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
References: <1450747435-5738-1-git-send-email-cjp256@gmail.com>
Date: Tue, 22 Dec 2015 11:28:22 -0500
Message-ID: <CABZSBQfegULVdFw78XDUPgeNXBsfQDz2UzH94GDT5FJwOFvFXw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/4] xen.cfg: update for linux 4.1 and add some newer config options
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
X-List-Received-Date: Tue, 22 Dec 2015 16:28:27 -0000
Content-Type: text/plain; charset=UTF-8

Ignore this, I switched machine targets and realized I should have
kept CONFIG_PARAVIRT=y.  Will update. :)

Thanks!

On Mon, Dec 21, 2015 at 8:23 PM, Chris Patterson <cjp256@gmail.com> wrote:
> Signed-off-by: Chris Patterson <cjp256@gmail.com>
> ---
>  recipes-kernel/linux/linux-yocto/xen.cfg |   20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-yocto/xen.cfg b/recipes-kernel/linux/linux-yocto/xen.cfg
> index 4e796b9..206b162 100644
> --- a/recipes-kernel/linux/linux-yocto/xen.cfg
> +++ b/recipes-kernel/linux/linux-yocto/xen.cfg
> @@ -1,27 +1,18 @@
> -###
> -# linux 3.4, 3.8
> -CONFIG_PARAVIRT_GUEST=y
> -###
> -
> -###
> -# linux 3.10
> -CONFIG_HYPERVISOR_GUEST=y
> -###
> -
> -CONFIG_PARAVIRT=y
>  CONFIG_XEN=y
>  CONFIG_XEN_DOM0=y
> -CONFIG_XEN_PRIVILEGED_GUEST=y
>  CONFIG_XEN_PVHVM=y
>  CONFIG_XEN_MAX_DOMAIN_MEMORY=500
>  CONFIG_XEN_SAVE_RESTORE=y
> -CONFIG_PARAVIRT_CLOCK=y
> +# CONFIG_XEN_DEBUG_FS is not set
> +CONFIG_XEN_PVH=y
> +CONFIG_MMU_NOTIFIER=y
>  CONFIG_HIBERNATE_CALLBACKS=y
>  CONFIG_PCI_XEN=y
>  CONFIG_XEN_PCIDEV_FRONTEND=y
>  CONFIG_SYS_HYPERVISOR=y
>  CONFIG_XEN_BLKDEV_FRONTEND=y
>  CONFIG_XEN_BLKDEV_BACKEND=m
> +CONFIG_XEN_SCSI_FRONTEND=m
>  CONFIG_XEN_NETDEV_FRONTEND=y
>  CONFIG_XEN_NETDEV_BACKEND=m
>  CONFIG_INPUT_MISC=y
> @@ -52,3 +43,6 @@ CONFIG_XEN_PRIVCMD=y
>  CONFIG_XEN_ACPI_PROCESSOR=m
>  CONFIG_XEN_MCE_LOG=y
>  CONFIG_XEN_HAVE_PVMMU=y
> +CONFIG_XEN_EFI=y
> +CONFIG_XEN_AUTO_XLATE=y
> +CONFIG_XEN_ACPI=y
> --
> 1.7.10.4
>


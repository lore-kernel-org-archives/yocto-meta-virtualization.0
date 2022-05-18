Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00CEC433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 00:11:24 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.384.1652832680811152726
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 17:11:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLuGtZEt;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id 63so266318uaw.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 May 2022 17:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Mjuc0ntBC7aVq0BAWrlo0Hh4oR2RweWXyD0fJrWsuY=;
        b=RLuGtZEtquiR78PnWLBTOkM5G168jLTVJ4pMIRLeWUc34pcppR2XxVYcX5qopJ5Y/C
         Qlss8Rv6FxKX/HmFiAerzE1PP9sDNPxP1tPiX+3os/Qb90Ku69SyM0nsqfxkSjHMxv3a
         6FbBskTk8xKPb6bmNKNjM5EiI+9XYhrAOCpnUimTDAV0HeFNtGYm3PnM3RANBI6j/38j
         3qTgwEzUAfZA1Gmoe8PfZPWU547xqkh+gX04HnoTr0NMpn7wVKyVc5u10rABpkPc5cU1
         XaNf96FBcDRqZhoxiRBvEy0wMqQNB1UXUaq0IOzqmzJc4jnNAdkNtNNQUbz+DKFa757y
         mNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Mjuc0ntBC7aVq0BAWrlo0Hh4oR2RweWXyD0fJrWsuY=;
        b=pVl+H5ryZ536lDFxfJlm0ZBMusKyFBsIY2rK4KItRkwL96S44AYGx0wl9GBGa7PRpX
         QaPXnKuunxVjV7GNpYTnoUB9OhchsUVk5euqCqPZPMaAYSKjqRSmhaUG36hoa30/nc9U
         VfMIpkXAIN4YFzFMAliLGNFYeTAEPJXYqAL4S5wpHnPI7+ms5xeJDN6cvNwjwGR2B+iQ
         xsYGrJbdVRTC4rbDDf4WK3gZpztXeAQFaXC4ixTkaOqPDQglQgd0H5XXYt5iQ1qkgibN
         fVa6gkOyla++AX9dNBHUi4/Br8gZisr63OTwW8w+qpm6X3smKdE8Ys66vmtVWr3buPjx
         FoaQ==
X-Gm-Message-State: AOAM532e6/IHNlaYRw5QvCtFSSnFG30UD4QOt+TuEqL8wdJOoTRXcu7s
	ONvbva0ln5CQuQX3CfecoH1SmmYpyUdeEMlYD0M=
X-Google-Smtp-Source: 
 ABdhPJx5LehHwTGHo/s7YgOpJPSM8TdcFsuDfm0LN+XLtbjp24t2lNAVmkSIB7jxatW+r9qEobjyC/aW7CetdRJ/0nE=
X-Received: by 2002:ab0:6381:0:b0:368:b480:d3e6 with SMTP id
 y1-20020ab06381000000b00368b480d3e6mr4764497uao.3.1652832679848; Tue, 17 May
 2022 17:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652196703.git.bertrand.marquis@arm.com>
 <3ff0a6eb0eb859dade39cfa8c1494519c626d26d.1652196703.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <3ff0a6eb0eb859dade39cfa8c1494519c626d26d.1652196703.git.bertrand.marquis@arm.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 17 May 2022 17:11:09 -0700
Message-ID: 
 <CACMJ4GYiMC79YZNDQ=ZUmRkiQCQ2coWY0fK-DVn+PKOQBC6UfA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH v2 3/4] xen: enable qemuboot for
 arm32
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 May 2022 00:11:24 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7284

On Tue, May 10, 2022 at 8:35 AM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add required variables to generate a qemuboot devicetree for qemuarm.
> With this change, Xen and dom0 can be started using runqemu.
>
> Xen is started using qemu kernel argument and the devicetree is modified
> to properly boot dom0 (which is loaded in memory).
> This is using the same system as qemuarm64.
>
> At this stage dom0 is hanging on PCI device scanning.
>
> This patch is also using qemuarm64 as machine for arm64 bit instead of
> aarch64 to allow adding support for other machine (an example a Xilinx
> board that can be emulated with using an other xen machine).
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

Christopher

> ---
>  classes/qemuboot-xen-defaults.bbclass | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/classes/qemuboot-xen-defaults.bbclass b/classes/qemuboot-xen-defaults.bbclass
> index c7e74c3..f1550cc 100644
> --- a/classes/qemuboot-xen-defaults.bbclass
> +++ b/classes/qemuboot-xen-defaults.bbclass
> @@ -10,15 +10,21 @@ DOM0_KERNEL ??= "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}"
>  DOM0_KERNEL_LOAD_ADDR ??= "0x45000000"
>  QB_XEN_DOMAIN_MODULES ??= "${DOM0_KERNEL}:${DOM0_KERNEL_LOAD_ADDR}:multiboot,kernel"
>
> -# Qemuboot for 64-bit Arm uses the QB_DEFAULT_KERNEL method to load Xen
> +# Qemuboot for Arm uses the QB_DEFAULT_KERNEL method to load Xen
>  # and the device loader option for the dom0 kernel:
>  QB_OPT_APPEND:append:aarch64 = " \
>      -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
>      "
> -QB_DEFAULT_KERNEL:aarch64 = "xen-${MACHINE}"
> +QB_OPT_APPEND:append:qemuarm = " \
> +    -device loader,file=${DOM0_KERNEL},addr=${DOM0_KERNEL_LOAD_ADDR} \
> +    "
> +QB_DEFAULT_KERNEL:qemuarm64 = "xen-${MACHINE}"
> +QB_DEFAULT_KERNEL:qemuarm = "xen-${MACHINE}"
>
>  # 64-bit Arm: gic version 3
> -QB_MACHINE:aarch64 = "-machine virt,gic-version=3 -machine virtualization=true"
> +QB_MACHINE:qemuarm64 = "-machine virt,gic-version=3 -machine virtualization=true"
> +# 32-bit Arm
> +QB_MACHINE:qemuarm = "-machine virt -machine virtualization=true"
>
>  # Increase the default qemu memory allocation to allow for the hypervisor.
>  # Use a weak assignment to allow for change of default and override elsewhere.
> @@ -26,5 +32,9 @@ QB_MEM_VALUE ??= "512"
>  QB_MEM = "-m ${QB_MEM_VALUE}"
>
>  # 64-bit Arm: qemuboot with a device tree binary
> -QB_DTB:aarch64 = "${IMAGE_NAME}.qemuboot.dtb"
> -QB_DTB_LINK:aarch64 = "${IMAGE_LINK_NAME}.qemuboot.dtb"
> +QB_DTB:qemuarm64 = "${IMAGE_NAME}.qemuboot.dtb"
> +QB_DTB_LINK:qemuarm64 = "${IMAGE_LINK_NAME}.qemuboot.dtb"
> +
> +# 32-bit Arm: qemuboot with a device tree binary
> +QB_DTB:qemuarm = "${IMAGE_NAME}.qemuboot.dtb"
> +QB_DTB_LINK:qemuarm = "${IMAGE_LINK_NAME}.qemuboot.dtb"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7274): https://lists.yoctoproject.org/g/meta-virtualization/message/7274
> Mute This Topic: https://lists.yoctoproject.org/mt/91015802/3619037
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [christopher.w.clark@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


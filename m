Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DF5C83F12
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 13:23:23 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.26965.1693142595568981037
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 27 Aug 2023 06:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Kw0vl8Fp;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-76ef03f76c7so162893685a.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693142594; x=1693747394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KanDbs4K8GMwuKjMBb5w5wWroignQN85CFcya0QXYx4=;
        b=Kw0vl8FpYVQ1Q8SwkkOPSjFul91nx2ePwaGCk+eiY9U2/ufBDADx61DPii/dpsBnvY
         5meX/doutehlqXCnymwg9WK+zSr8h9R7l3J/hZayYFSfXwD1b1UycThizsnvqpv/s4zZ
         oQTkA2GrJSm+RH/uuksXU70R2Ar7rMy25E4rW+RypxgWnQ6i9SxHoYEdtxfADkAYRIAF
         MGdlnHPlYM3nPxr0Miy+NztxvHXbnArdMe2oQ9d/ZBL3bloabBEqBFOP0qUyBvtfYulU
         rZh5MBRny4c1nD1ZeZpxXLiVv04yJK27jbkGao9tTx9J27QqtKNv2tnVMosJ1MlpPf+b
         H6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693142594; x=1693747394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KanDbs4K8GMwuKjMBb5w5wWroignQN85CFcya0QXYx4=;
        b=VvbURjYHjhkNPeVTgxZC61E0EoO2RgAhIt7IMJi6htRir7Xl7bHBJwtQhC1LrQtMNU
         clFVLZhLDxCbMtcBVinDavYN85D7Muy6LBIpFgfvFJuu02/R65J4wfMcuwCjq2QDxgbj
         jDtmZ6Y+IsjVBGbXn59KHz4ASikCWYv9ZSjhvTiZjnvS9HPJVTOXBDbgseQ+Oy+Di2Q1
         GVQIFfqd3d7R227Qn33xXDqlVk9oyZLjwUv4c9eZL5Xb5axxtzMbOUli4bxaYfwpQd/d
         W9WNSvIRwgs+zEz6R3EK1ymCX/dKYdQgUW9gBKl9m3mIjkjMfcB8JemtftU2QPthEYm3
         4wAg==
X-Gm-Message-State: AOJu0Ywf9wCM0nJ2w+c1BgHoh+TF/ltiNjKOF7DSfqjYK6bNpCetGUHC
	fahfe2za5P1PYyGyi/ADMcU=
X-Google-Smtp-Source: AGHT+IGuVuv5wOtxw5Z8OQ00P18U6fQh/pJoHEaVUxitSSOvXhoCRF2YHV7+E4c1cyfQFl54sz5lGQ==
X-Received: by 2002:a05:620a:22e1:b0:765:7652:a61d with SMTP id p1-20020a05620a22e100b007657652a61dmr24371621qki.30.1693142594551;
        Sun, 27 Aug 2023 06:23:14 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w10-20020ae9e50a000000b00767cd764ecfsm1732197qkf.33.2023.08.27.06.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 06:23:13 -0700 (PDT)
Date: Sun, 27 Aug 2023 13:23:12 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	christopher.w.clark@gmail.com, mark.hatle@kernel.crashing.org
Subject: Re: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add xen
 variable as addendum
Message-ID: <ZOtOQIeCfldaixvL@gmail.com>
References: <20230825181811.3306054-1-sandeep.gundlupet-raju@amd.com>
 <20230825181811.3306054-2-sandeep.gundlupet-raju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825181811.3306054-2-sandeep.gundlupet-raju@amd.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 27 Aug 2023 13:23:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8237

In message: [meta-virtualization][master][PATCH 1/2] xen-boot-cmd: Add xen variable as addendum
on 25/08/2023 Sandeep Gundlupet Raju wrote:

> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>  .../xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> index b2b76120..6d113c9a 100644
> --- a/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> +++ b/dynamic-layers/xilinx/recipes-bsp/u-boot/xen-boot-cmd.inc
> @@ -36,3 +36,15 @@ XEN_CMDLINE_APPEND ?= ""
>  # Specify the max number of vcpus for dom0
>  # Example usage: DOM0_MAX_VCPUS = "2" or DOM0_MAX_VCPUS = "2-4"
>  DOM0_MAX_VCPUS ?= "1"
> +
> +# Add xen variables as addendum.
> +# Variable SCRIPT_SED_ADDENDUM id defined in meta-xilinx and set to null by
> +# default and enable only for xen builds.

s/id/is/

This really entangles the meta-virt dynamic layer with the xilinx
layers. You need to have an understanding of one, to really understand
the other.

If we are setting or appending to a variable, it really should be
defined in meta-virtualization.

Is there a way to move the functions that are using this variable
into the main Xen meta-virt recipes, in such a way that this is
a generic way to customize the boot ?

Bruce

> +SCRIPT_SED_ADDENDUM += "-e 's/@@XEN_IMAGE_NAME@@/${XEN_IMAGE_NAME}/' \
> +        -e 's/@@XEN_OFFSET@@/${XEN_OFFSET}/' \
> +        -e 's/@@XEN_LOAD_ADDRESS@@/${XEN_LOAD_ADDRESS}/' \
> +        -e 's/@@DOM0_MEM@@/${DOM0_MEM}/' \
> +        -e 's/@@DOM0_MAX_VCPUS@@/${DOM0_MAX_VCPUS}/' \
> +        -e 's:@@XEN_SERIAL_CONSOLES@@:${XEN_SERIAL_CONSOLES}:' \
> +        -e 's:@@XEN_CMDLINE_APPEND@@:${XEN_CMDLINE_APPEND}:' \
> +"
> \ No newline at end of file
> -- 
> 2.34.1
> 


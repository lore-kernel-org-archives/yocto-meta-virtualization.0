Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C10FC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:37:35 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.2308.1709926650544052813
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 08 Mar 2024 11:37:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmP8OSUq;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso2543821276.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 11:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709926650; x=1710531450; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31lJmiaIZcA0Xc3GOmeTL0dT7EJQTe3TfMPkCsqDKr4=;
        b=GmP8OSUqxuRVWwO3XWTJ69gMYe7E+srdts1Ca/zBe5shL3rwFJGolvE5aUpUam0WBV
         hHSxOxHnQQUaCzKjDLfeq+GmNdis9Wqe+VdTo/AMW5zdmrajizbPXUhK+GtrhgKfWgAh
         Kzxpcjj3q47J5xOBfcj2Mr3wtTOVbll0kQ4/88cd1kzeBvx6cyBPnVJY+NP41I6mzLnb
         5iff6iX5tEeSoC8NNXvXZsynDwHkI1vsFYWLDicPyMONOsGlzaXawHAUcNNJ6rYAHGcP
         RAiQC15BgJ72aIbqbChEwzyjjlDOGDlUx2FYS7JgsuRRTyLQ5xGKP95TYo9epF1MvtrR
         O3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709926650; x=1710531450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31lJmiaIZcA0Xc3GOmeTL0dT7EJQTe3TfMPkCsqDKr4=;
        b=XL1jQBlzL7f97qxaodxYY9fJd7zC4QmqI66p1YEcqFU55MR8lDKt4DEB6PZ0lir9BC
         ZqKamGpzUsgW7gcJa96zKE01pCZhykQDysv4lvErF+sKb43W2AMtHesRTvYrTqwooCx7
         O8uC4M3FyQkBoOGFayCe/0s3e/l++uoBqr3lFfUUz9nY3EVH3/hDABq8OUMm6YqVDueX
         EKNHTpXdVyehMCGCwwhMAn7UUy2+R7JB35nT9K124WuSEx3RFZp7+17zAvh91w33LFa6
         3Wr3pFIElF3kDbTi0GRfEZlZEUcjCBJW11UIK0jVU21iAo/Yg8XFo7EOgOY/T6ZOp5pW
         kxvQ==
X-Gm-Message-State: AOJu0YyTa+qCZpQAWkmrA8qS6aXDZVHYXpTZ8VeCdKpvnAtPagh9Sbgx
	A1U2w+kUQT1NZYngV1HCuCEarX1lTJUi/3+w/3hEXS5DLtDjf0XN
X-Google-Smtp-Source: AGHT+IETcDy+ttl1lUlMK6kHxexbZI4f05anrxUfF+QfmuG2cFv8njM4/grsWIviEF4LiRtgdx1nPA==
X-Received: by 2002:a5b:a04:0:b0:dcd:741f:490a with SMTP id k4-20020a5b0a04000000b00dcd741f490amr19358013ybq.7.1709926649563;
        Fri, 08 Mar 2024 11:37:29 -0800 (PST)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id l9-20020ac84cc9000000b0042f068d3d8asm73890qtv.43.2024.03.08.11.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 11:37:29 -0800 (PST)
Date: Fri, 8 Mar 2024 19:37:27 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCHv2] libvirt-glib: update 4.0.0 ->
 5.0.0
Message-ID: <Zeto95GGjbyWs6Lg@gmail.com>
References: <20240308183029.2280173-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240308183029.2280173-1-f_l_k@t-online.de>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 08 Mar 2024 19:37:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8616

v2 is staged on master-next.

I'm still pending the content of master-next on getting
the ceph upgrade finished. Hopefully the slowing down
of patches will help find someone willing to help with
it ! (this statement is not directed at you, it is directed
at the list :))

Bruce

In message: [meta-virtualization][PATCHv2] libvirt-glib: update 4.0.0 -> 5.0.0
on 08/03/2024 Markus Volk wrote:

> 5.0.0 - Nov 28, 2023
> ====================
> 
> - Fix compatiblity with libxml2 >= 2.12.0
> - Bump min libvirt version to 2.3.0
> - Bump min meson to 0.56.0
> - Require use of GCC >= 4.8 / CLang > 3.4 / XCode CLang > 5.1
> - Mark USB disks as removable by default
> - Add support for audio device backend config
> - Add support for DBus graphics backend config
> - Add support for controlling firmware feature flags
> - Improve compiler flag handling in meson
> - Extend library version script handling to FreeBSD
> - Fix pointer sign issue in capabilities config API
> - Fix compat with gnome.mkenums() in Meson 0.60.0
> - Avoid compiler warnings from gi-ir-scanner generated
>   code by not setting glib version constraints
> - Be more robust about NULL GError parameters
> - Disable unimportant cast alignment compiler warnings
> - Use 'pragma once' in all header files
> - Updated translations
> 
> This fixes build after libxml update:
> ../git/libvirt-gconfig/libvirt-gconfig-object.c:200:37: error: passing argument 2 of 'xmlSetStructuredErrorFunc' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   200 |     xmlSetStructuredErrorFunc(NULL, gvir_xml_structured_error_nop);
>       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                     |
>       |                                     void (*)(void *, xmlError *) {aka void (*)(void *, struct _xmlError *)}
> In file included from /home/flk/poky/build/tmp/work/corei7-64-poky-linux/libvirt-glib/4.0.0/recipe-sysroot/usr/include/libxml2/libxml/relaxng.h:14,
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libvirt/{libvirt-glib_4.0.0.bb => libvirt-glib_5.0.0.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename recipes-extended/libvirt/{libvirt-glib_4.0.0.bb => libvirt-glib_5.0.0.bb} (92%)
> 
> diff --git a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb b/recipes-extended/libvirt/libvirt-glib_5.0.0.bb
> similarity index 92%
> rename from recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> rename to recipes-extended/libvirt/libvirt-glib_5.0.0.bb
> index 7ca65a95..4435ca0b 100644
> --- a/recipes-extended/libvirt/libvirt-glib_4.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt-glib_5.0.0.bb
> @@ -10,7 +10,7 @@ SRC_URI = " \
>  	file://0001-meson.build-allow-crosscompiling-gir-and-doc.patch \
>  "
>  
> -SRCREV = "e0bfc34682744a74b850fa217e9c206a9eb80612"
> +SRCREV = "9b26bec8828a38fcb3bc0e5f6f33b03fa99c4b68"
>  S = "${WORKDIR}/git"
>  
>  inherit meson pkgconfig gobject-introspection gettext vala gtk-doc
> -- 
> 2.44.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8613): https://lists.yoctoproject.org/g/meta-virtualization/message/8613
> Mute This Topic: https://lists.yoctoproject.org/mt/104814529/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



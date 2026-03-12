Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0534106ACD5
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 17:31:40 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25.1773336692041478174
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 10:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JENd/hmi;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899eabc5292so15300216d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Mar 2026 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773336691; x=1773941491; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ew6h/06KX7KUM7953oqs3ixlQ2qWU3Z161V69AkXw8I=;
        b=JENd/hmiWKI1bV+OSz8OdCp7y65ylp5rF2//GzohzIdMGuFyI4Nf7+FWOaxjgfTcSQ
         mNFzPa4fI9Cn5lYTPrdUrzUfzM22fI0+sF4GbLwu0RXGDhfHHN2i8T2DCqtMELMtevl1
         uBMy6DD6g3Km4uzZIbKyL7vcYNdJmKmvgwqWtTDcOCoWVZhcw8Yksx36n7nWFZPg5FFH
         xISIpfnhCTZ/k/iiLPK5CYoW3d0XKi5d2Dkvnf7+qsFCj4x4GjhOvShMd2SwhJus8sSS
         DQx6rzuRj7efncKiNGUiH9iRLGRtr4Dwg8Tl7/tCf5rYlmmsnQ7hcX7QnMf5k01Ckqeu
         Xgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773336691; x=1773941491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ew6h/06KX7KUM7953oqs3ixlQ2qWU3Z161V69AkXw8I=;
        b=vSpZxWcaT/Ow+L/PXPjpc0AH8lYSwZFtcqXaRqtrSUEIBHHi3vYNg+aL4ZSEk/TNdx
         K4hx/S8YrzdbFgssVjbGuNxLvP5OeCC88d/efqr26l71f++edDiYCuFgpQFD33pDw64J
         iTKQAq5CRKCT+zfLyU18TZjXogR/uDhuTUlda3lWeuR7EL7dOChlsxlIJ6lhOs0x/kmH
         LT1K6VFz6EuivbrRQVCo2ZWBt0W3JPptDC6SnIUdLHkbwBKXSDJKbhGUIyuBBUDU5803
         dMXB0CsUF6MkwpWvSWtImBH04CE+RpE5DCH8J0aN8KaDe/SSUdfwHTlzbU8tUZ8MIHRb
         5RHg==
X-Gm-Message-State: AOJu0Yzk299PamueCeRoRvn/dkNDD7E3GhF3U8QmxeY+cBybW6jvu3JR
	4VGiA4FqH4XI0AVdumYtJyTHcedf82MqvEGC+XMRJhhGgMJvM0kanU3701z44608D18=
X-Gm-Gg: ATEYQzzBrquykel3BFQf5+TKMfM3xYFqYmQ74VphCX6jfx6EqjmS0k9nGK+/HZP1t4v
	OZZZ/7Rpvl5enVeG7hU9qv3pOQ6E2k7w34WrbDSN2Ts94rtkrqwcPkl7T1o6ZimKhTbMSqm1H7A
	oGQuzhf5pCQDO60OKAzFRt3BBZLWTg8s8QD9xWLtSb75wxamZCRwiobvckv+YSdjwKVorrWmndB
	/qLNjFhI1/+vfXT1clIBsSTBfIpQAbs6r8Nuk0nZ5Ttl9VWocgMzRN4MpSm1V4S1IxyPVGbriE3
	h3DYrbVH3QT+cMPgVylF+erGQODCFu6NXs3Up0xmDrGyMG9yyZI50lQHXEeW9f8NS8ILVGuFaxZ
	4CRyhY2CVOjul7k5EGN3vf6PJqtDE8YAf6w0rxkSQQfYJk7CgQuyzTp+cCC9w0W0mn9syv5JgSs
	yWxNx85AdvxL0crcIkihxWu8vXD9VNwpYaTWOvmtNS4AUsYpLXs7cG/PDtZpYXEQ7SuJGc++njA
	yXpKvNQFO5y+rn4KT3jb3NyyxbTynESFGqm
X-Received: by 2002:a05:6214:d86:b0:899:fa9a:98fc with SMTP id 6a1803df08f44-89a81ea6ac7mr8287306d6.43.1773336690975;
        Thu, 12 Mar 2026 10:31:30 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65cfd520sm39269906d6.36.2026.03.12.10.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:31:30 -0700 (PDT)
Date: Thu, 12 Mar 2026 17:31:28 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] qemu-system-native: Tweak
 whitespace handling
Message-ID: <abL4cBTxTh8OShFs@gmail.com>
References: <20260312170222.3678984-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312170222.3678984-1-richard.purdie@linuxfoundation.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Mar 2026 17:31:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9650

In message: [meta-virtualization] [PATCH] qemu-system-native: Tweak whitespace handling
on 12/03/2026 Richard Purdie via lists.yoctoproject.org wrote:

> Avoid a yocto-check-layer issue:
> 
>    qemu-system-native:do_recipe_qa: 05c723e48cb4253cb80f1e5dcb63767b266c72cf8a83d3d7ff36a6622e43eb50 -> 7f42888db4f5572303288c58ad79c5267fa81da05a3a71288f91f309b50ed614
>       bitbake-diffsigs --task qemu-system-native do_recipe_qa --signature 05c723e48cb4253cb80f1e5dcb63767b266c72cf8a83d3d7ff36a6622e43eb50 7f42888db4f5572303288c58ad79c5267fa81da05a3a71288f91f309b50ed614
>       NOTE: Reconnecting to bitbake server...
>       basehash changed from 1b770ad4a9b79d38c928331d17651d3d66a6ebc45822c336d7ab98bfa8ebfd94 to 6bc5e5507534603aa6f6ab862ab27ef9c0b9ffcfaa9922d7ef25cb563fab6ab9
>       Variable PACKAGECONFIG value changed:
>       "fdt alsa kvm pie slirp png pixman sdl     virglrenderer epoxy  {++}" (whitespace changed)
> 
> but moving the whitespace into the added option.

merged.

And I've pushed another change, that should get meta-virt passing
check layer again.

Bruce

> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  recipes-devtools/qemu/qemu-system-native_%.bbappend | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/qemu/qemu-system-native_%.bbappend b/recipes-devtools/qemu/qemu-system-native_%.bbappend
> index b04b6934..1b77db02 100644
> --- a/recipes-devtools/qemu/qemu-system-native_%.bbappend
> +++ b/recipes-devtools/qemu/qemu-system-native_%.bbappend
> @@ -9,4 +9,4 @@
>  # The layer.conf propagates virtualization to DISTRO_FEATURES_NATIVE when
>  # vcontainer or virtualization is in the target DISTRO_FEATURES.
>  
> -PACKAGECONFIG:append = " ${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'virtualization', 'virtfs', '', d)}"
> +PACKAGECONFIG:append = "${@bb.utils.contains('DISTRO_FEATURES_NATIVE', 'virtualization', ' virtfs', '', d)}"

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9649): https://lists.yoctoproject.org/g/meta-virtualization/message/9649
> Mute This Topic: https://lists.yoctoproject.org/mt/118282685/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



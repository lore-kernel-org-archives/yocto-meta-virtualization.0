Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F420FFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:45:53 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11445.1777376745846069095
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h52C/vST;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50e63771eb0so101495461cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777376745; x=1777981545; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKP+VFmntzT3Icg+LBvMpOqnvaAAEFFTajXuDXLjMDQ=;
        b=h52C/vSTsGzfmU8Oll1XfOrCfK/PK0wXoCd5+PSNq6Uz7DECaJu7TsGy0/4io9zxiK
         7T4nsuWMnkT6ZzFyeo7G7vzgI8PTNxpICGkHRPtxKyno8gYXtUobVAWJBYPoRMkLrs13
         Of2sgDsy+5lXxSyjdtL/4QH4MAZopSLur73OKNHcyTAzb+mb3/y72gBYsWLrMhnXNXKp
         iIFrBsAehoeePHN5s4/UcExqyiJvxRJRbIihR8DijHp+YD26gVCmlg8bRfOFwzzsETRA
         3rm6y9P/SM+OB323CXDuURrBs0/gnhzpZVkySj3RGq4Gt90OHWRgfabcvGKY/zyaItVv
         8pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376745; x=1777981545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKP+VFmntzT3Icg+LBvMpOqnvaAAEFFTajXuDXLjMDQ=;
        b=g1kk5/wckBe1Wdm2ox8TXPoy3qnZttqjoBm/eWPKed4Q7E0F9njwJRS6atL3GsMSTh
         YSGgJ8FeYExIrf4PI2NBsNUrmoldDKi70U7o0OtZq4EIVw7OsI7cQtdy5+7Br1vxyusL
         CbhQ7r2UhESKtti141PBJLrSA2HA5wsf5BM+XWcbVc761qtds+AXrMVBMP+pb1qCmX8O
         mVdEYt78qv+YReT9HHc3AiR7bCxyu5iuI3Fc7sOqi/Z+po17GviBmXhdJi9bCXqaCjNA
         1TyfX+M1W4ai9tMWRCBVXB7EGZPOWSdBKsv74kBsNcIj47ynBBPNnnypjq6i1ybLfejX
         d2hw==
X-Gm-Message-State: AOJu0YxmjOjlHlK8vzY7HRxiFVVzekyXk/OmsuVQ6iGssLMLYB2PZpxV
	Bo3FurONIFlWCA3WVyRlQbB5MZGc7mCP9ZJJhs0wLkqOTRZOJhDdbMfd
X-Gm-Gg: AeBDiesBDQUzBNDnscLfF0oj8FuOsEpWzUs027X9XXJ7kPcxmWvpdMgnKbF1bOha/qe
	jt56RaO58CEn4XLNg3L8g4YbKQmGf7YvpGZz8KH+vsfeDkZzDIYuw8g2K8ew+9czPXh7lQVmC+2
	Ywy8Ej1a7mh9YfS3BQ/84LuWN+igrC9ytENCk5pZMTUKdvoTMu34Cd5I8V5pU8klcWJAH5ZXyts
	cHqJU7pADkRe3lER1zUc2f/A82Ldh5DsZ1euhkGsQRnZA1V5QPQ8qzTDYc/i1fYUcee4gLXGrDT
	5NgY4Aq3dBZVXvKtRfcVIbfDkULDRzoNk9+8w9CzphOG20DQnZ763azAcmTwIecqLdrYSYjTuys
	B9mE73svlBGYz8XFXpEwUVWTHXwj418cddJL60FIE5U+NOVtK9DifIzgnR0fGSBAiAGSlM6/Tgf
	XaRpelJ0y8N45CVYcQnt9wEdlPA3Vs68YHUgWu74PoZ7KwzOviRBcR/upu8hKvEGS5ZI1gT2duQ
	8oDl41C0boRRPsxffvs6/tlfz2daqEBjYD12xY5K7PRvBg=
X-Received: by 2002:ac8:5c8c:0:b0:509:f36:496d with SMTP id d75a77b69052e-5100e1b509amr32953611cf.33.1777376744770;
        Tue, 28 Apr 2026 04:45:44 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5100e0a9befsm17313481cf.14.2026.04.28.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:45:44 -0700 (PDT)
Date: Tue, 28 Apr 2026 11:45:42 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: louis.rannou@semalibre.com
Cc: meta-virtualization@lists.yoctoproject.org, pascal.eberhard@se.com,
	Louis Rannou <louis.rannou@non.se.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: remove obsolet depends to
 avahi
Message-ID: <afCd5q-X7UtiNBt0@gmail.com>
References: <20260427135431.205900-1-louis.rannou@semalibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427135431.205900-1-louis.rannou@semalibre.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:45:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9765

small typo in the shortlog fixed, and pushed to master.

I'm curious how you noticed the obselete depdency! If it
is a scripted or specific prompt you used, I'd be
interested to know if there are others like this lurking
in the layer.

Bruce

In message: [meta-virtualization][PATCH] libvirt: remove obsolet depends to avahi
on 27/04/2026 Louis Rannou via lists.yoctoproject.org wrote:

> From: Louis Rannou <louis.rannou@non.se.com>
> 
> libvirt has removed support for avahi in version 5.5.0 in 2019:
> 
>   * Remove Avahi mDNS support
> 
>     This feature was never used outside of virt-manager, which has itself
>     stopped using it a while ago.
> 
> Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
> Signed-off-by: Louis Rannou <louis.rannou@semalibre.com>
> ---
>  recipes-extended/libvirt/libvirt_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
> index b5b0a5f2..34a1ff21 100644
> --- a/recipes-extended/libvirt/libvirt_git.bb
> +++ b/recipes-extended/libvirt/libvirt_git.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LESSER;md5=4b54a1fd55a448865a0b32d41598759d"
>  SECTION = "console/tools"
>  
> -DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
> +DEPENDS = "bridge-utils gnutls libxml2 lvm2 parted curl libpcap util-linux e2fsprogs pm-utils \
>  	   iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \
>             python3-docutils-native \
>  	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
> -- 
> 2.53.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9746): https://lists.yoctoproject.org/g/meta-virtualization/message/9746
> Mute This Topic: https://lists.yoctoproject.org/mt/119030694/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



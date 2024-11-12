Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA45D597BB
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:22:20 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.101191.1731453731465725135
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 12 Nov 2024 15:22:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y/gO27Nb;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b150dc7bc0so436091585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 15:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731453730; x=1732058530; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S3kFlXBAo5/bzIFn5Hixbjstq4oD+JseDF6RzVhrRZI=;
        b=Y/gO27Nb19S26TahyAEf5bUd7ZlqRVk75H2USZRVmsy3J62bpZZSCGMsAw0hCVO/iQ
         /VAIthIQk1KM4K4s4nMGmzXJw1NBTnmyKkvHjVXjSKhk4BmiqNVHFH8kpXHu1GP87LWW
         yGw91tRVKKrU2cVWq5YViZDmiZ3URfWFSWDY58AtVRQ3Z1nD3qjzI4eWLHUbMJ1XgS6A
         pr1iChY8DR5Tkm8+joYXTOj9cczZYwAQvO+wK2piwQN6juKffjmLdWhecMD0T5SvwrmS
         1T49tfRCxO9gDeTGieRXS08+PBKDHmKk74Xr2HcTB018fSRqDbFfe+xH4sfBKFQMZNjt
         3P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453730; x=1732058530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3kFlXBAo5/bzIFn5Hixbjstq4oD+JseDF6RzVhrRZI=;
        b=iMgPsX3MwOm/WhJv+xOEkrO1XdRJpFSe8Q0Tl/Ob+cB2xOK9klcQbCGW4NdGzMHyr+
         d5egslL3Q3i91ujRSMMhphPQ7LYIaF3x2SNMc6OYt9f8bed7ui7onZeVPxL6wDeMhBb9
         WYVZ6Zmz8fy/xefdZhsWK1HcE81LlHm/YVLOZU2P1clz9S3+cYWcCo6DkWaEDZ3h3m8M
         PP1cqsHznx8U2hvtOeM7iTgb8h7GH3Rt7I7q5t93mp2tSp4kLVK76Ay8cZeQj5D+6zCW
         a4eGuXMpADl9h0BTZG9ot0kBzKANXQZTf+JI9UuH5p2KXhxHWe3t/DGNQO6OQvEwQSWh
         F6TQ==
X-Gm-Message-State: AOJu0YzkqWOxAnJamvYtCmgm9O2I23DgD7S+HA4usT6c1l87TxGnTktj
	ts+oMKOSDwHn+L42Qsrt1D0ILoKvMThQdwgK7iBfbLKtvrzN4k8YDXo2Mf/7
X-Google-Smtp-Source: AGHT+IHTiI5ekIPVh/A2hNXljrLWNmt1c6lDk/c866ZD9GYh2sylw6iRYP+a7WSVZpDKRU7y+ySBNg==
X-Received: by 2002:ac8:4d07:0:b0:463:1398:ae45 with SMTP id d75a77b69052e-4631398aefbmr179889631cf.25.1731453730404;
        Tue, 12 Nov 2024 15:22:10 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-462ff5c8540sm80663001cf.72.2024.11.12.15.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:22:09 -0800 (PST)
Date: Tue, 12 Nov 2024 23:22:08 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] libvirt: set
 USERADD_DEPENDS to avoid package_write_rpm failure
Message-ID: <ZzPjIJFxC/GX5trw@gmail.com>
References: <1805DEC3FAC3F34F.28149@lists.yoctoproject.org>
 <a7624c48-9683-41eb-a5eb-146f45ce5061@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7624c48-9683-41eb-a5eb-146f45ce5061@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 12 Nov 2024 23:22:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8967



In message: Re: [meta-virtualization][scarthgap][PATCH] libvirt: set USERADD_DEPENDS to avoid package_write_rpm failure
on 08/11/2024 Chen Qi via lists.yoctoproject.org wrote:

> I didn't sent this patch for master branch because master branch has changed
> the polkit part and there's no chown there.
> So this patch is only suitable for scarthgap.

I was wondering just that! thanks for the explanation, this is now merged.

Bruce

> 
> Regards,
> Qi
> 
> On 11/8/24 10:55, Chen Qi via lists.yoctoproject.org wrote:
> > From: Chen Qi <Qi.Chen@windriver.com>
> > 
> > When do_package uses state cache and is not re-run but do_package_write_rpm
> > is re-run, then we get the following error:
> > 
> >    Exception: KeyError: 'getpwuid(): uid not found: 996'
> > 
> > This is because libvirt does chown to polkitd in do_install and polkitd
> > is from polkit.
> > 
> > Here's an easy way to reproduce this issue:
> > 
> >    bitbake libvirt -c cleansstate && bitbake libvirt -c package && \
> >    bitbake libvirt -c clean && bitbake libvirt -c package_write_rpm
> > 
> > So make use of USERADD_DEPENDS to ensure polkitd exists to fix this issue.
> > 
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >   recipes-extended/libvirt/libvirt_10.0.0.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > index a33b6980..22193ff3 100644
> > --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> > +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> > @@ -11,6 +11,8 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
> >   	   ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
> >   	   ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
> > +USERADD_DEPENDS = "${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'polkit', '', d)}"
> > +
> >   # libvirt-guests.sh needs gettext.sh
> >   #
> >   RDEPENDS:${PN} = "gettext-runtime"
> > 
> > 
> > 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8961): https://lists.yoctoproject.org/g/meta-virtualization/message/8961
> Mute This Topic: https://lists.yoctoproject.org/mt/109457527/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



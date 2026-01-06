Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAEBCEFCFC
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:33:22 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98558.1767727996205402127
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVCDgWac;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-4eda6c385c0so8863821cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727995; x=1768332795; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mqD60anN5dLdmPXuo6KL5ExGg3xcNhEq4EHXnYxnLWY=;
        b=iVCDgWacYJ2G/SPN7A2lrCuaoqsxw3ubBKU30rlMVU6LqfDLk2cxjL0lIra2fqFhh1
         HhiVYXL0eT+fcQ8nSQXVLqFKKej1vtGEYGjBr6PSBQvSvWRRH0RDeaqBfoprozVXFb+l
         5TOOwhTh/qB91tdbKhiyQA/v7hd+LXiF2OJzQt7bFbWK/tkzrTQVzTPi8ht12vZYV6si
         vDMZKhYCBHbaaZTVxTzsW9SEC7oZR2AQJ/LEm9DqS0Kbh0iDesneTJnmy/GLskQMyFeK
         zL3or+lV3fZT7HhfAoRNLoVIQdD0UeFUoxemvKCxmpB/6VKmoZl63eaKKL+nXN8uAmum
         U5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727995; x=1768332795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqD60anN5dLdmPXuo6KL5ExGg3xcNhEq4EHXnYxnLWY=;
        b=k98MZ2RYJ0AVeAbSaSK1/Ydpde0/XCp09Hb4k4NSMc6/Ladum1IzhN6/8bZWhlkRbe
         tI89yFW/TT5bPXdgxOzqgJKm9XFJkMriM/L6pKnXZvGqwMMIIT13BC6xCnG5j+knxoiA
         ZfTsWke7SP/KVR0SVPJ7nx/HoftAF2vSfVV4seYF51dxRHfpoh3UajEPAWxq3zG4ikTn
         JJYlsvPm18iRWAnL22Hq7agMitt6nT6vX4yYWIrEms5xSCGW5rS7j/0vIsKnTHSRKLQA
         uB9G062Cbs9u/n0qp/Mdz5YHGgXPO+kzQreEWFkBkT465hX23Mn3Tfq3AXRhDzZLcGDe
         JTlQ==
X-Gm-Message-State: AOJu0YwzaWizYoZOIP3sBNMzM0TSn1BjIuPquN++IbofoLX6kVADEqZV
	s+wntkwBVFuKYE787FiD6HxFW0EUdmb7kssYaEdTDTHqOfh7GuXtlmI1
X-Gm-Gg: AY/fxX5BF6ZZyFJcf6nycHqUjktuffHqHpUlofnKPlD+5EJfD3mDnTTy9mSff1ry8nB
	4pHldgNbSsaIsUtmwfV1CEciSqg3RSEU3kp6LIa0oAqnecFs+rT0SyMLMjAeOH9RPFmgOJetsOS
	PmFpR5aJ7Xbd7iSKeR14/YVed7GGIxz1ig2cucMHIhC2xQmgupq24x2fciyqSbNFH/Ayaq4qazC
	l424ls4r3pMBNGOmzyasIHXht1Y1mNmLsnyaMGQ2EJI6vy1W0heByjcogqT0qBEmgHt60OMNW0O
	5ql0RPS0DLQEiSZBzxtHobqv5iOWjlPMJ8wG4ylEUo5a98dAedwXb9Sg6fKB7RzgyobFmRQo7m9
	+IgAWGWWrjL0F2b1x5VV53/FbcAUo8osYgoxa2ck1ldx3eQgfLxJAVJnjMSefSgZgSSltiWdwht
	9RZgpcriQD6kLzN9NHlgPpcV/YaYvQdr49WOoIiafids63fq41dZJjrmKoIYeFLuun
X-Google-Smtp-Source: AGHT+IEAGJqIGhv7kERrY6IbkZ+5qS3gos3bPTEBVi85FvtFdC867uUzLPHMOGyEyIRkvOBoqyELFA==
X-Received: by 2002:a05:622a:229c:b0:4ec:f5cd:8721 with SMTP id d75a77b69052e-4ffb45e0865mr1663121cf.0.1767727994957;
        Tue, 06 Jan 2026 11:33:14 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907725ffc7sm18915356d6.44.2026.01.06.11.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:33:14 -0800 (PST)
Date: Tue, 6 Jan 2026 14:33:12 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: paul.leguendekerneizon@savoirfairelinux.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2 0/1] add support of
 cockpit-machines
Message-ID: <aV1jeNmTCtVDtLYt@gmail.com>
References: <20251217153521.51439-1-paul.leguendekerneizon@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217153521.51439-1-paul.leguendekerneizon@savoirfairelinux.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:33:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9524

Sorry for the delay, this is now merged.

Bruce

In message: [meta-virtualization] [PATCH v2 0/1] add support of cockpit-machines
on 17/12/2025 Paul Le Guen de Kerneizon via lists.yoctoproject.org wrote:

> Hello community,
> 
> Since version 242 of Cockpit package, plugin `cockpit-machines` has been moved
> to a dedicated repository. This cockpit plugin is used to manage in web UI
> virtual machines. There is currently no support of the new cockpit-machines
> package in any Yocto meta and the following patch bring it.
> This recipe is suggested to be added in the meta-virtualization in
> order to fulfill the needed dependencies on `virt-manager` and
> `libvirt-dbus` recipes. As the cockpit recipe is available in the meta-webserver
> layer, cockpit-machines recipe depends on it.
> 
> V2:
> * Add a comment in layer.conf regarding meta-webserver dependency
> * Add a comment in cockpit-machines_346.bb about musl compatibility
> * Edit commit message to give explanations about how to test the recipe on
> target
> 
> Waiting for your review, feel free to ask any questions or remarks.
> Regards,
> Paul Le Guen de Kerneizon, Savoir-faire Linux
> 
> Paul Le Guen de Kerneizon (1):
>   cockpit-machines: add recipe
> 
>  conf/layer.conf                               |  4 ++-
>  .../cockpit-machines/cockpit-machines_346.bb  | 31 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/cockpit-machines/cockpit-machines_346.bb
> 
> --
> 2.34.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9491): https://lists.yoctoproject.org/g/meta-virtualization/message/9491
> Mute This Topic: https://lists.yoctoproject.org/mt/116827734/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



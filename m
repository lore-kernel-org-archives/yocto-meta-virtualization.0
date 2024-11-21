Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A32D75BB6
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 04:31:10 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.3763.1732163462774464120
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 20:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O7M2QS5g;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6eeac3535baso4335717b3.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Nov 2024 20:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732163462; x=1732768262; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6MVag2oenRbDthYaEOSfIR41N3yxbxrpZOaD8SJGi4I=;
        b=O7M2QS5gQ1+x9LDQgvkKUROaD5ehS0VUzjI3Ixq9iB9b/ajczaC/cg/iedJ3UHyrs0
         MdKufLX+25LsbJrzD3N5QMrbGvLd8ihb26StOZhNl4wyAGGwbRjsBMQ+b5yxUzHUEdep
         EcQm6SVHVgqWVpgVdq0brQra/OmZGTssbcddfdV2F3TxALZLRrJHHgOxkPFoK3EcMbq6
         u3xwAjszq00lmZU10dFKQjFHeuKcswfE0oP+RN8e7sNPJ++zSdabmoLETeuoDeJyB6SA
         +8O3FESRj6iRc8rzrrYPJf/VgLqwVwZJUErTds9KMpiby5v6L1SJANiESRLeVfisBhDd
         4Qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732163462; x=1732768262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MVag2oenRbDthYaEOSfIR41N3yxbxrpZOaD8SJGi4I=;
        b=WUnCGXdfTYXhzdfnMeRBqKD0JDGy9Rxy+zOd7aBnyVpkvfSEV79n4xKos4AjLszFyW
         Nl/PRz0v3wXWA5QZbifCHU2zajfwRsVtQNs9UnzQYbUva1c9Wl2i3dt68t5Gt3Vl3mWJ
         SRQatJPhm9eHNdDqrw5tYnORgnQdDkyz5gym8djPwZJHeAhqamE7gEBUVTWB//af3DAt
         dUVuyrfHwkdVT+0Y6j5d27pSSqekQqXKsa16ncGvJ834Gl/vzFHkciUzNocXfBfwHNav
         M3Zs2fJKceJS5hxancaEJ4+WzFP8JFdj1T1bdJ5dlOau7wSMDPaPHxRlkOHA8rfnhNbK
         u4/Q==
X-Gm-Message-State: AOJu0YwEm/oCzBL0UnBVUEpoya+2sOJCAtF7S21VrsDyoDbM2luzIdAF
	ZhifMJNqHEbmllYmPDAe8l/NldeqK7rNnsvK38crWQVdcUPdT2KE
X-Gm-Gg: ASbGncsF5lofKNKcBrv8P5eEpJNr2+peb2s1dgxBNRHXpE2uwiAiQir3cQyMTcoZN/Z
	ItiXjWICS8Q9sIrg/davX+kq0X5UhdZg+1/COMtFE/4tD0tkj/39VufZ1+K7H+nM36lg221pOeR
	tXfuyi7bXyYunID2MuZsnqR6d1rjiw+3/GtJU7wB4s1OD9IUQ7U5/uFry1ynWRilIqo7Kbrh2iS
	aNNI+12J8tp0oQwyf7JaIQhvUnhI0vY4J5AFsv33msBdyZNIOEC+zaG4YtT2Yh+p7ZU/0Q07g9l
	OesjZQgTf2vrYAEHDFrUb+FTvCzl
X-Google-Smtp-Source: AGHT+IE3rt0phOIo7wgRQJhR5ffw2AmcSrJgkY/Ct3CGiTUwhbSdy96dH54VIOmSSgjuBGiQ8VDYcQ==
X-Received: by 2002:a05:690c:6286:b0:6ea:4d3f:dfa6 with SMTP id 00721157ae682-6eebcfabd65mr62194497b3.0.1732163461870;
        Wed, 20 Nov 2024 20:31:01 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d4380b3447sm18415916d6.10.2024.11.20.20.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:31:00 -0800 (PST)
Date: Thu, 21 Nov 2024 04:30:58 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: stanley.stanton@taitcommunications.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix
 datetime deprecation warning
Message-ID: <Zz63giXvpIojHO/S@gmail.com>
References: <CADkTA4Mc5RRPd_vJ5Bt4KDrCyvfB_H4EGwojXY+SAN8F--puqg@mail.gmail.com>
 <20241119034817.3051733-1-stanley.stanton@taitcommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119034817.3051733-1-stanley.stanton@taitcommunications.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 Nov 2024 04:31:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8988

v2 is merged to master. Request cherry-picks to any other
branches of interest.

Bruce

In message: [meta-virtualization] [PATCH v2] xen.inc: python 3.12: fix datetime deprecation warning
on 19/11/2024 Stanley Stanton via lists.yoctoproject.org wrote:

> Parsing xen.inc with a host distro that provides python 3.12 (such as Ubuntu
> 24.04) generates the following deprecation warning:
> 
> DeprecationWarning: datetime.datetime.utcfromtimestamp() is deprecated and scheduled for removal in a future version.
> Use timezone-aware objects to represent datetimes in UTC: datetime.datetime.fromtimestamp(timestamp, datetime.UTC)
> 
> This warning comes from the use of datetime.datetime.utcfromtimestamp()
> in get_build_time_vars.
> 
> datetime.UTC seems to be a getter wrapper for datetime.timezone.utc,
> which is already available on older host distro python versions
> (I have tested only with python 3.10 provided by Ubuntu 22.04)
> so, opt to use that instead to prevent a breaking change.
> 
> Signed-off-by: Stanley Stanton <stanley.stanton@taitcommunications.com>
> ---
>  recipes-extended/xen/xen.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index dcd281b5..63790f73 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -151,7 +151,7 @@ def get_build_time_vars(d):
>      source_date_epoch = d.getVar('SOURCE_DATE_EPOCH')
>      if source_date_epoch is not None:
>          import datetime
> -        utc_datetime = datetime.datetime.utcfromtimestamp(float(source_date_epoch))
> +        utc_datetime =  datetime.datetime.fromtimestamp(float(source_date_epoch), datetime.timezone.utc)
>          return " XEN_BUILD_DATE=" + utc_datetime.strftime("%Y-%m-%d") + \
>                 " XEN_BUILD_TIME=" + utc_datetime.strftime("%H:%M:%S")
>      return ""
> -- 
> 2.43.0
> 
> 
> -- 
> 
> This communication is confidential. We only send and receive email on the
> basis of the terms set out at www.taitcommunications.com/email_disclaimer 
> <http://www.taitcommunications.com/email_disclaimer>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8976): https://lists.yoctoproject.org/g/meta-virtualization/message/8976
> Mute This Topic: https://lists.yoctoproject.org/mt/109659338/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



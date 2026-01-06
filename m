Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC43CEFCF5
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:18:32 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98228.1767727101911491433
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 11:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPQpd/ac;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4f1aecac2c9so1627511cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 11:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727101; x=1768331901; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/b0av8iRX1obbC9B4vlqMkHHXYjOOtcrBWU5VjFwWxA=;
        b=iPQpd/acmdv8mJIgDwhua6Hrrrr7sYi8KUkYj6dw0lvzmRWJMqLHB2aKIXJAQ7VvJe
         /02W4a+tKqA1DfIZrdr8CVS+kDpq4jPxTb12CsF8ZHtve937zIAsYNUpcO4BCjAa+vUC
         39h8Dh7/dWroUXLK5Q/MXOjCi083f36q+NsOgJsb3tOrTlTsZUatovsJ2Of20ceqoTUE
         xFBrIJTdNWYrhd1KyWtyUaQgND1DR43kQ+vxTrregRJsoFfTt/LYq2DdGNCcmVYldHRc
         jAwUcx4BQFEAERdIgOZMbxZ6Ws4OGWVTzIMajPGEJOD4McfXRtJv17K8SAzRcJS+TNCR
         Da7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727101; x=1768331901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b0av8iRX1obbC9B4vlqMkHHXYjOOtcrBWU5VjFwWxA=;
        b=RlMoY5Bz1EiNDs64Bi+KIU9y+bZz7AmQOO76gqNQ0MQgentkd3Jn+wuohsJpGGrSqA
         cBOX4xYHr8wJfQYGM10tZTi7dclgF1Oevp5ZCMtFA1r95SpT7pucT5Gk0zNmy70OiOdb
         8Yjjh/L5SGjNLeugHI5snrKNXYMxHALkTYE2bSZS2pDa6pn/155BOmGIOoYZYzyf+AZ2
         /qIFvlqrFWdfh6rD88zyOrshHgr080S9kMuTYLnyS3UeAgNj2FPGKLNm4UBzD3mI9Q2P
         UpPR6ICVV1JNgOWi5awcoGlosC9opmRWiwh6cmr0n81OAuTpO/x12anfxmHHtfO7w/d4
         iDtw==
X-Gm-Message-State: AOJu0YyKVzPdJp+sSUGd3LQQK4/GiDW1RDVGocf6m8RNQbGi5tz9TGJY
	jdFZfI8u77knkpS07T9pNkG53cFKJXTOCGs1lGXjQkGeAIa5K9ABEFftOTtjor3TuJo=
X-Gm-Gg: AY/fxX4EiBKEr7zCWaPUZ/px+7OJgw/OygKrgDfLAY2KPTAT88eycvwF8Ptq/3lYB3c
	1qv/V3r6XQ/49g91/fDrX39ZmJ7J1BligDzWXtPXgPWzvDaZaoaPyf0Zj04LEXqfOmn5rOCSJLR
	29qbG79HXBxf1DvgedA2w7C0qig6PSOb4EHNzJOIyLLHTcpiCUMArwB9BIzkfuVMKAPZ8C5w4lG
	IJWK3bDMzgEquIyJD8/WzIHvH4MyDNxoEWe+0xy99JyPxQE5FVv36YRwJw+DPbbNLbxZmofrjRr
	r84vwJdbee0NecimuBkwUsXZ/9jRFPm+ryLFsSmMYj5MAxFAdKUOSOC85ny9PiChZQWKNYDpfow
	GQDoIct8thAQMR6MYOalEeMqjd4L8VYSC+HMB/hdTiLgo5IcncWTwAE0W+YXnfOvalbrU/EORdu
	0i+RP8wV+9OLeyMk7F2Ve15T1AdNxYDdRhtzsEEJGhAH4bBpLIK6J58MwGlH7NTEB1
X-Google-Smtp-Source: AGHT+IFhPfb2TbNH8traJJdaq8SyS0309b14MqZ6pXvD9NuQDVobiVb2u7Gkx+Y9qHanvQWNlE/56g==
X-Received: by 2002:ac8:5d52:0:b0:4ed:4ee:3a82 with SMTP id d75a77b69052e-4ffb3e01116mr3728591cf.6.1767727100713;
        Tue, 06 Jan 2026 11:18:20 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d57aefsm16827011cf.10.2026.01.06.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:18:20 -0800 (PST)
Date: Tue, 6 Jan 2026 14:18:18 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH v2] nerdctl: add textrel to the list
 of skipped QA checks
Message-ID: <aV1f+h059rYKChfi@gmail.com>
References: <20260106155158.3714544-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106155158.3714544-1-dmitry.baryshkov@oss.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jan 2026 19:18:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9521

I might have a try at fixing the relocation issues.

What is the machine you are building for that shows the
issues ?

Bruce

In message: [meta-virtualization][PATCH v2] nerdctl: add textrel to the list of skipped QA checks
on 06/01/2026 Dmitry Baryshkov via lists.yoctoproject.org wrote:

> On ARMv7 building of nerdctl fails with:
> 
> ERROR: QA Issue: nerdctl: ELF binary /usr/bin/nerdctl has relocations in .text [textrel]
> 
> Add "textrel" to the skip list.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 8f63b48c7256..bfd7c3af8356 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -88,4 +88,5 @@ do_install() {
>  
>  INHIBIT_PACKAGE_STRIP = "1"
>  INSANE_SKIP:${PN} += "ldflags already-stripped"
> +INSANE_SKIP:${PN}:append:arm = " textrel"
>  
> -- 
> 2.47.3
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9520): https://lists.yoctoproject.org/g/meta-virtualization/message/9520
> Mute This Topic: https://lists.yoctoproject.org/mt/117106963/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B843EC2D0CD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 02:57:58 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.12175.1747709875592514343
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 May 2025 19:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XdNSQ4Xh;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so51058066d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 May 2025 19:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747709874; x=1748314674; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YWCcDVb3YKJbvDlfLg279aoOZPFo4+N+BF5nzesd0AM=;
        b=XdNSQ4XhkhlKLbIKbEgIRz06WyYU/1OWHToIHlJVuYGVv2FKMm6ueAAbbYJBp9UPyV
         7P+N3c0cdn8FXZtohOzOrt42kS3aTruxIraL+TTcbLR+Yj5X+rupxLBTh2wtNqKYKIkz
         WY3u7asXsQ3Ud87LOXLtDRgOV8RhqcKWdLN1TIz3zNDZMA2+9H30Pc7TrOETxwTiM2Y9
         tD69pujMRWOyRGUOLF73sCuSCmrOBaM33AKHBH90lEP8voKdXQMxLNPUmsiGtISACle/
         Ln3sqZoCVIJ1h9ntMiYMriwZSNOvjsBsEE9aQkg8lqZgcJIE7cBrEvlRbNZ5sCArO9C+
         tsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747709874; x=1748314674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWCcDVb3YKJbvDlfLg279aoOZPFo4+N+BF5nzesd0AM=;
        b=Lf0Dhp08QfBkvOFTxiHTyV7l933h4/IIDcQ1PAtvgRecfOndH6Q6nUPXVRq5zfkdV6
         1v5pxDIk6KOcJ8gagJvQbUL5I0Jo8whgKlub9J6WP7Ew5445DAc8JZZ0poy8w4c0x+1S
         J3ES9sC0GTkB9n4tet9b+4YlA9APmHjlhdWnZncr+nJB9vWdZBHz7T9yKS/7KUJO/p+j
         IobBV+LRdQyB/EAIfW1Zp5vqeTSH6SO8A9g+D4dvYeqoRRr6BfUAhnddKYcVCkYbxr5y
         bgdabZTNK8ZBWLaqFxsdbmLt0TyJzHBXLXpRC7FfnlV9iK6UXb3E704CLZgHWflGfJlV
         CfNA==
X-Forwarded-Encrypted: i=1; AJvYcCXXVn8rpPgHibVwwsqQNgGmdhzJcf/5RqPsOBVI0il6nRE9S0j5LpK7aNfGXxeq4hORunAqlv9L93fwdnAMqRQWeCcK@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxwKybGgMybUUMLjpS5EQfzzP4Rcem2jrydmjJ50NajFo/zAtqa
	dUFYpaoXeehXE8OmxcUBwifm5YYGf3nXirxG+48oOnF467353KOZ40nMduIz/OC3
X-Gm-Gg: ASbGnctxBEVF5B+x0tU+BXtGH3yEwuwE8MWP9PjU4Zj2f/WtsEo4pvpDKI+AdF0TCWF
	i0oVjobG9skMApO4LEeJQM2Fk6Mx3/HZ4jFboY494MGg+9V2xj/y4rW8QgIk40R2qlVroVziV1T
	XGnf5j/VR5eAG2rWc4HBWv4LUIiUctZm95AUp5+6hO1XyGlnlkr3MWkXo5sSMu3efTZdKskcllH
	6YWUiFtlAD1CWIYW7QHzVsmObmdSpHvVq/nRFVg3qNMWy517129nCI6YCbVeSBVIrluK8xNNxUs
	JlN+F1YUoUJOTCB4tOWRBDfLTNmZUZcuTIAZij+l9DJgcst4fo/41d0jLTum5Wktv79ZRWUkGLW
	3LD5MMNTb7uI8QLiUfBD8fD3hISxefQ==
X-Google-Smtp-Source: AGHT+IEoWOVfUTZNTI+BeYFFmayM0LpaMf3bt7FRUG1kZ6ZqAb+WjRa6RtCCpMeGuomKDS2upkVBmw==
X-Received: by 2002:a05:6214:1ccf:b0:6f8:b011:cbac with SMTP id 6a1803df08f44-6f8b08ceae1mr251069366d6.35.1747709874387;
        Mon, 19 May 2025 19:57:54 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0899a1asm66163896d6.28.2025.05.19.19.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:57:53 -0700 (PDT)
Date: Mon, 19 May 2025 22:57:52 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: festevam@denx.de
Cc: hongxu.jia@eng.windriver.com,
	meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] libvirt: fix compile failure while
 DEBUG_BUILD ?utf-8?q?_=3D?= 1
Message-ID: <aCvvsI8ho1QBJxzV@gmail.com>
References: <20250514075926.1831264-1-hongxu.jia@windriver.com>
 <12d-68272d80-7-7ff59f00@235621152>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12d-68272d80-7-7ff59f00@235621152>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 May 2025 02:57:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9254

In message: Re: [meta-virtualization][PATCH] libvirt: fix compile failure while DEBUG_BUILD ?utf-8?q?_=3D?= 1
on 16/05/2025 Fabio Estevam via lists.yoctoproject.org wrote:

> Hi Hongxu,
> 
> On Wednesday, May 14, 2025 04:59 -03, "hongxu via lists.yoctoproject.org" <hongxu.jia=eng.windriver.com@lists.yoctoproject.org> wrote:
> 
> > Build libvirt failed while DEBUG_BUILD = 1
> > [snip]
> > ../git/src/cpu/cpu_x86.c: In function 'cpuidSetLeaf4':
> > ../git/src/cpu/cpu_x86.c:2563:1: error: inlining failed in call to 'cpuidCall': function not considered for inlining [-Werror=inline]
> >  2563 | cpuidCall(virCPUx86CPUID *cpuid)
> >       | ^~~~~~~~~
> > [snip]
> > 
> > Explicitly add -Wno-error=inline to CFLAGS if DEBUG_BUILD = 1 to workaround
> 
> I have sent a fix upstream:
> 
> https://lists.libvirt.org/archives/list/devel@lists.libvirt.org/thread/AB7ZAE2BCMG7CXIJHOHD3MNLBCSCOOBK/
> 

I don't see any replies to the patch, but I'll be updating libvirt in the next
couple of weeks, so I'll check to see if anything merged then.

In the meantime, I've merged the original patch.

Bruce

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9249): https://lists.yoctoproject.org/g/meta-virtualization/message/9249
> Mute This Topic: https://lists.yoctoproject.org/mt/113143907/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



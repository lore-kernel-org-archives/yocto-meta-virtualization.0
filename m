Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8C1CD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:28:34 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27942.1781116111509981657
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SthTTOVk;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-915e1354934so318605185a.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781116110; x=1781720910; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VmYFzPMpBcYRGScpjBHiZ1yD/a+ZSgM8Sfby1bSozU=;
        b=SthTTOVk/Y5ZbRs2pND+AkKz6wqOA4UG6TMkAumomUYE2UnIE7vt4Xh4UFb1G2Q72s
         7meL8JwuU+wI251Sh9T2KHeb4bdqj2AiIoOUPx1R+rWHzzmt2eu4wt+vJhV/HxkuTurQ
         Cs+tNovS3Htwh4IuzDZAuzQhfcGQHaLXXx3oGq75fhF3RoP2eyh8JZtZBBQDPHYtRvDU
         18y491ATKa4oT4pq3VFyP+bK3e+j7YR7x1vHbZEIFX2UHmzfJu/3KO8nTmgrta70Xa+R
         aP1nPERmK4dLkiEFmkUaqeA/P/dKLEFtSJsOO7Lz0l7cfdp41uF92dRsy0diooXPJz7r
         SQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781116110; x=1781720910;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5VmYFzPMpBcYRGScpjBHiZ1yD/a+ZSgM8Sfby1bSozU=;
        b=Pqac9jgpT6Ifb19XQT3349suFoYw0GbY0gr8NsDMW71WTaGVCVJ/ekttVneg2z8rUr
         8Ca1f3iAu3sYLo0bMDw3jJk3pDDKBsHCRJBrSJAzBpsXW7VhubqyFoc7T1Jb5qANVO/Q
         ou0K/a3LeCRkyp9uWAgcTKw55rjZpdTQ7nLlhtYMQDim7e//PG0o5OqksbYzQxRNxrG0
         aj38gAJgXRKuFJv6n8CI/WeuQGUP5yHfUaMoz75KEVWpPxcpkURpmn0AENfksQxEdzfX
         tTqICHo4IFmHWQXmU+VaI7MmapXSoPEB0GE9g3MiLDJbrj2N0yD+QFEpDKz68Mb6mcAh
         IiIQ==
X-Gm-Message-State: AOJu0YwmaE0xio5clEhFKBd0zVb1ZYOcBvnLio3LcsKHbSjdSN4ef+le
	6DaOyiP+Gozp7CjFPv6jYsrqKNoq7SHf0bZOekvuKdB6w3ZUOfsAySdv
X-Gm-Gg: Acq92OECwaKiWMhR09fcMSlENcI3yhSLFmZDR5bsZ6GBlBZ12KkBMtN5/HhmzV+l4iJ
	EkxVdc8S3mhUEeyAM4R0YFNNRKYLH0VhZb74glh0Rf35cUW6QrcUc2uivVT+b4Q87Rm/hwTlYsq
	o+ki59CYdZ50MQZ2FkhHtjCsRZmhV/KtPw9IXxOaDQhtYm5xwJgL0X6cMGyAMGhT+7gxTWwesyd
	Vohs2W7A2SkcGRxxJjZrMAkV/5fTzIK6pSoJojKmf1UpRJRhwMt9w3X++3kKGAqlmC0lDv1LXuz
	65rlzAmDlsHW/QVA20dZK6GhaW830sebFMPNAgnnFJv5FOYYPy2hsb5q/uxsXgXw32WzQuRsQ/l
	dQFr9pQq31AlPl07yWGgSdZIrdVnv+KqVv8JHlZNqyi8D4RqxSDvvbz9fkt1tPd5l57f4/VOPK4
	8iRIaYbZpk7wto9QubmKTGrfzH6i2LWxzKZ7GxdCaaoLFwV7OHdHb18abimLumZTutN0tSNN74V
	z20D9alt08WuFiWSpsbiBW0SWGZNmnwj1GvT99afq5UVQ7VFbTspwIsGIm3ABIh0kQKZR5fHajE
	FgZWvvwoHUYyZ4RaUm84p5+YfsqGyHSeBhY=
X-Received: by 2002:a05:620a:6cc3:b0:915:f27f:e70e with SMTP id af79cd13be357-915f27fea7fmr1003694685a.23.1781116106361;
        Wed, 10 Jun 2026 11:28:26 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0611sm242638906d6.1.2026.06.10.11.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:28:25 -0700 (PDT)
Message-ID: <6a29acc9.faeca26b.16cc9.c2fa@mx.google.com>
Date: Wed, 10 Jun 2026 11:28:25 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: sudumbha@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH] podman: set status for
 CVE-2026-33414
In-Reply-To: <20260601183536.3478585-1-sudumbha@cisco.com>
References: <20260601183536.3478585-1-sudumbha@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:28:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9864

Merged into scarthgap as b48d4a76.

Thanks.

Bruce


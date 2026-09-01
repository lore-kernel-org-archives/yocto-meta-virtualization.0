Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EBEC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:57:59 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10480.1788274678922049094
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 07:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g08pS1hI;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4678d3e490bso1011015fac.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274678; x=1788879478; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=g08pS1hIeTVpgbu0kxhAmM+7tD6ajzavdM4aXwgWWPhW8Q+Fe2bUmm1SmurRwTCwU9
         WzL9tNk2DtVJZhp2nPO755BRPeUL0W9tANyVe3hCtPxMF3omAqJxKLsbefr5wkNoWt1M
         XuoVrmk+7KzYkDhfTleJiBw/D6Q2JB7JlNYSd7NHFDX9AMqfzxxqygSsvMhGDULFI926
         yd3zVrnag/5HC1cEz0kgJ/xHFYiw2YS58Dhh84TNiknRHqp/a+9ylKARz0OP7yn/MTPt
         kXkAKk6SX20QDexbokA81IrJrl18Bg/Sr+97TEDQc00uFXDsmofEpLjEFlJUNoPTi8uv
         7VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274678; x=1788879478;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=UIyYCSwJimsuoD+m3iiYQu4ZTA4Tcxleu6/sUpNcUlgot6aivgY4w+ijlt8fGXPLKq
         SgenAEFPkCdPplCmzrj8aAjKm2bb9wTG+YipY0IRDRL/JcGCN4u2VNH9FbBNNgEKRVym
         a2SAfpfYlw/rtpoIsIZK0Hy+UpJEtG4Y5gqzXLN/UZPRZaGaBlpAWi4iS4cOZbVGZ1kh
         OYFIRhMWYlqauep42toVIuRF3fmjjkGMr3bvgEIfdlPpFpMstWyiCJ3FqIYkAngyhEwM
         jcYikPuuvwTLQzqXUPfMqlai6KJXNUiW8KTqArwvuhKDBl+YvsBFHwTf1fT7AP6i4gFo
         opMw==
X-Gm-Message-State: AFuF++n1za22BDnCU8bJnu0z8pcQV/FdyJxTLMa1wx6JMK9w2WZBIHPK
	MdyI50Qgix4Aagf9cErBL01cTiMYx9CF7TP7ES8j7msT/rFaS7195JcL
X-Gm-Gg: AYBFou0sSwCncWeoM+wpJ55+TVz5Bhl+4tl4oxGty/95iuYdKBXBy05v2yxAwNYuYCf
	+By/0GS84RT2J8/rq1KF28+G9SpHuK7n/m5Kje1YY1PBLmIn0w4vhlHIFWV+171vWz7Nkrs6A2J
	vObBHeN8+vF6hqZ6dFxE52QrUXWFfv6SxL8735Tw9FK9TqjTgrieKQF6uPO5eLg+OPl4EH1pnTF
	KrKIpUHx5JHLqatKre1pcSbl6ECEWfStgWpN3D1AYIjEio/SFuP2jG6mLaVo7CDOhpnRViO3yUM
	h4PnAtOVzcRERuPdO8UbSpzyrVDj6vTgbo8qv8LqbeEP4IqBcURbtvGpqsuzUiDMO+HPIbVfTMq
	1Br93MN1lh9AgkEbPu1YqqdMVMvyJgPU/OFkTQWwmsU1m3fZH5HkEGzOyGHZa5x4dfw52u0vm+A
	o16PD2Hr39AybYECwgN5wjA1S1kSsxddx3x+4iyQgs5hsSL/9UFG2+jco1Uszu1Bucf1DPflvsn
	g3BjZJALPhA044XQ7U5Q1fXXkowpiaGRjVN/p9z/GhyG52VUbtEcWPLTG4nqdrK1bBZ8wPF8+3o
	tacWCcjJHvwGU9sarZY86AuS0lzF7+c+h4ipvN5Hf+MXEO01lyknLvbMp/di
X-Received: by 2002:a05:6870:ab08:b0:463:6fe7:6818 with SMTP id 586e51a60fabf-46afeeea772mr5275449fac.7.1788274677904;
        Tue, 01 Sep 2026 07:57:57 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46ad2a8e3adsm9156394fac.13.2026.09.01.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:57:57 -0700 (PDT)
Message-ID: <6a96e7f5.0db9a8d2.164938.0cde@mx.google.com>
Date: Tue, 01 Sep 2026 07:57:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 1/2] crun: patch CVE-2026-30892
In-Reply-To: <20260823100330.3784951-1-peter.marko@siemens.com>
References: <20260823100330.3784951-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 14:57:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10072

merged

Bruce


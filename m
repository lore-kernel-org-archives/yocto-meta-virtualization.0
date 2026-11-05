Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.932.1793898039710620526
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 09:00:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=y4FYf+AH;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc91ddf447so757375137.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 09:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898038; x=1794502838; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=y4FYf+AHs6k2czoSOTL51k5PqrsqjRgQo/Z6dSX1x41uueAx6jpR1zRIcMumHuPo3T
         7UkY1RXbzVDkEVen3IlHCl1BQcsb5Mq2HIPe1wW+0xprI5cGLWa6hd7BlKHdSqnW/Vmx
         5kwxFxuSlmoENokAti+c80PtPzkWim68xFfKXlDjZI/dRGvbKjwxBU4Gxy6AAd5JLbvU
         7ziIZPNfYkZ+K71JDPA31NbpL1JY+hJ5DqC6vQZhB/4Cpq5x1K3Oud+/5l9CxBR8CsFU
         EVVGoTNJ8afLmC2GG8JmsRfjhLtLQ8V6nwNetHWf1MDkOIR3JKfXAr1y6hgf0ERVT/Ns
         H9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898038; x=1794502838;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=AfNgfzrqftlDu1n9Vzpb1QJxWcix+Ewr050nttMuv25YEbNqdub/58YSAlAzEM3CeC
         c/9GP66kYfWo/fLQ6oRSgTpG7KCiwnh9Vp8pl1j1/ZVEN66FNyJjypA8nBZU3rW+XLbN
         HvClCiJktyYmQfmrhsh64B+c9oZmihWadCYfe4mz3nGiutzmGGRopI36hGUbwZdMcVsG
         W9VvQqXD7NXhhjbwOeeBZ4KUMBkS4j7KKSiQ9X3ZIV6p8h5tiRPyjijbRnplh1Nkwut+
         fwnr0laCXJxrfhZZ4l1qwLE0wtyromUFUngJIEpGmXSbctuHzMZEactPWJt15qRQEDhB
         CkGA==
X-Gm-Message-State: APuU4Z+AuqcIVjBzn9va0hx0O7lNmQ/jjjVfk9/+xaOARjzdLruQPRhq
	Cm2dk2ng4VDl9iiX3zmPNKM13pEys/kzSLO437CqGvZxDRgEER4WMKcCK/I+qqSU
X-Gm-Gg: AYBFou0gxOgEDxYhArqkxCMTIdRBHCfza/Gr7+vEyVVCXhGZoiXmtGgm3Kp4j6vKF1m
	m2+oLZJi8O6m17O7t5FrcYKmPuH+IhgfiyoNoBhA3GFYRGI970bBh6lNN7BSS7t77BcwO/zd7Pb
	uKIWhu/dOFD+sYrsPPOMi5BX6ryu0GMY9aWN5YAmqzTEIrM5rzVXFwyV2nCwrjeno7QRdttwXO9
	YKs0AMTP3KDxuHmqibaM9h1r9HONy57qc6owDJYB+cU41/LrFe2ctD2vR4UtOIYp7ARTMCY1Am4
	wP10rO9stx1vgr/GjUSpMIaPu0JFyvZnkcoDLbQ8+O4kxkJfeCd8QpWtK7GtwykHdkF3T6DcNYn
	mwnnsZavamBLxc8YD2EzXi5m+Chvb/0lskRz4eK0NrWgN5nBRY1bkFeM4nSEPz1WU/u0sdkfEDZ
	SH5y+xgT834qLi10sCrQ0pTI1fDn46P5NFPau216qg2y1s32OviL7sgIjzkO9TjmZIL9QBzojUr
	tTpiAXIMfUlTy2pBx6EpbOuAxF2XPXvlVNm7SNUrYgAOeWezJ1zspiherojMwMfHbhItgWGpft0
	6IwpXEkqCd6qpXM+URvh4KgutngJNP+SKDMyXv6qBAltZxpwVvbaQeP32AvnL2El2PHlxABAVaE
	hjVfEJP1RZASydhS6zuJUILYWSdLNaT8I4e4mMsGf75ALZ3VXG2hi
X-Received: by 2002:a05:6102:32d0:b0:7d0:56e8:d146 with SMTP id ada2fe7eead31-7d2a1539369mr110935137.12.1793898038397;
        Thu, 05 Nov 2026 09:00:38 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d277d13753sm4019724137.10.2026.11.05.09.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:00:37 -0800 (PST)
Message-ID: <6aecb635.672bd177.2e7e28.28ae@mx.google.com>
Date: Thu, 05 Nov 2026 09:00:37 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 5/5] docker-moby: Fix CVE-2026-92542
In-Reply-To: <20261105060006.1286469-5-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
 <20261105060006.1286469-5-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 17:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10159

merged

Bruce

Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0831ACA5FE4
	for <webhook@archiver.kernel.org>; Sun,  4 Oct 2026 01:35:02 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16615.1791077697985801145
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 03 Oct 2026 18:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lGJm22ji;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917ad52d7b6so10311466d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 03 Oct 2026 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791077697; x=1791682497; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=lGJm22ji5paNxCrm5mCnz8v2qW3ZKfhy5GGpTlJxWiIlCdeW/RPcQhwtIUy+9oT/NL
         LZGp+hYmqUfeUAM+7/kzJcusfQCJ/Zh/2DNpSVHpn2+YJZ60mARuLuglEk7K4gdaoY6q
         4SjFuWg0vO+2HpiPSi1ssKS0iKVyh0P/K+jENtmHaQ6R2CW1kitoAW2sxRHOUF+9ZA3L
         yrgyXVDSibol1uHfjN4J4V0Z8NNR1AJdiHXCSUzywNSvMQfIujvGmtvCmH20QR9uuIgy
         C3w+54K2LrX8aRmdFiA1zxUsLJ1Nu9n0ATyFRBi2RqfYabQBCSl4sxwxOkcsDn04vFtk
         fhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791077697; x=1791682497;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=wJ/fhL6CpFn9v9KKX9aRHij2Ao/qoCSjjyV6pMhaqDyoGMiGbHOmbq08IXoaGFUI+G
         JDSQJjKbTh0KhFIuOS1ZhBm4dEFccuG7f8CgYA+l/IXjLskpYqR8CdwD2WeWMRCKz2s9
         d29Pw016nz6XlJ/DdW7MgYVBbLOsu+tDmKdsdwleCUiofif8zVOn6p44oMYhKFIMOGQ9
         2PppPNDP+hHXcKK4F0GwoyJSXUDYTDLvfsuT0pGUEgNSBk5Yk+S7kI2x2NOb2UY5AH6I
         F9aX/sdDmBSbhNVqtDYYTZ3LmcISmuJQwQZlFr+usTeYT/xb9HHpy0RVUFwduxkNdc4Z
         A+Zw==
X-Gm-Message-State: AFq9FYJtraSDt4YqnjFYKiRQN1vpOoPY38neOiQSkC7kpED3G2NLI9HA
	aXw3HTnZQ6gPefQ3krd2UOuoJpCYgQmjd8zYB8i141jZs0avt+He5zvgOyQ/qehC9hxwFw==
X-Gm-Gg: AYBFou2z9pq+MESrhOXMp83sn9NQlNjOdi6dvwNxgtddhatYfTA7/5EpfYJzfOKn+0h
	XoBsGOWTJNH4PppjDWyl9FY8Y49GVX1lmVVX5/kZGYR4P2AxsQ377BtP/wuCEgV56MoDNq1yAki
	TYruvdPeMezy9D7mkd/FkUyYZYOL1CeB/QvSZZgAqvLaZ1xHb12MUGpoU/CnZYe3D/DKBgHNu0n
	c/xDr+R/myneuMKTP3i30Fd8H2Ckh42Rs3+0pWzm/k4wlV5ADCx1SEY2TYUpNvtx5l5N8LnnFBP
	GQnjqfDqpM58CPjt7RDfvc+qK2Rch95G1/a0WOJUmmgPAHBVuIBp5LHkzq0nu4+hZuZFrA+a37e
	o5JcduW4MEWyEuC0hMl0ed44Vsu7izjY77miIzCp/AdnO3K5lfpA/CdpgPZ0FSq6ztJswKzrOyF
	GPETjPjkIONBAew54YclAxQCPqRXZ9pyf2vogZzgQuWFqapc47qislqSZKKCnDJgYkgt/azDJC6
	XEUbOFTlAG6NyCxyLI82WBV2p4hzYJ/88Led3ld8rOcn7ROkSElMrw/1yPZB8xMJtAS12AtWnXK
	09+33c7rNX8XFfEAVxXomApt8CbZa/hxLpp7EMQuTPq3LnaJU7hQhXS/hdDnr1v0xXNRqMA=
X-Received: by 2002:a05:6214:1c45:b0:914:5579:85bb with SMTP id 6a1803df08f44-9195d17d4aamr70935226d6.31.1791077696780;
        Sat, 03 Oct 2026 18:34:56 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm55897426d6.19.2026.10.03.18.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 18:34:56 -0700 (PDT)
Message-ID: <6ac1ad40.5fb20c3f.19ad37.fbd7@mx.google.com>
Date: Sat, 03 Oct 2026 18:34:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: peter.marko@siemens.com
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] crun: patch CVE-2026-88264
In-Reply-To: <20260928211145.679470-1-peter.marko@siemens.com>
References: <20260928211145.679470-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 04 Oct 2026 01:35:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10102

merged

Bruce


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB8AC54F56
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:09:37 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1309.1785258574235312121
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=o4WAwJFR;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfc54558d5so65140e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785258573; x=1785863373; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=o4WAwJFReYxZy3KkzaYQQmJPo2OnBPGB1twQRp2iV1KXss63o/d+GNiLWqy1edPGHs
         RjETn3CyppfQvO4BPr1yyU6NIVyflL4uDT0e2HKkZVmoCuFZRCPexu5C9k//ilwPeJKK
         bqOW4MXH45nLS87NlKG+9OuxRckkeMnV3NaNqgKV6gFaKkfh5Fmli26X6CNDpqggA5/9
         3Fdg6sXKxLozBaCqUbUz0a53xTAX/vYvfALAaI8cjJmI3909y4xHfWfLaYPN8+hFnrWc
         u24Xbor0VTeaNLVv6tpD/XPE9CUbdYG1B7r3BkxQqx7qrD2lfSOWjmLt90RYokhR/CAL
         SOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785258573; x=1785863373;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=chbSbHiSHpNxC/1hq6hHnGoNwzwb4wRcw4oAzFELBhUW0yNdiprP7hVVXr+P8C9aSB
         jEVgcPgfpV4MlQtlBQNOP33NMMhMVzzmWI8bXUeq16GsTBTiMwXkFSF6lCj1nsXdLlPI
         ComLeaqoX4L9+JO3sF5BfoxDdyVKpvUo25T2EEKJ3Xdxvn14ar3MoyN6EIb9ZBQgBGF1
         pLI/a3WyVjlxfwwvmhLfp/H0eJdvNtSblHgDex6S1MM6Lg1tQ8p3TAOA0luY8f2uKE/4
         4uIDRjEz8ZH1ErkN6NHliFZuaufYFuicjqzmFXpADUjiywFKSsmJtpiPj2xWNerSOzcI
         RfRg==
X-Gm-Message-State: AOJu0YygQeJZB+8IBb4xtyLak0RvvZCgFPWyJQmbxxLzVpuJKdorOiEC
	iqqi28R9p/Pyj7cxCl4dtHis2sabcurROEU/CVx9zdDD3JYQh+DWr9XGtWo75MIK
X-Gm-Gg: AR+sD130O7OC3fBKZMK5Dd/TyZS5qG/6fxdOADwC+gi19hE6LcrCgYi2rK8B+mkE6De
	JXjgkkKdbhTalF6DEK8hHfxI+JIHG3ruVTItrnb5sm9V4P8vsc8JfALlJGvH3RX/1+zfDqqeb7U
	LL5VAQCW24Jk/u/PRVO8ERmd919QytcJ0arMHBMt8qnCj7DPAsoSRv9jPZz2wZheg/vnIf4bAeZ
	9NKcdGGgddzb8P2Wp+fDd0M2aWvh41yYkJORBpgaBcbJ77ORcW+ks/xX1Hg3Nii30ECL0QpViCr
	P3aGs0S58JL3L4S8e81eWvFpYfEyUkfidwFa/xfICHos5q9bCejwOERSk2HQyXsLekC77QEwOdi
	qUV3VLfXkFX/3LI333IzSHngAi20UA40WM7y9KGAc5m/MLdioP7rZvGHdWzMPFulqoaSRMO8g+A
	xgUsDBHLwSU+LuolbXbYOnao5xlOIfCT/sE1KbWSDpEAFtS+VYsVx5Od0c2ArV/9miPYQSJ2Bhj
	k3IUZApBg4gAmWQWm8+Ky6Xc8oQdD7HM/dnsx1I79IQCjqfbOTOnXWL5LQH5mq+caZ2NXFY8to7
	K9o=
X-Received: by 2002:ac5:c747:0:b0:5bf:7c7a:22fd with SMTP id 71dfb90a1353d-5c33fc7d0cbmr1149097e0c.10.1785258573112;
        Tue, 28 Jul 2026 10:09:33 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c34d4c562dsm334947e0c.2.2026.07.28.10.09.31
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:09:31 -0700 (PDT)
Message-ID: <6a68e24b.b3a5976a.65661.b1f0@mx.google.com>
Date: Tue, 28 Jul 2026 10:09:31 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 3/3] tests/conftest.py: memrest_stop
 timeout=120
In-Reply-To: =?utf-8?q?=3C76663da09cf268817d875971c8fd11cf4820ed96=2E1785110?=
 =?utf-8?q?917=2Egit=2Etim=2Eorling=40konsulko=2Ecom=3E?=
References: <cover.1785110917.git.tim.orling@konsulko.com> =?utf-8?q?=3C7666?=
 =?utf-8?q?3da09cf268817d875971c8fd11cf4820ed96=2E1785110917=2Egit=2Etim=2Eo?=
 =?utf-8?q?rling=40konsulko=2Ecom=3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:09:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10000

merged

Bruce


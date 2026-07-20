Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB76C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:38:00 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8982.1784583478471711077
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:37:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K6l/nf7f;
 spf=pass (domain: gmail.com, ip: 209.85.221.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso3376273e0c.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583477; x=1785188277; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=K6l/nf7fDaroKpm1VsU4M7jHUwLLWSW506wzxB69AtG+nt2TxES7dju8eJfIjj9B9P
         aWleApwqxNlmtmBVofGX49qB5shd0WUAITHIJZ2/YktpoNp/Jfo04+t1h3KgsAL+UvEO
         h+JCN1vsrcP8WEdeCGzOZK+Zz8H/Zjdqo3K1iPFtb28RAw+rlZc5BV/VdrPzcS4lyRx/
         5qTWOTAWoxlhuQMiSEm25Y5DRoYBE3jrZKEcRHGSdSxmqYEJ70u1KUMUdH5cZSGlgVmU
         VdgmTQERSSw/e1jdQrfJFP062n1vEz/uSXCJ3TwQQ1NlpJUULNGV7ll87XkiPR+aK2C/
         HfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583477; x=1785188277;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=H2aXhl3BoXKbKVLgmrt9Pff9nIF3jc8zSOxbEf11ZcV5IviWC1P8mE5cj0I3Yva3yD
         08tOvKrRkMfMPbGvde44Pxt8sSni8ZyPBEJZrZoaGYQjB+3yy3vhHx8e2GWJdnuNCJdn
         3z7Xa8djyeuEFP8+4gwc3IhQ7XrQFJSG9EQJHFPp6640/+LpON0+tC9qPSjUZx4MaYZZ
         Qap8Ea2uIVAUxiUzVfqy0SViFQxmpAS6UvG5UaO5ChrwFTzgsK27A8o6mr0u0TKWTX4w
         CvDPxcBRoWDG+nCoNCntOBOEzv1gCI38+aCb5ZMdaexy6T8VKT1JmlUhpsU7i5ccvq+Q
         Xa9g==
X-Forwarded-Encrypted: i=1; AHgh+Rqgn93LHkbwoOwBpaCN4zjZUntOBVr7ZjarQXnWMZyDEZcPWyACbbj75maGWknoIQnM1YcIxzMHwxls5Rt4TOELhqdQ@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YysIE9B2RBvCAmFmHRy1Ef9J+efcL5IhnrRiqFtIBq/9KH4P2if
	peTQkWMlU2tjsr4f1KmMmuNyZy2gMEEKVTLhXwkHD8BiTyyVnyoKNYGgp5hejPpX
X-Gm-Gg: AfdE7cnaL4Q76nyQRtqcZshQ4XFoiRol0mu3kGzzkPH395A6HY7SFaiOYImJNMlTQl8
	X7/Dh74r61XtZUKdb/kIWx1a3LbaSoGY0tcV/6iL1blWZAyTeEf9t5ajCa6eKekjXy5DKc10jaa
	c48AeZ+97LEDLVv2jE9zGXdh1Fq2r5gs5HgKEH8efv4R0jzc7NtGVkBd73D7sh5IlgvFfZz1iQn
	thiIILd8aUVQgR8mlMBHOBHXn8zZVRSYVToqIqx9v6WV8pG4LmyNk5XRVTa60XdGV5neMJ+nam4
	i40Kkxw/CaeVJNFG1tgaPTmKB3ykWfHNVza38pmpQVGtmOFekVkbkqlUdSDeNkdhZE77tKGzVIC
	8BzYqRfdHUBDJ5J3MBl7JnRqkLdHJoxpHwd8e7XKIGxj+q7kyWx1Euh9MMifUVvYPbI/QYwEwcw
	Ao8ln6BgdpTC5Kk71V8PEB0gg39uNG+7NaUtIzkF1LtQkYF1ia7U7z1l23WGO25ggT7nWOB8uHT
	/yc8/n/B/2bv9hQRIEW7Juq1Cf/TDecBNxnjs6haWbZAYz8PSEIfLV1Fr55MfKRUDAlSQHW927Z
	mKM=
X-Received: by 2002:a05:6123:4c:b0:5bb:c529:5f05 with SMTP id 71dfb90a1353d-5c1bf9569c8mr4434748e0c.14.1784583477392;
        Mon, 20 Jul 2026 14:37:57 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eee1417dsm10561163e0c.5.2026.07.20.14.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:37:56 -0700 (PDT)
Message-ID: <6a5e9534.ec7609bc.1985ef.8f8a@mx.google.com>
Date: Mon, 20 Jul 2026 14:37:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][scarthgap][PATCH] podman: Fix CVE-2026-55686
In-Reply-To: <20260707072556.2854620-1-deeratho@cisco.com>
References: <20260707072556.2854620-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:38:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9970

merged

Bruce


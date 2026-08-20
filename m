Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9EBC5DF8F
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 21:12:59 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3899.1787260379527022669
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Aug 2026 14:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QQxqiJ+a;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so2909366d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 14:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787260378; x=1787865178; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=QQxqiJ+arhnaBD+gMJ1EDefKoau8aI4Sh1Eh0Yjn66vgyBarkesPnA2R8b5sGu8Zni
         cURQ0KIzcekYVKyXQZODX8MvP0TKiEgVvy6BAGJqTAa3gyCzF8pEgBBcdGtE/wCbKhvN
         d1J8J0cQUdxsptciJ8ghHNTGOwvS4fzBJ1KBfZ18k7HJhlP2SOrSmpNyKJYpD5lm4Gwh
         bBCrBjBoOf6lF+5435ElHFVO6b9oRFygg6CWOWldh0884dTfYAPq24lmxgGlmisKMJtd
         3h/vTrNa9coKrATcauSpFBYk5ZBMnvZa+AWoSMyN3OP3Ef3xyHl2tS3YB0wXXGla8Psr
         17Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787260378; x=1787865178;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=IvtwnxLAYRWVU/15YXc3gLFyO3LxR5DllRfp4aGZXIN89qJ+/UhlQ6VaOIcJLrqSR6
         T46yTTDdD7iEhY/FP2fesmxb6O99ndmh/nOx0WAa+Qxq/MFQwq+K70JX/PikXSdIEVrS
         43SpSYiO4+I5cDDTvflj2uIOz0r8oHwjR3XfmM+alLepOTbUkkIEl5QAXCmB4oseJqsf
         dYgDspBURKUazUtw9W+rA0nF7NGuWH1WNt4/VdXcQ/7rYfsqBrXvcqs/nLp2mLETPAvZ
         T1Pu7DfYcslU2D33Mwe7OYeQBFx6cCPC1bA+0lz/3BSwS1XKgSmXNS9pya6s4FVG3bKm
         PfDQ==
X-Gm-Message-State: AFuF++mdPexNYRWq2vJLRthbSRRN1U55igdBqWt9YOtEYGF5VVx0iwxt
	o2YTd1rrLS8gKRFVoZ6nJZ06BjYibtKcK39NK6+Do+NrZMHVx0Ghy+Aewx1qk8xE
X-Gm-Gg: AR+sD10/j3ogIiGj5ojhGLQvGwDbWhob/ylZ5FzGFoAXYZhgm2ezxao2FwWrSxBeTM6
	iqwG2nt9D+TNYy/Xd72933+zBvW3QWn86B366MnmaQ1D5OCPFhGn6PuURcRMlPiGZjY6Px8n7s/
	rr9YVlmG2a7uujqlEFufFoc1CIqH6rS1KUDkV/EpMuB5gPWdCjaRVPltnfj58CrRJfMwaB+mwsh
	8RmQKQSQgrrrDhVOSHSGQU9jsu506D7hC6ZX7oEPrr89/N+7nsK8jl2c8LE0zJXe9CP8NrzTt8s
	4gPUtbbpFQeZu+/+k63vy6bh1qlis9lJWICuiBJm2pUkb+NufpeY+3hYUeI84ETnfoZ2bIkrqi4
	XhO80/hzGnSKsFQ2GG5jcsvTxPU/IMfgNiy6yogwDoF0/ulgmKQz3CPIMEPIxdFpYEVaZPRok11
	B3xJ29d38jaJ5QW1DFyZcp44h8pqlqUL3qS2byumgbgzgztAqYAk8BRX6AU/EaSCckoUQDhNg7L
	lztbOKOuHENrI61p+9CsuXoD2OnLKoHTwIvZ8MmeyblT/F+vB4XnOBdJPta18asuOKFK5v+IsK2
	CUhAqEMjma3rc8CDu+XNUXXDs197t+pkmFZ48RdeIUBkV9t0r+LtDjLVdbkZ
X-Received: by 2002:a05:6214:418f:b0:907:5aa8:ceb2 with SMTP id 6a1803df08f44-90c80c5b3f4mr13216466d6.18.1787260378270;
        Thu, 20 Aug 2026 14:12:58 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5eee0ad7sm47497006d6.18.2026.08.20.14.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:12:57 -0700 (PDT)
Message-ID: <6a876dd9.cfe3cbd7.1e082a.0705@mx.google.com>
Date: Thu, 20 Aug 2026 14:12:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wangmy@fujitsu.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services] [PATCH 4/5]
 python3-pysnmp: replace dead pycrypto with pycryptodome and use SPDX-2
 BSD-3-Clause instead of bare BSD
In-Reply-To: <20260819094512.1153-4-wangmy@fujitsu.com>
References: <20260819094512.1153-1-wangmy@fujitsu.com>
 <20260819094512.1153-4-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 21:12:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10053

merged

Bruce


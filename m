Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035CAC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:27:00 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8835.1784582817466600364
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WBmSmSmt;
 spf=pass (domain: gmail.com, ip: 209.85.217.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-738b39dad22so2546388137.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582816; x=1785187616; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=WBmSmSmtEzEGktTl8pSM6UWd/oetHYm874BRobAYHdnVnmkWbxUCXEd+0duxkMa0CN
         fImMiwaEXt4mXZ6TD1Mqo1lIfB+F5sY9cC9rU2dXaTLcCEpxy109T11fly0QThxV0VlJ
         Q3eLicrT9/ivFNBa8bIapleaI1jInvi3/934e/wer/wefmSx0IhZPNCxt8P2G7JyDLrL
         77HukE0zBXho5Qwg/CnQdD9J+PRDED+LSsZThvJkmqq3ITjhGLxYKmM5Z+4iRmKFnQbW
         R/xshvH1v7xPcIhnBw4wnVvnvlmGvERiVRUMFYSplToFH8vFT3fwUoblFIYJJIbJYzvN
         eimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582816; x=1785187616;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=m6qxrhG0RJ0AKoknSmQSjJOdxW3IfA0YC4z4rRaOqXdczcwKachbM7DxvMvzOCTL8O
         Xxjxr8yYKOP+0eVbGRGVB2c9hdyCCBQQ9kZRt7vKT/XgWuTbYLSiL/lfWS2QNUJg6am7
         m95VYTCzLk9lQPEF65TsJuDROTni2rb9EmHmW8BtUmGPlEVuM/0P3VId6VvKXfcLpQ65
         EcuV0LpbkUH1pKwZY8mNFhY586WS/dPnoOZpIEkmzaj2r27COjmrwWxxwuSnb+Bw87QX
         DIGzMJTklBr8LArrK5T1eIzwFFHLPwoG2n726KH3mMBigjfMc2MGkGMyX4yH9iVBzI1a
         duJA==
X-Forwarded-Encrypted: i=1; AHgh+RrLZuKQSo5rfVTyyH3JaPnCr9IyksXzz3A6qLQveAvWhW1nZBZeFS95QfwV3jlcVucAQFtva6W07knXwkk54INJhVPm@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwnJEJiaK7cRYCxegNh1EAHCR1A6SdfIkp2+RDJSeS//YX5jpgd
	jo8bH5LvzPCYwIFEelguYBfJZpz10TvtpTmTCosT1szApe36xcyyAXYc
X-Gm-Gg: AfdE7cm3kpK6OvgnjQNtTxmyVBocs7GCLP3ffjbU1KBikQ1P1Ei/bO4iRT/D9vaQ52D
	Z8w9nkELKPfMLm7Wb6MpPJr9oYmqHNC7TlLBlicBqQzRMSlirzDOw9HdwTMldwc5/M84uFr3TJ0
	hfA41L0apJn2+xPs3YxQw41fWv53hE/mhVxUyXOcHwSxxP/CuaFsZ7pdsa/jI0T+LoaYYqlrGlA
	jhrXo0EUK8pbOYmVLXLBo/hcCs73+cqgcPBDoRIZ2KdndCbOrToZPvEOgxaNqRZQ1Cl8gWmwMj0
	WPYugxowpYsajIuiX0HE1UNGR0khSGx+WkxJTCLgtT4UyNY4/Tzo86Ur5Z4Szf2bdW9xq671LKO
	ayqn0/v2+kPKLHN8QGWHvKIlkcXY+2iksP9tL6IMvbyGKeVYBEUZcFqy2/Dd8ViaUULeBr6UWfn
	mb7c9J/hOHVeoW8a+yJoC5XoIt/jf3aJj9n0lW5b6GOZPPxPXJxgKrpkWAzTdRHnFjIsFIC3e2S
	RiPmm4q3XLFQ5M5qp4s/erZSofGyuoBgPb8E8X1on6FuncOtJOFlFDo00NS99xWvsp6M0j9/9KD
	XJc=
X-Received: by 2002:a05:6102:5e8d:b0:739:71ef:d772 with SMTP id ada2fe7eead31-7475346b146mr4288945137.4.1784582816300;
        Mon, 20 Jul 2026 14:26:56 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc36c393sm9190865241.2.2026.07.20.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:26:55 -0700 (PDT)
Message-ID: <6a5e929f.48fdf659.19c40f.eae9@mx.google.com>
Date: Mon, 20 Jul 2026 14:26:55 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH] runc: fix CVE-2026-41579
In-Reply-To: <20260710122553.3001811-1-deeratho@cisco.com>
References: <20260710122553.3001811-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:27:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9961

merged

Bruce


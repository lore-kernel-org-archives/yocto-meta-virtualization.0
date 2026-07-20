Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C90C4452F
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:27:10 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8772.1784582820921765777
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Hbm8GfbM;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97017a60b06so651026241.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582820; x=1785187620; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Hbm8GfbMj8OGbCwENWrQrL/wiGlVz3xseb5fBHd8QHON+N+KGmK+C7kbd7B3ZHnPJP
         du4hShelOZaiuqupl0tXemBJl7x3bRxol9J6ISl82KTtQQLaZpIU4ezn81OrP4Z+29Qy
         rfsVDzEHESBu8N0WFPZigIqgbFMsbPLNL5XWzOZ3Ewi85nxzEpaTEc1IdU0s7TGnpE4+
         gEPDSGaG9KVS7tmVO5ijAQY6T1dNGZJsLVYvn1L5Yi/FLBCF3Vh9oGEzp+TXaADV2Wn/
         C8tdGDBP++r3MqrefNFQH1j9e3AoG2OgKW6CNjaqxnGfm+3lKbqkiG0NXhEjr3xcsA/t
         xaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582820; x=1785187620;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=LQNjpK+m2jZZeQ22QFM1+gSYL9NhcIP0KkMndh2rvuNquSaXVRoeenPF3GZU1FPgWW
         EZCkC+ZcLzRJkOQhvqrt9LAHXs5hQgCEGEyi2hd0DeG/60Ws+rjtctYWhpK27GtYLyUV
         0S0FuPGbfvAUWnE/4z7EBFYkqF4TbjsaTdyAgJpefYTjiL5qfC/HZFdYYmaK3+ZnazVE
         2dHQWSSPUmxLZ6XQqe6Dry/zrw1/euorm2cdWqASoi7mS8lmeBpkM6CxsY38//gjlrBA
         eJ/sIbi5JhosawNX5medUuKGzdtYb19GTTpF+9LfmakNcqZ7n996F5jzFi30Z6hBi9Eh
         uLPw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Wi5BamE5fDG8JGkqSBRwZxjOCAEJ2mMx4SbeaKGB+7VwmlLNJHIAEvcL5qU7PI3P6LfWQ/Xn2IDWu5VuGsiiWAq+@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yxd3dSCJ9TRyLK220HHZXmMb09tMQ/XlC3KVqnqTtQHxI0bed23
	ctFBUJ33JYZxUoZE4I+ckKLcw5nAqzYZhfCcrwDzlCqe9fNvLdzWFuXLnI299ZT6
X-Gm-Gg: AfdE7cnRqspMz4j84YJH0uXUpVGnd5rksFRB4AONYsSwl24UOxJNgNM1Lc3E/AR/oAb
	abHIhjp6QLBW8M5OCzFA3dKp1Wq+hnz4ja/sesFxjsgJ/+p6SFjZ5PU2UHW9L1IAIttu+ZAu3mS
	g4DjUPgW5CE+0JAKFH72fmD2wo+lN3VvmQMcO3YJE3Kp6DlWE2c7WwQ3af368T2ZN0fGfeEvve7
	nslPYfZt8/NJWE9j9H8n+Ke+eWLfFR+aJxxnqHeqRj+IzH8zKv3YCy0hsT6H6KV38i+hYeTX5pH
	OJAPyvDN+5NEauXjkIsI1ZXE3MEMZEkrONyrlKh/7ISNpaerskvLmaN9kVV1/H70VuXYFtjzXF1
	5kwrz8/jVylHyhAQ8F9234cAj+TBhC0Paemxmx2PAYW+tX9xtuMS4K/mvjsxMv5SPWboj0Hc7j6
	cPtnLQJlDvSLCKq6PheE3Yz/9z8d1AL3mUjEPWiAxqTVc2kbIEzNZTkWp8MNkAQlMDBM93O8jrt
	fHq7soA9tia2sn0s2WnlUqc8AnTst6Cx+nd8IDvgmhnRPBLoeCdKIHZGf60ngl3tYaNVHUVWJeZ
	eLWoPlkVuYTxyw==
X-Received: by 2002:a05:6102:3309:b0:738:3525:4403 with SMTP id ada2fe7eead31-747536d459dmr4087603137.16.1784582819801;
        Mon, 20 Jul 2026 14:26:59 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-976fc60c50bsm9053896241.8.2026.07.20.14.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:26:58 -0700 (PDT)
Message-ID: <6a5e92a2.eda3a0c3.29521e.054b@mx.google.com>
Date: Mon, 20 Jul 2026 14:26:58 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 2/2] docker-moby: Fix CVE-2026-42306
In-Reply-To: <20260709113547.3747083-1-deeratho@cisco.com>
References: <20260709113547.3747083-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:27:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9963

merged

Bruce


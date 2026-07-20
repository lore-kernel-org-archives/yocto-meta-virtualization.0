Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB19DC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:26:59 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8836.1784582819106169170
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UVnvWaHl;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso1811819e0c.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582818; x=1785187618; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=UVnvWaHla7o7qgrVBOjgaGrfOElAcUvENOYWhbJcskEtS20pw376fd6fWdm8DUMtfi
         ZSz1wQZYLz0ANrLsX+0Tf5NndXeCleq3rxMBAv62wtZBKTcHP9NYuW56WixBIQV+S2sR
         k7oE5EvSsOMzYbgfHzgkAphrXHOFCcQ3rxSomacvBmaMt9xPcPdsUW+BepVe19n6g+Ri
         Q/ivpxxbe3k5hcVdwcEsoKLVmRUZem+2LMr8zeHlTUFQmhUlsv4QajalQj4gxFpznA9S
         WlvZF4xlfuMG9iepPBHrDhm6DCiz6ok5xtYyWig6CdLXkJmEPbkBDQPBz2ljqKkzKZEh
         m0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582818; x=1785187618;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=ScxA0DyYrqYdsod5A+77AG9Ovgqk5NcurLFwfgQy4VPzs/cLmtjs4tzbdgA/DNqHBi
         ZGnfr2hnT8JAvfeLp/poJG3xQ8/M6tnsajwS9BzKniD91hGSRHimjNQiQScIN10cwABS
         PFQmdqt2fuEHXpebfzc6f9IPCsAHzkMr3+y/Fx01kzH+i2DqSGxDhNSw1+bfuMqb02nE
         TgTBHw0LDuG7CIRFyqpEiDgx8MiNd89Z9aeELse5rgPTjIYbajWGuioBJf6DTorqTUKN
         64dWJxJRHJOpI6gatqOIaP1DzXfYq8UW4lGXoLo6PNOw1EkyGdhM+ExFGAhvKVpe79lY
         LhOA==
X-Forwarded-Encrypted: i=1; AHgh+Rrxb/IPNzJeCK97kib8JCNOv5KlZIE+pXqC0dYdFDWbirWPQqSrRqlQpxH9Vt+ekki+we5HlDhnTVS2vRLfuCg6Ef2e@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YwU8YmrBlEA2Z0ERK8FhyFADelROLOBs2IPp5osNYJ63YyLUCTJ
	o3o46rQqCptFtCA83P9GNeafzBUFclaENAn5gFhLq1lb+0YNGnT3xO8gqDnAH10/
X-Gm-Gg: AfdE7cnwZgDcPkyHws6dlaEd3qcHIQN27Nic3Zj2hcWfPI3DmDOAYVeS9ECu+fqvaqu
	a4CDEqLiAKsBQfgjt2gi/DzQL0g63ze8kVQneeanWCpGyDpxiXjQjADmtK6AvACDL8j6T+p7epL
	X0TUppQOVpmz7yoBUiDl5jX5ZzyVZwjCRP0QvC2s5j/AmNMQOSRA/QtqO64Zx2m7ZeUoIfJHhyH
	YxrOrJx+WGwt8xG2pRMmhrMe7+MFV+4UNXFxqqFbvazELuM8Dohb7IIwzTNmWBi6txQthk9kyI4
	EYvwYEzYx4GPH9kImnnx4xOk/oKbUKU87160y8IplfxW2lvjmi2tSbL4DXX9Clx0hQwNdrd76dV
	1SSVYW3Q35Qn/16noL50somiCtkszJgzw0l+1y3zJXQyPnIFlAtmXE4pOQUk+0eOnSWNWUQp8F/
	O8/N+MXB7rN7jp2ynsjtldfa7yYQAzqX8Nm6x7JOrjYueDcQmriDJb1FNI9w15xC87lnfIpktZA
	0UxMAuTz3JYfTixGgE0NzTjJioTnv4Q7pc8D2JXQK10w+JC1c8EPGBHiZj4wxlb/irJEnKMPnzU
	9POv3YQIvBaxHw==
X-Received: by 2002:a05:6122:6598:b0:5bb:fa79:56dd with SMTP id 71dfb90a1353d-5c1978818f7mr4203705e0c.7.1784582817963;
        Mon, 20 Jul 2026 14:26:57 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1f6c51462sm10629532e0c.15.2026.07.20.14.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:26:57 -0700 (PDT)
Message-ID: <6a5e92a1.73bf55c6.1cf776.148f@mx.google.com>
Date: Mon, 20 Jul 2026 14:26:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 1/2] docker-moby: Fix CVE-2026-41568
In-Reply-To: <20260709113527.3745345-1-deeratho@cisco.com>
References: <20260709113527.3745345-1-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:26:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9962

merged

Bruce


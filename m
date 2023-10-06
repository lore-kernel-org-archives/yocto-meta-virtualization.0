Return-Path: <przemekchwiala@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F16C2E81E0B
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 15:23:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.15707.1696605791733950073
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Oct 2023 08:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fT/yOo8f;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: przemekchwiala@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5046bf37daeso2943479e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Oct 2023 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696605789; x=1697210589; darn=lists.yoctoproject.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZcbgVfjeQVneCDJZRclP1NczM0eTnVTTnNcMTz7tVc=;
        b=fT/yOo8fdmkAmKucbfK4zfOAoO4YJDntwiMfClEK/aFzmHPtpF6IBIGzRaLNJLFSyH
         ZdNA0n7bVdSzTJVwlwZupl2qDDd+SMCGYhgFK88JxtJn/MeIXpWXMp+6CtVq7da4YzY9
         wD79fqg1XDpZbagbxAxr6XKcKFw/dSoB3wvPYJMns/ojs3eNgj/8Ma+3gTIhslD0i/st
         4eUXfiLL8auD/RJ5iRil/Jz7AZxJVC0ddN0LMutwkUkNkuY/wJ3SxzU0LWKBrimfngvo
         e7Lonu3iQ1WFxw78Wr7hxgoTHBApsfeslZ8+sRQrt5LuAX3iZTFfkKjlhxLeOxPHH/G/
         kTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696605789; x=1697210589;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZcbgVfjeQVneCDJZRclP1NczM0eTnVTTnNcMTz7tVc=;
        b=Zz1IhRujlb4oTi2Wo3BDAAiXWyCIb/2ASoiW8M3w4y2ySkMVsbUMiSiX0DWb1OUgrI
         cYtakXgXoO8ykjsvtS7Njim+rlmi0EwnJGIK1WgF8NWiwvHn+kCOu2VfUkT7qEqRTERN
         D2+BLePK6PcFsMyYc0EJkPVCKDUmqGBBfK84zc5FLMCblD00Ir+oIIoQiFSrNhnynK7z
         ckv4X5Ekn8wMMIfB72EFQCdqBJ3jTEE8EnDidsklEMTOdpl5vYpt6fnAMV2WaYU1kGee
         FfWke+jkvTY81ZtNqvzkyyu3gr957h/m0ILfk/qWOoRS9dI+E8Q9wRABXvVMr1C0v4yY
         F+cg==
X-Gm-Message-State: AOJu0YySa3qEEWY1jwSpEnusI8hAeUKXhvlYfiFsZyTpCJT9NC2TD3V3
	nT19dNK6A2tClzDOS/a/KK8Nag9w5+BZeQ==
X-Google-Smtp-Source: AGHT+IG54ljcwt6VmRzSEumBMw4bAegSz/x2+NgjwZHnWbCWsRHNhgTawRXvKLhNIq3LIdY0uHLu+Q==
X-Received: by 2002:a05:6512:1327:b0:4f9:586b:dba1 with SMTP id x39-20020a056512132700b004f9586bdba1mr7706571lfu.4.1696605789361;
        Fri, 06 Oct 2023 08:23:09 -0700 (PDT)
Received: from smtpclient.apple (staticline-31-183-3-111.toya.net.pl. [31.183.3.111])
        by smtp.gmail.com with ESMTPSA id x2-20020ac25dc2000000b0050474de0713sm344265lfq.7.2023.10.06.08.23.08
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Oct 2023 08:23:09 -0700 (PDT)
From: =?utf-8?Q?Przemys=C5=82aw_Chwia=C5=82a?= <przemekchwiala@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Docker-compose Go update on kirkstone
Message-Id: <1D32D17E-126F-413C-9F22-2E5CCF20E61F@gmail.com>
Date: Fri, 6 Oct 2023 17:22:58 +0200
To: meta-virtualization@lists.yoctoproject.org
X-Mailer: Apple Mail (2.3774.100.2.1.4)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Oct 2023 15:23:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8337

Hello,

I'm working on the kirkstone branch, where we still have =
python3-docker-compose_1.29.2.bb. I am wondering if there is any chance =
to upgrade to the Go version of docker-compose from the main branch? I =
tried to build the recipe from the main branch, but got some errors. =
Before I dig into fixing them, I'd like to ask if you see any additional =
issues that might block building docker-compose_git.bb from the main =
branch on kirkstone?

Thank you
Przemek=


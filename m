Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76851E8FDA0
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 04:32:25 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148297.1766723538795433636
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Dec 2025 20:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g/7zWyPI;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso5237070a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 25 Dec 2025 20:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766723538; x=1767328338; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Df5EUzg2FRhjnKUwy3Nd8t2tUmY/7tGyfelRQcBPAis=;
        b=g/7zWyPIoOdSgFgkbXTzhieTxAyqzREzkktuaxtFlFgqNJatEt2v9BjFcyX4N8ORtQ
         hPkHikNXCCdqg+Z/txPzxMBTgdlPv5oLDChKNXfjV1V+WmRiu68DccdVi6bx8vRR47n3
         UP5LHLG01FcteLcB6zvuTjR0OGzWdsLIsHCaAwZ+7y4Sr/vCpLNr2xl18sv0x9m3v47+
         TKxBxeZFdS8XmijwcduOF0ty5ax+ar4ERjkDnVisrLeUJLxV5RQI6jkqXAxD6FaIfUiQ
         RpD3GY1I7JTVI8//DLjhrcnQpmbRUqIus5CkoUHhR8fiorUgUtqPlkLukdAjwSaBO6hd
         wN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766723538; x=1767328338;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Df5EUzg2FRhjnKUwy3Nd8t2tUmY/7tGyfelRQcBPAis=;
        b=j2WkWTdibyjQYE6aR/Vz+sS9LbrW5MjAeHiiJAAsEuBnNsmrfv+4pZRL12V2ceaDOu
         KGwDrgl53hE4M8a80n+LE4p8RTvfBgfTTWszorQZqrZup04aXlGypw+aASwXkhAvfym9
         UcSEH+YUqdO3ih201GesWpdYRb/r7IMXH6i80ltywbpwconX46UBqtw3Qexly+au5NNn
         wPk9N0xNQgqgFPQNHSKyLtY6VgRH8XSbhB+98Wj/db8/slExm8s/2YOYdDjpaX2GBs7O
         WlUSSt8GOV++RZjMy4El2+PjkxQjU32l/va23zIWmlpZImHYEq5zDWR0v6AYTF+RYSAB
         K1IA==
X-Gm-Message-State: AOJu0Yz4DzMxfClac1jofX1f8r0ghvlYmeqRtP3QNdeGExU+tGGEGXDn
	B6444O1jI9fA7hMNNIRGeRJlHjLwZb9zXKYWDB7PncwOIQmOQgzQS7Tg3KF8n42NvA1ahL+K9Ji
	NznzHrZWFC1kStv8ffbOAJqQpfiELHNPn5U4RUdjxOw==
X-Gm-Gg: AY/fxX5NL+wocdcKUuEQbQ4YtA1wGu1sN+TSHdTLDLNs+BohclW+yWi92RFHsOsddZS
	9iZbfBTsrfzL9wnO87E8CRkrZIO4Hx9i7T0YuunYUyOU1CD29DJuzCvf74Nsyz9uYmjHH8dU74H
	O+UMCHDV7oiR9+aw0/qwuHNS47mzjDjxryNEvqrcf2AiHuyG8fMgBVpysfz+UIWHzAZGM7MjpIA
	pYWMq3IRka5Z1DJv/p5j9COFQMAmou4eLcDrd5yyc4VBnSXI0h1+/LFScu/se0+6f1TE8Bs
X-Google-Smtp-Source: AGHT+IFA6i5tFkpXPVDvhu7R5eukivtCCtZz4RXocBSkM3/A45sfbnDQnEC7tZPrtVsvWiD2hfFi6UySBflrxKk2P0Y=
X-Received: by 2002:a17:90b:134f:b0:336:b60f:3936 with SMTP id
 98e67ed59e1d1-34e92144866mr20478640a91.12.1766723537558; Thu, 25 Dec 2025
 20:32:17 -0800 (PST)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Dec 2025 23:32:06 -0500
X-Gm-Features: AQt7F2okRQrsa62i5d_m956_cgDiM1Nn3a7Fa4vtYq71bmHUr8jgVG_nndIXSGs
Message-ID: <CADkTA4PavLz0Fb9Tv504p6UsWD+Jj5YUyDbOp=0PGq4+j+g3xg@mail.gmail.com>
Subject: whinlatter is branched
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 26 Dec 2025 04:32:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9504

Hi all,

Just a heads up that I branched whinlatter and pushed a set of changes
to it and master.

Also note that this isn't fully released yet, and I have some pending
changes to complete, but I wanted to start getting ready for the
release. Almost everything will go in both master and whinlatter for
the next little while.

Pending patches will be addressed in the next week or so.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


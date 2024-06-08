Return-Path: <rfried.dev@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4161C25B76
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 21:15:10 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.6197.1717881306390292879
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 08 Jun 2024 14:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwZ1nRgS;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: rfried.dev@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-24c0dbd2866so1704670fac.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 08 Jun 2024 14:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717881305; x=1718486105; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kyfKtS6Fnl6/ee59PQqvRnRRnUX+TFa3u/3vk2n+VHs=;
        b=UwZ1nRgSVPZ54IRqZ4BJ9ubnGUQWFj1K3hQF0plc1GUiX4T1uV/+7fNWF122qNqmeG
         Xp3kmy8PgM2C96CIK6KuNCbaNvhK9xMrR3Weo9ddYLKUB/fUCv6Xyjb5J1BsSCxMdgDH
         VN1HvlCZWpGx+2Om462uJjPHhjpv0gjVIqXV0KSC06dLaPIO8BKNnc8Vpyc1OmsGBW4e
         211cDFp5JsOJkvGIbpYccYOhfPHwLptHhrZU/18/DOldzMILB4NW0w5DT1YmO2l0tWAR
         m5kZSGjbDUT476vKgTwg9U6iFgs+MkcHdyDkoPDBPazOSqRtjkAM2sowRT4gill8zfqp
         NO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717881305; x=1718486105;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyfKtS6Fnl6/ee59PQqvRnRRnUX+TFa3u/3vk2n+VHs=;
        b=GAcsMoDxy+1496ogsz4oiOAlwJIhqVzbXz+KPb3Kex5iFAanvSkYcFpPGo9l4xhfsl
         2xcb+fhrOQV/PikyM+DVJYSd48DDp4ebLnN9/FPKvP6erElO6hNJbdCVHbPasUhHZteb
         bEINXB0xcG6eGCtcNkfMBd2aGWOMOXZn9Ee374GyGCTu9TXe++ATBeySzVcyLUiK959v
         GNR51Hsyp5N3Ga7oPBcKkDoEFXHWQ4dLiuaZlS6Lf1Q0WS3YOMXBkNOX1tDJ3TFrH0HD
         pSZ4XSl1vtOICcIu45iffjc09X4VbomyvE+AQgJMHQAgjfIv1glBE8zgFcuDYPj/BYpy
         6j7A==
X-Gm-Message-State: AOJu0YxQhcDdXmKZkMONG+e6zowAng/P05qOIEgXHCMRvh08KRFnJiK8
	CVjfPOR1/TdTG/tiIBaljK68uZMWu9BOR3nN19+l0+hvl5U2Q8DyNXWrAeA+DTHsDeStA8dk0t/
	Ahybz6FzOGnbAmEKBj1JtvIiE5BTDRTSgl5k=
X-Google-Smtp-Source: AGHT+IGhW5DPVP7n+gXgs4HniIEWrHLi9EOVRt1bQcq9rLQYG7k8NSXOoKOs8gBWrFXGL2BOXeqwZ2gPVqWHmn/Z0AA=
X-Received: by 2002:a05:6870:b4a3:b0:254:9501:db80 with SMTP id
 586e51a60fabf-254950246f8mr2851861fac.14.1717881304877; Sat, 08 Jun 2024
 14:15:04 -0700 (PDT)
MIME-Version: 1.0
From: Ramon Fried <rfried.dev@gmail.com>
Date: Sun, 9 Jun 2024 00:14:54 +0300
Message-ID: <CAGi-RUK7ARiAVcS-in3m_E1EjCOzFvPb=k=WYBJZCWQB_fT7UQ@mail.gmail.com>
Subject: mickledore - packagegroup-kubernetes-node pulls k3s instead of k8s
To: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 08 Jun 2024 21:15:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8792

Hi.
On mickledore, when directly selecting kubernetes, only k8s is built.
I recently noticed the packagegroup-kubernetes-node and decided to use
that instead of kubernetes.
When Iuse that, we see k3s is also pulled and built.

I masked the k3s.bb to understand the dependencies and it looks like that:

Missing or unbuildable dependency chain was: ['k3s-server']
NOTE: Runtime target 'packagegroup-k8s-node' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['packagegroup-k8s-node',
'k3s-server']
NOTE: Runtime target 'packagegroup-core-boot' is unbuildable, removing...
Missing or unbuildable dependency chain was:
['packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']
NOTE: Runtime target 'core-image-minimal' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['core-image-minimal',
'packagegroup-core-boot', 'packagegroup-k8s-node', 'k3s-server']

Is it intentional, or is there a problem here ?

Additionally, I added VIRTUAL-RUNTIME_container_orchestration = "k8s",
but it didn't help.

Thanks,
Ramon


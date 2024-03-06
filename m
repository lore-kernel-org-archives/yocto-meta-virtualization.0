Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28342C54798
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 02:22:16 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.2971.1709691735547522205
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 18:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZKW2Ic2;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-299a2456948so320757a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Mar 2024 18:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709691735; x=1710296535; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5tCAPt8Z4h/XZuBm4oW3Z8wHIRuRLOacf2RGPuUdivQ=;
        b=lZKW2Ic2K4RYMhQDLG5fcBj/uzlbye52RsQ4Z6IjRRVapMGmXqET1uqmdCeSWcdFD4
         jbki6Hw01Ly8SMiH808nQjyq6rBffNiQ8PUXaqmoKxcoQDriL3Bdg88CLoH/5PmK/yut
         RBkmi0V8hjsz2QhiKjFax5rVbmbaZyAGtuVIqQOKPntFuhwjqhMDt9CdjI4kFFWdXEcD
         9c1WLYbygPcyyBZq00FFNYLeTf29SuSJmUz41YPcqMAI9XTsGXhirY3V3aFN0Ol92MDK
         y9NbxEl7H1ea1VzNF0Tl2QCPuhubwjKtEbhgeSdCW8XKDb+FbFY8IlI1AK2pbXrcanXG
         D1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709691735; x=1710296535;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5tCAPt8Z4h/XZuBm4oW3Z8wHIRuRLOacf2RGPuUdivQ=;
        b=JIfrl9Ums+cYCUh59KsZYpUbrvBEIEQOL6+S/thxDL7EZisKoo4kSqGEOOnDwfXXHj
         Ct2B34YiVwQOymlhO/lUqMCuFQN+rqXQEnCM/e7wHzaxVekLqXXKxgupq0OrugSmfA9T
         brcuaPqrVd39p/KhFGFzrH7VVakCmWf6sFbckksQR7tzbuSCPvX1UeQkuRWGUZgQI/6R
         N6+QVqEP34W2TaPqjf7HJqog9//wuTWH80nWXMbZu+b6TWlDCk231YMcufHoykVSXvkm
         As3jX28RKg/OmYcDha/wlHGOPxoLhtignVkwv6ks1ObuO11ouB8F5kye0FpGZufddEWj
         r0VA==
X-Gm-Message-State: AOJu0YwgW/fCMzWUE8WfN9hn4Fw8AwsKjujsYBOZ1EH2yas3J1xf7K7Y
	k9x5L1REfFee6b+vKMji42Zwh320WaINMvTI3mj5l2fEOHrXPjTjMfL61BkeWnn1NIC07NsNU7F
	Uoxccy0Vq+FtWVAZH+cxuRDkqGsvYt4nb
X-Google-Smtp-Source: AGHT+IHykUHsALb+k5DYYgRSd95T8Th+b8Zl7Pnlu9N5Gtz36C6ZlgaqKTiQ6ybwJWIznAUdacv8F8cknV1lC1wh1bk=
X-Received: by 2002:a17:90a:8008:b0:29a:bf47:e133 with SMTP id
 b8-20020a17090a800800b0029abf47e133mr12516449pjn.23.1709691734424; Tue, 05
 Mar 2024 18:22:14 -0800 (PST)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 5 Mar 2024 21:22:02 -0500
Message-ID: <CADkTA4Pu+VRU=nOazQGrCdJcTriVDatUOnG7P6DVi9T1AOTOBw@mail.gmail.com>
Subject: ceph upgrade
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 02:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8604

Hi all,

If anyone has experience with Cmake, I could use a hand completing the
ceph upgrade that is marked as WIP in master-next.

It took me a few hours today, but I managed to get past python3
detection issues, but now I'm running into a compiler test failure
during the build.

To me, it looks like our sysroot isn't being passed, which could be
related to the toolchain.cmake not being used (since the compiler test
is being launched by a sub component).

I'm inclined to be stubborn about this, and keep working on getting
the package bumped, as it has missed a few upgrades and is in need of
some love.

Bruce

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


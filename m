Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B01CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 19:10:05 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28636.1781118595331272376
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 12:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SgoQXVND;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so3741111a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781118595; x=1781723395; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXqTgeI96bY0FZJ4cAvnR6BwCdTajLvqzzynXxdqWn0=;
        b=SgoQXVNDigE8oNp00bntD71wxUdkjMLyosUdTzVxPJkU4JHeNjv5EXSayA2FrNsM7W
         PeLiLGVWsXd6/2Mkh/9Q0G6qiu/mqs7p9NmS96Wdx8+BI1xXLwMbrBsP8BJ5/ufPll9u
         Q5XSOY5YgWNhfyo9yAs7nHHqbAbk5WwQAY/c/phBZC9Gfz5FFsHGVfl/L9DrlVv+ewwY
         u6TGk9hd+hiCIMLbka1BQ4ugzUq1so/ZK8gnFUTAAR5u6HMw391CVV2clDdVEUTulffw
         b1u1evX8f8GO9o6HsUkAtI9Pmxcz+PdAfxhsM38v1BNIuJkszl+aO7z5nZF0uw5CaAwm
         by5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781118595; x=1781723395;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXqTgeI96bY0FZJ4cAvnR6BwCdTajLvqzzynXxdqWn0=;
        b=EjUqWtQBCMKl7NDi5ZYSKv1LEgu3JJ/o6CMZ/8J7dbP5mQmcoanCPowb3L5rG6RVJr
         yxkW2lbsDfaskqnnudCMy9lAawYs4d76viRIfFNtUqmWvPkMhCJTMeVlgRdTrVk69Y1O
         +2ljLVrOynekg+yXdd93m9hk4UD777U8u+99jInbeq2AWtJnFRATlbMWH47bZqkAByND
         gnw2mqYDEsj32VHg9DgoeD0VU4ndGxkI9A0Xq2VUnIJJv+gDOBPVobRF1feO0DXc/AkO
         KvixJjZoMcWj8c/+JOjUZrCg2sRoW5Ljfk6vJqgbdDZeT2//zERP9URf8lyecFJw93kB
         dN/Q==
X-Gm-Message-State: AOJu0YwXi9AcTfczHmZZ++8wKp5yFkxmtesTo7SOQ6ja8E3Vu8ishLMU
	6SnScAVo5b+u0m8XB8Vxa0GLQlQ2dD2iloadoLCN4p+KvlvsKzNhAaCY
X-Gm-Gg: Acq92OGA1VRxUwTdrNnnB+Y/qKCW5sbKvCi4x6ZyaSjJNuWFM4RvUztgQ3VlcDVPTJL
	OSSsxlECPpGKI9LOBKofZEOwk5QFjmOwWZRBxhrsh9u/yNgNom0HEr/nOtk9O8NwXEiapKwUVr/
	BVxHAxvXzVqjdHf0iZ5TFLhgli/HIxvWAq5ZoGczIMf+0fVM5mmmsQc/LXxNBNn/qAP+SFCXNFZ
	V/pm/2k39YkhlpSWjWvFL7BkSw0wO9bhrYrHy+Syzc6IFA5oFuedBWPfUvF4cyz/Sj5vvLPCZT/
	7vuVK2N/LNy2dCmXpKgRelQhXXPNvGpoGsgXrR3P+WCZaZmsgYBf9Zf+yudmkxYlXxwsgXrEE4H
	LcA3mnMX+fh7fEU9vdfmO4J/EEEfNUeRZ59lir8Vt+Wh83lNsVFkDmHkpmjG0IArPyhy51XCLCQ
	RQiVkq/dBkKv1I16NumIoDkRhSVk6gAuvYyIhONVwM/SS1/Hm8cbvp5XFiaIAL8U+6gOZYJ0PX/
	yYML+uP8dEQgh8CsGtnuhtnNfc/9Qj0Edi5w3RwiVsUrbzVhckLoccy5lkQnsttwfXkoSNGDwbf
	Rjm+eqVIRUkA+ReVmT87GAJk4WVl417AhvA=
X-Received: by 2002:a17:90b:3fce:b0:375:2a38:1d40 with SMTP id 98e67ed59e1d1-3752a381e99mr10290487a91.20.1781118594530;
        Wed, 10 Jun 2026 12:09:54 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37756143554sm135730a91.17.2026.06.10.12.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 12:09:54 -0700 (PDT)
Message-ID: <6a29b682.695e6a0d.25a510.f79d@mx.google.com>
Date: Wed, 10 Jun 2026 12:09:54 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haitao.liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 1/2] libvirt: update to v12.2.0
In-Reply-To: <20260529030040.1487113-1-haitao.liu@windriver.com>
References: <20260529030040.1487113-1-haitao.liu@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 19:10:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9869

Thanks for the wrynose backport.

This is a minor-release bump (12.1.0 -> 12.2.0), not a patch release —
the wrynose stable policy is 3rd-digit bugfix/security bumps only.
Same constraint I applied to the docker v29.4.3 patch a few weeks
back. The 12.2.0 NEWS specifically calls out new hyperv features,
IOMMUFD additions, and a new public API
(VIR_CONNECT_GET_DOMAIN_CAPABILITIES_EXPAND_CPU_FEATURES) mixed in
with the security and bugfix work, which is what concerns me at the
stable bar.

Would you be willing to send a detailed breakdown of the v12.1.0 ->
v12.2.0 changes that addresses the new-feature side? Specifically,
for each new-feature item:

  - Is it gated behind an explicit build-time PACKAGECONFIG or
    runtime option?
  - Is it only active when external code calls a new API, or does
    it sit on a default code path?
  - Does it change any existing public API behavior?

If they're all opt-in or unreachable from a typical wrynose libvirt
configuration, I can take another look. Without that, I have to hold
this — and note that landing on master later wouldn't by itself change
the wrynose criteria; the new-features question still needs to be
answered for the stable branch specifically.

The paired meson ptest patch ([2/2]) waits with this one — same
response.

Tagging this and parking it pending the breakdown above.

Thanks.

Bruce


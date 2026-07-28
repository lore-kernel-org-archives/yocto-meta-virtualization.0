Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE7FC54F4D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:47:19 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2206.1785260831169998809
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=knxnZ9ZE;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9f1f24cbcso124364a34.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260830; x=1785865630; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=knxnZ9ZERKKf7t9mMvjItScd7i1mKjZykTV13b5pFgw0S2Ze4iiGqeYR0JfPilUsh+
         jiG8AzivIbTeJ//81k54aP2yRCRmVAGBgaSeo2C248GQDtA4yeZdthjKiEssKxRWCs1L
         pMA87/3jGgAKcY25dVz1L9z6gUU8yYvQxadeomsEc4W4FjBbfYlh9u0cd2CyX0ySjmuX
         Q7NyYbyuPH60baxNuX1cXauc0cUCvlUVwezDRb1686a0xCuMn1MnKlkKE2imm7+2sSH6
         cc/PvcGJClYabnyLc8P582INB6gzhuNcdmIr5yhhHTrXQzwUc3tP6UdECE7Fk6C67C/R
         MoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260830; x=1785865630;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=levJuMAz1o6/tlPOZDrI6J6LyJI0YWMR/2nGfcZyuvs3bOz+H31GOGsEJbc2Url0Vm
         rN8Awn5mrfGMKLnKbtNuLHc35SEUFNlWFblqrUIwlR8KxWv0MalvLz7Ycm6YV80V4PC3
         ZkDGOsLJlQIrhgJXsjWlMi/YGsR7PpRbwbKnP8kXXHJc6kicpRpfWRcqxGVCMSzRdP3G
         sV6YEFJtUGYMxNXwsqL7NTvqxNxmEYWisccENFOiXnW6NSA+oLbUnQEj/nJXEKPGU0yq
         zoeXg+eIt7j9+HhtBtNMCaj2lR3WfqCmH2dZdu120ZS2WNJJE5tq7hNAJ3ze5LOXsuAf
         7f0A==
X-Gm-Message-State: AOJu0Yyp0NP9Pur52HjvsKKx/EekTHTxXqBjyMHTRJXxCexfo9f+8Kn+
	ikTDt0YFFIdSf5l7mzZD/ek/L59MF+DBhkpNpkkO3B2Pt471hM6fVNeSSL3puCi3
X-Gm-Gg: AR+sD13rZxrW8/Sd2W8G8cDKPqGdSbQe48JP1XMruu8GK9USmlxVDxqCZOV59KSCiNb
	pArDNFCvDPRWwOuq8gEwnwDd+dSo4dnMjKzopR4XrOm+vSAwkfXTLvZM3gPV31E4kPnYCCFZOu2
	deaGSYkNvvE19RI6XstkxZUyQegs4bBlZ6LO5/k7TZv7AsTmN8lqbMUOfRK9bHdAciGJBJAaDzc
	LmQozoIJVIRnsGcR4VViB4szH46m/GJ36/4jCGGBJWHW8qEkEvPwGkkP1wKip51MSwIHPpDliT5
	kooEVC7/aeFhv1KxZIA9pcUPGDnGTtKZGNH1uAdouKOXnP8bc53w5pE7bCm7j3I63+YqQOhMU0H
	jzzy1XxbPbsyzbqfXPRf6r515jm83HUTG5SQ8oBgdPGuoz1p0RROgqTNhb5KKundb5a/tGVVp8M
	u02g3BGwxR9CHdqpdzsZaGggEhk9nGnH0+WnicqqdYO7IdGVAXuT6VOP64CFBeFeRBn0Slvtvx4
	khHoGMn+v32CcI9gQBUJ+a8E4UFl43/GW5JS7kfkkzkFxyRoU8hYRHNpXKUtDQs2Zvu6nVMrrRi
	v/M=
X-Received: by 2002:a05:6830:348b:b0:7ec:4121:f56 with SMTP id 46e09a7af769-7efff07f4f6mr1826268a34.1.1785260830328;
        Tue, 28 Jul 2026 10:47:10 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f00d9af5cesm273209a34.27.2026.07.28.10.47.08
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:47:08 -0700 (PDT)
Message-ID: <6a68eb1c.bb286e2c.181766.cbe3@mx.google.com>
Date: Tue, 28 Jul 2026 10:47:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH 4/5] container-image-multiarch:
 add container-yocto-builder
In-Reply-To: <20260727000247.1623785-9-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <20260727000247.1623785-9-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10005

ack'd, staging on master-next.

Bruce


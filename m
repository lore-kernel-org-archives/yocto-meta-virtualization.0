Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.106.1792696411152828849
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L16Yy92E;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-530e75d1ba1so464861cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696410; x=1793301210; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=L16Yy92Ecanfi7TdpzQlDuo3h9xKnQ12mkxMcNEOkZYuS2ltz+3q+Xpchet7YeeY8P
         U26r0GBQfJxbvnAuCqYGiAfZkojDDZ9DHu1TG2z9j8GlnqWaGbuUvwd2jAmKwKeyOfWJ
         u/6g+t3X95b0/03PFSj+s27yqjeLutD3VIDbC13D6DwESRzWQSQxePvjVcMGShA0i+TN
         38boZa+Amrcen3Zaq4HUqYus09oYyDAWJHzEHcqGiDE8lE8EUiERKOKDBQLdm19RFMmM
         exg8SNkt73rLZlO+b5gLOfaKt4y1JVSD2mevYxBBaYfO1pL1T8YzPb8jgIRv2lOWPC+x
         5qyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696410; x=1793301210;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Caa3dO/4VfTDyNtGatXLsIdxGQDmPA/zqn6Jv8Yol50xWa8QxRZze7OKzUg15Ohp2B
         NKABnwBbnTH3CAImt/DOWoXg0snrZVJYaT5U04Pr3/5h0oaBbhRDCwiRqKMTVuZJACNf
         ABir3YxFniqbgAkFEl3xRcm+515Oke/JzP3uz3A3sRr99Z9AMs2d9QJFw4YL5OiTWPui
         MUYt+oFL84Bcxi14rPewy/bNrsAfhxCPcHeyE8SXPv3v5d9uUhjgvTwTddLzd7ZdL5lW
         YORKVt1Q28wfgSbpwps+wnj1IDJgkubiZEH8TSC9xKvZy6HHUl8XHRGjQT4mIdQSdGPA
         UfOA==
X-Gm-Message-State: AFq9FYIhaw6crIp+LW5AbnSE+pMwTqVkxc90z3vA+53kTZxpwOgwIA4d
	kyesUa3l4s/g7OtOgP6vL42+mqSqUPDKR7tanDi3VYfXuWcgtDFNT2xRbuWM4p2m
X-Gm-Gg: AYBFou3zcr3CDyhRNcoS0SK5r1uhDp0BU+n/pY/aOcg6+OGQYWSILUoOl0rMyE7TBXN
	O45l2NdX8Vyd+dEYfUvMX/16+7VWQH+Pocb507z7E6s9uzvhHp1VDtEcyupg6bD5tom2Nb7DNzC
	sPKdfwXbdfT0q8F9JEaHFSAHRmbFNiiuOCaUqlxAvar0ZH0QH+cQZI/qbx0xyYCmgmY4uk4JUGD
	VIsA/Y7xbt9OfyMpPDeMzsJcP7ozq3zA4td2AKBw7r9zJdle8WZKI1/lJy6skfq2nOWhHyS5u5m
	H1f2cE4vJ47LKYR7U17QHj07Wwq+aOVrzj8e/SfUBLsWxwyL+Vz2unpmNOugiEa83jwuLliWfEM
	USCF1Oa4Wh15G1+OQmIduxvFsSKAfM3D+UIg/XIHVi/3bO1cF0gya6XzDKDOEACb6YLPTf1viIq
	KKrxVpMutmcjYCgZW/9Wsun40zGM2Hjz2KGpXYafyqufh8YgVjWggIqb4gYZyWEJl498HN9hLqk
	HcTWqCH8ZOLkPZ6lHh01TqOj3MO4drfmNMHWR8dtOh1EMYqndADhRuLff9n9WvGj46ARiO7UbsD
	AQmBXFqpi0IVj2qV3oa7eBBAhCqJMfNPQhaYRJsgf6TtCr+T6SVqI9SojCgPkPrcCPmpi/kqqg3
	MFykqYwj2/6dHXYNeGTAUJLH/obbYM7sj36kQ5R6b/B0qHTmcWMTz
X-Received: by 2002:ac8:5f96:0:b0:535:a20:8277 with SMTP id d75a77b69052e-5369b46fca8mr99452051cf.10.1792696409969;
        Thu, 22 Oct 2026 12:13:29 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c18b52d5sm17771cf.29.2026.10.22.12.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:13:28 -0700 (PDT)
Message-ID: <6ada6058.a56822fe.364d81.0605@mx.google.com>
Date: Thu, 22 Oct 2026 12:13:28 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: hthakar@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 2/2] grpc-go: Ignore CVE-2024-37168
In-Reply-To: <20261015044008.538247-2-hthakar@cisco.com>
References: <20261015044008.538247-1-hthakar@cisco.com>
 <20261015044008.538247-2-hthakar@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:13:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10135

merged

Bruce

Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6785.1792696160650782700
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aSPPvypM;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93e7ad9f78dso11720885a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696159; x=1793300959; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=aSPPvypMOwSazsA8yKisbgzrEnjamxQQKej5pC/dvYHF2CmfW+qkjaTFdtS6YfmrYD
         VzR+pLXmS5GTGpyLTOEghMouk4QX1xajCiELCbw4ooCJ3+12/yUh+REcKMVZ4KAhX5xZ
         vmDHSo5CQHCqNvA+y96RQSQpTxCARzoNhobW6l6drPsVeTrm/ha0bgmn2d9d9LOso9Jl
         n7GT74FbS0VfhUl+pIqk0qBeieQ4AbrBuPWvJZevf5rtDL07Ez2Dr0pg25iAbH+Tck3a
         MmsQjD1t6pkfwbl58C0Aez5SnJ/OW8UjTxtljpU5cVA8toIAYfSNRjwnF0D6AuFmHdnJ
         NCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696159; x=1793300959;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=ZI4rPws+6awBXXQjCNvF+RkjKqZ16z+8IaEQKBoKjnC97OkA2/AfcmzPVpDMNbuo1U
         LJZNbc7UDrE5t2KvphSX+e0EjxpAVbAF1h/swtKfAInx2a4buvSiRYK4+OBCCDuAsern
         4nSQe7YIE3vaFs4+P9gemd9T4LCgtWPv3yzCyh89K9i2Sfm1wkBp2WKf1tXSmQbkgPXI
         Vh2O284SxczD68Ij/hwwbbu9lb38bu5qWfiyoAgpOKK0HKtyUmvNiVon8RZD1EPJkSDy
         tZWmAfefSnRLYRNJ23efukubxO+7Of8d+XYF2gRQMLaGWj47TZKXpN9u5KhsSXEJO6na
         SszA==
X-Gm-Message-State: AFq9FYKCM+JLVX0W1MpDd2zBy4vYNtxv8eAx+nDXpMRUATuE9RrD7ym1
	VBz/sk/2TAvIKf4aejmqbzAoc7J5uXFYzrP4CueYhP+viHCuD1e0U8fIFSL/PIVZ
X-Gm-Gg: AYBFou2ZpIp9BXa1QH/4ejWD/bRJ5v14yLc3PK4tW6UfobKstHWbMdwpJT/xuOXBkvb
	wE/lyuakhdnNtRxInMQ9onlLzVDFEyZdJXBipF7mtM6n0LXNt/tTJ5FhCxJfXq4fmV+HcS4HISY
	tRSIyT4BXciP+pqt3V4l8GxrU4FN5idZIVFdmj2KOijL15AGPQtD2i8tA0KB006F4uq1TkhipEO
	KIzfYRVlri0HQQP99KNXIzMvYWjnTg33avJNZDpeGBdh+8JRHnKD+6NAfMfOZ7oQ2zk7l+CN5kF
	Zv31ecX+dryLuNiBOXy/VkAKZ7vanC5fUh+2E5ApmYY4D0h1mtCygHo0DyhAxTDiyk5u83EPdOM
	udtSVDTVwLq0gVqR5zH9HNwRCT0NYNh3qJT+nrPvFulbbjcAcQMVyY7m/u12DgDrDD48d3S4VtX
	B0pZcqF9OB7iff9yrBm2DoNgFCQo9o+lY5m/dtCJdnCEV2OZN6PRFT1XhQSQVGHPogt+xCh/mgb
	cZjsY+f8j2opdALXdElWvpHXLGfqTVepJ9NPsBhWBn8ko99iqvzPJaB3e72dEpUiDRvhFZVKw0D
	iWnmcV2Bg/yyot1PnznX9kAA8zBDIngCSKbL1nbANz1AtVw6KZDy8Hagu03feH/NUKYTARy5o4S
	DllzYkRiaEZikUnXlhweqE0E/EeGOsIDWuMjx9AVGTldd9KtHOvbf
X-Received: by 2002:a05:620a:4728:b0:93f:3795:e8ca with SMTP id af79cd13be357-93f6f78715emr70442185a.21.1792696159409;
        Thu, 22 Oct 2026 12:09:19 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fa79976sm27853885a.1.2026.10.22.12.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:18 -0700 (PDT)
Message-ID: <6ada5f5e.8c8d7b34.1de36e.b257@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:18 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: deeratho@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 5/5] containerd: Fix CVE-2026-53493
In-Reply-To: <20261016100641.1628059-5-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
 <20261016100641.1628059-5-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10130

merged

Bruce

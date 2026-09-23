Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4390DC98311
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:10:56 +0000 (UTC)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com [74.125.227.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1512.1790179852545337458
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 09:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pqFAcySE;
 spf=pass (domain: gmail.com, ip: 74.125.227.40, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9d8b323d9so880923e0c.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790179851; x=1790784651; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=pqFAcySEfTgnYj5aRwomQofU9IJmfcvFnaUdGbN3831GB3PpgLvZLnNz88Vqzvmqq7
         M0UYfCYYEXuxJQsC9IEDPfJaAQ9Zuj7mFb9nwh8Ej4ngXekUtL+jmjYLACne7e8eeOKJ
         Ctv0xqMUdldqAwU8hgW5eyKkKlKHB1zsMoHWf0LLewY5CZ6UBtoLF0otZfOC/GvzByFN
         iUYYpvvML7I3cC/FTyZ2GxnvSoiqCY6E3Esy9eI5LPb9K/XlwdIYuaWqDGKVr2hI8vgq
         f0tgCjoAdRpNK+EGu2Bc5HfZjsYgnpGy2yXpei+t+NN3SDKv/uuK3wD7aVSWI6pIgMV8
         I3/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790179851; x=1790784651;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=mXLb8BlbqlWP+SY422vOgsgGM/W1nu1aQ0/mJXmOm25E6C0KARfsd/g+6gG7kf+85L
         CUV8wDKMv/GxzRG072XCyiKIHHL9aFzKJY/t/JmIIHCMRT9HVsQMIjjgj2dULPPZw329
         qThC/mFP9i04NsrFPIkXeGJdUDJVnzhGgCUioikW1Er5uZNGI0ZiivH/XTKRdDklqTZp
         1e1RBCW57wMB+Gq7OORw5RNL0FxxgjexbCq4noi8VlgbDASbx4SN1V/wok2LJm3wHeKo
         zNwsWKHbNvj+vqTYdYGfUfScd9Gy5VZT22EF+sHHqtGmsr2EIPcF54RFdk6cfzoDaeuU
         UNNQ==
X-Gm-Message-State: AFuF++n2OJyptDhRcdyqmPduDQ32nZS3RPWC6Bha/DHjDEwlks94K8Vq
	8x6IFwTnpXAcFrVc4nAc5zYBNVYgEnOunK9/FDJlO47fIwchaPjXJVFr1sibss0CehU=
X-Gm-Gg: AYBFou0rjp8CCHL0k/yp91s87N6J6tri+6wqMm4kbyouVhMjqWD7n0YX6sznAGm6uiQ
	ECvgzxhVXKZHq4bUSFHDfM08ieAHlNRYWhub1zccjvTH2PoAWcFS76GZ/FO2I+HIzadhopOkmfc
	zombcnb9TaDF8/sawAH7nJVE02xe7wg/RB4xodAyWAz5JRZN2s4/O23x8y9DRPZQPjbHbkO6+DP
	v4nfXwigJTvp9Wwyr6A+Ygwt2RMYpZggeQ8vtz2dtH7gwiPuiTCsbvAd7xpbev7We4Jn6q2L6pv
	k/Q200dUhH4gWUjzwm5SrGqVljGxIKDt97C7WYPl/4lOFla3jMMH8ldkVIRWayrmksEVDr2v7lo
	kLKLsxuuys8NZde7t4oqD+3FLUpVS0AkNTvn4r1HztXMzYpZc3ShC6uEVfm3VrLbW9UBCiZPBg3
	t/+6E3wa8jEiJMwV88i15xZMaE5msYrsqsTZOD2P+gvBSMf/5crx4z1gkEY0vEe/uxjuZWE4707
	Ld1rCw6jCOh4SjPcPhvhOBtBLWaMjCTaEaCnjl/ltCmPJNN62oN2rLceWB741UI2ZmsXrffcG1p
	Fst8nEiB/g9rVCjv1VDoa1s6l+1tMh671sNaWHq3Nn9LnbUFLoKBgXNwKRpG7PoRqpgi42bw
X-Received: by 2002:a05:6102:4b04:b0:7a6:dfec:3643 with SMTP id ada2fe7eead31-7ac1cdaa87emr2939458137.27.1790179850997;
        Wed, 23 Sep 2026 09:10:50 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf6087f6dsm4686672137.9.2026.09.23.09.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:10:49 -0700 (PDT)
Message-ID: <6ab3fa09.6264433f.136c95.efdd@mx.google.com>
Date: Wed, 23 Sep 2026 09:10:49 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: koen.kooi@oss.qualcomm.com
Subject: Re: [meta-virtualization] [PATCH 1/1] image-oci: use rsync --checksum
 --no-times for cross-image layer dedup
In-Reply-To: <20260923140433.3632759-2-koen.kooi@oss.qualcomm.com>
References: <20260923140433.3632759-1-koen.kooi@oss.qualcomm.com>
 <20260923140433.3632759-2-koen.kooi@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 23 Sep 2026 16:10:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10093

merged

Bruce


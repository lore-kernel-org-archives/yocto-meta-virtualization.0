Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C7DC2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 18:55:51 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49716.1786128942991699137
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 11:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ph8BpUCj;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so29457176d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786128942; x=1786733742; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=INWwNpIdMID7F4ccWqWER6tnM8jD/nXW6oC4/fBDRqc=;
        b=Ph8BpUCjLv25T55Cl+nEJsLHCOOmAMN5Sf8GCfWGJr+va/0/v3Q3U9KSz80cHR1ejU
         Wpykc3kSJ+tLSH3pLTxZTiQj6dqkT0ovCCp6rXIxp3lj7Dq/NJy4nhAIyNYVTyowbcci
         GmqictTvIGiUzqHDHW8A/jmoTIZiEybjWSMOvZCkWRmbF+TAZEEx8FzKlUNEkjyAeV7N
         yZib4Zo9NVV/SZRpUR3L2X+n4SfHUem8B1P8erpA7LA0uJfoycE0sM8M1qSsaIW2kECg
         54J2QUHSlhZagBmv2drTTGztXWV6CIeDUekXN8MuMkqoZSjHr7h4yRvLjKV8Yq6lYJ+9
         Aj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786128942; x=1786733742;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INWwNpIdMID7F4ccWqWER6tnM8jD/nXW6oC4/fBDRqc=;
        b=Xig3wZRufZb0WMMOqO2wfwFMP96sbJi7JPlDUHbn/zzdAkf4NyJ9vn74mXnwqcjC6L
         RVfSoJHYzrbz3HgHtoJfldL4B3Np7srJ65XoJ8EIbvHQENz/+SVwDlt2ZncwhCxzOEq8
         +oCNF/KB7nptX0W9HRqAjzgjYgYC+ICqroCIAPGEEJtW+gf9zDLsBADNh31BMrvb5RCj
         xLm/ySgjaCiNSQLjgz4wzS9SCKQoLI1y3IID4GY4Bqfg0glRYLiQvQMunSMqYrXJg0zQ
         RYEikgpkzi3XsjIoCcT7+UFnGmRvEqcXWTUsnT2K7vSEsr7slLsf9ueLZTs/7WueQ2GK
         8/0A==
X-Gm-Message-State: AOJu0YzJvjjviUHRQ3NafjYZgcPM69BmF1ZdMAhmdn3UI7Ruv/P/fPF3
	oC6IcMlufIY3NqmoYH1hiVVGJF5wVKh/fNboEldNlQVT0dGWLpSdfDlTxl1cTicw
X-Gm-Gg: AR+sD10kjyUj1EkI2BeyLV8mHkjvKkctUwiNBdxS7wReYQT6V6pm/CDIqHUaJ+tz60G
	4g8TvHs4cUFGKlF2MiW3LcT+OtJL7+SeyKjuJUPcOAQXBhQyiCTL/u+2YSq7C6k/N2wXabCHNdK
	RUoKqw8eTIr5bEl7i4sVUlKZmYWCBpitWklTKX5Dd5x5LWJW7mozRmhyszKTu1Wyr1zJkCK7YKJ
	VUQrmNf4+JQdzSuadr1KvGtHIOakBGQM14neLt0V/ed71BTaEFDgFRs6Qr+fiUJo3zewiBnoF4K
	JnVG7L/ScJ1yDgZS0tyU4p1Y6BOOJyi/3m58tXHjtm3xo91778XjeHadbbKa5lKi2KCLplAcUuj
	dXczFQjkzt7xOoLL2JRBaBPCEKYd8/vIl4k+lOws+WoDjVsFFkNPIGiBlxd+fzyNsyrrBe0ID/C
	5SaG0L5KugrGKTpONFWML6Klie1RC3LklUpd6VHQZsa3LhwJUc/ZnsNMVItYddG+BGzNxiuXSHd
	vrtAvcolsUnrepDBLBudsUpUNEAw6a763aZoELvTqiZ2kp89SPSWhue4s7/wIA4Y/6X4Ts56cbe
	T/v41aSnRRF6CRijuRlPd8Blc4mjY/rTsy2rhrHVsp+PsEe4yESRBhrCYeHi1w==
X-Received: by 2002:a05:6214:3912:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-90a346e2a01mr33017966d6.29.1786128941696;
        Fri, 07 Aug 2026 11:55:41 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a9348e70sm14972016d6.43.2026.08.07.11.55.40
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:55:41 -0700 (PDT)
Message-ID: <6a762a2d.0a531e61.138fdb.127d@mx.google.com>
Date: Fri, 07 Aug 2026 11:55:41 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization] [meta-cloud-services] [PATCH] fix license error
In-Reply-To: <20260807025036.1571-1-wangmy@fujitsu.com>
References: <20260807025036.1571-1-wangmy@fujitsu.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 18:55:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10040

Hi Wang,

Individually each of these changes looks right, but the commit as
posted bundles ~5 unrelated fixes under "fix license error" and I'd
like a v2 split before I take them. Bisect-hostile if any one turns
out to have side effects, and the subject undersells (and mis-names)
most of what's in there.

Suggested split, one commit per logical change:

  1. python3-*: use SPDX-2 BSD-3-Clause instead of bare BSD

     The 11 recipes that just swap LICENSE = "BSD" for
     LICENSE = "BSD-3-Clause". Pure license syntax cleanup, matches
     what OE-core is asking for.

  2. python3-django-nose, python3-nose-exclude: drop dead python3-nose
     RDEPENDS

     python3-nose is Python-2-era and has been removed upstream. The
     django-nose swap to python3-nose-exclude belongs here too.

  3. python3-pecan: migrate to python_setuptools_build_meta

     PEP 517 backend switch + the scripts= sed in setup.py. Not a
     license fix.

  4. python3-pysnmp: replace dead pycrypto with pycryptodome

     pycrypto is EOL upstream and gone from oe-core; pycryptodome is
     the maintained fork.

  5. python3-testscenarios: update to 0.6.2

     PV bump, dual-license update to "Apache-2.0 OR BSD-3-Clause",
     backend switch to python_hatchling, dependencies. All belongs
     together as one version-bump commit.

The 12006 open-iscsi-kernel removal I've taken as-is, thanks.

Bruce


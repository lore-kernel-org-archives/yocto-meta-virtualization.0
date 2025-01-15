Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F04C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:39:42 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.18072.1736937575768531930
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 02:39:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ldu+3UCh;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so668955e87.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 02:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736937574; x=1737542374; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UIvirEdj188miRsgtJdCV4eot48VJhgIhbVjbWSvbP8=;
        b=Ldu+3UChtGMqaaw1shpvmvJzLPQtXtNE7G7h07bnoAjQa8Vq2PTGcsh2mao2IHKz4O
         xJan5I14fp4xKbbemQMZIjQapSXAONa3ykMRFzhYcgD5Gfk7zjBAOuqpPD2ElnGkuO33
         wT7v9LS0dCFlmrEmOLC0gdqPXkH3Y/CKwc5OtomR9UHMnfy7ngWQh95sgps/aFn0qQKX
         PWFWoJHDQrjhAhdCqLSoBt2TXPU/TuK9cm9dVmfMe1zEGO3XhD42ekAAYc6co0tcYuU8
         hJatrgNNlJSzmw3VWsFN7EwTrqJ0Y/HTTWB79rGfnUpQ1O+ST5w3y/09wTU+VsGv6TrO
         g0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736937574; x=1737542374;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UIvirEdj188miRsgtJdCV4eot48VJhgIhbVjbWSvbP8=;
        b=By5Y9nu8RuCMEptXEEiWVohbj08BI0mOuvypjJ99l5Y9RLxk3af690Qx96cJ4eyRC+
         c4cLVqYrtGZofcW9OkWhEADWxuKdagvfioo88zM1UTUGW91ZDsieqQ2hsJLewSQsmHZT
         awvWbQPOXDDWUnb5DmvMhaVKIG78IainZj4SlpWRS/RDIBPRGFvHLQSUyyXLnMOixxwK
         FxYv7UGqZipi6yHyt4K/xV6zOQtvAAorsbUOAr4LrTCfueUkcZEtF6BkXdPxGgoOMXP1
         qHPm75IzYhGxQXxAgEnwc+D+QGMLCuQctsbgKaADuTPZWceyCSrG7rj2N09+3s8p16Hm
         mAyQ==
X-Gm-Message-State: AOJu0YwtZPqSbicrFJW9FtUP31KSzM9BN5I5KjaC4tW6gYChhTGRtbXI
	shbqVH2X7ibjcpI/55a1jxWzB10wEhgtCswdS5l7nqcb3I+8iwvqLvO6y3ZIKFpEXnCLHm1oNu+
	I
X-Gm-Gg: ASbGncvX35onuRscFI/Qv9K157eQ5tu5FVKFrQFtQ1ZFbu3KoZAxlIB7vgmRDket89Q
	P9VT1z2BldWPPIBTAn6nIDHSDNllnkmh+R642kcvpCHbV/unZZ+pFKwsTWC+/kHLbSGUkxC7KZA
	BH9BGrXeirySCawWoZnE8kX1KsNDT9nsNylMFXlgcdpLJr5dIknW/bYk8T+RZ1dUcgvIFVf0EVS
	YMJwGBChUiXjh0GzJ76J30rapYIbOezWEix0DOimsCnnU0FC79e3NXHUpE6CGKOBktPKI7DRxzg
	tWrt8w==
X-Google-Smtp-Source: AGHT+IFr9m4fXAemahGz9EVXNkFmIf8Mx0PY7BhQGgV7fr5uMK6Th1Eyh+AFUrf3MYG+gyJE1ttGVQ==
X-Received: by 2002:a05:6512:1393:b0:542:91a5:4b90 with SMTP id 2adb3069b0e04-542abfbca10mr802825e87.21.1736937573238;
        Wed, 15 Jan 2025 02:39:33 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be548desm2021626e87.107.2025.01.15.02.39.32
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 02:39:32 -0800 (PST)
Date: Wed, 15 Jan 2025 12:39:30 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-virtualization@lists.yoctoproject.org
Subject: k3s spegel download failure
Message-ID: <Z4eQYh2ty62xgoE2@nuoska>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 10:39:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9084

Hi,

I tried to update meta-virtualization in our setup with k3s and ran into
download failure:

WARNING: mc:trs-qemuarm64:k3s-v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934-r0 do_fetch: Failed to fetch URL git://github.com/k3s-io/spegel;name=spegel;protocol=https;nobranch=1;destsuffix=k3s-v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934/src/import//vendor.fetch/github.com/k3s-io/spegel, attempting MIRRORS if available
ERROR: mc:trs-qemuarm64:k3s-v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934-r0 do_fetch: Fetcher failure: Unable to find revision f3d2c40723149dcefc9b219dddc5bdd44cff0874 in branch  even from upstream
ERROR: mc:trs-qemuarm64:k3s-v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'git://github.com/k3s-io/spegel;name=spegel;protocol=https;nobranch=1;destsuffix=k3s-v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934/src/import//vendor.fetch/github.com/k3s-io/spegel')
ERROR: Logfile of failure stored in: /home/builder/src/base/repo/build/tmp_trs-qemuarm64/work/cortexa57-trs-linux/k3s/v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934/temp/log.do_fetch.171833
NOTE: recipe k3s-v1.31.1+k3s1+git452dbbc14c747a0070fdf007ef2239a6e5d8d934-r0: task do_fetch: Failed
ERROR: Task (mc:trs-qemuarm64:/home/builder/src/base/repo/build/../meta-virtualization/recipes-containers/k3s/k3s_git.bb:do_fetch) failed with exit code '1'

Commit f3d2c40723149dcefc9b219dddc5bdd44cff0874 has been removed from all branches
and tags in https://github.com/spegel-org/spegel/ and its mirror
https://github.com/k3s-io/spegel/ . The commit is still there
https://github.com/spegel-org/spegel/commit/f3d2c40723149dcefc9b219dddc5bdd44cff0874
https://github.com/k3s-io/spegel/commit/f3d2c40723149dcefc9b219dddc5bdd44cff0874
so as workaround, it is possible to fetch this specific commit to yocto download cache
manually:

$ cd build/downloads/git2/github.com.k3s-io.spegel
$ git fetch origin f3d2c40723149dcefc9b219dddc5bdd44cff0874

Then rebuild of k3s with bitbake will work.

I've reported this to upstream in https://github.com/spegel-org/spegel/issues/697

Maybe fetching specific commits should be automatically tried? Or repos like this
mirrored in yocto infra?

Cheers,

-Mikko


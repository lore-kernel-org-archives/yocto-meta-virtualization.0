Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5267EF5862
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 03:58:22 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28903.1771819094322930302
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Feb 2026 19:58:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nxu7lnP9;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb38e86cf2so404673085a.1
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Feb 2026 19:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771819093; x=1772423893; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pm7au7+UNS+i+95dqc47M36pHEwVH3ZAIzJexg05gZ4=;
        b=Nxu7lnP97fhh5ghQKkgKecpMoYOBKHy2FaUYcO3cyCGA9HjDKJfbeeyZSU9qOrzuP1
         kFG4dhee0WN9xWrE9xggzMVxRmAc7mWaJrF00ZfdTUO6V9XaTm/X1FMOMGkK0O4R0Ckx
         fN4aRqrucy+NrxV1dmfB1T/1lmy6OGMCT0rIoF7TvbvQXs/gEah++SIQKL/1yR8vmD/Z
         2grVkGkGCHDPwcXx6d0UOzhaZj8NabR3wPudYwMWWQ1YxnvdRRZqIjga2fEjK5nzPANU
         1eop6s6d3aB5DXJoadIiVj+cFiDQ3S3KKWW7mpsl7kAwRhnAUxuI/wzPJoSdN7mTciRa
         +vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771819093; x=1772423893;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pm7au7+UNS+i+95dqc47M36pHEwVH3ZAIzJexg05gZ4=;
        b=HLvfHp1ravl2PRgh6NR8vWJEfF9d8LfNoGIonWMG5nTLnC4wa1KFxPpwTZohTOvebW
         ttvxOijagVVsgD4ZtE9/DxXg3GiUuKWXCt3ta8dTbc3BWFU/emo5e8etdlbv0vh2Rjeu
         qmgT/Y+6IcC3GH+YX5e5iMgTiuFhsEGvBH5yajcIMIdb6i3SltOLk/MFDdYXppWyB3rt
         z8A8Uxeo9A+ppAzjYxsTtrYwuMZEMr1ZhW4Zwdvg1K9LtDu4JrEAuZRpaFML5jOSzV/7
         F6Bu+shKribiaHpnwsVITn2NtEV4FdMhZDu3a7Huwnn6T0oqJI67sP6bI72uoxTk3vPG
         LNbA==
X-Gm-Message-State: AOJu0YwqFjchUXGGrxp3cKTA37alUzYxtbh+lwUs0gziHP6LlfIraVdQ
	QKzUJqx/ncN1wFqqdOIvUkF3VItA9Sm6oshoGke1oSEOkcp1lnKe9Ry3
X-Gm-Gg: AZuq6aJO2CgU2PFbsONrvkFwOJjCOjnFlIPjTGEnxXjAZt8PTfIeM1i3DgOKdn0yCny
	QJ5WwW14hCETZ2LJxo2GS2RkvQ2MdsKwKsPZwmRjXbIu67z6geUgzFULx1VYtUgjysDVM3ZqNYE
	oTZF+egOOiIyKdEbw+XzmVx6DvcZAS3GbzrMjZO68Xf0zDcda0AlX5oFQqNcBo3piCXD205aJfB
	Ievdy6dr576npn4vdFyo3k4arjqMElSzBne4XuwF8ivbfRBsula3yGYVnLlpv+ekuQWScRGa5vX
	HLF6IrYxUrcY8FOrDORWf6AtOlOcJwExBzivy9xfVy222JvPjoAUXMfvcHNGpAg8r2+Tuarqo3M
	+zFS96z6ExS1YNwO6vD1OWLSft+kYCmuftjJaJ3jCCNTj6udEqm4wiInbHAIvyF5QqqcWOAdtUI
	/OmfRE642236aFcJI0z3vZSKPOKvHRB+SFJf+cOTN903ATsxlUFGGRvk4qnhItNi1k0d3mjr/B6
	C+vy4btdtrCfJRm+BiN3nS6mz/KquhSgROX
X-Received: by 2002:a05:620a:414c:b0:8ca:123e:819c with SMTP id af79cd13be357-8cb8ca0fae0mr933596685a.35.1771819093232;
        Sun, 22 Feb 2026 19:58:13 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0729a3sm614609885a.22.2026.02.22.19.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:58:12 -0800 (PST)
Date: Mon, 23 Feb 2026 03:58:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: felix@piedallu.me
Cc: meta-virtualization@lists.yoctoproject.org,
	=?iso-8859-1?Q?F=E9lix_Pi=E9dallu?= <felix.piedallu@non.se.com>,
	pascal.eberhard@se.com
Subject: Re: [meta-virtualization] [PATCH 0/3] Update docker-moby to v25.0.9
Message-ID: <aZvQUy2lluwbVT8f@gmail.com>
References: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260216-upstream-update-docker-moby-v1-0-8ddcc5b7ff63@non.se.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 03:58:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9604

I merged a set of CVE fixes to docker, and this no
longer applies.

It isn't that I can't fix the reject, it is that
it should be double checked to ensure that those
CVE fixes aren't duplicated in this minor bump or
cause other issues.

Can you send a new version once that check is done ?

Bruce

In message: [meta-virtualization] [PATCH 0/3] Update docker-moby to v25.0.9
on 16/02/2026 felix via lists.yoctoproject.org wrote:

> This patch updates docker-moby to version v25.0.9.
> 
> This is not the latest release of the v25.0 branch but the latest
> supporting Go 1.22, provided in oe-core scarthgap.
> Updating to newer releases will require updating go to 1.23.
> 
> Signed-off-by: F�lix Pi�dallu <felix.piedallu@non.se.com>
> ---
> F�lix Pi�dallu (3):
>       docker-moby: Update libnetwork
>       docker-moby: Update docker cli
>       docker-moby: Update to v25.0.9
> 
>  recipes-containers/docker/docker-moby_git.bb       |  11 +-
>  .../docker/files/CVE-2024-29018.patch              | 344 ---------------------
>  .../docker/files/CVE-2024-36620.patch              |  39 ---
>  .../docker/files/CVE-2024-36621.patch              |  82 -----
>  4 files changed, 4 insertions(+), 472 deletions(-)
> ---
> base-commit: 8b1543e121deda2445f80f74d85c10316d5b31f4
> change-id: 20260216-upstream-update-docker-moby-d0826db5916b
> 
> Best regards,
> -- 
> F�lix Pi�dallu <felix.piedallu@non.se.com>
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9591): https://lists.yoctoproject.org/g/meta-virtualization/message/9591
> Mute This Topic: https://lists.yoctoproject.org/mt/117842532/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



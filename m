Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6782.1792696157202716089
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:09:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=av4FMnyA;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5364d86f7f0so646721cf.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696156; x=1793300956; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=av4FMnyAMERwQ/vkOVcS+EEdM4Hoc96ViDDbFchv7CStbCoXGBRu8KI5lDC9cGVMUj
         xr2R/ifRAbGXj8g4f5WoAZJwcX72xeMtBf/BypYVuN9rlBh/9G0fWddiRuWZmDjxa+zn
         N8m+bphhl6mbhyWYMnN78DEaAkkQPNSzq0Vpa4kKhvNMOjbVtZeGoMV+hwYat/MUPo9s
         K8f0bY7AmG6BU0c0zJZFxmTuCzcD3ovZMK1zBElmVNk0w1JUC6QYFbvRtilY+KHreXVS
         i0SKkK2xyolA2jQqfH0QQHzarHs/j8l3Vu1/FLhyF5s3oKsn2eQzL5QChgaZYoi6wOQ/
         Iztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696156; x=1793300956;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Jnuw2+4Fg4GGhXw9kRqdhfOUDTHPTCTO+uHuaPit4QpAz49Au9QV/fRgL4tdr5Vo2c
         edDVevEloScJp0VsoAcxrd5CaKS6T93j/HoRzM6Gwg+lfS5IgoxCe3MBVPee8knep1Px
         Vu3yCs23Vp4MYHcu3Zz0YsaYdfD+A3b3HPXNnmYtGbcg6R5OK8btYdU5+ZQJvKpTcUrY
         DdNMZ9gk3jFdu4jDjcFdBr3ntc+L6g3O6qlV3YihpmAd1qINl0UvYnhjphyly8aeuJf2
         WhpGoDcKePogn+gRHqIIUrVJ2k+AeY4nkOfpocFU3iaYbfmyWLoaKhWNDusekdSt9nUA
         Nzmg==
X-Gm-Message-State: AFq9FYLf2RE/tJ7Ly0cEN+oAib/ePmXilO78thAuZpUozwbkUzUB194R
	vqqiVCOjyZMXpogmsemUN16CKrj9uAe5tZwIt/xcgaBEL0Ty6iTyVeY3yzeUTo6H
X-Gm-Gg: AYBFou0+IdwQliP5reUJSGY6wWzH3MVX8+iU23ZkLHF/27MikzpmQPeW23ExPISDb5j
	DF39SmKUy+uwhTQ7Jxs3u/wWVa4CfJk+CblLbwTAcUe5LaNAhiLZodduvbFSFIFPsbgqQJKi3bX
	5FYoAcETaJNNr36wzcygba/DCcnkHt7tl5vX6ocxbOT04RhxY5RRsEzv1pATC8hZSzwdaE02RKP
	yDqRWX8pI9qXODQYtfe4PdH2g6+B8s+UKpYQblF9Da0hJn5IpzzM6xxmPXFOEUtFqJ8Vrjbm3zH
	AFa6TA5+VAFLoF2I2UGgRecyaGPSQCUWIYR4I3P9UsnQGPumCpvyPvrmJvG3ExtXX8sOVIlxS37
	Eyj0MeSJRAtb6Y5ytfP4Jr83r9AIWuDQyJipAPV+S7eT3PSTjgerFE9gSk7oefY3IfE1QHbGG/7
	u2mctIeXoJg7yscHA+jd78H36FnqzGixgIjj1LszApcS683dn14fa3UmQLlM+oC0vziNsE7b3d0
	g16MJuNaF0geAPD2NBVeAa/YYfGeKgSARvwrdyta56FerJzltA2WSQA7X9gWYwgzhREAYlJo9JW
	HR7B2Uv2DoJCV1wk1D9R53iw+QzipvOBUvwoQkFGP920Fi9QmXt2PuYouaQmdMLptL2XHYvLqUJ
	+nOBkXDRwvK053aJlwR7esGaeCGtZD/WdYZnued3vcjeWRXnoDK6F
X-Received: by 2002:ac8:5f4b:0:b0:535:266e:f121 with SMTP id d75a77b69052e-5369b5aa8f7mr99128761cf.1.1792696155942;
        Thu, 22 Oct 2026 12:09:15 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c183720bsm8361cf.18.2026.10.22.12.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:09:13 -0700 (PDT)
Message-ID: <6ada5f59.24304cfb.1254aa.02ae@mx.google.com>
Date: Thu, 22 Oct 2026 12:09:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: deeratho@cisco.com
Subject: Re: [meta-virtualization][wrynose][PATCH 3/5] containerd: Fix CVE-2026-53489
In-Reply-To: <20261016100641.1628059-3-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
 <20261016100641.1628059-3-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:09:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10128

merged

Bruce

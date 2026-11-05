Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.593.1793897423335393083
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 08:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ZNnYTcuB;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f3c89594cso188475085a.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897422; x=1794502222; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQeNeC6N2fSY19MPnr6nUEdh+d55MGr21eilvQIts9A=;
        b=ZNnYTcuBCWGov+JTBHVL0soTxDTFZR7ZCHlpc4ZW6gIi/Ehyrtv7XT0X4ao729sWFi
         dyDBm4v8TVom9nX10lGAt7bk1ne/AWFZiNIIET4oKfDvhzlzOrUtjMkLvJ/i7cduHwIg
         jW0/KyG47rtQUxVnoaUfhhppjrtQPY2VhsQkE2pm7yGyvxoXYvfBBOqQM+ryuOhx30yx
         LRV49Ztwbbunq8/siiBMOgRIpEEJgSEj6oYUhr4s7n4SfY4zDxhU0qNd0FV+4SDR2SJ/
         gc0BjFwnJfC1V203twMQK35HSCMKYsqwflCCRVoL3OQr6KiQyM9ReNY+/sDYMzchsQNC
         L8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897422; x=1794502222;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQeNeC6N2fSY19MPnr6nUEdh+d55MGr21eilvQIts9A=;
        b=ZvEuXDVUgxS3SMjvmEcwkecJsv8gv6dLhsKvM66tyxocZ8ZC6h53XqIbRboJQFj+SP
         fv3nksU3iSFgQ19NaXZQavgbzBff1D1n8WtdqixoeFCKiIDcXI5pD/g56KagzUOGT0/m
         OvxCK6t+kuh0uLAeQYYCkgqohPnqsvjuHHx/PdZtchQV/l/IV6zwO//ZhsKSpBg3l8eM
         K0J5AWXTn2GlZ7yAGvIkpz2CodQSMtOaTfeO/HGIJkez+FHmf8ZKAuRxzZK6LvV61nh2
         XBnkhviiq+IB2IevFDmXwZwhW3Km775DynMd4f91uiq28xlqB4mW1VAhUrTWDFqsRAIt
         s/fw==
X-Gm-Message-State: APuU4Z9FVICXHJEXUhcWce8RsOVqbfYhqi8Ae6kCWsHudytWrPtgvwR6
	N70fn/OP7m8w5C7FRQY/uRmt+NEfrK3KU7sAXYIP5L/EV5GTOvPwyeoC
X-Gm-Gg: AYBFou1c0n/4J+VAL3QvBETPDwUzxRvZrJA2a/6mNDxHL3t6Q/9sUcnPaK5uLjOVmkW
	RpUTjKWItrz3iQJSzLmRhu+IgjacvH0mSr60q9MhK9rPpLncECI24LGoIJ9ynxoORQR43R72rx8
	n0z7TiDSh0diUIaVRV60kEGKrKPySej9VFQLnTg8Xh/gG8A3xlel3mhkEUV3eIc7L5D5HgIykO2
	ACKmQiA32YF0D2GtUzu+9sdSZpdVhv+HZ9FbOH3dpGBp9cPDXjhaUm+WJT44S6eZ6gcVcrLBaC7
	jHKQXzUy+Y8JU8LsLywS06GVH15k7amnIU174RwKvQE3VajwkGOgKtbB++n1A2k2SzDNzvcuh/y
	ehYrCy9HbRYtAKRwexm5fGwU9XwG0lM2ZBBoo+RKoRQprTwe8luI+26GxFeQU7KVYtlXLdtxMSg
	U/ZWqYWWW1g0wjX4aeP4PZ7zW5zvpS387lkuDUSsfVuZHaGKt6D6m6gwmO5erSD25i35HaEVkyG
	WdterhYZQNamCvsrMmZMHeCHM5OOcxjUGJhKoBQVbsLnur1nY2C62pPzkmlh+aWxrWZ23tpesHB
	2vIr1B4arYbGvGxevKKAOaqKaBnz8mDFFAiexFlf/8Lc8DzosKt+nHigpolAfLvxHZ47NEQPRBV
	oDGaobwhyiBZLjqzMQvFbyO+V8pE7paTqDPHgQxs3y/U+hfk2cxUvNSOL4FUfq67nLFA/lD956w
	==
X-Received: by 2002:a05:620a:40c9:b0:944:3aa:520b with SMTP id af79cd13be357-94421659dd3mr3519364885a.16.1793897421491;
        Thu, 05 Nov 2026 08:50:21 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d484499esm504425685a.26.2026.11.05.08.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:50:20 -0800 (PST)
Message-ID: <6aecb3cc.1ef1dc9a.2bbb4c.3498@mx.google.com>
Date: Thu, 05 Nov 2026 08:50:20 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 3/5] docker-moby: Fix CVE-2026-17106
In-Reply-To: <20261105060006.1286469-3-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
 <20261105060006.1286469-3-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 16:50:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10155

I'm holding off on this one. The partial go-archive backport stops the
escape, but it also fails on valid archives:

 - a file written through an absolute symlink (var/run -> /run, then
   var/run/foo) fails with "path escapes from parent"
 - a directory entry with no entry for its parent (opt/x/ without opt/)
   fails with "mkdirat opt/x: no such file or directory"

Both work with go-archive v0.3.3. The series skips v0.3.1 and v0.3.2,
which looks to be where that handling went in.

Could you respin this as a vendor of go-archive v0.3.3 as a whole,
rather than selected hunks ? In a quick test, replacing the vendored
directory and updating go.mod and modules.txt built at our SRCREV and
those cases worked. It would also need go.sum and the
daemon/archive_unix.go change from 2a3ab8fcc0.

Bruce

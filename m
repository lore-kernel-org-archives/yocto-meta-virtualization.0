Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FD3C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 17:46:50 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48100.1786124801578625171
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 10:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oa5nyWj2;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-936623c6dd3so107940985a.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 10:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786124800; x=1786729600; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=oa5nyWj2xW+joRwBq71VNyKHqPdp6GRtIliI/5mBmwMBBdTqo8nxMRZbdvVhVVZyIM
         7/aXWYXLQeZuPNmsp1wNNIuiUJ5RNWW+PraS0aXRdBDooYMiPAvK8FmTKSJ+dwZMaQXf
         VJYmwo8mBcHYk48GptE53JEQqFzVrto5cS2MHyFsRjq9pyhbSJfNPF8Bjx60q3Neq7h4
         evtQpQQRGw4lMPH1t1RYkL4WvJr5fTziRj3TMKiulDpSKrpxQ0P7xKx+pzWItU6bRBem
         yVy/ZG5Hnu4VNRdynp2g8yALUpUihTmL4Br/ngmfhcnc+7GnmUu7Z+wfK+eLxyJC6xw3
         WjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786124800; x=1786729600;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Qob9qUqbgWvwNnglUn6Rn4AZNP1B6nNwZ/YznZmnYx9vEK4RTkJFaCNNOoTBOTaenL
         qNkIDJCLs3hwZOfR9QiuhWu27rVK/DqZLctWEc6qRinCBeLZ5V+JtbBN/31nSeHsuQG2
         WlN2FnJ9ZhtHFsGAMguloaANQmhqXPn9AUD5dlvr3ceHuryUB8zaw/62ze2I7fptPIjO
         hXggPAPGyl98C6EebtfMrPKiAp8PsmB2eUbUEmgGLR/Sc4c/nQW51cy33B2A9rDydkSA
         nH600TuTOajKDGBb74TSmSnf3YVk/F+QkaJYJ1IlECGakRe4Sps6hTBO73wYXDzY37vt
         Y9sQ==
X-Gm-Message-State: AOJu0Yz82YL4KiFdz5QZOXB94f1OtYIHkCf7nGFH6h5looH9sjgtjmQC
	J3wQeKZ9o/g/dgXrXqQBvsszrrtbTsDprBub1eb38wbIaFhrNskfn6XgSIixidrC
X-Gm-Gg: AR+sD119dyaL0waiIv73j7leNCPeNVd2fscrtHOQ8mmZP6caTWTBoNZRcUvTTsuCG1p
	cmjn9d1X0TeT9ALmxvIvJc6bpTxFpsK0fbkVw9wJL0Rf6tTrdWIfSo+yc6rjBDNZhtCqz7OeQ0o
	VJp93gDblJlXIwGhqemUYYTL2REQxtzikrjogNkXBg/tPVC5VXZIGgwVfJYdHjjeVNoT7+kbiEK
	b0NKRRmKGhtCfxTCHDzRCG4x+y5x8Fsqx4mOdCtdYJAxr3HFGSHQci0uhDTPAAR4iK0f7L4S91i
	TIEShFSBbanrhoaCgB1YASmjICZ/j4gSjT+uLRO31FxKrN3H2WV1wwcZvR3H7K0gA7YzsKDII0z
	rzEV1tu3X7oFZduqV08eAQhksUKCki0IHt3o+3k9U9tEH0a54ANKTjNnimV2V6asE8XsYECZRv4
	8v0Pc1A+vTfUsHdiklzl81ZSomJp66Tm1/iRMpYqEkt8D0Wyu4ZYuJBeTYzHVDsLa97sgj6VmfE
	C05bEYjpd3GqMN4t414jUZ53Shu9GBJHNvqpv4K29ZShqVWbvzk27kxCnz/wP9kYjYYqN0y8iIv
	3rOxxs/+g854VHjIDECXe1sORIKi9Rk14LIrEPuVUJCSOJ+9QR78YKEAlGAYgXOBl7Xced3W
X-Received: by 2002:a05:620a:2304:20b0:934:ac0a:8bb1 with SMTP id af79cd13be357-9367b5e6d5emr38822585a.8.1786124800124;
        Fri, 07 Aug 2026 10:46:40 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e2ae072sm196167485a.46.2026.08.07.10.46.39
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 10:46:39 -0700 (PDT)
Message-ID: <6a7619ff.04a468da.2a420e.7df5@mx.google.com>
Date: Fri, 07 Aug 2026 10:46:39 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization] [PATCH] qemuboot-xen-dtb: Fix task dependency
In-Reply-To: <20260806141906.2309877-1-richard.purdie@linuxfoundation.org>
References: <20260806141906.2309877-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 07 Aug 2026 17:46:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10035

merged

Bruce


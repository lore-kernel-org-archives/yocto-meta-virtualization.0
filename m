Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.99.1792696404914510328
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 12:13:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RKpHyuak;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5361e313e63so538941cf.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 12:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696404; x=1793301204; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=RKpHyuakKL4XrYAxb2L5A0L+VPhQN2upwtmRT5Be6XgcC3uSSGMsFhHisehQ+wpvo9
         9hHKFeCRrEMW1V6JG3JtfwO8CF2MxGlFgawCYb9wL1C0gZsuz7v9HGXjwSEvlTENYQTb
         SoNHJCjDrbr2My7dFtg4TVNVDYpi9rZykOrzXizpKJs9XWfxN/69c7vbfurK3z3wzTLQ
         10belTrg5fUPf06fm+CjjMGCnBnlXnhMAZShsQjGM5AR0oqp3qTPQ0euGsdXS3H75oaQ
         2O4sbYsEXOFpEzmPh3jl8Dw+KVvUXImYE8rMJf7xD4TZiYdWadmPm4HAzI1j/r+Jiyb5
         vDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696404; x=1793301204;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=ZqBDoxpaBdq1QE5lo7mzCjUGHJ1oiT9LQWt/bqUzL9UDMXUJauexhwm8JR1Xz/c/Qe
         a4e7Xfs5qz4KLK/Bj3vBxw3kFsYkrqxWvgatRGOLBeoERjA61erH6+7ToIy7od/MHvKR
         TBLvUDIQFdAv5+BNCDU64c96p5gzEe3MuKg4K7K1aqeHqoHTkyE6JsHQD2np38SM5Op/
         1ikKV2p1CVX21f57XRntKQhP9OwxFY//yo25otgrA9Vrjp52l2RM/qLKA33ls33Ydo5y
         ba6LTFV5vmcoHR2ojSrmwEq6Dj9fkwG3ds7s7PC1lwzkTIkz8hhCPB6ESwCjaLfi+497
         BUug==
X-Gm-Message-State: AFq9FYLASu3Ck8Vq2Qi+Ht+wTsAL3r9vix7DsTPwWzFH9kTU8+jrKPr6
	MVp5LD7omssCG0ZW6aNwq9dtUgHgyWxcQysuM8OVqYK5xeLRwUefy+ACMPzi8FH+
X-Gm-Gg: AYBFou128uFuQGGM2/FXphe/SX56afsBesek9uHit5sUAPIykfhmKrxLFVBXmhAdA/t
	f0IXwhQaNUQIbo/AVcEe3yaNbwymq/uVyC6KCKXjE9IBHq787xq+P3E1oi/hZuAbva3LrCWn826
	AMkQG6xfbqaI81H7ywZ4lrZZ6BUK0sX2S/vFyh0hse5gdzGtaCiEjVS2fh29cN5tsdxybry3xj0
	UsmikJF/03vL0RSkYfgc7B7V28kd8DOJ2ntdaD/ABAoRWmk6mBU//eNWul6KO7O5YuG8Dtiz9/E
	08+7cKmECq9LE+bOLj+Zs1rO0h9Mmzd1BYJzHjbmTS87w3mJbl979f3xCz3JQy50eqt9TRTyHhM
	nd/SVECuoHhr9mcoYMx5FYIQ2OtVtCSviaZPP8Ee9XUJvvK4Vm8QkWCvtyCDWaizpLEpmVOUap5
	oDjUKwjuLcovb6XMERodvLgAVhaf8PCpwLJ/RTl15JdVeKXJFqMktD70c6XqtHDkHXHdJIOmgLJ
	g1/01gzSrvE5huMIE+s4Pa6Z5kMUlImcnXEF9o+jVMxPHYnrqNA2ceAeUIOLClb9Y6TPt9phONS
	jwGfu34kHFYooSVS/SbQvBuprdog3xRFRes5/eoXpN64IQpPA5a2Uy7/rYOGx/AR5SFj23MkMhE
	jQhuleowdfqwM1OXLDP22adh4+DVrYCPaSSKLMT27ynspGuRd7tQDFw==
X-Received: by 2002:a05:622a:c07:b0:536:719d:7974 with SMTP id d75a77b69052e-5369b852a77mr94864811cf.55.1792696403569;
        Thu, 22 Oct 2026 12:13:23 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c1872a8fsm58721cf.23.2026.10.22.12.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:13:22 -0700 (PDT)
Message-ID: <6ada6052.49dcfff9.2ede31.13e8@mx.google.com>
Date: Thu, 22 Oct 2026 12:13:22 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: harish.kore@windriver.com
Subject: Re: [meta-virtualization][scarthgap][PATCH] podman: make manpages
 optional via PACKAGECONFIG
In-Reply-To: <20261005162333.1040257-1-harish.kore@windriver.com>
References: <20261005162333.1040257-1-harish.kore@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 22 Oct 2026 19:13:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10132

merged

Bruce

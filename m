Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E54CC624D4
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:34:19 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8153.1788269650697835817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 06:34:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MPmw/wJP;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c250f28f1cdso749707466b.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 06:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269649; x=1788874449; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=MPmw/wJPl/EaLZeto7AW9bHEnsgr5X/3bKmeEIUXxpF/VM35D/eg+BAQUf9uW67EMJ
         t0+/V/pt63+yq+eI81cKtHlhXHLwLKt5yVt0xBUS3+GFYeTSUYzPBK485aOL9i49oJmP
         +GWlQ/CD3ZzcyPRXnFRwR8buEzKm5ONaeZLNiiaYs9u5cRNkuiyZpbxUP5aRhqcRZkoy
         U2injz6etWDXB4Ims8Shfgi5EytqPvVVPIiyo80czIUiFaOXu0qpWPNUJHOUoYXC6S6+
         tmWvmu9LQVh5U8fsah6pKlsRx6MmTp6KBmg5jQmqDTcgxCLwLNAcrixNbjpku9ukmFzv
         W2Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269649; x=1788874449;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=KzknemYaiuXa6kv/Pm8GQbZmRjwt5gZ3XD6OYwDd7/cghlqNb1Wdx8XUyT7w7Ay9aZ
         3fTGG1+k9jX4YYwm65Afez/gvUhge4y09cb3H0PFY+vTdDA8uFtEIAgl0bORww2sIeF6
         cjTGccZzy+zEmxpVsY18anXDnixdkWS/+Bjz0Mtxp/9dys2Qu1AH1Pl0Ofr3pceXDWl+
         pqu558BG2bV2n6/kDKaGyVuuLuEVyoPEg9gbmn0snAEhT2Q79Fbtdt24jZGRAHX1BrZ1
         ZhuO6vAbxKJmoe03KW46h5E++U2OcUMbP5jpgjohHNcaepqkWwIyyARrK3Rf7UCRjULH
         PXIg==
X-Gm-Message-State: AFuF++kTxbJA/rJz0v4zG+I6jcqOuecwEkhta+6sk3V1AumiOp0uzXzu
	ayOuIEngAm2qWAl04lPhxGvy3JkF6nwexR8XCAGz9WfGgpKtPOzJE2ys
X-Gm-Gg: AR+sD10OY2rKLA9s7xf1kipEmw/zdBdnOzWeRa3y3KOGksU7dEVkuxFQfqA0uGoyDZ9
	Tyyi+7jp/lDaLbAcU8qBLsf7tHKkwvf1eBhS2slf0F7tr3NUMyvv+8ed+gUm+Xkm81iR1Cq8ny5
	GLMifjCQiMipEA4TwKhvJZEVnrySF13f7gczaBHfApKue2WC+IKurOtsT0M+UZjtEaQQD2UeOWl
	BTVEeXf6hsgVms7JlXDi58FA7ySP8aif/i+QEvsLP65UFCZRYQH4bUtCj84IIXZmJbypj06mZaF
	EMsPpWo+FmRlJoHGMZfEJkV0hJVcg7gtd6CqcNx8BdEq1MP7UOJNaE/mBYSwNJECH6O9Ayz6Jm2
	4MnqbQONDK0xNYr77KwbRa95TiJIc/6FMIAxPc24bo/r2RfgClQ7HXaP4UwVTnamogrmBmvH5vd
	9euRmFhVSei9sijO5FQqRH4b4H5q+vX0FyHCSyU6yT2FBXilyJz7nrHYZIhurr8AhgGdep9aZhe
	d4MSUc7lnMUtZcOZgocs2U+Ur+8+XouCGQl2v5z95RdHIst5V4ur7QeVuQdaH2ZzGbFK/TgCPDh
	XtgT+Xd6MehXj9hBVxtmzCJaT9/QgACvCp5STnCflDjD8lyfI6RMhAeWzO3b
X-Received: by 2002:a17:907:c01c:b0:c20:af9d:454a with SMTP id a640c23a62f3a-c25571deba3mr2248484666b.16.1788269648449;
        Tue, 01 Sep 2026 06:34:08 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b233sm586553366b.11.2026.09.01.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:34:05 -0700 (PDT)
Message-ID: <6a96d44d.be5b9433.13ffe9.7e98@mx.google.com>
Date: Tue, 01 Sep 2026 06:34:05 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: devanshp@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][PATCH] python3-webob: add CVE_PRODUCT mapping
In-Reply-To: <20260821050846.51825-1-devanshp@cisco.com>
References: <20260821050846.51825-1-devanshp@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:34:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10069

merged

Bruce


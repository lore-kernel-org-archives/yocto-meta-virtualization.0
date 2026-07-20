Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF750C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:27:09 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8777.1784582825893467028
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dh5pfgvO;
 spf=pass (domain: gmail.com, ip: 209.85.222.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso1717302241.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 14:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784582825; x=1785187625; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=dh5pfgvOhn9cx1K1SvvNMkX3YufluggzRZzb5IMjWrqEQqak/Jz/iJb1KM6C0HfzpQ
         s+zpyS2Fiu5iKBM5JRIUhypxzC82AAgcjpdSEy07Gg+4CLuT2F9uDsKCl4WwSNXwRQKs
         NiZKjpNbKdvRsfo5bx8mxZfktvJEbMqC7eu5duAXwz4AR5OkpBWFnZdWxoDJuRZXwkol
         ev2v9m7xLyscfsDwazi+PAsJ8SEdMD2VViOydCcxHw7cWTn371OOaDOWymYS9iqEsR0I
         zoGBIE3PdfIPTe7y0s+tJx9Vb9IzWvaP/NzUE/kErcLfJdYuQJrU0Z8CWppe8hS44SN8
         3h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784582825; x=1785187625;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=jxVUHMjIrRldGWnAl1oL20UShUjOySIeguk0zSBZIfu+5K8VZ8GwYaGFgh9XENuZ6i
         IJdlnbMZFlZ89zT/W3bQkk9aoZvm6f8ccFxgR5xszKxL7uoywNTDoE++t2l86X/w1XHV
         /F7OgnQ8JPCBSdzS+tLtFFhYTYDoje659CzQ9gnPGrh775BUymie5z/ZqHQ6nqg+aIIE
         wgEkgHXF3lwxblVSHDF9StbhpBLWn27231S2gTWvxoRGzVcqoVyw9wWI73axkfVzGs7t
         VYYMquJX6eBA3xEgs+x/aXgNYIQcyOh1uPZxwcPQxsQzIZE6WV8wV3kfUNjfnk/7Llmu
         e4MQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR2/6WzIiaYtEsQe5QSy4YL0mIYaNFn6RQlFYZSvozb/PsZ8blU/QdtDdvqpsRRGBuEbjM9SgquIeMI1NVp4HfI0z9@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxfKge5FTtaolOJg1Pquib1sXE3wENRLhgJl/7YtLfERmegh61s
	b2KrNjHeeaGYxKVO5gBAULZgUhLc8KnYCthHbeZDx9BVKWIN1I14DQ/POggOqtk5
X-Gm-Gg: AfdE7cnFn0sKNcslwk87bKc9/9IvGvz1A718nmxMjw0q98vtNfP3cRA4P9SH7lFWYcb
	cNqQ8elay5s2BPAa8RskSMXmIi6Tw9Mr+71ECLvRE7HyFKg9Ai/h5ssSgJir0ulvaSOpyTlmMSw
	QiPmUOKtv7QAIcDMIcEScjqGIpzk1N2PmzyfylG8MvKaPuHah3to0mfImBvWDYJWSuSWcj6/N1L
	ISFmM72WaHRwAQgoNKXDeJn8voLqAl6IDBVYKGkwrbfF6gpL1599NW+lUEgYUzhmG5z2AsgBQki
	7GLpt1ucG2Kka8OvefJLYm6uGBCvhGjD+qwI254NCFmECrIdh2sIXn4H89iwWJd39ZU+dowhXvD
	n2T4A8hW99aA1VkMw2J6XT3sf4AYez9xhcCr778jMjqPbi/QdGaKcxApvTQvipvxqwPSaxY7lf+
	FqKla13NIEb2pXjx4MjgQE4STmlLZOeuwzymjJM3IWHDf49L9/AV6QyOihB7SshnAvyh6SzDcuq
	8WTnt8m8FEOgrI0Xo8H6HAEm/Yz/uDJyFiK2BHP4/RHJTZSl/NPVPIR+K6nSzxrJB7Zwr3oncBx
	/tc=
X-Received: by 2002:a05:6102:6446:b0:739:918a:16c5 with SMTP id ada2fe7eead31-747534c3d0fmr3581331137.3.1784582824681;
        Mon, 20 Jul 2026 14:27:04 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-747581aea4asm9642271137.9.2026.07.20.14.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:27:03 -0700 (PDT)
Message-ID: <6a5e92a7.273a27ca.2c6448.c8c4@mx.google.com>
Date: Mon, 20 Jul 2026 14:27:03 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com, meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 3/3] containerd: fix CVE-2026-53488
In-Reply-To: <20260710122652.3004381-3-deeratho@cisco.com>
References: <20260710122652.3004381-1-deeratho@cisco.com>
 <20260710122652.3004381-3-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:27:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9966

merged

Bruce


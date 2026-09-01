Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA93C624D3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 14:58:09 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10318.1788274680614092294
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 07:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gJSYYgWz;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7e9ef94c0e2so630554a34.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274680; x=1788879480; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=gJSYYgWzoNTs/RpZKaJ1rb8/Wihby0SCNkFebfPp9KLpqWc9pnEObiVP3yNBSWmMOr
         RXZVd48WdZYtSZ+xtn2GakH68F/2/VVCG5HuL/2BgRyzEw8oIVppi6eIO9Tsbj+lA4J7
         0HGf8UiPSbMklscALJZDr7miXhUQl8J92G/N+lisaoh0jGaAD+oTP66O+eeofe2IqQ6A
         t16wGDux+oVLy1hgCZNJRCSRMjIyDARStpi5xCPFbKtHXJWDA2shR3W6fib2wXMxek3D
         1C8VpLQ/4e8PjnAtcKlYizxJy+mvpOhFeKrGVzZc5gpdG8OD0NGO8tv2teraebxZhUB7
         OSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274680; x=1788879480;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=kxBaHNfQAGfhitCVxs/YxXja9htsgH7BfeSVqZ0PTcsQUdnoPLeZB1HwBbQtogRIHr
         kPOpDtJXCtdg+3LyIWqfk3cAx4KjrjRzpxyIsFD46PpYcPn3RJ6eUpuqQtphhMcbpMI+
         KWXxza+nDXK2NAs1GDvSm3m3PTXkdBGc7ALKrrI4dhM6zM4aPTDD1bdH0qd7GPuiKpLG
         FUtOwW07HCicnqqWHhw5NfjgIqEbtaEJtk2jmAyXZmwxtStUpYUCiplqyl0109g+BEMf
         x8oB4Ufck9LKIXjJAfCabrrJPVd6VM89hOF8k5BGebKaXaXqQl+5aCUnQ2G2UC749kEh
         MXDw==
X-Gm-Message-State: AFuF++mish9/4zJ8kdf0PhWI+JxrPKPcRjWUkzk7PaCZs4j/zCMJ7sEI
	tpH/oQdAo/Id4f3X06Re3LUKji6BsdKFNN2ovaDoSLyCvr24/nasdQfR
X-Gm-Gg: AR+sD11bXPc4e7FjhLEGJ7ibM2TR20DSEvgVTOUFhyi/XMwIlbXI/AxCtR/SsmgbZQs
	w1bW6tVLfIDax5ryN7epKQe6cMS4qqJE7ipoGi4lTP07odJtq7WIsmLZqJNkg77J+6DCuZLV4P6
	FUtt8Lw5tmDzBcE8qBkTKaR4hnWUQ3bbLn7z9K8qgDWJkJiMm9BNeWDIK5PEOzWsO7FL3GKMQTz
	oe13rX34pU1qdjJ92wUmuGJJX89JqtYLEWYm5uAjb/cJm0VPt22zvpizP5HPET6S9oOeISw2FHW
	0kF1ZfBtWQbeFYkFfFjTyghIbpWPKumZLDU+bC2Fzj1uAXkH9AJPUVrIdBfOZSmKD8z39CI4+s8
	DYM7uL+HKjj9obxrL0it3IMDbozG7PN7V0NzYNktPcmovJg/S9jc7m5KWornJKq4dNS9nO3uxze
	6It8HcFk77RE6/BYqKqYzzhoDNVaSmLfmsnm3nSsQWUeOAu75rJlul7wr0+elYZ8Fxo61BDgFd/
	8jJ01BgpriLEpNOlntAdiYd9WxLJuTqdAAZSSb/02ojMevT97thx0lqCPqyZN5+yz1tNS5SMia3
	NGHoxW4xMPzBwpuxo1FYZOIdufDLE9IRqIw5txVJQyQPAf2N/wIUyaIAkXFD1o6SHSEBAIc=
X-Received: by 2002:a05:6830:349a:b0:7e9:e288:2b60 with SMTP id 46e09a7af769-7f4f21cb626mr33830436a34.1.1788274679643;
        Tue, 01 Sep 2026 07:57:59 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4fa9a153dsm11029672a34.23.2026.09.01.07.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:57:59 -0700 (PDT)
Message-ID: <6a96e7f7.a29f8321.1c507e.2702@mx.google.com>
Date: Tue, 01 Sep 2026 07:57:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: peter.marko@siemens.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization][wrynose][PATCH 2/2] crun: patch CVE-2026-47766
In-Reply-To: <20260823100330.3784951-2-peter.marko@siemens.com>
References: <20260823100330.3784951-1-peter.marko@siemens.com>
 <20260823100330.3784951-2-peter.marko@siemens.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 14:58:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10073

merged

Bruce


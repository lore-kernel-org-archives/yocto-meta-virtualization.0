Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26701C7115C
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 18:44:22 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3913.1750445055969897005
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 11:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRzuGfjK;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b31befde0a0so1329169a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jun 2025 11:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750445055; x=1751049855; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fKo67owPLEvYWgQPyivUWWGc0160o0BhpBx1DdxcVyc=;
        b=dRzuGfjK2a2M37ew9bykkJr1xY+isFquL94sJ5JCnYLPUoVyzV7nGIjeGWgTCP3IdN
         lB8T+49MHs/xcofY2RQ9AJo3DciAIgbTH/2id7oJJTMaEJxucsWlcYCVLd/gfRQ2xh2B
         7g8UhI+JRvd9qrF3/8rXtn3p01jSrUB+l483IGPEbKmrCdhoPjhubFBbjHk0IiEcYVUu
         cYIdC5s8+ALL0pb/CGR65qBdftiZXxu+J2VosOTdASj7PAJS3QPi9KFRCtVagFFMtiuG
         7pCv+3Jde7F9KTB+ELPmM3KxOTEwVyMKlxu2JjXJOeCipCuQ0YZbyGxh7GWzzfAPFiym
         rGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750445055; x=1751049855;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKo67owPLEvYWgQPyivUWWGc0160o0BhpBx1DdxcVyc=;
        b=Pmqo9ASqml+OC5PyDjY4eUAbBLHTFmWnDSfYXqLcalGaqFCVfPve79P+6uaIB9Peg5
         grKY2oSRDYs/7VmC75h16BI5k5qEHyiCy70+7xA3PfqgtWfLUD6IBPIzGjo5xoAZFxwN
         sTLFz+hCCyg/xbkkeXGD5P+mSRJvx5oD9pPRRw0cflcNV4x8KhEIspJJwHeoopGJIo5H
         f+WQnhDA/bloHlqpOGFQdydfQDAj/qD0kTLTIjCqIILrZP15RHvEYchmyy47eRUVA5/C
         BF/N47vzEU/U02aRNknrtTBQmT1O77Mg2sz9/j0YcVSA9IwrAh/QXv/s0y3nekUNsC/l
         ff6g==
X-Gm-Message-State: AOJu0YxlDcCFVX8q6suqMyhdAw6/238ZqpoZHPJS1elZ2I+M2B4r3V8J
	o72m65t5vyjl8GYwYfW7J7mGgZwNOQeNYGkHIDtXQ7XcjGBe5UYOQQ90MAuvzlnq4/lej4SFmz7
	iSPOR7I4PuvKcUjdgDu4mHfvIQBt1q1700nE+HV0=
X-Gm-Gg: ASbGncudTxGM0kI+6XNMAK/GlkzTn1/Xn9Ths+oGpT38tGU7+Gd1pQc55Cvsnr61M0Z
	MjWJ4QTxZ4opvqxvqRZik44GURLsfVtTLnbPFqo31GflCcxLl8V88Er0qlvtS3bURAtuv8ZCJ2m
	RoeSY5090LEg15RA+jADyhzyzzRNRxoOklfC8/4rPZfFy2
X-Google-Smtp-Source: AGHT+IHounhes0TkLP2mCaFH0/pNwwEXQp/nwKRtIS8Bm7qBGX1tBeznsgkSfAwXQqS0qiikPbeZSPzTDmYltz2SKnQ=
X-Received: by 2002:a17:90b:2f0d:b0:311:ef19:824d with SMTP id
 98e67ed59e1d1-3159d625fd6mr6586269a91.2.1750445054681; Fri, 20 Jun 2025
 11:44:14 -0700 (PDT)
MIME-Version: 1.0
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 20 Jun 2025 14:44:02 -0400
X-Gm-Features: AX0GCFvryPmU38Dz73N2Ya_PMopvpCdchOCZwmMqG1bCi2gEK70essYTrGfSMLI
Message-ID: <CADkTA4MZhb_Yb00fgtQWbBOoRYUEtXPfHzp9KrwOU8hrrZ+ZXQ@mail.gmail.com>
Subject: SOURCES breakage
To: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000aee6700638053fea"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 20 Jun 2025 18:44:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9285

--000000000000aee6700638053fea
Content-Type: text/plain; charset="UTF-8"

Hi all,

If you update to the latest oe-core master, you will get the source
handling errors in meta-virtualization.

I'm fixing it now, if you send patches, I won't merge them :) As this is
something I want to do myself to understand the OE core change better.

Cheers,

Bruce

--000000000000aee6700638053fea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Hi =
all,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div>=
<div class=3D"gmail_default" style=3D"font-size:small">If you update to the=
 latest oe-core master, you will get the source handling errors in meta-vir=
tualization.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m fixi=
ng it now, if you send patches, I won&#39;t merge them :) As this is someth=
ing=C2=A0I want to do myself to understand the OE core change better.</div>=
<br><div><div class=3D"gmail_default" style=3D"font-size:small">Cheers,</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div></div>

--000000000000aee6700638053fea--


Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C94CD98CE
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 18:58:24 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28332.1781117901418327977
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 11:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TFlQ4cuO;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51764768c36so91554941cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 11:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781117900; x=1781722700; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wqL2Fu3gz7iGho3QuO/kHulWu4u9WM2bBtoqZvqsXo=;
        b=TFlQ4cuOlf8WM3S9i5kdIHfDnXgA2BHn87qqAJbxJ3ybIdLXAEjui+lIU1IOZyMHgo
         D4cFpQEuEOwQSYbT8tPCB0uJ9YF86N04ndzJufTjOjOeco0VYgPMEqfWLM1GoxTnDAO6
         5eY9L78VZ3PwJehx+ia8Lpwo0gozU/KQsRrgwFM7EyzzCMhojKeU4BJbkINNYIKw9+z0
         ETwjG5hFIzGBVQ4buqsSuo5M5+zOUO0uCeNnXh21l4ElE2IqCcuoWND8XNrLYnjRneei
         R9N+W4HQn05wpQyuO1rTpzdsWc5FMLo486KpSrvtFa6FO3CrStS0s4Zg3w5PI9pe7iYG
         z32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781117900; x=1781722700;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4wqL2Fu3gz7iGho3QuO/kHulWu4u9WM2bBtoqZvqsXo=;
        b=YEK5HtBozkANeo+2C1nDMh4r3dlrpTPV7wBRSiaTsN/pBZh6ufhDtXJEW5bJ0SfI7t
         lvDZN0P/w5thjepSTg4SO8+hqKTciWmVe9PW7pJyddxQUnnPGKAFnDzuGQW00W3DSlci
         Sg/jFpYhrMM4xggGrskFVB/9ZQPtGIg/DXcU0C2/PogmSB9KgMhcA0SPSunGphUBCGbq
         mGtEjnpHKYW/9wi8sJGxpuZQZ1WaxhwpblxS0Ke/CgOingjLB/CUocnfx8KJaKLU/537
         j7qZk//IRjN4ESvI58cO8AJXXk4gbcVgU3UHhKAirS3lWQFT1ok+ayt+icS0ERSOZsdO
         LTkQ==
X-Gm-Message-State: AOJu0YxuxjU1bcMi8z2HVX44/ujsPV8qRsCI0ERN7WiTarYkMaxf/T4r
	U9J3ygAKcNaSJLOlqSGN1REs8Tu3mJRJ8DpsjMMnKGkvAWB64Jji3Ba6Xf1xoe+p
X-Gm-Gg: Acq92OG6oVT23iQGlvDDcAU79u3xWTTxD/Rm8tGwILPxc8Ic3JkU5zuiimVNofPjKvW
	LzkrJ+2gNj34J4/ihHEPrzZZL9TdFdcXJjgfzDrlAo6/McG6qfxFlKAgi3NH5fz2WsZXYFe6S5w
	VGUO2FMIDH1XiXxdvzv4xc71hZ4EC1TE6IemfDglHcRgZskvMVo32zIxVmPT5Y5mhy9TsNghwag
	TreUECqOIuqub6ZLffi8PSemt7y/54QQjPk+tVjlzVBWjidtmzf1+1gL7jrAZ1bzue8OFC1ueYL
	lKo6sqhrYE5YA8oViTZRfdh/eKKot4fTs6rll0KOKw2EfrXp00R+e6zAYfQ5s6udrwdP81hJW3v
	bGvynlkI6h4u9B50NqBF7iWM7yjBp+7EWRzc9nCromTeo6vlqaoqJugzB8ASHentRnlMDhVfMKZ
	OzCy49poia+Fh1ROw5DzSf2ruG93N0vx8Tna6z9nIdTnyr0kGi9ZqrnG0lw9J2XmoaiOWVoQpBW
	SMQVAadhACzZ/uuccaL62fdc8tOeTE3sWSLpafOfTDAVbactFaaBh2WWDlWIMmuDiE7erNUJ/wj
	JyTiEjJDhdcYM5XOScaRFj/oLeUlqL2L6lM=
X-Received: by 2002:ac8:7f42:0:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-51795b8ef04mr398938481cf.18.1781117900287;
        Wed, 10 Jun 2026 11:58:20 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fda2sm247540746d6.2.2026.06.10.11.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:58:19 -0700 (PDT)
Message-ID: <6a29b3cb.7dd3efdf.a331b.ba4e@mx.google.com>
Date: Wed, 10 Jun 2026 11:58:19 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haiqing.bai@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization] [wrynose][PATCH] skopeo: upgrade v1.22.0 -> v1.22.2
In-Reply-To: <20260602085703.1137209-1-haiqing.bai@windriver.com>
References: <20260602085703.1137209-1-haiqing.bai@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 10 Jun 2026 18:58:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9866

Merged into wrynose as b9deaf7d.

Thanks.

Bruce


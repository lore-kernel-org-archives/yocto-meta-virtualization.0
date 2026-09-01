Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E92AC61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 13:34:09 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8256.1788269643060447503
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 01 Sep 2026 06:34:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q/XTmscF;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a5f968ada7so2267385a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 06:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788269641; x=1788874441; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Q/XTmscF+8mWqyVYPln0oTSOiWBoupswHNoZvo2NAlzjrC1BPCNpJVl11WVQMTSofv
         X68stR/vgMVXMJxZT6dvI2QJMfQfLb9qoKaJX2fCwbuzuUApNsVqKUGXSM9GF3tl3JUp
         IJpHLgmD71lnBWm8Njf0R751prfHFUQsVxCOnmY3qLT9toj7aeb8/LZUiYIQ9EBR3luq
         p01uldcxZcD7436pIjtY8oLtYwUMP8GARd/gqz3QQWCVi0wHlUUBx1xfIFJfizM6qwmd
         PcMbvhbkDEDe5Vyx46kACePOiwJLVJv8nBZ54TYKFD1AU8QLmT010LnXPQl5RgRgWvmC
         lwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269641; x=1788874441;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=EmlctSyUluGCs9l86BPhBwndOlf/0Vf2bk45zp+3BOHurHlPl3bG6uihzZpNg9dsPR
         WUV/mT9F4BCyZhh/eSQ2DkJBGstnwTbhR7zD75CRZSG9jRuSLA8EocL/9ZKLkfZY2zX+
         TMcZNwnB4fWxUBEI2amSacouAngciz+pTLvukE4tvvoys9vAKrczsMKbluyzcCvdl9+3
         naAWesfYTiI49HTHc7TzpIkoxWsTv+kUi70UB2bdC+l1l9ClIPssdtQHkF90uC78LxJc
         HtPaXd4tAx8P+i0tAASR0+pdg6lv7bwfQdG+k6vKJjZHKezKooZwX3c6ySYPMrW5L19y
         LyoQ==
X-Gm-Message-State: AFuF++k3gomO00rXsAWMpJucInefuoyM05aCfubND2t4aZ1eYh7eXsw/
	YUcNK7S43mK5eS6HpRVKtrqLLuHeuWT3uR964+WrT7CubKh4amw3Tkd+g9ffvE28
X-Gm-Gg: AYBFou13ZOebC3pV0k3BWFbdCnLNeWsvsYtV1wMtpv5NrKlLWNxDVECKjfJ/75rAJGB
	UkR5P9uaXWpkIibhfeJQ/VpaxyCP4PUMKCP+s51jZy4NdXDCBGHQtHOz1kiG6JF8jMPiVPtxRam
	Qh8UD+oqqJjkVDoCH78Rqpin3FLfx2CY4cOJdmRvupJQpw9j/Aqwh0iN+rhvA13oUQLt5pfByUq
	Sg0kP/64OPV9EqUvdNzzxmd5gujkr2d+myPojyGO+pmF2YKO0YlGkS/x4rz+Dn0jAEI/VbLGX2x
	ttnMyeCR689Oz3aX2xExpMGh/Bh5TgDu5kdY4xtigYvUL/1jJ4aAAR9JywTsoGrnnYIfya5JcrX
	XZp+OOoMmfCNconyfWCuuKhuU7D1lQOCU8EvgghaCOrdL7R1YClaBtsDoq4C2sITQt5Vn60OJRe
	5p9fpfN3U+9O8x5lVbeY1dLz47vfrTbLTEN7uXoVtxuj/fMQ90S7DXT5hjCgLtu/+M5OIGRLdqK
	ZD3rCzydebQb1nJaF+ls+s1PtohRLzVdDCCFeVd8fAqdK+2axHgIzJSxuk+pScliLWsdNQWFUlb
	Pxp/FoRIiyFofIH0IC8Zrqlqbl3PJdnJNPc5WO+UCxH7k7WMaZ8XGpIQcB/t
X-Received: by 2002:a05:6402:3888:b0:6a5:f4dd:9ee3 with SMTP id 4fb4d7f45d1cf-6a66a75b745mr4212577a12.8.1788269640649;
        Tue, 01 Sep 2026 06:34:00 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a66ccdc436sm1014477a12.10.2026.09.01.06.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:33:59 -0700 (PDT)
Message-ID: <6a96d447.fb30dff4.1e844.728d@mx.google.com>
Date: Tue, 01 Sep 2026 06:33:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: devanshp@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: correct CVE_PRODUCT mapping
In-Reply-To: <20260821050709.49931-1-devanshp@cisco.com>
References: <20260821050709.49931-1-devanshp@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 01 Sep 2026 13:34:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10067

merged

Bruce


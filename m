Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.928.1793898037256469676
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Nov 2026 09:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Xh06cf+1;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-980c4258105so1131323241.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 09:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898036; x=1794502836; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=Xh06cf+1Kgc9AcPOW7D+CQT3vMMveXsoA632vEcihUi/yXOxHoImEwJuVE+apHC9E1
         h74wFQtGWIJObM7qQJZ5GSAv8412Jwlg4oSi5l91+2v2jLK0nh5W9DtSTdKiN1ylIgTX
         tXbRnGWsOv+erV5i3Jy68bOMUj2h1w9qmpEPIG1EaGRK+YpAtN+pjILEK62jUycNx7ld
         H6Tdr+xsl4EDBe+jG42WaA/sYG5jYEpfgvHSsC1OHxyihcrs7aNaYPZAgvr4v04G34E0
         FAWXHhHBOUMDuVKCbAajDXUfBe5/EJFz2adoXT/eZ2BWb0l58c7yc6MnTs8IxplnMxVj
         icsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898036; x=1794502836;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmXbgnhysW6ilWyQ/a29nOI3tw7mnEfxS6ub3q5tZoE=;
        b=As+Su//wEavwkP6QJG4oTvvNrSg4hUT2B4AQBxhHn+qZRg3myK9Y3Niot/kh+juuCu
         VL5VGhcXqXz3dZHkWMop4Z9clVA/TF9gFjPlwb0niW7DRG+aZKVQbtc8WZ6NISbzsZi4
         9/BB3fVLMActlLQUPSUVguWvEyyedWHHmSXSk2SfWxTjw9O/a0CuefvLCMcK4FqG9RwY
         YQ18SwPWu9wOJvXA/mmUjXHmfJU5mrO0K91QVsqE3Tp6FDX2fG03QT4E7JX7A3MvJRTS
         NpHA6QukQMnfpUWTiRhmARxI8fbZAMw8jzbhU7gaD2XGv1gBWX1f2K6bHnsxjajtizpI
         L4nQ==
X-Gm-Message-State: APuU4Z//lb+FcRXegPE0kFE6XXoqwd1eNzl1N+78CX+3uaAzFV1+Mq1D
	OvHqcFa5UhQctCpHzMvIYL489Mu7FnAgEjhb48mh0oHbxy2E6ViMoiPP
X-Gm-Gg: AYBFou16HodQ87rwH6+OWKLiP0oxM1OT8VzoDaB/0fYGO5Ii9YIBiPsEn6r69cShJ8t
	LiX6yaEVmBi1iGmgd3qRznl3f6e/bRkEroqQd8+zYtxsUj5D1pc01HCvjACVS8sSHAPnFPcSVm6
	JaLCylkbM4kU912GSwLHSgYqx3qdfKn33oAYIRjSCghEMIAAqzPRjVlKRcaN7SOUHVmftHhfNaP
	+ZatntchoMuySBVpH5iG8uyH94vP2UQE1XB0OMc92prRQFyYqaJ+uTZRoRLa6Q0MdNfgRdwLKzb
	hB8nVGFttYZgCCZfG1a7AzqjCXbWMsgwHZFn69icvNbaZcRdfQQ6GtLmYFCUdZgAVDp6mXBh9rV
	SKRQVcUYXyy61A/56JGZcsYj5YNd3zhLXMd/DsPIlf1SARUv8VSU0g/hJWick/t2HFtoRU81L3N
	rQS4aYkOdeui5K9M+r8EiGonjOYeMBxGzzpbHBb/tbpPcZYVGkKROtcf6kLb+/QZgsKsZOxYyfY
	qC6/jrAT/afry3RsdrVYpM7dCYx4fePDGfjANQLATF+JcJjItvgbzmuXlDiVhnxtQORtMiR7tI9
	oWBhk0nJk+/LsMfzE+ZT6aCZEdMmM95ufNmQNJI4axyeDGy3D4b2XT0M3pZQEQ+XD/9EYeUqN0y
	myTXMAlwNkfwo9TMauZeQHILij0b5q16xo1QohKa8tXKgHLY1/W579IIOZKeTIFSmZFZS2/lY2g
	==
X-Received: by 2002:a05:6102:6d5:b0:7c7:f976:ea9c with SMTP id ada2fe7eead31-7d2a150833dmr133256137.13.1793898034769;
        Thu, 05 Nov 2026 09:00:34 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8dc1e75sm4755549e0c.14.2026.11.05.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:00:34 -0800 (PST)
Message-ID: <6aecb632.3d21a3bb.104fe5.7655@mx.google.com>
Date: Thu, 05 Nov 2026 09:00:34 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Deepak Rathore <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][wrynose][PATCH 2/5] docker-moby: Fix CVE-2026-33997
In-Reply-To: <20261105060006.1286469-2-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
 <20261105060006.1286469-2-deeratho@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 17:00:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10157

merged

Bruce

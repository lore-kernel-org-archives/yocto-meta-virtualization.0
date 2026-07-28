Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2459C54F54
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 17:47:09 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2137.1785260826295700025
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Jul 2026 10:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DOLBEeMu;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-966e7380109so26062241.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 10:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785260825; x=1785865625; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=DOLBEeMuUgNJWm75a92GXYjQJAh3JlybV0ewqJlAdaiDrF27pJM55BZ5UXdB0iklF+
         J+08StpeU8TD8zdkdQpxqYfJA3cDsrcBYMN8e6WCNSwMvb+UjpAEWqVUXFJcO5SVPlJW
         fje1ccrLADsE7oh6EyZMtz3dxO8HvDVwH5EMrO25M7Z1RIZXa35QW1TJ0wkGbRpWjJv2
         Ae4s+rEK1mm5v2GmWwrQAZFjDhVYswY+Wofr3Df2VtRULFNdly3PbT2dw+7aq0wHP95C
         Qg+fxhiyWiBP/BIWdMY7b+Si2phopQv+Fq56NkTyNrHokTsBp8x9AU4Km0e9XvN4Y2Ev
         68dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785260825; x=1785865625;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tlq/vr6kSdCi9iN7PVNjXkq54Y1H85OwEwR4PJG5iHE=;
        b=DWzCN7z3Tdeq/iSVX0UjOKdX7cZoJohDV3009RDAEAEhKWJeu91UxSAe4Xiyfysrds
         BXGkC/vpsN/CWscL4vN/4Vk+h75Qe6fxdxEZ44fQ6HX+QpQPr8XbkLnRVNdjCpXfcMcA
         eNEwTxI27/9zJjUn2hqrpzY7XvAzSxTTTJeXP6z6oIiIegZgfJZLnYunBTLlbKVXGUyq
         3YRtSZbHGiz/BF1JfyVe+8Gdy7BDkw+/XK6nnoElaRWd7aQkfmdj36IsE9k86QLD7t+O
         3Lx3fVLKoKKMx4J/uLuZCbR5eU7+YB7IB8EukNhH2k0yvK4SKgQU7fqx57QLDMuP0sLa
         EXaQ==
X-Gm-Message-State: AOJu0YxpJssYVjcBSIKpF3tzWqJAFyyUMlUOfDOS69t1OxdTW+bM+VJi
	RyuwGDF7gCrfz6RBfJnwZ8yw4n6V0L4OCn3BaJS1P1D3EVFyUhRj8w4vL3PB6W+H
X-Gm-Gg: AR+sD13JGGwJEvgLWT4OFQ627sGbFdCcQAb4boDiMQr95HcGVwo4uHY7Vvrq13UCC1C
	WNs2vgYGPhNWpIoXCA83BDSmjR5t47vh3zP+I52t/GzrafFn6RKTN4NClJoC3JyFJG2pknKEdEa
	5cGr1dMLVJLPAQNCdl3N3H9VzDbttrzaOPmFzKM26a87Uu3UDowERPb8ihfw8jB7sm0WjqS5+7P
	jRrvSa7MsO1K/gmLeuYLgmSmYU/e0YQTqiXOAVp/cvJYAMhoPMFk8byMaepEb0xtw6TYJXYmtFy
	ckNxoLkDt24OB5qslCqi+h3T6r2OGu1QThwc7EQ7pkIfHsfeLAFWahNdzoXjWFuFG9Pk/E61Rtl
	ywE2smqP98sBM9001xQnwwF/QhCKS19xA0xgj6yoPygOyZS54yEZD3jBtqQb+8pUSqB5G0WEItq
	lOt4p/pbwmrVRXS+Cc+7czBXvL5QdtNkqAUF4Msr6N5n8NgRrPMXOhJ7YRnF5m3E8Is3lbS/K24
	aFfLoB5WMdy1cwmMlNxzVlcz4TAPK7uu+ImnSgNbK2st40FfZBW9GUKmL2tDzd/g2dPn1A3saw+
	VEo=
X-Received: by 2002:a05:6102:570e:b0:744:a77a:a342 with SMTP id ada2fe7eead31-754a26c7c42mr1669608137.22.1785260825203;
        Tue, 28 Jul 2026 10:47:05 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977b268a64csm271173241.10.2026.07.28.10.47.04
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 10:47:04 -0700 (PDT)
Message-ID: <6a68eb18.461f3e43.2c3e0f.d398@mx.google.com>
Date: Tue, 28 Jul 2026 10:47:04 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][RFC][PATCH 2/5] container-yocto-builder:
 drop redundant IMAGE_INSTALL
In-Reply-To: <20260727000247.1623785-5-tim.orling@konsulko.com>
References: <20260727000247.1623785-3-tim.orling@konsulko.com>
 <20260727000247.1623785-5-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Jul 2026 17:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10003

ack'd, staging on master-next.

Bruce


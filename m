Return-Path: <a-singh21@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE74CE7B16
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 13:45:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.35029.1725630298899025286
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Sep 2024 06:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gzvP1+pz;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-singh21@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 486DivWx096622;
	Fri, 6 Sep 2024 08:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725630297;
	bh=MHSjY+8P4uB1Ti1gG1KmI2tNKpExU6X+RAH9J2S5/Bg=;
	h=Date:From:To:CC:Subject;
	b=gzvP1+pzHpni8j1FQN70wsk0zD88ZzTEepNHZvhrR1pvD8EaE9/P8naQT38rb67ZX
	 Hh6oRwH0Us1axBL+9laKkT4tIORHpTDDpdjZMNGp1GgplfHlelklGDRXVKVbolL1qY
	 13lG2X9jL5cBCj9PRplypbw71dPi1LMuzlQ/52uY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486Div1T105182;
	Fri, 6 Sep 2024 08:44:57 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Sep 2024 08:44:57 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Fri, 6 Sep
 2024 08:44:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Sep 2024 08:44:57 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.72.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 486DitkI001081;
	Fri, 6 Sep 2024 08:44:56 -0500
Date: Fri, 6 Sep 2024 19:14:55 +0530
From: Amneesh Singh <a-singh21@ti.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Backporting Xen 4.19 to scarthgap
Message-ID: <z5wghvyegwdiug5lhb244oesag3nmdku3xhlpfv4jrhuj4kql4@w5fbua4w5lw4>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Sep 2024 13:45:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8873

Hello,

Is backporting Xen 4.19+stable to scarthgap LTS a possibility?

Regards
Amneesh


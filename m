Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD49C00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 13:22:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.45048.1674134527134302574
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 05:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cvqmWBaV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5E39340004;
	Thu, 19 Jan 2023 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674134525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FGOsI7rlxwytaR0lRyFjAZzL15rw3Ue7kBuSIdJY94E=;
	b=cvqmWBaVLZHFoVeKQxtPApIFNH6BRF0I/CJ4qmwAAm8RE/1wgldib4STVv1GXVWwOhw4I3
	P0vmGKEgJV8rMGZe1NncKtKq4s54XY3NalNMH7+io64aC+CjnzVlJwnMk9OvVZvZEjshZc
	g2kPneoU4J6k7Ykl5RMEw/E7Ttb99fyMzmR8pl0kvnv9WaQz9QZdmPeC4/+O7nN0unjMk5
	DWBqDzfAffe+xPm7fkUXxW/KpKYUF31Z8ld/acwdRFcC6OrdVzexeaTS9X8UBu/8xG4AjM
	xFWba4jmcRFVqAMYalU+tH1/XuAYuKMtDIRTkvI9apChwILvCSN9+5KkBnkv7A==
Date: Thu, 19 Jan 2023 14:22:02 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: xen-4.17 build failure (av_permissions.h: No such file or
 directory)
Message-ID: <20230119142202.594f36c9@booty>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 13:22:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7819

Hello Bruce,

we had this failure on the xen recipe during an AB meta-virt build:

| In file included from xsm/flask/ss/services.c:46:
| ./xsm/flask/include/avc.h:18:10: fatal error: av_permissions.h: No
such file or directory |    18 | #include "av_permissions.h"
|       |          ^~~~~~~~~~~~~~~~~~

See:
https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/1168/steps/17/logs/stdio

According to Alex's analysis it appears to be a race condition in the
xen makefile.

Could you check that?

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C894BFF886F
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 05:18:54 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5826.1777353524838549633
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 22:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=padlZHe8;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g4THP3zNFz9tpW
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 07:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777353521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OAH2+vPsnpTvriOUXtoKve7BefCgOnTUI2O3MBevGM4=;
	b=padlZHe8CntSn0q7xUlJlKiyot4hYh8wvahw0WDd2ykQkptoWI8RcvDnXi0dqlzig3lQxU
	RTjFVmKuIi9u2wHr3hD+C7mKNFQrR3hlQ7uH6R1eG5d3vP7kRAdGe/IBi/dEte/yBZKnT8
	4EtRmflD4GMGAGM2+Jb//8oK7LQNbhpC8fsPlg+u9/T8IEnbo08/T/o5+QslM2hjNo0pt0
	V6raE70qxzeARnxHzYDwo0bARylSLP0X3ds7NhDv4XxsRfI1xMuctW3JmiQ9i6nsX0XdJP
	snEmanitl+ueRAeUX8xbKH4jgad9TQ9eQxghxqEp02H49msNJxcBixIhxLooBA==
Date: Tue, 28 Apr 2026 07:18:41 +0200 (CEST)
From: patrick.vogelaar.dev@mailbox.org
To: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Message-ID: <255898079.381409.1777353521045@app.mailbox.org>
Subject: Podman version mismatch
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-META: cztngnagazhuht9xwd3aqfjd6jurtixe
X-MBO-RS-ID: b4b06b069519b5946ce
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 05:18:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9754

Hi,

I gave the newly upgraded podman recipe a try but it seems that there is still a version mismatch.
PV = "5.8.2"  but: podman -v
podman version 5.8.3-dev

Do you want me to send a patch or do you want to have a look at your update script?

Patrick


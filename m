Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD225F53D87
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 18:42:30 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.58285.1773686540428794377
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 11:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=BlH0qYu2;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fZP8S5t7sz9tsv
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2026 19:42:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773686536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nQtmE48rE2GPzTRKTblzusb+4nCEzT6bQm6UhyYcgFM=;
	b=BlH0qYu218z5tjSu/W6f8Mk68sCuyVky+1wUV+WxZ8WPMfqzmopGy9E3G17B5sIOnNzaOD
	MQ+TrCoa0FOVpAo0ZRJ8WlTB0IlEnk3X83HmSRccH7Hoy5MGHYId/FmbBQrQ4CRIT5hbA4
	KZ82SMpAlE8sQuO0V7jmzlUlccB/v+jbRk7bDThaB8vMS9P0KnaJPLBXiiHfI4QPYollJI
	oVJl4JLdSNVYMonKP0od34SD/5vl818LFv/RNGvgZGcP0Lc7Qs7LEjQQSFt2kdeQu9bmR6
	Qunqebv81uqBEon+2gOxD2W/x3UlIQgDcVmwGCnv0062nA1Y1zkfc/817Dgopg==
Date: Mon, 16 Mar 2026 19:42:16 +0100 (CET)
From: patrick.vogelaar.dev@mailbox.org
To: "meta-virtualization@lists.yoctoproject.org"
 <meta-virtualization@lists.yoctoproject.org>
Message-ID: <1942784541.31638.1773686536467@app.mailbox.org>
In-Reply-To: <586528399.23310.1773677692552@app.mailbox.org>
References: <586528399.23310.1773677692552@app.mailbox.org>
Subject: [meta-virtualization] possible regression with: image-oci-unmoci:
 preserve file modes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-ID: c83172c51860fae58bd
X-MBO-RS-META: jn39gapne8uspp464hudatz3o3wpxzfg
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Mar 2026 18:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9663

Hi all,

[0] caused a regression on my site. I am installing a recipe into the container that sets ACLs with setfacl in pkg_postinst. To my understanding those xattr were not preserved before anyways so wouldn't it be better to change it to:

cp -r --preserve=mode,timestamps,links ${IMAGE_ROOTFS}/* $image_bundle_name/rootfs

Could also be that I am doing something wrong in my recipe when setting the ACLs. 

[0] https://git.yoctoproject.org/meta-virtualization/commit/?h=scarthgap

Best Regards
Patrick


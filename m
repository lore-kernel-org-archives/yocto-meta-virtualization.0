Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56128C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:10:37 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.8373.1750255835717219248
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Jun 2025 07:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bcnlGUj4;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wxWnCI84zMWG1u8B6kg9tio0QCZJD8zTUfkRSazM+Ug=; b=bcnlGUj4s41vEFXvtGlo3kLJI5
	LRnulOpzYzlfOzyQBsWhhXzoSfdvusccyc2a85rwQDd2F6D48IG7Xx5AXLzuAmE8CMiQTDwAM9VXX
	n3tmO/VRdIqUN2uXicG2fRiZ1NTogHqzBGmfGFKqSNzJL2aWfH+s64qM3bgWMdfUZsFIS76sNSrVB
	WIxgOrMhWTe9x29XJO6bG9GlOqG2JZsMoO+7gksJBgS5i5QSV6rR7jEvE/eiLGQaBgHMyQLj0dauC
	EKJKiO5ps3rTJMhC4ROeVTbFyXAowuhyDNYe4/ApCrNQXzvtr8XruQLDgKn02+HqcXld02X2kzwsr
	baQD9PnQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:43490 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uRtUn-00000003ruc-1px9
	for meta-virtualization@lists.yoctoproject.org;
	Wed, 18 Jun 2025 10:10:34 -0400
Date: Wed, 18 Jun 2025 10:10:29 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: FILESEXTRAPATHS typo?
Message-ID: <572d3260-3adc-5161-a04b-b09d0563e043@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 18 Jun 2025 14:10:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9284


  recipes-networking/openvswitch/openvswitch_git.bb:
    FILESEXTRAPATHS:append := "${THISDIR}/${PN}-git:"

that seems wrong.

rday


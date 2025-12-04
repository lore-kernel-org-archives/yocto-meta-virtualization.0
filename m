Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E85D2A52A
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 20:23:40 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53949.1764879818605782663
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 12:23:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=O7KTuske;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=SzhoQRVA7+ufJeuiCoK8cVsOyXtnmurm0nCiRL066bU=; b=O7KTuske/5V6s7Y1gkOZtePveM
	WbBw/3tIAO8Sn9vU5HcGVVmY9pq4WORikBjrrOmWASOanrzu6Bk86S+Fyau+hEOoUBHe5N7Gmn9gm
	2nDvd9o8Y2ZOkqcNIhL5Qc+iz9chTHqrLHmsnFmggf8nQ/DigqWcHT7KYqbu4B3JuNlEPfugJECPI
	B3V5ANSVVoA3rM1jeL6o2yO0EaTts113w8l+mmJWjNg5PF1vXzskV9MUuqhceokfkJFQho4sej0Fg
	qw6qSqsr2d4BjV13tuC/eQayLgeOex9iwAaJtTZi2WhlbrPumePRBzgJopvILQgpWEMYzDdg8iHGO
	+j1+oAEg==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:58966 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vRFrQ-0000000HQ7M-3JcK
	for meta-virtualization@lists.yoctoproject.org;
	Thu, 04 Dec 2025 15:23:37 -0500
Date: Thu, 4 Dec 2025 15:24:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: Why do *all* xen-tools recipes set DEFAULT_PREFERENCE to '-1'?
Message-ID: <7a68aa42-0904-18cf-7619-c97b4bf310b1@crashcourse.ca>
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
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 04 Dec 2025 20:23:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9478


  Working on enhancing some documentation and, regarding
DEFAULT_PREFERENCE, I noticed that *every* version of the xen-tools
recipes sets this variable weakly to "-1":

https://git.yoctoproject.org/meta-virtualization/tree/recipes-extended/xen

  Is there some rationale for this that isn't obvious?

rday


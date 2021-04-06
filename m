Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.9652.1617702141168855111
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 02:42:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-67-70-50-7-189.dsl.bell.ca ([70.50.7.189]:33404 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lTiDz-00Cfv2-Tc
	for meta-virtualization@lists.yoctoproject.org; Tue, 06 Apr 2021 05:42:20 -0400
Date: Tue, 6 Apr 2021 05:42:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: two more FILESEXTRAPATHS issues in meta-openstack layer
Message-ID: <3f5f6c5-a8fb-29d9-6af8-79fbcdb1ef84@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


recipes-devtools/python/python-nova_git.bb:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
recipes-support/iproute2/iproute2_openstack.inc:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"

  i'd submit a patch to add the missing colons, but i'm skeptical of
any appending to FILESEXTRAPATHS in the first place, so i'll just
leave that with you. i'm curious as to how the above made it past BB's
sanity checking.

rday


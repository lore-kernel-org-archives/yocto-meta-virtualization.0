Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.3508.1603188250907235461
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 20 Oct 2020 03:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:58324 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kUoUx-0011gH-FM
	for meta-virtualization@lists.yoctoproject.org; Tue, 20 Oct 2020 06:04:09 -0400
Date: Tue, 20 Oct 2020 06:04:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: meta-virtualization@lists.yoctoproject.org
Subject: oddities in meta-openstack layer related to FILESEXTRAPATHS
Message-ID: <alpine.LFD.2.23.451.2010200556030.7142@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
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


  this just doesn't look right:

recipes-devtools/python/python-salttesting_2015.2.16.bb:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
recipes-devtools/python/python-nova_git.bb:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
recipes-support/iproute2/iproute2_openstack.inc:FILESEXTRAPATHS_append := "${THISDIR}/${PN}"

  it's not just the lack of a colon; i'm always a bit leery when one
*appends* to FILESEXTRAPATHS. i will let those higher up the food
chain deal with this.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

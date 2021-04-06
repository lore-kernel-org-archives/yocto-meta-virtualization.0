Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.9721.1617701753246710943
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 02:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:33386 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lTi7j-00CeqY-3f
	for meta-virtualization@lists.yoctoproject.org; Tue, 06 Apr 2021 05:35:51 -0400
Date: Tue, 6 Apr 2021 05:35:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: "FILESEXTRAPATHS_append" error in openvswitch_git.bb
Message-ID: <f65d58c1-c178-9980-f835-418f5bded250@crashcourse.ca>
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


  this doesn't look right, but i don't know how one wants to resolve
it:

  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"

so i will leave it in your capable hands.

rday

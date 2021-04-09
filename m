Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.8018.1617969874140572012
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 09 Apr 2021 05:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:35468 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lUpsG-00BZiE-ES
	for meta-virtualization@lists.yoctoproject.org; Fri, 09 Apr 2021 08:04:33 -0400
Date: Fri, 9 Apr 2021 08:04:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: meta-virtualization@lists.yoctoproject.org
Subject: openvswitch recipe: .bb SRC_URI simply overwrites SRC_URI from .inc file
Message-ID: <1bd674a-eeab-7071-8aa-21cce3e5a7a9@crashcourse.ca>
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


  apart from the aforementioned oddity of appending to
FILESEXTRAPATHS, i just noticed that openvswitch.bb, as its first
line:

  require openvswitch.inc

which, among other things, does this:

SRC_URI = "\
        file://openvswitch-switch \
        file://openvswitch-switch-setup \
        file://openvswitch-testcontroller \
        file://openvswitch-testcontroller-setup \
        "

after which the recipe file itself simply stomps on that SRC_URI
setting thusly:

SRC_URI = "file://openvswitch-switch \
           file://openvswitch-switch-setup \
           file://openvswitch-testcontroller \
           file://openvswitch-testcontroller-setup \
           ... etc etc ...



  i will defer to the meta-virt folks to decide what they want to do
here (if anything).

rday

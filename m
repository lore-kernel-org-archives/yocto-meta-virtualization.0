Return-Path: <bogdan.purcareata@freescale.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FC69E0076C; Thu,  2 Oct 2014 09:18:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [157.56.111.141 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 935 seconds by postgrey-1.32 at yocto-www;
	Thu, 02 Oct 2014 09:18:45 PDT
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0141.outbound.protection.outlook.com [157.56.111.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13D39E00749
	for <meta-virtualization@yoctoproject.org>;
	Thu,  2 Oct 2014 09:18:45 -0700 (PDT)
Received: from CH1PR03CA011.namprd03.prod.outlook.com (10.255.156.156) by
	DM2PR0301MB0638.namprd03.prod.outlook.com (25.160.96.12) with Microsoft
	SMTP Server (TLS) id 15.0.1039.15; Thu, 2 Oct 2014 16:03:08 +0000
Received: from BY2FFO11FD057.protection.gbl (10.255.156.132) by
	CH1PR03CA011.outlook.office365.com (10.255.156.156) with Microsoft SMTP
	Server (TLS) id 15.0.1044.10 via Frontend Transport;
	Thu, 2 Oct 2014 16:03:07 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD057.mail.protection.outlook.com (10.1.15.185) with Microsoft
	SMTP Server (TLS) id 15.0.1029.15 via Frontend Transport;
	Thu, 2 Oct 2014 16:03:07 +0000
Received: from exile.ea.freescale.net (exile.ea.freescale.net [10.171.73.223])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s92G34s3006293 for <meta-virtualization@yoctoproject.org>;
	Thu, 2 Oct 2014 09:03:05 -0700
From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 2 Oct 2014 19:01:16 -0400
Message-ID: <1412290878-18574-1-git-send-email-bogdan.purcareata@freescale.com>
X-Mailer: git-send-email 1.7.10.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(85852003)(97736003)(48376002)(50466002)(6806004)(85306004)(558084003)(44976005)(21056001)(50986999)(88136002)(89996001)(93916002)(86362001)(92566001)(68736004)(87936001)(84676001)(87286001)(95666004)(46102003)(120916001)(99396003)(102836001)(110136001)(26826002)(76482002)(33646002)(4396001)(62966002)(107046002)(10300001)(36756003)(229853001)(104166001)(77156001)(104016003)(2351001)(31966008)(20776003)(105606002)(50226001)(92726001)(107886001)(80022003)(47776003)(64706001)(106466001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0638;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB0638;
X-Forefront-PRVS: 03524FBD26
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=bogdan.purcareata@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: lxc: Update version to 1.0.6
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Oct 2014 16:18:52 -0000
Content-Type: text/plain

Update LXC version to 1.0.6 and rework one of the patches to apply.



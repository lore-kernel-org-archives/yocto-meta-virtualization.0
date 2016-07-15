Return-Path: <collin.richards@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C943AE00CE3; Fri, 15 Jul 2016 14:00:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [104.47.40.112 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Greylist: delayed 4681 seconds by postgrey-1.32 at yocto-www;
	Fri, 15 Jul 2016 14:00:57 PDT
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0112.outbound.protection.outlook.com [104.47.40.112])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A89FFE00C39
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Jul 2016 14:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=m0PXWBh0qmSzDBf2QvFvpXopgFXZTGKxdeVuonbRZoU=;
	b=FliXDLCAnROLY2smDBZuHsIIJehakN/RtpIeyka8d4UK9cmdujIEdRHS7Tyrrql5chYf3VZSROQDJIdXSFhrKLqeSLEAZJclbmMa3/g0Z9aGDs0IP+Nb/YGLitxLaxANk+sW7zoikUtlaZgKKY1/KdG0otgLLk+63a5YLq1/hnE=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=collin.richards@ni.com; 
Received: from titan.amer.corp.natinst.com (130.164.62.185) by
	BY2PR04MB2054.namprd04.prod.outlook.com (10.166.111.140) with Microsoft
	SMTP Server (TLS) id 15.1.539.14; Fri, 15 Jul 2016 19:28:02 +0000
From: Collin Richards <collin.richards@ni.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Jul 2016 14:27:52 -0500
Message-ID: <1468610872-14309-1-git-send-email-collin.richards@ni.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [130.164.62.185]
X-ClientProxiedBy: SN2PR10CA0002.namprd10.prod.outlook.com (10.160.12.140) To
	BY2PR04MB2054.namprd04.prod.outlook.com (10.166.111.140)
X-MS-Office365-Filtering-Correlation-Id: 4fd95c2d-44ec-445b-53e8-08d3ace62336
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB2054;
	2:+cgXPq4xrT5gejDO826lm2yPIZoiZCJVpC2mpMloPHQYqGwfsW/1SMTl5bw2brktfe2fjA6O6mCGLn+NqZ6zL6xFT1FOxlBmFN23OZ/GsuhAyD/JIlFlURtXfWipLw4jHy/nRxkVJNObI1oCntDpc9H5GKRXTKrY5cDrcb549LbUqT+/WtAnoTcn9cp1vouV;
	3:knCn/JjHM1U93DCpYSPrlp3n+essXduszPpK7DQJDCJG9Hzf8lANPzKLF/B49lBsoZlD0CQQk2WmSA0KTbNfrj9lgTmEuCYqUMHrlvaneJ3Qeu1I0AysGhjiJpitXzrO
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR04MB2054;
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB2054;
	25:ZzH1UADbBlWIIRPB3c6+tcLLi4+BKqU5vGIw7+qhHDmDqZKCOe/oxVnwzUowDW4eHLkqwcPtltsI7A9I9bN7hhl/cUIrQnt2DIKoA27gjuMTGKKXqhjGMiVn538egTgHT6BqxDhEryIBKw1ZwIPiD2QteH4hY60fC6XxOtdClT8Z02emNj8hc8pF8T+r+N3ABrbQAbiLr3fdagb0E0ZRwtcR/m5YXNmGviiownjpoVHLXbHoYIcZxq+wRTYtxsbRvqFD15iKXu4TKx060f4VCWPDmnu0pHrSOKTlNhyzKCQRoMVw6gV8nKtoYEot6aB4ECECo6T/8fqvwg0e1eZN6crdOZNOXXUGLS3oXC38ezdSySETxsplhLxQwpXMGd05Mbrr0eiydBQfj8sbyzU8qCYDuQyWMvjpYTzM0XiPCt6ZUK0QCosdXeKujaAi8FjNp2T9exBlIRmMSwpqD4FWBA+gUL1CwuiVesd9LaXN/DU9i5bb/pN4yMtm1ZZWc/uoETszOcsH7kAiszhBo0KsC+OktddVAFBkPvWyhN+NXbV7dN1SJaciuDpVlu+kFsTmUJ9ysib0N0Cj2IIB8KTXa5FTqFKNBUUY/2ss6Z67kVp01m8WJIMtVcJ97OLYI58mSbkwCC13jBJ0dSEXPnxTGor20QeYhtQw6cXHaZrcdIW/RlrPWpYOH3fgfockrhu92PpXhiugkN6QIC5CWgoZycuAaDmHZqfEbpO3DcG/iLIW7fAzSu8fB7NZjbCJ7Pfhv9L7Bx/pm5Kfa2PRfJ3WkA==
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB2054;
	31:R+fnICr2oncQlZHdbmzgNqvk39qSGXvMHixVK9RaZMlExwHTUkmdQSxISrLx1DQFX/DXKZKG27pqz/rYmI8wDRjwSYcCgVAgIs3ZWeco0c7Yy6za+SzLkIQTrCOX4OhaC9DDgoPOkpGIVzZgXy/HpBWRmQIONXFd78ZPujc5iOtSkZcTkeJOT5F2B7ia4STrZNu0MWQnHQWTjAgc+0/GDw==;
	20:8HCAs0aS780lbG8glxgO2U3LnvJqrEG70TSCjeSDiQmv6X7uW4Li+n7vMZlsvgWGem9AUAUnlGp9Lpb6j+V5xZxskwu4/oREkJzxa8tzmL5t5WtHgUi7ur4eBe7Gk51xKoOm/MJqsvcm5Xu3lr8uXFa5p10Q+nk7CyZJ0+3y5HAggvJciCZgQq8sgG0ICzAl74ktKD/lxImzu+NCVxtfpzkqCR9/VmvuODaGvHaB7nl2yPfZsuqys3KUJho7yyDsplb/eAak9j/PxYlvAljGq5gvljxNO+xQc1ctGvNPHLETER4P+px71rZ3pj9HsAdFsje1g7Nc605jKo/CVYNEuD7GvupAtrTBRAkzCA22GHcaSxHaa+TQjXMKWOYl6VOkE03YT24vgHTlYPcrq1mSeqSiTFGZkPlFJR3In+Nk5OAXe3j3TO9ytk1GvfkvzOshT6oYhpY/hoYcwsjNPHBuYrRoA17pa6H9L/tQVADjfLs5YDUtigl3+vyBAJeVH+O2Rvi/VD+y2aVe2rka0VVSsdgln/wxUOOCGQTyiAUILkzsxHOixwcWjawJO5tBZy/u+YEHa7CWzqMniSAu3jNcTCPlvnCHME05Qpb83fFxetg=
X-Microsoft-Antispam-PRVS: <BY2PR04MB2054994EA779A410D4C7106083330@BY2PR04MB2054.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY2PR04MB2054; BCL:0; PCL:0; RULEID:; SRVR:BY2PR04MB2054; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB2054;
	4:afT/esmcasGveUCV+lfCT1IK/dpi9K76mGGh+eEe+3ISwrFxnFPwkXu+NHK/vE9gsW16mQhXdg4iKf9sS7gLzdpCoH8io1H1hCNV9Ab9+lcWT0R3El2iqihR2fo84jStL0LeeAUqi65/N94BZWtP8lOZITl7x5YdBmbNGSgAqygIijcTG9taZmn5stF1ww5DCmPPmqHyhMfBhkDpMuqJYRLwmQR5Oar5RMq4W4DIYL3x9tZsP/HsOdpuijyJcsnzeUI3ACICxf8r3mVzA9JDBINVh9dASOEolGXe/iid69xFmHWx3qnXYByZPfViPao0XBMi0elxadg9J/6Vp77m6tctHBjhtB8YPqYw5YnbpF4cNnuljt+RkaYW3vO38muzBQeJFUtQ3zgvRJEWjqkkhH+iJpuWLAK7BZmjTG/lY1A=
X-Forefront-PRVS: 00046D390F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(189002)(199003)(101416001)(48376002)(77096005)(50466002)(86362001)(106356001)(450100001)(6116002)(3846002)(229853001)(68736007)(2351001)(8676002)(50986999)(47776003)(36756003)(2906002)(19580405001)(19580395003)(42186005)(97736004)(586003)(5003940100001)(33646002)(4326007)(66066001)(189998001)(105586002)(81156014)(110136002)(81166006)(305945005)(7846002)(50226002)(7736002)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR04MB2054;
	H:titan.amer.corp.natinst.com; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR04MB2054;
	23:YRiB9dGKMxCKGxBlK58/irQatMsPVfj48ikRnmDZz?=
	=?us-ascii?Q?BlOPh3LfB3luIZyynnzoVK+I9JSktYh/59AeBit4CGcUfPkoWpbyGPD9c7vB?=
	=?us-ascii?Q?yXdXqWwAxgoebXhD7sMYIPsfl+48BYEqc+8FR8lqdFCglWwlk2vFnVco9vVX?=
	=?us-ascii?Q?T6XUYa7zAEtwpxMJJK9sPzfiKec3yVSF2Eqj9CNrk1eXNPhQV30E6dqSi3Nd?=
	=?us-ascii?Q?l5yqotTkSohQZK4UA4Hzvu2AitsyuyW5z3gqU95JZvKoBEmfS8v+HSYosr6a?=
	=?us-ascii?Q?wAuFsLKjS75T1WX6Tao8hOMKmk97rJ6mWe/QYbBJV3NMyNcnLrRq+s0wiykA?=
	=?us-ascii?Q?FdqqHdLmAVSLoynKP+d2DkUu4cDxKfK3lerWr06T5+6/xOkqm4dr5hXhHHA/?=
	=?us-ascii?Q?c2UU1yme6jswkDbDZ15+NKRZhhq1KvE/tkwMxJvOcwUnFdc1fzFiTj/E5Gdk?=
	=?us-ascii?Q?l3bcN0phGu1djVoiEZOnNPAufbDSMm6x9S4QZVcJO8haaTyJxJ7d/DUB/KXv?=
	=?us-ascii?Q?Ekcr1x4Fh9bdHqJaa44SJB15rsIoqpqV2maDtOZccI3wVZPBZwdtA98Vu4/H?=
	=?us-ascii?Q?GUCw4gSDoJLiMSGe+y3smX7JiIdoFtQBc9jEOMwAtDdST1/Us+f/VBKlcMbx?=
	=?us-ascii?Q?0ShRC8L4SaIha2XJYQDRVAuyOq7W1VExNq6e+w5pVoEdYQFtb5s7FaLWyVUA?=
	=?us-ascii?Q?5N1YKxGfecWiHoFoBwiuX/kWbmKY0nWDLEYjPBV2s41BU3L+XAkRqNnlhcRG?=
	=?us-ascii?Q?RpiPg7RKRsfTtyeXoqTkNJHuHEog0cxH+Xnz+hg5tAxxWA/e9j32Xfy7q88k?=
	=?us-ascii?Q?zEw6w9fGeqIK4iMSgBiSh8htOK6aZhdA8OIvpmQH6g8evlPUWQHbQPTqhHD6?=
	=?us-ascii?Q?JhCYWYNpEboP9o13NcWI+Kxl3zTluAdna4hgQMcmHmwRod7rsn6Z6ZbuaM34?=
	=?us-ascii?Q?dgolf0RgX+urGreIXoNSaf4pmhtICqUCKAZBEI26EPwgYDEEtuhptwey87Dl?=
	=?us-ascii?Q?UF3w9T14O9ybM5iEz3jPcOL?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR04MB2054;
	6:4hQ1HGsKJ63jqXNbM99ap7+NCQoZyBMHoLbHsSNczJocgIrpTjsSLNxOe4dpXC7DFzJAZ1JoN2FIlOGahearXXi+3b1uLhWWrb4OF5qMDo3IcHSRT+NychTqpgh1WD6A/h24IQat6z3pHJxl2NhX8H0GwckyLXtQ1xGouLWRqDKwikop32PnMDoX9M7qFTLEgEqXgqjDeIY6HL7xDi4MlhiQ6Uj9Ar6gFVh8aK4HcGmHIfYZBPqY8rxSAwUW1IV618RjqbnWJuFoP/mGKaaPFhctdEMJg65dbzwgP7Kzp9Y=;
	5:1EyWjVZmqLcIvUGS+vdaqWMBalc6PyYZ6zC0Gwj/ePYDRt1lop7n7szxoJI5O+Ov1MibVBE7PIWaX+M312vdUCwhjrTVzdaZ2ItNNJXCtjNiParujDEYEsBl78AhoDRuTP0XYS3sOApo+k7q3dk+IQ==;
	24:2auBxs3F3yspDuMEMTl6qqwvdnEsJM1AYEH3gdH0WatrhgkSik73GWFsMVAJ0Z0FUhoRFrjLBf6OKMRKlT5rDGDToZaCwWNJz71n4+yf6CI=;
	7:u1Zm3xoEQl8pXoBSUVFFKz8dgzsfnNdOKf+RbvNWE3ouieCXaqWMP3SMPjYlyNRWIfIWEcmhUvpdPDP+Zj1FhIXIrpXchl9iJ1Cq4v5cEKho8JINs90Fu8nx3cPxJnsiQzuGCjmIrJ12S3jX0f0c8RDK+ivz5W2k9IeLk0K949eUmYqtU3yxcf88ABN1g+1N2nkH/9czYjloFEFIHXh8n0uPbIBaSlKhAT53K+cHT32E0aphOnVZzG6rzYAxbFRj
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2016 19:28:02.0498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR04MB2054
Subject: [PATCH] salt-tests: Disable staticdev QAWarning
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
X-List-Received-Date: Fri, 15 Jul 2016 21:00:59 -0000
Content-Type: text/plain

The salt-test package uses files with .a extensions in it's tests. These
are used in tests that inspect the tree structure of the file system and
have nothing to do with static libraries.

This triggers an OE QAWarning. Skip the staticdev check for this package
to disable this warning.

Signed-off-by: Collin Richards <collin.richards@ni.com>
Natinst-ReviewBoard-ID: 145293
---
 meta-openstack/recipes-support/salt/salt_2016.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
index a99296a..7024f42 100644
--- a/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2016.3.0.bb
@@ -35,6 +35,10 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools update-rc.d
 
+# Avoid a QA Warning triggered by the test package including a file
+# with a .a extension
+INSANE_SKIP_${PN}-tests += "staticdev"
+
 # Note ${PN}-tests must be before ${PN}-common in the PACKAGES variable
 # in order for ${PN}-tests to own the correct FILES.
 PACKAGES += "\
-- 
1.9.1



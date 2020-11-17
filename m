Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.64])
 by mx.groups.io with SMTP id smtpd.web12.15850.1605652437794347754
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 17 Nov 2020 14:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RCSgnYAA;
 spf=pass (domain: windriver.com, ip: 40.107.237.64, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEMJeVDRULdYBfogIE1jAoMOKx0qhDUp9ioE9q3ETk+2H2Ye82/EUREBQjV8UGg4TSxaSLIqd9RDgBh8QY8zcZ4Hya80mpRZ89Su5o1VNWDpfyRrU3PTJ4uhajAtHdWKtL1B/mc4sO/M6GeCR7JM/T1urzQZvOG25vlB0CCTMDkEOmMbXNOKTRvryQFLniD+QGp9GA4qgJdaKYPKdJjfHHjKzUhW/udQPFnXSvaB7T/ez8nIIC4voC+JJUkyVSh+92TlIMOBDohkxbl/Gf9A/JmjUbykufjCrdEx8G5AtI3IfFWkHEysu2ptZF2lYdCoFSPwy78itLYIedTvOI9PtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n8BmtKKrwQrnzFWIOBbvyxO3IFNZtv9sssT2hJrKrE=;
 b=loznzoAszEu4MCNVpwp+MBA6qIpYrv0EEUEm753fzOgqkEmf+SK25yaXxhNj88PMMLB2Kedyk7wx/rd+TH6JtnmoLdiP0suIMXJV03O8qwz5aYsOYthKnFpsQmufdzfetOrlNxylFwIBapuc6ex+PUperotWZzJFtcFHtrtdgyWe0KyMt6XzvGW7GFpk7P3rpPTdJOlAR4Bw94M50DzQm+71Bc+zu2D73E4hTqBAguDhqa16vCq0OiCF1ygMpU62K1l8O4WTnNBNRb1usKLbTisRfczZMr9IexJgg3L2v6le4+lTar4GNzUstF3WNtJ++m4Rio68iCKG5q+T6O7rcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7n8BmtKKrwQrnzFWIOBbvyxO3IFNZtv9sssT2hJrKrE=;
 b=RCSgnYAA5bANOL95DnSjxRjgrl19TJrQXawMvqFNSMKt7Gjga+v+YY6SH0Bng4VaL1AFbEZRI2IGX+NLhATSWX4IE8yvs2gs9NGP/ygS8uHI17YJG2GQzpdQx9WeF4fF1hXieK4vNDIL4KMvJrQWj1vGrpO3fpo08jwb9Z7zhN8=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Tue, 17 Nov 2020 22:33:55 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::7126:4988:387b:a741%2]) with mapi id 15.20.3541.025; Tue, 17 Nov 2020
 22:33:55 +0000
From: sakib.sajal@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nagios-core: fix do_install during cross builds
Date: Tue, 17 Nov 2020 17:33:36 -0500
Message-ID: <20201117223336.39599-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Tue, 17 Nov 2020 22:33:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7216ab12-6aa7-4d50-622e-08d88b48ddb1
X-MS-TrafficTypeDiagnostic: DM6PR11MB4692:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB46927CEC20EE8134BE86F243F2E20@DM6PR11MB4692.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aM/9HDjtfbaUIL5ciBX5vviBHS//DKPI/abB/vOK+h34AFtsZvPLZxJa4a9V8lIxg3AZ5lCA6A4Rkmnfh/pgGfOeLH/XG+b21NljVlO0SvezNRCW1fQ39+ii548GN+T+cmIxhfLGgq5J1OHGdfzNf+BAwqhHOpgbCEC9eyUQjuVAfARpAY4uNzyAmy6ZgQigOmduY9CKaIvhu+hJQfMVAEkOfeh6k2SoDf90oNQvPZwulu0cPWVUZmTWCzBV8JM24gMJi4xEW7pSiE9DwFBdk/jIQOsbyQkWjYzVRdBUjK65ptv2rx+u/fcaD7FptmA6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(366004)(136003)(396003)(478600001)(6916009)(83380400001)(36756003)(86362001)(26005)(44832011)(66556008)(66946007)(316002)(66476007)(5660300002)(1076003)(6486002)(52116002)(16526019)(8936002)(186003)(8676002)(2616005)(6666004)(956004)(6506007)(6512007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	s28dUH2gkV3aTcS8/iZZbEyXLTUCUfe1udw7Giqtq8Md939qegrFEzxntIlZqKU3avVbgE55iGTQTevC2++B909BVWfEfbQPJOEHAqVjpV8nwJsjD5/Djqtb76d37EOe+nV9O72hyuvMm5yeT9CgiOlX3Sie9xy3PQTYx6dN47SODdQ4+qMnSrK4SRGOPjopV00WTc4g/xBF7xF9Akno2c23TCwW5CaxdqJ5PI7mK8KZXQTOfGx7T3kxFZCk4og18h3HS1KU55JKN+1PXeIXY+sC39SBbf7XdKAmfvWD11RvSXqNZpC4aJXBA1h+dbq3m4gmJ1gDyoy4Hak84mCDFbyxNWU1LRIxMlHGu+y2Drfc/Xb21t6LpvmfAb2ikf6fLj+jrx36t5DHHGeT7DgA6k3LoPDm9GDjvpF0NyKH1p1R2qacnR7L83nK6NLypvT3A7PDb53p2NkORHR4Pi1fe64wLyTru1A7xFqg6MPcEIxob6N/7VKM6tiE2n1MUBXu7vV385kV+ftmJcoNIbrhup/7qRGCnoCC46CRufD/jxhNY0XKFtpoH5tp0CLwy2Du2VCTEnZ3Ps/6Ox/sFkd3iCigw38KXJDYWZq+s3r/3Ne6WFBgxp4134B39DeHX6dgebhWWrox8wfrgtnKKsR3Vh7dlNz+vgCd1hMCK/otH1wkM5Rfax5JswpWE+87BDMwS3YIYCDYNtodlFjGChdckFhIkif2OwbrlSPdxGTZqkPYSDQOlOUttfZUyS90RgPHVckOpHVAB2b5zvVCJsqJb+RiT1G0JWiUArVtdAYuMEH2WWWT966mtbzmJvcOmQC2y2fe7fuGeIGUOYizt2hHurhwPqXcvOSgVPi2X0uLRMgtR0TXdsBZu6ELANJtYSruLu+a9wDS0y23lgVng+Wg3Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7216ab12-6aa7-4d50-622e-08d88b48ddb1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 22:33:55.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ws/vLgroe7KywRdZMEWOegpp/WH62RR+4lY70w/AVsPp7vXHHnfoAXTxIeslzene6u0wVHNnhFNuySc556PfqoKfnXSi90A5ZTqoHB6IvFM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Upstream started stripping built binaries by default, using
HOSTTOOLS install to strip binaries that are different in
architecture from the host, raising errors:

strip: Unable to recognise the format of the input file
TOPDIR/tmp-glibc/hosttools/install: strip process terminated abnormally

Hence, build unstripped binaries and let oe build system
strip the binaries during do_package.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 recipes-extended/nagios/nagios-core_4.4.6.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extende=
d/nagios/nagios-core_4.4.6.bb
index aaa722c..4cbec2b 100644
--- a/recipes-extended/nagios/nagios-core_4.4.6.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
@@ -80,7 +80,7 @@ do_compile() {
 }
=20
 do_install() {
-    oe_runmake 'DESTDIR=3D${D}' install
+    oe_runmake 'DESTDIR=3D${D}' install-unstripped
     oe_runmake 'DESTDIR=3D${D}' install-init
     oe_runmake 'DESTDIR=3D${D}' install-config
     oe_runmake 'DESTDIR=3D${D}' install-commandmode
@@ -158,5 +158,3 @@ CVE_PRODUCT =3D "nagios_core"
 ALTERNATIVE_PRIORITY_${PN} =3D '20'
 ALTERNATIVE_${PN} =3D "nagios"
 ALTERNATIVE_LINK_NAME[nagios] =3D "${localstatedir}/nagios"
-
-INSANE_SKIP_${PN} =3D "already-stripped"
--=20
2.29.2


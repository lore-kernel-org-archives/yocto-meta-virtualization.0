Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2679.1609984344568551510
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jan 2021 17:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ht4kfzdl;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: daniel.dragomir@windriver.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
	by mail.yoctoproject.org (Postfix) with ESMTPS id DA6ED38C0894
	for <meta-virtualization@yoctoproject.org>; Thu,  7 Jan 2021 01:52:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYJjAwMrGH3d8GBxA8nDteUuBQTG1mzcaG+8K+Aee0IFD6dLdBloYcCH+WeDlrhulot30tzuxwkZ+5vTgyZHi6PgNvqc81Qd5wFHxClg5KNrAkyhoUBlSC2pD794dWdnNQjHDCteO+2QvotLJa2Ls5kFu/r1UF0arG1sxuVSqz4jGWXRPb/kxeJcZqgPtjzIrhxPG5QF2DV0jJPoc7/7bJ+0JZpqvPIReTQYZnoB6+onXIOQxlIyupUngGQGzKw2PqHa0lkOobsAsoTnnf3KrvBAJ0VWg59O5uFqvNby1zk88LA5613oN3LMiq4hXpaTWGR07WNQyyD+mSAZ6UY6oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+Bt/k1HARy2cfAeTpAj46dE5CIsJLCkc1X2RgnuQLs=;
 b=S54if0O6a9hggNTvTMYOYub+QuSnNO18ibi190+j3v8P9aMQUmVV8GyTWuyIc4JT6Vl73HnpShk7qn5/fulWYESsWWs4gHwAOMUoV+I/R11SUoPL14l2XqqRp6dxnsfE0Fho2Io2qoE9DswYU3lHgZWCUX8RrfJBoJ5pFuH/2dq/hEfEayt/HT73+NQaexl1QjKnOzz/3ZV0l0WcZoJDaT7xBTCpLMex0QFkub9m30C7+G8dALjcnMRSKOSIdIZOO+JXQ+uaUMU+tEA8MgbcZ7BWvqCkW+8CsQNOHYySc1M3loq07LpeeBjPsA5QNrDxjcQrZGftBRmn/fB2z4iAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+Bt/k1HARy2cfAeTpAj46dE5CIsJLCkc1X2RgnuQLs=;
 b=Ht4kfzdlmqZ81DPHs13ImyYlOhi/YW19NXjdZlhU/6EBSjIBFxgx/m81j/7NdNtDu8RKHTfwyIcaYz5gXwo/93hyVLUEZwBpAn/m0G9RoJKk1GFJmyTYHQ44Ex8m6mzrI+TfV46zYHqKGXWIa1YmWtvxe4UNOM8K0LaR7/X2Vn4=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
 by CY4PR11MB1813.namprd11.prod.outlook.com (2603:10b6:903:127::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Thu, 7 Jan
 2021 01:52:22 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
 ([fe80::b1a7:f5d2:7a2:f03b]) by CY4PR11MB1814.namprd11.prod.outlook.com
 ([fe80::b1a7:f5d2:7a2:f03b%12]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 01:52:22 +0000
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization] [thud] [PATCH] lxc: Fix postinstall script for read-only rootfs
Date: Thu,  7 Jan 2021 03:53:35 +0000
Message-Id: <20210107035337.33793-1-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VE1PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:803:104::33) To CY4PR11MB1814.namprd11.prod.outlook.com
 (2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-ps-s1.wrs.com (46.97.150.20) by VE1PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:803:104::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 01:52:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d5ba8a8-d20e-47b1-2082-08d8b2aedfec
X-MS-TrafficTypeDiagnostic: CY4PR11MB1813:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB1813D3BA875E02653562F66EF7AF0@CY4PR11MB1813.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+gZEM8cg+DFokhOTccxvgXZ98mJy3ctlh9oJxclHvd9maz9s8TIOacRp5ejQ//6mbQ84EM4CgcYK/20y+UI7wrFu6D/XQ2bx1rJ7SYd8iqZKNHpEcxRMYwpnDBictW+RSesSISyjeaYZj8H3QbGDnzsu3/ulougkV9gk3ikeUNA0oRvVYiXLrkGsj0poxsgCsPPgsI/0ZexaY1PITzEDe4PGgs5UC1Ct219PCOsGpYZN6Ag/DPrEx1/Rm9tJu82sRAKuXM481KqcMdvZ9eLcVxWqUIEYqD3U43UKrG5C6n2b5EQUVo+tRyCbMGU2hrTcBPYyQDOVcc8Gw84q2Ac9rGWXsCxP2vSjEO4NS26O4VwWgGW0v4gu7FqPohKZYjzGZYsNLh4tdKbGKd0ptjBsOg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1814.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(956004)(6506007)(2616005)(26005)(478600001)(8676002)(5660300002)(83380400001)(1076003)(2906002)(8936002)(6512007)(86362001)(52116002)(6916009)(66476007)(6666004)(66556008)(66946007)(16526019)(6486002)(316002)(186003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qJKydZARiHMMm4R7KWItdL0wJZEFT2bNU3Jpw85oAMJ63db9B7oNu3Xl6iaZ?=
 =?us-ascii?Q?VPfnps1W1FVCzHTOWMWgw2R/wH29wXBxqbsQUS+XCTEtSPsijWKA/yBr7Y2a?=
 =?us-ascii?Q?vWP8U2ewUloVAA4R4v6HaapOhGiszt7SL9QIdsS7CQPhBldGPpbiYkaGozpe?=
 =?us-ascii?Q?urIScIdP8e14o0HsQ9OTAEkZov6ktVOTgyDM+y35H0p27xM7qTs3CZM9sOT1?=
 =?us-ascii?Q?t/fKPZP94/WRh5qPRs/lpvu4UIHvyvShbmzBdNXZA7eAeL7RM01GwbC1x0Sp?=
 =?us-ascii?Q?bs7iCEjXaOH28iMIBhuUe4fuPGIbIW5fDzMfJ/orgGGml00Xe7yB7wLRQNCq?=
 =?us-ascii?Q?NIWy4AUzEleu0BuoW6WBJuBiiOiX2BcM1Ed+psZHyXLnoDroYIGOiu7uc1d3?=
 =?us-ascii?Q?cDNbYMhpnPao6OMrrNxImvn8y3+Ql88UHfw2NU1HbSrsbDKdD2+Ih7PsE4hz?=
 =?us-ascii?Q?ePMK/A3hqK/srh9FMuK6HDT69ISbrydbiujAtWfFAj5MvKfh6uXHRAxIzHoh?=
 =?us-ascii?Q?B6YbUBdPKb82rR1l/V36te0k/xo6okbno2tSYpgff8/xRQtO0uSblNc+JTdp?=
 =?us-ascii?Q?Bj14LPhKgEDFxqeai+eUb3S5FGV6JJbujHzLMF5wvlajzrapETH/NztghLIA?=
 =?us-ascii?Q?3zu2H0Z91MJup7Y1ZAVKs8OzAjUZ4hz0j075NfDUUcyvbAc+zkVy+hy470N+?=
 =?us-ascii?Q?4sYQNoRG2v3+EeNX+u2hYP81oxgsXqmu47WiY2zadIKkPo6VBpgvk3sUeBEK?=
 =?us-ascii?Q?09KZ4EHK2dKgPssQ8BwpeLEUeDGhXisP/KFIparuSqcZPOusbeFAgT9kyTFi?=
 =?us-ascii?Q?acWn+LxORnz7eZf6YEVANoazQo/HSMPXks6Q7lwQcAYkz2jQUr6MGygI5yyZ?=
 =?us-ascii?Q?j9OClqEoAd48Hq6uzMgefXrwvbF2LBdrcd1BRBV3y2v5JSCUzGE1Biq5jL8L?=
 =?us-ascii?Q?2+UAZlgNqm1WSNFGNMiU2Q43BpxHyFsYYr9QRZkA1ZcmatH3UOcoZAwfqQhf?=
 =?us-ascii?Q?5sPc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1814.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 01:52:22.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5ba8a8-d20e-47b1-2082-08d8b2aedfec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fs6aBjN3gi87Mi+4CelIdJJbcxDvXqDb763ljVHqomDnnhAdqA08mxoQrOvT3t0KQIIcQatmIwdTTWH8nEV0RPKUXuQYBMbmkMtiYRVoF6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1813
Content-Type: text/plain

Ensure postinstall script for lxc-networking package can run at
build time for a read-only rootfs (with sysvinit).

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-containers/lxc/lxc_3.1.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/lxc/lxc_3.1.0.bb b/recipes-containers/lxc/lxc_3.1.0.bb
index 977583f..235a429 100644
--- a/recipes-containers/lxc/lxc_3.1.0.bb
+++ b/recipes-containers/lxc/lxc_3.1.0.bb
@@ -167,9 +167,9 @@ pkg_postinst_${PN}() {
 	fi
 }
 
-pkg_postinst_ontarget_${PN}-networking() {
+pkg_postinst_${PN}-networking() {
 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-cat >> /etc/network/interfaces << EOF
+cat >> $D/etc/network/interfaces << EOF
 
 auto lxcbr0
 iface lxcbr0 inet dhcp
@@ -178,7 +178,7 @@ iface lxcbr0 inet dhcp
 	bridge_maxwait 0
 EOF
 
-cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
+cat<<EOF>$D/etc/network/if-pre-up.d/lxcbr0
 #! /bin/sh
 
 if test "x\$IFACE" = xlxcbr0 ; then
@@ -191,6 +191,6 @@ if test "x\$IFACE" = xlxcbr0 ; then
         fi
 fi
 EOF
-chmod 755 /etc/network/if-pre-up.d/lxcbr0
+chmod 755 $D/etc/network/if-pre-up.d/lxcbr0
 fi
 }
-- 
2.17.1


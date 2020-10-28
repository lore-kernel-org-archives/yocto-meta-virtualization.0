Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.78])
 by mx.groups.io with SMTP id smtpd.web12.468.1603906280903221943
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 10:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e8RxfUZI;
 spf=pass (domain: windriver.com, ip: 40.107.94.78, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFrHfRtAqXsYOL93u/fr9z27m5u3lUYxlmdHw8KUfrY2Isdw63G+TWFc7muXmzQ6FFoDLSYMc/NWnuVgWtoT26J0yyW5JK28qipXZIYlY4hbpIQLFNrRx5uVUqEYaFRD7ACHG/3+E2w1fk5OZE3HY5USX0UWYA7OdG46/HAnnR1ApT8N+uN0PGVeGz9oF14xotL+owEHze11Td2kDNiKw1TSKJfyU77a19ee3SZ+2KL1OtSAoE75QS2pNYLMfduQZYqs6e9vnBOd5qsJDFDBCXaFjv0+iHDA/Qh2xxk7AWJlCTOk7fO77ypKzaLAjol4GO8S3+Nx8Pq5Dhy9IU9hKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFWdyVjzA1/FH7NmUVasUQE/9sgq1Hyf27txbU2e8FA=;
 b=AR2XuKYPQQmorD+njWnU0W8GH/m4bKcQSNOufpnnAB2X+64DMTtYCokeJUB01jbTDIQHAka1l2JwhjwqWhQwrxHAsLgx3ufWHLGlnI0Yovwa1SKL0BenIgvN9J+xpz0Y0yUf4Xh0aJ6GAK/TkTB8ByNloTmrDbMkvKJUT5PD2kmlILRnVzhhC7nNpY96NJtIRsu+V7/Hd0KETOhZR8mmPpF6jQl8mzzN0+g5qbDL35nbqZfi7mMUckV+7ReQT8OPBfKUwGaKB2rXNkHGiyYMCIo3eM5mWP+JnN5fYnG53mxF9WLhcHUpVA1GqjqZVgMKl/JKtfg/DTkerhX6Gs1jPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFWdyVjzA1/FH7NmUVasUQE/9sgq1Hyf27txbU2e8FA=;
 b=e8RxfUZI6AiWOT/HQj2qgQwVuRwmXfJNVnMzRDejTtpM4ZQUYceqx8RMhHmMKlqtAhGDmqtYztL+V3nRKu9xdQRApOUYSTOwRNJrPa/YHgwvuWNtquffo1zOeErwW3wdm8WJd76wmq5GkAX/lMDTiup+x6f/aYW2veqLa39FVC4=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4076.namprd11.prod.outlook.com (2603:10b6:5:197::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.23; Wed, 28 Oct 2020 17:31:19 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 17:31:19 +0000
From: sakib.sajal@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nagios-core: uprev v4.4.3 -> v4.4.6
Date: Wed, 28 Oct 2020 13:31:04 -0400
Message-ID: <20201028173104.40737-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::32) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YTOPR0101CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 17:31:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8567cf2-1229-4215-05a9-08d87b67482d
X-MS-TrafficTypeDiagnostic: DM6PR11MB4076:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB40766A01C4D48BC9D1404125F2170@DM6PR11MB4076.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EoOVFhY0vyMTjJzP6tBfD7DkI8yM+LxrphtrXH6SwhIZ6Cyr0+CWw8Ov6MH7Lsna+TmGwL9Glvp8qvjGu1sgzWF7txgcFHSdLaCx8CI6Z5AjKdkpp6EwhgHzouzlQoE4EJdxWQWomfE6PNzkAXsaaOR07C2qwQMIm3gKrkcdaCRMv7+qQdJNzDhrIdvzadgd4HZZDZnuqLX+JF7rBVu9W3djST9VlyBCQ1yZoskom6I+liQcOtmPxC/5jzDv/UHoqiN2a9kU8/agvAnnc/K3+RozeVKge6czIMdH9YIcy3fJ8F35S/hADUvrLfqrT3W/a820d/c9gWhmVHJnJQadE6JU3UGtegUYHbnjGVGSANFjo+c5F6frwI9xtCOaDbgQXu8Nn2fcSMnBbJ+vxcZczg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(6512007)(2906002)(36756003)(8676002)(66476007)(5660300002)(86362001)(1076003)(316002)(6666004)(956004)(8936002)(66556008)(6486002)(83380400001)(66946007)(52116002)(44832011)(26005)(478600001)(2616005)(6916009)(6506007)(16526019)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FqzdqJvsW7p7rZQpJYOZZp/O8SPxOG74rpQrtSx5ItX9DK/UZh1ArFafOcmEkZOQhc3oobHUAiEb/znCAr3DlomoSInnbriJX2cZh1mJUq+SF7BNHXztLYH/JfK9Xd77zErubMoh25Ng+Q9fgZdFdsOB0tPO/UPyoRVWu4us7edSs05Eu+KpP1ItNWzgqiInRKWZgCDGFEu+9qjLstquOIsmbiXEpf7ww+BsXhEG+VeGHZ8FM43EIZxhOQF8L2/IU5oe1nZA27tDSXoQ1AEL7zUzT47r3z8N1ObLrO7eesKopx4+yxV2iKE8KtSD0xLmuXEadi0oKD4OhzMglcLy1jLi/Zs+uCKifvIdIMFO+J5Q8G2ksxIvrkVBUVcQsuoELf/2KV5mCmNLadWyHj3kmHH0Iy7Dlrijj3KbsH3DGT6LxkW2xjGmNLTRDVT4K80BzNwO/Wx9Hs4JP6zXa8aRCtzXTluRxaOhcvej9zeaggraAj6zOWX/1MT+L/zKrRHOnxpFFoiluxhAoLIXH8uC5ywQSWTR8tIdf76Fk5OiqJ24r+G3OoynUI43nudqRVtoy1vvg/PJMcwZX4jN9SilhsIRE6E6Bmj1tnHKtPVaNoB0ZXK6GkEEvMYu1y4UMRFmUxtMpEcYaFQ4gmXzPiDUjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8567cf2-1229-4215-05a9-08d87b67482d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 17:31:19.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fg0uNl4KrsDXkhdxX/iasqRYtHTD9eWnQVvYqLDDCG7gMisRxsaNw4nnmisIjiE/rPrC81ynwhSTV8qpUGXiFuX1k52PNDhLzWww/S1RRnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4076
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Minor upgrade including bug and CVE fixes namely CVE-2020-13977

Testing:
Built, booted and started nagios-core service without any errors.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../nagios/{nagios-core_4.4.3.bb =3D> nagios-core_4.4.6.bb}   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename recipes-extended/nagios/{nagios-core_4.4.3.bb =3D> nagios-core_4.4.=
6.bb} (96%)

diff --git a/recipes-extended/nagios/nagios-core_4.4.3.bb b/recipes-extende=
d/nagios/nagios-core_4.4.6.bb
similarity index 96%
rename from recipes-extended/nagios/nagios-core_4.4.3.bb
rename to recipes-extended/nagios/nagios-core_4.4.6.bb
index c78259e..aaa722c 100644
--- a/recipes-extended/nagios/nagios-core_4.4.3.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
@@ -20,8 +20,8 @@ SRC_URI =3D "http://prdownloads.sourceforge.net/sourcefor=
ge/${SRCNAME}/${SRCNAME}-
            file://nagios-core-systemd-volatile.conf \
            "
=20
-SRC_URI[md5sum] =3D "8beb253b1236ee1407f698b5d2a2d894"
-SRC_URI[sha256sum] =3D "bba8f0e8dc8cf72f7a7ae4e8ce9c60f5bd315629421b9ec348=
18a28b8da49f67"
+SRC_URI[md5sum] =3D "ba849e9487e13859381eb117127bfee2"
+SRC_URI[sha256sum] =3D "ab0d5a52caf01e6f4dcd84252c4eb5df5a24f90bb7f951f038=
75eef54f5ab0f4"
=20
 S =3D "${WORKDIR}/${SRCNAME}-${PV}"
=20
@@ -158,3 +158,5 @@ CVE_PRODUCT =3D "nagios_core"
 ALTERNATIVE_PRIORITY_${PN} =3D '20'
 ALTERNATIVE_${PN} =3D "nagios"
 ALTERNATIVE_LINK_NAME[nagios] =3D "${localstatedir}/nagios"
+
+INSANE_SKIP_${PN} =3D "already-stripped"
--=20
2.27.0


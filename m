Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.2655.1609984346371604428
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 06 Jan 2021 17:52:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=l5274kdC;
 spf=softfail (domain: windriver.com, ip: 198.145.29.25, mailfrom: daniel.dragomir@windriver.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 1FB1238C0894
	for <meta-virtualization@yoctoproject.org>; Thu,  7 Jan 2021 01:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnqWW2jLseMsGaRSvJJsg6lNNzKWluZegEadHk9crIkC/A6KrnIsG0Igo+2u9zQgaRDltendEWWxpuWAccgM+4BAaxlT/eMILpngpt/YR3regChuaeVW9TFk7iY0CcyRUgyi6n0qK1/fgb9xxfNn/kWLvCPZDkiM+RkirbfbCgwvO3XGWTf69FEoA1oYFUH6V6ljpc4+dZFMZyARmm7kJteOgi2rZatfnEU10Yxac7X73YGfn06+dgiZQjQfPXQk+qlBMLIDyej15O6EFX78b3RrSw47vAHxDorALVEmMrVJg/CIjipv7/nwNQYUNjyidVdWivTjd34uA2ZXGv1bDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbTwtVaMVz8TMnJ/eGv4MBOkxJiXxr7yD+bhpsqGNNs=;
 b=YEsezwuL6rLwnCaHWAxKhCmd3td/B0L/q33ff+hYVp5kNEgPqnZLdrB11lOI7MveSaWHkbqkYb+DpC4oC0kMZ0vi8CT49k+arYZ1u3u3i3QLEAdlkdnJslmUSMZBAAAqlQ/HARLKllxFGPWqe2qK30Tk8rOPgFNYxnoQDvKVMeaN3gZPI/He/GSh4ci7Fgo3U2WuOpBDj+c7yN3JuilBR50+cmPUCGXv3EMaJyuxWLwOZENgxJr3IFd+wUtOFnHD/kODtDO3s3ZhiuHRIqcUpoh4xREiBv4uriH+pCjNydlWzA6uN/S0k1e3WYcryPOb/Yph6AojaNftdbakWtjw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbTwtVaMVz8TMnJ/eGv4MBOkxJiXxr7yD+bhpsqGNNs=;
 b=l5274kdC+Oz9y/HGDhP+llEKJt01AuHpBAn4/VbOVL0MAo8e+IaehNaMmg9HMdWP4UCt3IwIopZKGRuFvWxq22hHk0LnNDurqXDuTEkFApAFOAiNcIqY19q3063RXaTiwOwjb1cNEBZoMZyT3oY7MFgFJZBKNO4JSOUwAYUW0aY=
Authentication-Results: yoctoproject.org; dkim=none (message not signed)
 header.d=none;yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1814.namprd11.prod.outlook.com (2603:10b6:903:11d::7)
 by CY4PR11MB1813.namprd11.prod.outlook.com (2603:10b6:903:127::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Thu, 7 Jan
 2021 01:52:24 +0000
Received: from CY4PR11MB1814.namprd11.prod.outlook.com
 ([fe80::b1a7:f5d2:7a2:f03b]) by CY4PR11MB1814.namprd11.prod.outlook.com
 ([fe80::b1a7:f5d2:7a2:f03b%12]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 01:52:24 +0000
From: "Daniel Dragomir" <Daniel.Dragomir@windriver.com>
To: meta-virtualization@yoctoproject.org
Subject: [meta-virtualization] [master] [PATCH] lxc: Fix postinstall script for read-only rootfs
Date: Thu,  7 Jan 2021 03:53:37 +0000
Message-Id: <20210107035337.33793-3-Daniel.Dragomir@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210107035337.33793-1-Daniel.Dragomir@windriver.com>
References: <20210107035337.33793-1-Daniel.Dragomir@windriver.com>
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VE1PR08CA0020.eurprd08.prod.outlook.com
 (2603:10a6:803:104::33) To CY4PR11MB1814.namprd11.prod.outlook.com
 (2603:10b6:903:11d::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-ps-s1.wrs.com (46.97.150.20) by VE1PR08CA0020.eurprd08.prod.outlook.com (2603:10a6:803:104::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 01:52:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e858609-ad21-426c-6d0e-08d8b2aee160
X-MS-TrafficTypeDiagnostic: CY4PR11MB1813:
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB18137629B644C1ABDA737D59F7AF0@CY4PR11MB1813.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lq4Z/PHwdp/v0PIDgLaNFo1WCmCIVx/z2bGDhAfuvHo5eLIV7nCKjz9d/bcyOtd1Lz3o9vGD+L4FF/RYaRnmqk9DCOcuK7t9ep8OH4QUDO+58C/NB+Zdw0dWfKkSbRCfE90m0aZznC8qtsVSfQdFGhceghBRnH8kSjSXFg9YvQV+nk8HVs823lQm/9HXq1AsNTv10uCdcykOs3g9BddL+4zjIaEtNVO2algGHWN/5Ec8nOY3lCWueD4JaOF/F2Yz6j85I+CDVkau9bjaldFm3JWuZ01u2e0WbuB2iTlW8hEQ93MjV0BnznBMyMUQDbkUPcBUWV6xh48p8Bh4OOCbEWvM9Ym9EV8OXN47Yj46w6KS9jf0eRmT9huFtkX7YTQTsmHI0vCVX9KdHct6TTGJPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1814.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(956004)(6506007)(2616005)(26005)(478600001)(8676002)(5660300002)(83380400001)(1076003)(2906002)(8936002)(6512007)(86362001)(52116002)(6916009)(66476007)(6666004)(66556008)(66946007)(16526019)(6486002)(316002)(186003)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?AyPLppHwHA7vFj4lFUYdiuC5pcikPfpwAf9pX492cxICdr/70mXhgp6C2UAL?=
 =?us-ascii?Q?ebalNTVrVHUoZVqyhqcLsOg4iVc5sAu8SoI18NtXS+XGj39UXjoSNwDnLngq?=
 =?us-ascii?Q?NMSDcqa915rDwsAZ7lSoThdB95W5fyuO5WpeqKp1N6BmM+eMj0N2riDGIE/y?=
 =?us-ascii?Q?Y5nfaQMSyt7cCoG55dyMun791GvqWACQ/WK3e+/q1EgWNuP0W3NpurTc8i6f?=
 =?us-ascii?Q?lcNzVgmVyfVg10t8+rXRO5AVqpXu9rLK/7Q7tIY/pu+NFDK1oFbr9dcjyxBl?=
 =?us-ascii?Q?kz7X+U+hI0+5Cs7oPirtxz0KYefxakmsECrsh1pYJvGIH9K1RidpyZJLmrFu?=
 =?us-ascii?Q?60X3SnoXxjxbc3mZDxj2fnJZM9MFeLyjyRTHE/rSklmm6EvbpcT4P4km84qj?=
 =?us-ascii?Q?DNZ5OTl3v+gpGn58rntPWGWJP4gAIlu2idNomACzaAAnORyC0EcQFyIERr1u?=
 =?us-ascii?Q?0Ks0b0KbY5kPb/rp9qZWu0Bxv4aWIRyUoVka/vCwwlb2dtPtms0eWc6RnU3n?=
 =?us-ascii?Q?9eAEheocW72rJbF6PGghWmE5woc4OT8lSvg3WnrM5bzbmIzQ9xn8zNt4KrMj?=
 =?us-ascii?Q?2SYQ1KBVzeev4rXUnOlQ8Dh1CFjm2dSzJGBYES3xnpKGuKflD72DT5HtzUKv?=
 =?us-ascii?Q?ewoghqr+6XByegTugjI782dZPsjsXDgZkPMd2uDYORMfQtH1gD1DBTVod4Mm?=
 =?us-ascii?Q?PtDTMo92lEsU0VGjT+7WHZykElQ+fp0AtFCWfW9bf5F1/EYobexewvvwzemj?=
 =?us-ascii?Q?HOYPoM20xls/LqGvQV+znoKv1Dy4qHweZbSuLIE/7bZ44gyFvWEbWySpVYTF?=
 =?us-ascii?Q?HmeYLbapuXkrUECJg9fPUmJYfxNF6cuLiA+J2Ds7jGU/gJpiCEyzTuO/0IE1?=
 =?us-ascii?Q?S/Ry430/XUkcKueR6U2CuT6HmDw7yXdP+aDipQ9mUdpxuA76+w8pXI4jyHX5?=
 =?us-ascii?Q?BnCroqATfFoVib+mdE50SD6t0rceBA3ESxNz2H8fJrBtyWgTWMJT4WLOBZ92?=
 =?us-ascii?Q?EZXw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1814.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 01:52:24.6742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e858609-ad21-426c-6d0e-08d8b2aee160
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzdQUFXdQeCBirOO3C+wTnRnPEWCIiwef855H3Z3RhK7VzDli6TBbwz6Kf0JqqhHwuhnTdtvatj3RX0DwkmpCpNAx2RGcKETv3vWeh5eRP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1813
Content-Type: text/plain

Ensure postinstall script for lxc-networking package can run at
build time for a read-only rootfs (with sysvinit).

Signed-off-by: Daniel Dragomir <Daniel.Dragomir@windriver.com>
---
 recipes-containers/lxc/lxc_4.0.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/lxc/lxc_4.0.4.bb b/recipes-containers/lxc/lxc_4.0.4.bb
index 4ef5fc0..19b40f6 100644
--- a/recipes-containers/lxc/lxc_4.0.4.bb
+++ b/recipes-containers/lxc/lxc_4.0.4.bb
@@ -173,9 +173,9 @@ pkg_postinst_${PN}() {
 	fi
 }
 
-pkg_postinst_ontarget_${PN}-networking() {
+pkg_postinst_${PN}-networking() {
 if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-cat >> /etc/network/interfaces << EOF
+cat >> $D/etc/network/interfaces << EOF
 
 auto lxcbr0
 iface lxcbr0 inet dhcp
@@ -184,7 +184,7 @@ iface lxcbr0 inet dhcp
 	bridge_maxwait 0
 EOF
 
-cat<<EOF>/etc/network/if-pre-up.d/lxcbr0
+cat<<EOF>$D/etc/network/if-pre-up.d/lxcbr0
 #! /bin/sh
 
 if test "x\$IFACE" = xlxcbr0 ; then
@@ -197,6 +197,6 @@ if test "x\$IFACE" = xlxcbr0 ; then
         fi
 fi
 EOF
-chmod 755 /etc/network/if-pre-up.d/lxcbr0
+chmod 755 $D/etc/network/if-pre-up.d/lxcbr0
 fi
 }
-- 
2.17.1


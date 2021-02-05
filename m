Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web09.1052.1612562005152042495
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 13:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FbOf0Wmm;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzJDpfSX07O8KSJKXR0XlTWVgLBWCjoJIJSKvd6QLPUWRStWcGgHChg8byuHPeT7vdxsr0oLIXmjVI43YRnPHyOMisfx7+MNoZQUtKimTXPZ5x6GDi6m6Cp7/yewwH3hHaViFwBxYAecfru49Oo9s3ecA4DaOjQ+y0BbPOu+Y0xTJFbDRIMkhKIYTY/La32Fdpxi0dgGwgnvFMMZ5LbihUNdcoDtLlQRD1pTzgcDhPczsGKrp41qHyVKfpg3PPx+Z1DF5SHnTEQi6cwCqH1IBX0rOnZ5WHzPjmUTAd0F8u9HhorZcRxW6aJ6shb+pGrStk9h9aJHnaVQk3TmBfMnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfRXKcKlrVdwgmmgSdaeKOrjKEH7DsngSRM5zGdATlU=;
 b=ScgNiJC+6kCWpHpfJSld2DiNUYorq7NMUtojJyqztMvSGTWvy/g9Fd7RARyE1NZAx3AMoUaPBbFvxO3zp2vnwqPZCJKdDkdW1vBFLC1bipPJ+EDxnphG3a2Qp2XqIVpNSCz9xrg+MYJ7GFV5RBQbllkWSYe8lHWQLeg8hGxryBVe/3vc3GYTkBm6/4ayYKRA+G8uqbNKtnUQSi/Oc8iyFx5QBvCp6YPswWDZzNopsNL05Qn07CkMkIWS5/lKR0o/RWg7S+l8Php5MPt/xntrbO9x7uVqVp8pK/S/8buckWdUg4M2PT8dOmx58IZwWxBicPg3iOfOQ1IzLLYTXSDtjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfRXKcKlrVdwgmmgSdaeKOrjKEH7DsngSRM5zGdATlU=;
 b=FbOf0WmmbO7ToQxN6R2mZX6QLvollAaXHatGSAyD4KI/15F5MNP0rq1gZaZy5WW/CSOhlXvZXW5Y4H7SrDkWyilV4vbfgP7Rt4LxTB9ZR/OI7hBuzIKjdIMFmLW2ctCUpb6KcjiNUY5HSHF33o0PJEZAMtZEixi50qVosC6F9hU=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Fri, 5 Feb
 2021 21:53:23 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%7]) with mapi id 15.20.3805.027; Fri, 5 Feb 2021
 21:53:23 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] nagios-nsca: blacklist recipe due to unsupported libmcrypt
Date: Fri,  5 Feb 2021 16:53:10 -0500
Message-ID: <20210205215310.17125-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BL1PR13CA0261.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::26) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by BL1PR13CA0261.namprd13.prod.outlook.com (2603:10b6:208:2ba::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 21:53:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deeef92f-14f5-499f-e073-08d8ca207570
X-MS-TrafficTypeDiagnostic: SA0PR11MB4637:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB463793836CC4E9E05344C82A80B29@SA0PR11MB4637.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ShlqqkMqDSAbm764usBjZcuCxjXtHL7XOzsG1EwLCaVcg3aTOvkDZhqm8jzdXx6vmSBCDwV5xSLwK8mu6OzEJee4Z2JxQzhiI+EHEzdFKnJMTiAaYFpx+qnazRhKYeNqzt2OajeDXUb3ZxroB1LAwkfThmEIGl7e+oy3DDP6YDMGGBsWZHHcZp8bYGJSAgHei7OkeDX6gczYS7Xrj2qjc7s+kwODCdsfF7zzOe6g2KL+quejyF8bUYqQhjYAVLSCdm/aU51G20nqXt+J7puq+lCYcEBhTZeuHffOd1fypkgJkeceTG5nGWEtODRGdRec6viSWy0rmTMyotewvNo6u4lg9zx2ewcuzKDiEEJy28d6fqRkYcfQRhZC6PVHqnMxPJrydm/aUZYMrNk2csoikXT7pTl8768/QHAWtKnHNwzpw01bXlQ2ugGjCRwZZ5KSnXFSMuFyLhZIps4sQhyu0d9v0T9ufNEHbbbn7XXpO9OAvPjOlLP6WvsdTK4ngzexNI9ZkBlCBn5ssfDJvmVXVg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(16526019)(4744005)(6916009)(86362001)(478600001)(1076003)(956004)(26005)(52116002)(316002)(8936002)(8676002)(186003)(66476007)(5660300002)(6486002)(6506007)(6512007)(36756003)(66946007)(6666004)(2616005)(66556008)(83380400001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?fBHsBEeW4UluY0/h1AYYbdZVsSzSKBV146Zedsu2L23AvTYuAi0Qi1WzDSdy?=
 =?us-ascii?Q?72saO2keOQT5MkiV5IZug3Fzu8DfIzGskD14+A/5oYMsAv8Z1n4si4kHOTT/?=
 =?us-ascii?Q?G3jJpMmON290fN2ZKoatIqO/ryDCLu9jHH1DVrNJc6QhGQ5VQ27uH15MJHfC?=
 =?us-ascii?Q?Q4gy88eo2cq7rlYwk7fCfJ13QYPLcjSva6W9z9jlPv2jrqagAbTJEwVCBfxB?=
 =?us-ascii?Q?E7epMfJK++lmlWZ4TP97JTfs6F4nEntXOUrmFVI71xOxG0aXNvJAtGbcKm16?=
 =?us-ascii?Q?XtjuZg6Rs2br+porwZ16IiyRz5yVD5dsIOzgHvF9vYp2STcUOxK23rI3MapZ?=
 =?us-ascii?Q?QT6AwV00R9SubyQRpAQ9bxPGXSUZeIRd8N87nzW56yO8qf5Lebx2ZdNmnqjB?=
 =?us-ascii?Q?u8HF2mSETPX7iNLKEnGKUTBkyLgilos9/L0x3ZyQHLS+a0VoriTDQAaFwPEK?=
 =?us-ascii?Q?lfETQ1b0BpoHQ0cOofwAHE+HAOl3roiUrZptuVfQJFHHo+9ahorMv2OMKicr?=
 =?us-ascii?Q?kx4ybTKOlF+5fB1xfP5zWvtxFIexNPPC1tcPe8zm/wJudddZjyOseQhwAHi5?=
 =?us-ascii?Q?ZqzfYD5hE3q7u11RMQB2dQ5LuVKdYeSK4jQ/ZzYd8as8ZWz4cPi9TWBM8ieI?=
 =?us-ascii?Q?StC/hmhW0oeFc3GzqG2b1fdQ4ymnwrj+DLVdl1osXBi0QDY5YCs0Nj++gLqX?=
 =?us-ascii?Q?/vSZ0X3E8rrg2jygyhSiugRNv+feAXgmErfvv9Yse5/bcCbF0aujGCdlnxNL?=
 =?us-ascii?Q?LRBbziv32y7DZgKiTzwFUT/9YOs2dRp+d5slIOxhC0F5ZJ38ldj1QKG/pL/P?=
 =?us-ascii?Q?uxIfRPodJ5yOadRrOdh8BT33+LFfJk8f2Hm7/wnMbl0hWqpStV7V9edhs87b?=
 =?us-ascii?Q?hr1m47sNpXkEx31IiW4mAjtsddQ0KIhV0lBybuPMxUlfohw1VTwzHzAxBWfw?=
 =?us-ascii?Q?ii6q4ZmN2wQqLd5yJqVvELh6sKOEVH2UJyZnYBQzY42a1KxKuvy9TNAQRZ6B?=
 =?us-ascii?Q?ke+V6a5+GG0A0vpr+HSO6bECEQpq1UjLt8x357HbP7LEvEYbP3vaj2iw0KiV?=
 =?us-ascii?Q?+XlgxEvYkOAQmqCb8+fNlpRPs42U4d+C9IaB5kdrDFB0oXqjyN72/67m1Id/?=
 =?us-ascii?Q?RoeekyApAb8cC/o7moi7CNMXvMZxY44hMHeJbIRFu1xMUh+91KSTbsUezw6b?=
 =?us-ascii?Q?YnXU9MA1+BVQFVRcQWTJht8KHKliSW0P0xegGtIlR9x89jQK+697buKh2VXk?=
 =?us-ascii?Q?TNFEi/FfXo9/b7d9RTc3a3HT1Dg4OOEHyDIHL1P+Rdf3lhD3h2bDzljdk8ZR?=
 =?us-ascii?Q?Bo0XupgyIjRm28HAhATxjbU2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deeef92f-14f5-499f-e073-08d8ca207570
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 21:53:23.4256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8sOb+FynaOYvk6zsbwYf1jNVWnVJnQLUImeaoDZGuu8GnWpuFZDUa3HCVoLuxA7Mg6JZ38zb5U0IT5tudpz/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

nagios-nsca depends on libmcrypt...
However, libmcrypt is considered as abandonware
The last release was in 2007.

libmcrypt might not be building properly with
the upgrade of autoconf to 2.71.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 recipes-extended/nagios/nagios-nsca_2.9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extende=
d/nagios/nagios-nsca_2.9.2.bb
index d342810..66f8da5 100644
--- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
+++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
@@ -82,3 +82,5 @@ SYSTEMD_AUTO_ENABLE_${PN}-daemon =3D "enable"
 INITSCRIPT_PACKAGES =3D "${PN}-daemon"
 INITSCRIPT_NAME_${PN}-daemon =3D "nsca"
 INITSCRIPT_PARAMS_${PN}-daemon =3D "defaults"
+
+PNBLACKLIST[nagios-nsca] ?=3D "Depends on libmcrypt, which is considered a=
bandonware"
--=20
2.29.2


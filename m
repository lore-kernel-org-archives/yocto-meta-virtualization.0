Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6386.1631263298707237414
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Sep 2021 01:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=iMOK1jeq;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4887064055=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A84g1W028722;
	Fri, 10 Sep 2021 08:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS06212021;
 bh=5fGYV8b96k03jvwWnfKMQueBh58o964s2+rK6L2ivx8=;
 b=iMOK1jeqcnTHODaVgzphBg72WCONtg6pTfVZLdrZ7TCKcqhEChX91uANkjtoTCythcYP
 S3IJuii08DKQZQnYrkXBFAYsoAFq0RDFSfXfjUh4BNWNWxHBCAHNBpj1n6eT2SmjCWfW
 dAkjMHbx1aVc1VZoTcC6rBOllKPS+xTW/IA3UbnfsN+STWn0YRayIBcz6NpPrJ5spvg9
 U+cWTewwoWggyJABvaybHHRtsI4DaV8yYH7prxTJfRuVTUm6dXcdnQV2TKpBO8qH8tsC
 qWuRu/zWR1xbQnu/+N6LOUr2u5ytjHUBLfMpyxjgx3rTU4q+q+Eu4lML1udvimo/5wsp ew== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aytea0c29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Sep 2021 08:41:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQL/zlbJi4NS8f6WH94Q+qhtWHRuJBo2iiV0J7RH3Ro9wjb0963a2XKwlV7BTmAvinlXB5gRJCTuJsnw5nn82fwBOGIfRO+5M/FQIFkgcU4rcJG1aG73g++F2P9jJccAUrWnfkzs7EOfi28edRYoIcbHlHC9gbyswbVELyfcThDWD4sn2vmLb7BvCGi501iOtcXVm8xSZGlCiP//XhhSHdSK7XBQzZX4NvhpzoZ2wHrJNGJgxrCs2V/9VvNSOqIRnVNcFKyuFbhlU6Ky//FdwqY2vtgoObR4nNmnG6hmCxalpKGYzgGB4VFLGkHRnvAAwKBgjMHJNkMolERtzxPq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5fGYV8b96k03jvwWnfKMQueBh58o964s2+rK6L2ivx8=;
 b=ZeFQqXMm/nnCpNfRlnKZZYuVQe/vIXMyE4uQ0QOnWP+XqBxIyPjQvxPFJK0kYhjjRrjB5WoLi9sCUMPM2avcB7twdKz0kh3XrLTx/xyzICYYMzLcDRnhgEL22PR2HOM7x4ry2XpoZ/cy9cnEGWe3Xc22r9IKvuGgaxMOnSgzQTudhqR2ecQDtKssmaQLVQnsujBxXzEDSvOxQDcFE/KXjBghUIoibslSV9kYTIbLOrKQuxLQmxvNmFFuqXgf2j4m41NXMt/KuxgSkI2VQnPw9v8597xLCNuoKObFpABrApCcenzZCcsbe+y/SAEMkiJcNfEnJEK+70mjiJdXz/Y6Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL0PR11MB3361.namprd11.prod.outlook.com (2603:10b6:208:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 08:41:35 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::19db:ee0e:abd0:df6d]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::19db:ee0e:abd0:df6d%8]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:41:35 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] libvirt: fix CVE-2021-3631
Date: Fri, 10 Sep 2021 17:11:54 +0800
Message-Id: <20210910091154.28512-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR04CA0056.apcprd04.prod.outlook.com
 (2603:1096:202:14::24) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR04CA0056.apcprd04.prod.outlook.com (2603:1096:202:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16 via Frontend Transport; Fri, 10 Sep 2021 08:41:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f78eeb3c-36fc-45b5-f330-08d97436cbee
X-MS-TrafficTypeDiagnostic: BL0PR11MB3361:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB3361EF71E4C9DFA6470A0595FFD69@BL0PR11MB3361.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hC/yudo/B0Py3kNHqWQqBEy9ZSW6aa0OKzonmkQWFbmolZtgyfmC/Adhw7lzmZrRIW03PsyztgM40InNY73Zv8is64NVvIErRkEiEvPS0t4s/IfgpbC7zAvzbixEyFlFiQyZOjwfygg5+ZNWkLUCNMquWJ7krwf3viIxAwifKZuEZRgYZXqcMLY5j7i56MUwQBhCWUh9UBevoWa03X5uxZ6zkmPpoIrBPQwgnwdWiJTn3ZakJvGqIDPbIVk44oshsz4zq08PAleERzhufIg5oF7O7bu+azFWvvj0lRkHDu3sjWNTLT9xURnSGJAn9SPUYIkA/SRvmNL76PgT7lcFki5i8IrG4AojlMgjp12BchLIaTiGqH5sGVJ0+sLtnW0YkrvwJPIJf8X3rGUBWnSUU2YWTiO2TDsKgfINIKAigv6nwBCtv0+OIpuIs87yGKb6gUrLUFLIAhisw858QmFTKtg28S6CPiBxlhLj8dVfJOW2a932BUxoITOEg2pXttpcsMa7MeYNIOROuh/WbhiI1KvpVcdoZMeqvbPjt6zBnxGgB1XFiY5c3hef2BCFYDINmkFkFsEYbrGMXbK9Ld+z6GqHEd0hBpf/vzxaOHguGj/SZsqeJyYb7RxCVzGU5sJYYSRsk79jnOvdN29lcRpjIPSFGzD1obIGnISkLW5gXq9LA8rNJ539DTtzsQXMO27HuMGVSbWrpuyoKDlQdsFCMdVr8EqZBdfooP8hcL0hplhJfCMXZe4D6VgCPG3/nXMR1oE4+UQKc9FNxjWwkPBfNypUpILwJjwdb5PyPS0NlacBLhBpSputfrbJbpHupImtfvqHRqlyVqc5aFT6m7gQQA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(366004)(6506007)(8676002)(86362001)(36756003)(38100700002)(38350700002)(8936002)(52116002)(6666004)(26005)(6512007)(966005)(478600001)(6486002)(6916009)(9686003)(1076003)(186003)(5660300002)(4326008)(83380400001)(66946007)(66476007)(2906002)(66556008)(2616005)(956004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QTZPTkdzS285R3RBOTJyUlVUaHNRUWdVMnpEMkRYaXppc1VXZWhEdjNRd0s1?=
 =?utf-8?B?eGVaczFXa0puVUhjTGEweDMvVCtwRVpjTE5ia2FwUE9zWjdhbEdKQkdkaEpE?=
 =?utf-8?B?WXVPRjdpUzJYVlpkcHVvT3VWNi9zSUFsWnl3cnVQOWw5MTVmdkRPMEExMm0z?=
 =?utf-8?B?cC9CZTU1aHU2RFZTTDNwVlEvUVFyaUUyYU96SW02b012d0d3VlJ3U3Z5dmJt?=
 =?utf-8?B?R00rYVpzS2tJVkp6SkRKYXlwNHc1cFNpMVdHVi81L1RGYVdjQUFYd3NZUFVF?=
 =?utf-8?B?TitKamk1WExONUxzcStHbUJ6czVTTE1CRUhiVEc0K0ZZOHhJL3I5MzVOQlNO?=
 =?utf-8?B?MThkd1pCLzB0TnRIOUVGcVR0V01lTGNYTEE1YU15bTlSRzZDN3lpYm0yTkcw?=
 =?utf-8?B?SXQrdXRTWHJCOTBKMUwrMEdHcTZ4K0dnbEU2ZXI1dEsycGlBMktGVFJRbUpq?=
 =?utf-8?B?Y2FDQVZkWFVsWDl1TFVCQ0MyWGducmw4NGZlTXAzbkx2czVtWHdCRjU0QmVT?=
 =?utf-8?B?azEyL2NoV2lTSmVmenFLRWN6U1Q2ZXZqWVJPdTRPUnExUTRHdUVEMFo5OXJq?=
 =?utf-8?B?ems5N3Bad0NvTUVSU3RmNGlyQVhEaE1DZXVaMXNkOWphQ01JL1ZiNkc0dGUv?=
 =?utf-8?B?L2V1RDArRzZ5WGozbFZYYTk2OWlsb2pVczZiWTZxTTlLaUF0ZURlRElZS0li?=
 =?utf-8?B?cEMyYldQMDVxcXdSNlBpUGxsdDBRNFNqYjRjVCtGemJZYnVKMVpvYTdPejhL?=
 =?utf-8?B?clc4aHJsVzBsdFpyUzhoU3p4RzVENEk0STFBbW9DQXliRkNwTWl1K1hITnl0?=
 =?utf-8?B?YVR5dXV1dDJGYnBmaVAwNTMvVUNiRW9sRUdQaDhYZDdHRUVUVkZDK1NlcjNF?=
 =?utf-8?B?eWk3U0lFcitFaXhZekVUT0NVLzRqNnRDSndEalkyUVZxdUF4SFhqd2F0RmNj?=
 =?utf-8?B?TkxxMlhUOVo1SSt2VmJlVWpVa3AwSVFOa01KdjZDeHprTmF0Rk53a1VSZUEx?=
 =?utf-8?B?aDVKZjVXTHNFdjA0OG9uRUlKUlRsU3RBWlFtSXFvbWlVNUlReXdibDJDK3Zr?=
 =?utf-8?B?dnZBcnFIbjBZQ3ViZ1BkcFJ4dEFiSnp0Q1luVjg2QmFkRlNCc2R1YkdCWGRl?=
 =?utf-8?B?TzVLNnh0ZXpFWkNHR25ZcEJkandmSXZOK244dzFOdlNLRUdCc0E2QVVMeVJT?=
 =?utf-8?B?MDFEejBZWDFDL0hsdTR2cGlrQzFuaGVZZEJoNXpvYUtqeHZaWDlZS0tVMTV6?=
 =?utf-8?B?MGh0L09JOUNYQVBObVliaXEzeStmejJIZWFkbG54THhTdE9MMFM4eWJ3Vko5?=
 =?utf-8?B?aytXb3A2TGZnUEVyNU9maUhtNEtXWWpDZ0JtSzRFd0JHcjBZTTJGT2tCNUZh?=
 =?utf-8?B?TkViZlBmY2N3dFp1c2p5SDJUMGg2N1ZSVzY3VExGTVVoWmxzb2lPMHhOVCti?=
 =?utf-8?B?N21ER3JEOGpkNUlvZVdBS1JaTm5TdmhEbDYzNnp2bzYxa3NtUkRaT1dvZDQ0?=
 =?utf-8?B?Sno5NGdKUEQ5ZUhYd0x1TExoTmRSQktncmlZQ1hwMUhpU29vSmdBTjI4bWd6?=
 =?utf-8?B?Ly8xejNvSVp1d3pOQzJUNHJQRHhyUmt4V1RWYXRrT3FYV3g0aHg5OVMzeUNX?=
 =?utf-8?B?UzN2UEh1N0xReTYrRG0wdEwrMXZOaWcwaC8zdEhkOW9xYXUwMlJhNmtiWmdD?=
 =?utf-8?B?M2t6eWV1cDl0VDZuKzZMTjZ2MVBrYTRPcHB6dDk1ZDJhUVo2RGViTWZ1YVEy?=
 =?utf-8?Q?73KBRZJli1fHs5sLzg/ihL0L3GG4y4n6/WqG8ir?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f78eeb3c-36fc-45b5-f330-08d97436cbee
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:41:35.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsXuGkJkqIR7hnoQFK6RYWWwdCFn6yy90nz2ZPCfJxpJ/5Znq7yEOuBtYqD5TMi6re59SMU0KuN6+QofOLnfdCBRJ7w6BlVsRfc5oSQ+5HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3361
X-Proofpoint-GUID: BJmJl-z5Ws7Ha6f7gW8DB48PfEhjcW9v
X-Proofpoint-ORIG-GUID: BJmJl-z5Ws7Ha6f7gW8DB48PfEhjcW9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=621 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100055
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 18A84g1W028722
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Zqiang <qiang.zhang@windriver.com>

Selinux MCS generate a single category context and may
be accessed by another machine.

link: https://gitlab.com/libvirt/libvirt/-/issues/153

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 ...y-fix-SELinux-label-generation-logic.patch | 54 +++++++++++++++++++
 recipes-extended/libvirt/libvirt_7.2.0.bb     |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-security-fix-SE=
Linux-label-generation-logic.patch

diff --git a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-l=
abel-generation-logic.patch b/recipes-extended/libvirt/libvirt/0001-secur=
ity-fix-SELinux-label-generation-logic.patch
new file mode 100644
index 00000000..e8952c36
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-ge=
neration-logic.patch
@@ -0,0 +1,54 @@
+From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
+Date: Mon, 28 Jun 2021 13:09:04 +0100
+Subject: [PATCH] security: fix SELinux label generation logic
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+A process can access a file if the set of MCS categories
+for the file is equal-to *or* a subset-of, the set of
+MCS categories for the process.
+
+If there are two VMs:
+
+  a) svirt_t:s0:c117
+  b) svirt_t:s0:c117,c720
+
+Then VM (b) is able to access files labelled for VM (a).
+
+IOW, we must discard case where the categories are equal
+because that is a subset of many other valid category pairs.
+
+Fixes: https://gitlab.com/libvirt/libvirt/-/issues/153
+CVE-2021-3631
+Reviewed-by: Peter Krempa <pkrempa@redhat.com>
+Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
+---
+ src/security/security_selinux.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/security/security_selinux.c b/src/security/security_sel=
inux.c
+index b50f4463cc..0c2cf1d1c7 100644
+--- a/src/security/security_selinux.c
++++ b/src/security/security_selinux.c
+@@ -383,7 +383,15 @@ virSecuritySELinuxMCSFind(virSecurityManager *mgr,
+         VIR_DEBUG("Try cat %s:c%d,c%d", sens, c1 + catMin, c2 + catMin)=
;
+=20
+         if (c1 =3D=3D c2) {
+-            mcs =3D g_strdup_printf("%s:c%d", sens, catMin + c1);
++            /*
++             * A process can access a file if the set of MCS categories
++             * for the file is equal-to *or* a subset-of, the set of
++             * MCS categories for the process.
++             *
++             * IOW, we must discard case where the categories are equal
++             * because that is a subset of other category pairs.
++             */
++            continue;
+         } else {
+             if (c1 > c2) {
+                 int t =3D c1;
+--=20
+2.17.1
+
diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended=
/libvirt/libvirt_7.2.0.bb
index 9cf29511..b7f8383a 100644
--- a/recipes-extended/libvirt/libvirt_7.2.0.bb
+++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.t=
ar.xz;name=3Dlibvirt \
            file://hook_support.py \
            file://gnutls-helper.py \
            file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
+           file://0001-security-fix-SELinux-label-generation-logic.patch=
 \
           "
=20
 SRC_URI[libvirt.md5sum] =3D "92044b629216e44adce63224970a54a3"
--=20
2.17.1


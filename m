Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.34.1621616485445045688
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 21 May 2021 10:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YJ4OgQQk;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07755a0f2e=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14LGxnXM019663
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 May 2021 17:01:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com with ESMTP id 38nphwh5t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 21 May 2021 17:01:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwbqk/qPWhA6t9bZHSSHKTdXrMeWDSY+RtBJkF3OYQHcrkOxQUC1lWEjYfVrfMBGXl/2QCDgTzc+vQxcHqMeltuM4ia6aOwfV8nwBDpfibdItemxiQg6Oyl2rd5SWdCHq2MtgP3qE4BFvxvytuOP9ItRF+B0uMcnVO+Wudow8xMt42uJ4dDA7T6AWmw5wRn5mI9T3sPN1/bYidGAykOU0ohpvl90KiUyiIMM8Hxp+DZOmlQwpZzCRiB1nwboscCn55pjNFZEZZ8juAwWaSSN/QLWtyIr9oYnzWkB+ss9Vgrht0WfkRNG0WFsD4F/gNZ8hYNYHmAilr8SlRfJR+l7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+jAyYlWS92AKXfZWoV3e/NfUKuQMyvXyibsWZiisyU=;
 b=MGr5i+yJ0eMrXzgie+t+sDHP6Bbwjl0iIG0ktaXj9yTLF2AdBkE3c/buMxybu76g0Ssogl1B/gnFxfM2yrxJpva88VYriPYp8hw1TaKQAFTwPq3sA8xxzP1m8M2R0nWLxTnOA+N6NVmSxrt8PEdJ3QsvTI7QtgzWXElqTREcyOMvZdtHsNWHaYUpFDyeegxCI/kvtGGzInV3In9/gf0f+b3RWP6trwLT3cjvgMAPZIRfOJCV2hsvQeJaqx6g4p5V2lZl7F1Vm/jvM++Eq0v3jA+O0fTF2TTr2cDBqR57wnoW+JxRscnuuMS7/GLihrtqq3mGSKc8x97MzOUvTJAJHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+jAyYlWS92AKXfZWoV3e/NfUKuQMyvXyibsWZiisyU=;
 b=YJ4OgQQk8duDPBH+pw18X4DNkV5daOHvqj/bkEFLsLVt5RWPxT5tMngEnBNLm5DYLQXRCl8gBXGGBLRFkgZVWyF+tLo9sMT4v0YDdyYLlFn5ogRsDs6XdBHWVgBkyRk3pesnYvLTngW+FxgiiwcWtCHvf2xih7wnxhOAoEAWrwk=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 21 May
 2021 17:01:20 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%8]) with mapi id 15.20.4150.025; Fri, 21 May 2021
 17:01:20 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ceph: update to 15.2.12 to address CVEs - IGNORE
Date: Fri, 21 May 2021 10:01:09 -0700
Message-Id: <20210521170109.1538167-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR17CA0053.namprd17.prod.outlook.com
 (2603:10b6:300:93::15) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR17CA0053.namprd17.prod.outlook.com (2603:10b6:300:93::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend Transport; Fri, 21 May 2021 17:01:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67cf40d0-267a-43d4-83a0-08d91c7a0e90
X-MS-TrafficTypeDiagnostic: CO1PR11MB4945:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4945E0B0B8D7AC0E607881CEEE299@CO1PR11MB4945.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BkwYzHbpC2/tDIu53UWi18LEx6GyHAHeS+l7pNo9hrSR1hvPj+S11MMf5dRP3UPJ8QifFQTqGecMlFlC2tOW3teOEbaiUG/CMItGTji5fOAgF1Q1bLk5M3Zz+Yr8gUmbWRtULjpjnVyqaBxflBznvpqSRl+QllU1UHQj3xnWVIZRge41MjJN/Mkvj5Iv+sqaS6U1FCOt3wSw8vyDH4LTUh20VJXXl67eWjdxzSbbKnyKE41xnYNl2zWkaupxEVJUpKD7oTS5rRR6/NR+0vtemKbP8CVUPyDlYpVQ27Rwr1mfuC+kckFUidLkh1+Y6H7DeKWRGu+je8ipyPBvm5Qad1w6kuurDqf0Aa2eDkN1SXIEouJBfwZq8nALx9F0BdLQoZrr2ZCzA2Cd/+X+Es6n+tSXSj9gLdIxsMKPHs/aevLqymOFPkapfBoWzhDEnUFRP3CRLE8yQ94w8bdCdYSAzF+NChccLsd+8MxzpwSG9SKB6sV9U7tFu9a5A5vROetFWNPx+qh9X/H9PCiKGL0d4xig1GR6lRGKTqF5Y/ixTV1Sjw7Ds8Iqi4WFEZmQInkXPUEPo/UOPCS1VXgJXwuu5fQ7mb8GvpRcLlOE0m+4Azj+rasw0Ig8grEvJcsZ568HBIUPMf01J9hjkGs30Wgbc1PLeBz5I4Y+c54qnvnDzYCTBOsnviqmfxX0Pe4gFSD3C8CruZTG66OxHIpmeB1ExjM8hTEHE4xyJiDgNvww+qYIomKpC7cazcpXNb+TKqnqC8iKtrXvi8pbCJJeElUUTgdnsXaqF8wrT/0ENFhjFdM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(36756003)(15650500001)(6916009)(6666004)(8676002)(478600001)(6506007)(66556008)(83380400001)(44832011)(26005)(66946007)(6512007)(186003)(86362001)(16526019)(38350700002)(316002)(2616005)(956004)(52116002)(2906002)(66476007)(8936002)(1076003)(6486002)(5660300002)(38100700002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?xUkTDwem1Dbr9IVFZcS/RKV+glsKpKqXT0RZYIVFpjkfCs/zBJvZhGLeosja?=
 =?us-ascii?Q?k+RFreV03oV4y5svXtDB1oQss1DNjKynxpwNDHy6Dv+2VHuwPwg0uTLcRWiy?=
 =?us-ascii?Q?kjGPGaczojM5Ul+PMBen/Xdfu5c4hcu135umAQ+kPjNmHsvDuh7nOrJoYlgr?=
 =?us-ascii?Q?yuMo/sU5aRo+5xD6Q8zb3crL+HA+4vJrdKJHIw0XwrqzvwdS6dfpQzukdKuZ?=
 =?us-ascii?Q?DfiZt0NtYzgjyiaW+nzbFmE3mKEue3U2X8wWz+i20ohT7aGYhoBsPsyouSv5?=
 =?us-ascii?Q?VwLnSk9MhQxMUjnIPgZmL1KBi13jgq28syl922HY3GHnveATgtjR2myI/vRG?=
 =?us-ascii?Q?MhseE2v+QFy9gUfIp20NH23P28br3HAicwajHrJyjcv5qS26DiRMZ8VncWCP?=
 =?us-ascii?Q?B7/I2BFY6zLR2tahWsDSMKG85O/dLnz0hA8wMYeGLZ2NwdeMUFJpN0wCCAYm?=
 =?us-ascii?Q?U0hyLNpga3ZjjldbiOX3sZzQ6Vjqghw0X6xfVPCsFvwl+SsShywp8nq6dMDI?=
 =?us-ascii?Q?HQGX3dXe9dSYDuuNZ8GvFp5dOLLKBNvqiNNjPP5PeLJuhtEXDYz7QabA9qXw?=
 =?us-ascii?Q?EaA+9z41cPYl4bfVMVxwaf62b/OHWcI0y8WnyCgoLW9BmqQcQgK5TNm2xfkY?=
 =?us-ascii?Q?1+AxsXJMFJJz6fxNWor/80oLTMfS9FqMX6UIG+3GkyAogSH9SSUBrWYFtax3?=
 =?us-ascii?Q?LUKyZJJw2rkywuVEvqSmK9fhEDnJTV97XQ49Ld6UGoPyP6/KvHQTwCFD2fvz?=
 =?us-ascii?Q?5BtnMi7YNdm4jdjBJm0QMUnD4+NCllatpfbh4IRmZHHOMIxZdMDRsTUaVNZq?=
 =?us-ascii?Q?lUVuqs+senlVasvqw5VetenDJRTEMfBYveKal7XdEJog60P/aM6u88mBdDcw?=
 =?us-ascii?Q?Xnb6tplInRHPVZ4Jbd+74pVKaBYfhPnqAEpSh2IKKCoi8zDyr6/TFObJEaKW?=
 =?us-ascii?Q?WS3dmfrY1CrfogQ1nVfivLX8K9/Olh0zkOzSUUS+UUVrJMNOC9CaqgnnRc6u?=
 =?us-ascii?Q?rJy4/jlYyVCVg/5voF3/NkiF4SW1EML4YYtSRTjKC+03EcwkcxbM9MtT4FYf?=
 =?us-ascii?Q?TWBglZdnrBtBJmF/DNhPoZAEap9zYKEtevpqbHz4upinhemX+KYzxb8q4EFo?=
 =?us-ascii?Q?L/t3Fn8Tm6MRtu7HhC1Jw09TrLghXq6KFTXVrNe6pe3mKx32Yn0qIKgXg8ad?=
 =?us-ascii?Q?/Qfl/uMm3iYN3CW9OtgGs5xOWbxXwg4E/lVafDzaEOq6AoEn+mAbyr8F3lyT?=
 =?us-ascii?Q?SnyfFuCDGsTCINF5PlxFnUZhhEOOwseiIqpvOzCB8NN/NhkSL0ueXFRTyCO6?=
 =?us-ascii?Q?Bnh+tLBI7bLpX4ofC8dFLRqZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cf40d0-267a-43d4-83a0-08d91c7a0e90
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 17:01:20.6700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSrbmckR6PEArxapW1vgYGxOrEy7NMK562ZKhMSZ5fuGiXGiczMZ5UoJs3WYDsKb0OSxc+0eoEYEvOsaubKMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-GUID: ZuI4-Iuvno1Z0ABgSOHuGKujGpWJr3my
X-Proofpoint-ORIG-GUID: ZuI4-Iuvno1Z0ABgSOHuGKujGpWJr3my
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-21_07:2021-05-20,2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=894 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210089
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Updated sha*

Fixes: CVE-2021-3509
Fixes: CVE-2021-3524
Fixes: CVE-2021-3531

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 .../ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb} (91%)

diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_15.2.12.bb
similarity index 91%
rename from recipes-extended/ceph/ceph_15.2.9.bb
rename to recipes-extended/ceph/ceph_15.2.12.bb
index 0d821f0b..9ba72b40 100644
--- a/recipes-extended/ceph/ceph_15.2.9.bb
+++ b/recipes-extended/ceph/ceph_15.2.12.bb
@@ -16,11 +16,10 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-cmake-add-support-for-python3.9.patch \
 "
 
-SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
-SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
-SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
-SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
-SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
+SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
+SRC_URI[sha256sum] = "8710f6700de83765138df8eb4fc7a5e7c66104dd838033e0827a1850f250ac85"
+SRC_URI[sha384sum] = "2a2f177e5b68f6f5d13b253a8d4daba9e956b4a79a40a4775aee288b60c612fe13b417d6baf77944c32b1181b2136f68"
+SRC_URI[sha512sum] = "08266a2e9a7ca5a37e03f340873571fd012c630dd898a87241cd97c29760b2bf41fe64c8883e7b08e0f83c26245072cd26e69ecb1db02378d1ec38335ba1cd0f"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
-- 
2.17.1


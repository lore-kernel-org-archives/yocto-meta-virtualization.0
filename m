Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D8AE7491A
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 05:48:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115838.1766555288766473441
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 Dec 2025 21:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eykMXqFw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=445392776f=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO39wMJ2354550
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 05:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=A5mFcJE9ttdccx47m9Pg
	k/SZYGiDuepXqWU4P7CkSw0=; b=eykMXqFw81KGYZrf1QiKmhONUcSVpSUoI0B/
	FaiRs1LSqm/e9Krhq3C9OiYKX8g3EDoDkAYA/ypIS6wTMhaFl0gae7iY76VuZm85
	cwp9yu8lKHu43qP4yupIuTtc7Uh6CU7aylH/2ljs46VrhHf6Mb9mixUOi8ZwitrT
	qlMZvc1l99YUW6LKSVTCO77qJafXFXJ5Sv5/EYqLc0NvC8eTNxwCuRhErXzmsKNH
	6Umb3qRlyFyycI/kXQenixGuobW5As6LKXEBc+9nWqz19+scyX48wXZ5EmvIWc61
	Jm32kK+AXF0dK2aZF1HPK8kQAGrB5cE9oY7GbyOgsH3/XjtpYg==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js73ur4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 05:48:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0SRXhYsoQVCKWEK4lq6hdCYi40mkYXVIVlMzwlHKD6LdHCVqg3bATaMT8DMLnfuHz4/2m4fG31X0thZF5qXhoHoxcJwXul5qsXjawpoFf5dv53PosR4VRGTaT+P5w0+cufAqv3GAJF/jpjNNG2CJdPq9JEJt381cbFA9OlDFasX3mvyTTCcxYHhDX24JzI6i/bqBko+YJNs6szL3NDPP432B427ZzySQrx9XYzeDbK+SiuDXyRiDeA1wx7XWpzC8lF4RkDMRzF0HoJ3uJ+xvR9Y35fBNpf/Du2RFn4AIBOCZBBCMEvkooo1WI/O7jOgq8Zwzu40/x9AIws8xXtKzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5mFcJE9ttdccx47m9Pgk/SZYGiDuepXqWU4P7CkSw0=;
 b=C1E3KxCXrgUhurEeKdWDluLEzV7kCR7Ygc9t4VngI3uOA/T7Ls9xAf4WibuRpB10Pw2ptyh/FghjyBddOWKT1qPmpdZCCfXmXsqjVmeiJsN/LZ3T0N7MOO9jXfT8I/kJdcxp9w9lMvbJN1pEReIEYENkEk9VwTIxpTJKMHLvbtNZQFSMZO1oyH8Y7LBxz1gVGjBt8Nafb2fZ08/NRqh5LZoBRauP0Xu8osGloMZNFrIvfDsevdxjFhaUb0ekyT70gIf41ROvh0S0UBTetGnN8is0Q1d/QZdT/f+jF/oVgDN6I10bP6mgkp373IZu0x1LzlBk6iVAjUSvneNRgl5Xew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4557.namprd11.prod.outlook.com (2603:10b6:806:96::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 05:47:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 05:47:59 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] docker: RDEPENDS on virtual-runc
Date: Tue, 23 Dec 2025 21:47:44 -0800
Message-ID: <20251224054744.3109658-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0093.namprd03.prod.outlook.com
 (2603:10b6:a03:333::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4557:EE_
X-MS-Office365-Filtering-Correlation-Id: 844e2cdb-143a-4061-595b-08de42affec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FOeK33vH62GOOAfhu5dCrzZ+YqsdZK6OfBak4ReWZDE5xb5i1GS3Pk8GQa21?=
 =?us-ascii?Q?w5X5Vk1lldDWdzQHdW13KCx6d7qlv4Qx/CjCYgySuEWILfW+rPIBx8Uf3Hjd?=
 =?us-ascii?Q?an+x3HWYoHWTvk0OOI1I//yXMRhT9cAlM2jP0uvQoSBb3hn9R4Wt1Qi1+Jad?=
 =?us-ascii?Q?Vu71rBVdoql0xs+6oP2HzF4HJv0fIXUGa/sol8riSEFxb7cIFBzqLGyzRc6d?=
 =?us-ascii?Q?3Spo5NbGxcJcmhQfxquGia0c8i+/2D/P8bZbIisp+hx2q19q6j+QnNwjAyzd?=
 =?us-ascii?Q?KeB6KZtIa+tGJWEUndMfcNzLGoITdRokWS580GM7gghyzDrhAra2hB2LXaxX?=
 =?us-ascii?Q?zUBrema+uD/D9Sz8pM2iPSDk0KaFNOSeFXigAymGFObibukZ66lDuAS1QSbj?=
 =?us-ascii?Q?1mAvKJbNFuMmeFCWvgEj7ZGtljux0wumeWiEZN4zDOXl4+7hzCuaAu7A6WEg?=
 =?us-ascii?Q?NqzRLETDj8aitqW7RH7R3rY1TG4RrGTC43ZzdJvMCjFfL+iyDJFc1aOYJT23?=
 =?us-ascii?Q?SeiwZjXBGthJ+yo4O4YwniGf4NYnwD1K5rhboxiarj/DTi7sTOxu1JcYedu2?=
 =?us-ascii?Q?NXb++PYOAanBQ9BEkT02SeFW86vlBoLlRDkd3yanUodjWrXPa7dFjvh7OytL?=
 =?us-ascii?Q?2XsXUpGpiK44kM/RiPmE6OVNbPqhrNL+ntvRNJQk9PH/aMRFLKEt0De6xk9d?=
 =?us-ascii?Q?7VGq+f+C0V3gigW8Pqfpzn0BiXU4QdfpEVDild83eadlBcCjm0wKy/N7/kvR?=
 =?us-ascii?Q?F77gpetUc3Ofu2iXAZ0sEfx5/vDUSoDoVJUVAxXvTkm+d/2xJXifFy+fnj4S?=
 =?us-ascii?Q?hopod8Zb1a8LqlurCiP3a7+dVYz2eioevkwfiAwhC5Ct9NBoAu26XoXNRmHl?=
 =?us-ascii?Q?+oVIaszxZvrnQUV6IKx9nWwvHraS9pJmcc1eaxwN9D16B5eApw6GFM9dPmUc?=
 =?us-ascii?Q?FfDgXtCEiGXVmqBCcc/Vj4TpVO/5/u5bQ+aTMNieDXidrUNsfN9U+rCz0qD9?=
 =?us-ascii?Q?D9sc3QM/efMJ80bKpMUz5Bj+R3VHAEd1cKyOlJu02rmcFXZyk6QiQaH4hhI8?=
 =?us-ascii?Q?TnwDuyNnZvfS9C3lcws7B86OzvA5oKHU8c13fgY8ayG0zEFf+iz47DJwFHDO?=
 =?us-ascii?Q?Vgg4GMGraLOR1w0alukNAOTJ7JNiFBl67hopwFFlvcLK1+qBa7qB+cshIsyy?=
 =?us-ascii?Q?O5IT+R6d83WAVlG7RH9vsOxBHQ17FvKgUzx8V/pcPBkOGoWB5b9N+RVvBuDV?=
 =?us-ascii?Q?Ri8nKdCJao6oLmOJEk9NRO67Za7VuASVCCY9WeWbDXwqobeMlRq6UYWjoUQ4?=
 =?us-ascii?Q?ZrMgvOIbgvkDi4Ff1rx1fhXBXlsgVLHGkRRV3bPT8V//xMbGSB2nn72M+Imt?=
 =?us-ascii?Q?+q/oRq0gT7Aq611qYS59fU75Vg95FL386WSh7jTVnmkkPOtHdfU+0jz0Xjv0?=
 =?us-ascii?Q?xPlKwXy9G9jCOIBIysuUQuYYUXDnIQ7Gs/25rz1A0UcrO2aGSb+7tzbsz1Rn?=
 =?us-ascii?Q?6UsCB3eUUHgHHiMiOh4dxln9DeDgjg8MUpmr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BOKMl7RnChic8UafPQ//31v8Wyig4LkKE8m2ofnjECEwlBTKL8YgDm/I/Fgs?=
 =?us-ascii?Q?11qF7HKg6Uu0Igsj2t7JDUqNPrD2dkUzYpvC+zFlFjmr20zwkTBzOaEC0cBn?=
 =?us-ascii?Q?rzRcHayApcMshcYA9Q0NMCGbPpsLMhBZcxqCBzhuupfFOfDS8OnEssdbMJtu?=
 =?us-ascii?Q?0DU6ItLY2h4JX8rmfinTuPb8BCQzGpQb9uoz0E2OZPl2j1lQ/41Q2VqrfojY?=
 =?us-ascii?Q?AkPtF7lTUhyxoTDwUu+xYtcoHDyvkbR61noE7fiVAXVPnVY9Yw0Ocflp78BY?=
 =?us-ascii?Q?qORWHWZS85Bq4A7Hn+AeuL1RQ0l8Sym+d8EJHN3ttVuL12NOZ0R/sGbHKsBc?=
 =?us-ascii?Q?+DGyXEzoe4JFj6cfKRv68bprpxZfIaBn8wNdVlSeGGwxT8IMQ1yCQzRXtnla?=
 =?us-ascii?Q?JBTSXWRUM1I3whVPThqgCLib0YCbT1OzAn3N0QwBHMiUDW17TkoktK4MbO/0?=
 =?us-ascii?Q?eL2/LhXQ0pEFuwT7GisLOiadi5RDvbv6xBAUgrdo0DxNPi31y12KTZRJsiDF?=
 =?us-ascii?Q?5usmLuktVfRQrDrN12QqhyZTbtAJiDDzeGEKLFqrqSSL+r/LIdIzldnVv6LO?=
 =?us-ascii?Q?YHrKK65K7Za7q23vzVcKxzJ6vdd6DHkRpdQ+Z0cYYA4JOZyoby+qVs9VS1QC?=
 =?us-ascii?Q?9nGMZsDuozmWk0dZJc8tot2U2rsaay2kipJWvAvnJiLHnMIhNnVp5dk0K0Ym?=
 =?us-ascii?Q?6iEU6qaFD47tmvLJorI9KNVYFmh0KWEaGpF3OUXqjnjFdmQNps8/SUmBAB1z?=
 =?us-ascii?Q?HbPRRTRlEOWiJnYISS5F3TCnHam16m3zrl7T36jFIXFNunuv15my3/FcnuQV?=
 =?us-ascii?Q?AcontuLP83eTyUM/PWX2HzmhpOB74uYFSilhoiLV3pHb3E39I0/V1gfcqEoR?=
 =?us-ascii?Q?hft+qXf3CuDUPFBjiziAPVEZYnJZnpoyBuDSOKU51idxTbvw4DN0PfdppQ8a?=
 =?us-ascii?Q?pPvu9mij9+LpV5RvwuNTF1Bm9DIW/ovlbpCPKIACFpdp1KD7z0e5R/wCHR3S?=
 =?us-ascii?Q?EDis5vFbqT7duPekBIRr9PN1PEiejPNW3cZSEsItqKmEOVAKvYz7jnhyC4Jt?=
 =?us-ascii?Q?I1YTMHnZe+zmdK0jndMULOsnQu0avEpJMiFQOaam7HKBOLMUQs4r0uigznBT?=
 =?us-ascii?Q?ABtKq7CjZtyfxPQA0qFmArS7Uw7vnUHgCyVvHloEfdw31NYis8OsLiRPDDTM?=
 =?us-ascii?Q?AMzFeniWSpvKhsZvJIXlYQ6s/MKBtLwhg+TYnSJGW2SVxFAYNAspp5Z2XORv?=
 =?us-ascii?Q?opIGgfYEPmf5VQlDTelJ3v+YBrxL2MCJOdfUeKXsV6bCqjg8PXosSP2J+Akr?=
 =?us-ascii?Q?89mDTExm40zB8JdTiEAkOqeDLVaHa2qVxuGyEeCTjlNxPGA45pTxxTk4wzt8?=
 =?us-ascii?Q?PNIrnaGODgPqNFBw3n6C7KQ/tFzVhxg1dCyNJIgolxUXZf7adGIzXlSPMy8y?=
 =?us-ascii?Q?t6PIolJJk9szTaRhQxWE22QnqIYjUA+uDIG8DudXU52GlBk+cM8lqFYSgg7M?=
 =?us-ascii?Q?uR210tyTZPsCa3W/z3UmWZQf7nNG2a8B4Qfj0R8/4RUrR//QVYzQzB63dcUv?=
 =?us-ascii?Q?3wNz17OqDZb6PKXDVLtDbUX4mw3M7El1EXP3JdLlALkUDMKu9/v+vzaVRCjX?=
 =?us-ascii?Q?9kKY9pyruTxQToXS8yesVEG9NRDcgCv7zvnHJ361Nz/NmX7XdymajSjmVCCW?=
 =?us-ascii?Q?qfMp1yV+1wpZurh7xXYKKM5UJNEY7td0pAKuA5UJ54K/mh0PvB0KJvgdh5in?=
 =?us-ascii?Q?dTWS999sEg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e2cdb-143a-4061-595b-08de42affec4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 05:47:59.5913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDqSo/CVfZ2Drbgxf/ozSgBqv00W9FwGTpflTUJli4q2L+DJzFHUL/ky+u8ZE7i4O5Q7hDj5FoF/HlX/KIwOsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4557
X-Proofpoint-GUID: hF-Aq4Ys9vqjsOszXIBeUjdsuMnLZjOL
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=694b7e97 cx=c_pps
 a=eZ5Ua+8tQ3RPWrQJUiaIvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=cpjUCtRyUfM5JWPlCl0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hF-Aq4Ys9vqjsOszXIBeUjdsuMnLZjOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA0NyBTYWx0ZWRfXwLosO7PJbMvX
 BcTHT8mg4dqess342NDDmMjgJAutw46LYEaC9QViBX8b1DnCAeweJMktYnsPxjAveTuo/EW4nv+
 zbkWNC71/RFCi4QBHRujgn4kN4olUrNlImHPKoWFW9C7HjsX55z9ZwtEmAqs6+zXO457y6lQfZH
 NI7321LeDey4OlWnr00pzaAB4ORAJawU1DAMo3fT3PN1U1iTGPoaZI4BUOvoD7KHs1EtgCSLdIv
 Q987TBviN7kAAqpJdHAa4RcGJqnIJYKs7ONbt42D/sJd2dKOju9RdJEa1tA2Z/zyp6eGegH5CsZ
 HLvmjjoODscDFmiGL1dyV1muxbIag6AJgKHmsewmcFF8EcszulJ9OPAE54p1uJwckgUMVNhzCsg
 EZ/2W9rg2Z4XSHAdTDOHrokQjaxP5GeqdmAPzLIPd8HlQzBcs0SlFGfow8uv8xeUDBaPWxaO0Mi
 SYxyV75AeNX3IHUMNwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240047
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 24 Dec 2025 05:48:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9498

From: Chen Qi <Qi.Chen@windriver.com>

docker tries to find 'runc' binary, and if 'runc' is not available,
things fail.

The VIRTUAL-RUNTIME_container_runtime could be crun or virtual-runc.
This is not correct for docker. What docker wants is virtual-runc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker/docker.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 99535a77..39782b88 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite', d)} \
                   bridge-utils \
                  "
-RDEPENDS:${PN} += "virtual-containerd ${VIRTUAL-RUNTIME_container_runtime}"
+RDEPENDS:${PN} += "virtual-containerd virtual-runc"
 
 RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
                      kernel-module-nf-conntrack \
-- 
2.49.0



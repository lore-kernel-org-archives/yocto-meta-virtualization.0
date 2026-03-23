Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70146D58CC3
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 02:14:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8836.1774232079255043833
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Mar 2026 19:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fK8QKve5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7542070fc2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N2EciO2727590;
	Mon, 23 Mar 2026 02:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=eMzrKAwSnMZwCIDh99L6
	f51olRlhFB2kquxNJhBRlgo=; b=fK8QKve5gui++S3sWwfXXOFLgCpISPz5QWtS
	lGSbsKsq1/G5xQnxH7z5h7SHz2HIssFdI26AHxBBLXxPFmeoPifypp59pnkXsSHq
	qteZEO1mrziXEPrKHT43ThvlrYmGdgiKpumyFNeCvTU+sfSrzhR05unhanYtsPpr
	TRFopl750TUM+CV/ZJWpgsz8yPLVZmHGJCMUZ2MAG2JeVWd7K6bbIJmSRnYK+UN0
	2yFP+YinNpcaUHTrhq+P1CFcFDxCiwCkdQc1pBwgx+5QdfymAu3ER4By/2gD1FbJ
	ZQCDqeYw1P5tbpUfxEebv4VWPVzVdzRsdw3WuzCY2OJ7O3p4Sw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj81dee-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 02:14:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nv58IIabtJzeQmM9eChcUasu+MKScsqnyYunrsSrItkRov+VPHG7M5/i2O1GVcZ72k/HYXuSN9UVubEFE11sdTkRPYCS9FMn645qJC7ogTjSelvjx91nPrbg69y8H47yXfHp+Oyzb60RfMhEQQmPGQmhtW/usdWkBRuxl3mDhVR/X9BQPFeKwKbk3NbztvUt00eclPYs99SQvcwGtB4oOzEwsVfzUZglIS5nPG2RCgmpFNyz4tFyvuW+pdAN0/u8G6NmL8smodzXtrL2VYQlRLdJP4rE7o5SAwJr8ObABLkBKGkLfV8gAwk9enou6Fk19oSbzDgKDmHTrP+Sip3wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMzrKAwSnMZwCIDh99L6f51olRlhFB2kquxNJhBRlgo=;
 b=EPMrIG7XhR+xgTp5FnEKw5+DrCYz5/X9Gn362rh309DB7HJzrmkIvPcbhnM4BgIFldk9ipGXVbhWO5IQHqFUsvc45/c8W+wL1qHOHYNGnBV57bItQUIii7rygKRULpsNjvdsiTpX4/hUjSu3LAJQw0eYWkIfv3BE2z3nB4aVsnBvsM4/uYvMyhmWgiL3npEq+5LEvITwrgAdYGmsds/6ZEK8MS9Lyrx4DfCU9tvppMv04aS6vCm2//P5ix+09u0hgUmoCgEBzeoJwNT5vRPJjIqAjaErma1s/ZdAebPuwdONQwXaue8uNmpuZqHNBijXraR/RxfDYvmF77b0BLH3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.10; Mon, 23 Mar 2026 02:14:35 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 02:14:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [m-c-s][PATCH] nss-pam-ldapd: upgrade 0.9.12 -> 0.9.13
Date: Mon, 23 Mar 2026 10:14:20 +0800
Message-Id: <20260323021420.1728725-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb732df-93db-437d-0c97-08de8881ed99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4G/QjCeX6SzydZlrRf7F+SN39VvjEuNUBcNxGaEfa/sg/omZKbmsmYlxqRFUBdOOQc65Dr6I1+DPYgE5+cK27idhSB7Ua2eLluMmSY1IZ1mbkHe7riMAXlQzpKKs9zCThCWV1/qYz5O0y4qk3P5Q1pZsjXjjjhvH6m+qFk7ZX1TE0xRmDZXHHHgF6mORuvgXTcoXTkDrJnLmXgQ5uBRwIeWaRb24VcgibJN4VpRPFxtOTLKOTYMbulMIQorTB5uJC7fb6scl5+HOmJwUP6JxTxi15fnJIbzSaH87z93gNt1a4OqCvCtXfec3Xmr8K/ziwisBqJth7hrOSgIRrAjz1S3/MdWrBRnaaqHS/aHRYdXf/G1u2Ev9EayfsJS1RWe3y0n7DPskLwhlD+xhIVKIk59F5RD6ml6GUsQqFvc+dEbq/nRo4l1yYq/NIod7iBJCB7WDIRUWB8QAB5CQJvrU4L0kM8r1OWgow/TeeBNb2KpFVRjPKDmSPaLCuIviEhXKjj9j8hLzumpQyCl5/uPeINQbTk+MhcptJJQN5DiE9eb3d3+VePJ5cHmzZQhCzXitcnXq90b4fdx+IaVHKAhpTqLiy9bYvZ0Bbc3hkllchXGWxD1+ut7/qDU4TvDIvyp1H8aVi4DAWqG1QZYzLA4GMHCLUd9jrheRdPl/Dc4q+I0+G91ZSzOoQVqt08afc4fPYLdg2N/zJCSKproDEmcmK+67QAN8i/QR6sMKMmzQMll2a+odzMw9kH8FERZgJP2k
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M7ficxBEzpEniSUrbYQk2M7Pny3ZmuZ0b6mWXaUl6yQpzWPSCbRCXDmGsBJl?=
 =?us-ascii?Q?mrf3PH+AZ9JTTdM2yLT29yPWSxrYVWXHty2UY1Ocn4Imt2UkRigDsf05t+Hb?=
 =?us-ascii?Q?2hGna6U0Bhb0MDKcBHJMq5K81pvL5HqjmvjwfpJLuJjEcVTUUVYE1LbWRCJl?=
 =?us-ascii?Q?BKrNayvGe8FCNCkkwHS5Sx9Szqj7hSAaS9Vfo9jhRKdtICqw5YfdBFkU7wTB?=
 =?us-ascii?Q?F2Mx0XlSXSgySv2pf7lNskpyP561hknAWvGFUlQBIkkGAx8ua1729zEw70Km?=
 =?us-ascii?Q?/7taCr/S13nKc8UiEqyyGNF/DX2hHmWD65xgUp5pvID7SK79PlrFTz38dEhE?=
 =?us-ascii?Q?XrAz6spGlXI2bi2rSxjCTh5r20/TFURjaRO9MMvRbLTCZ4psJnZpb0ctCrBv?=
 =?us-ascii?Q?3rUc38y6cBeyllvgnty293sITgfgvWFjFkTfQ5E6iREpNZ9OTxpeLhSInUNt?=
 =?us-ascii?Q?oFqjnoMBCriYBy3zoUg3sq4Cp4vPl24rj5wWBraGxi1lRd6E/5vlqvm0yIVl?=
 =?us-ascii?Q?Yt1qIyH4pxj116k1viLffzY1qVG81QAK1WI2iOTQ+KtVbP//jyK8JDmHkXza?=
 =?us-ascii?Q?TXG9ijB2SB6fEBCra2i9oBlnzUDlqc3/NvP4FB60BNfHaPbLQ8YSMILPseKY?=
 =?us-ascii?Q?5knJve3U0dHouazk7WZG28IiBdi4+LEAt7mleTVwiFMGVyQckbLMCkdCzz+k?=
 =?us-ascii?Q?OUScUQrLvvjXJfhDsC3be4rDr46JWO4WSFDNdN7cvvmkihMvKXNNNDWIuAJd?=
 =?us-ascii?Q?7TycJK1TkrtEv/dYQZRgh42Qt4PK06bZQa+ETLZeDmv/UDju+h4QNhTy/LEK?=
 =?us-ascii?Q?8TZGLBJHm4PIdoyFgAEuJ2O22CM5mh5MzPvevnWzOS40R4HPmKtDKpocS9tv?=
 =?us-ascii?Q?cIOQCfvdgz8zQf8XvqWC011PqcGZfFbtyPRF34S27ejt3FbWzPYuYrjtMSTy?=
 =?us-ascii?Q?9H3dWB5tCY19zdd+ytqlrKufuH0ydeN43Xklqq6YRNGCjlxjVFw/MQvIunuZ?=
 =?us-ascii?Q?EUFviV7h79nEyfV94nCcLVuTaIFKpyyH5/wVdCc37oV1BB37VgJ6krBz341Y?=
 =?us-ascii?Q?FtllecMyhz6+ytC/hz56zTmHc8YIBaVVi69KeNzo4sTxCsavfScIrVMxXute?=
 =?us-ascii?Q?WGI7DRVBT8C9B3iXP38T9mjQObkiQnrI8w2nTthKJ+cwnEj8ApbBQl5poegt?=
 =?us-ascii?Q?PEcY5WXp1vGWAp+9Cmk2i6Dgow1Z+ic2G4BybElsl51F6t8rYrq/MH1Hb99I?=
 =?us-ascii?Q?e/RdI+bwieuVfPRnKvixxnVe9MqAoLzcFnYx6ahiHNkUhcIQ5RIJ9uD/LWRw?=
 =?us-ascii?Q?9cp5twklJYmwtxr9k1Mt4RDHHJUMrGfy045Bw2qNLoa+WbvumLoIaA9efOT3?=
 =?us-ascii?Q?e5r1fkwb8tlL3rUIb6SabWtvoRkKyCdM2Ij26WuyLLLy+swy6co7nJZKiFCM?=
 =?us-ascii?Q?MSFE5UGRn5fr7f0hwKF2i9Pv5rkBx14IY0k6WsKKocfDKsgASQP644FgEyNz?=
 =?us-ascii?Q?HoOjywPgupzS54UR38Ne966ASEgvUqlLYpRwtD2Z9jLESnMhxxSlhtKJHiR0?=
 =?us-ascii?Q?81W6SuBW9ZfEI3F6/MebDT9gCu6A9OFK0fjirhVWDTYJptqVdL996YID/++g?=
 =?us-ascii?Q?RRb8ILElAmppl4M/TBqC+eRUi8W8KNE6oD+LVXePpg9/YHuJm1sMWbL4vJY6?=
 =?us-ascii?Q?qvfBeszl2jX2eaGwlrI7acx1ysyYLUfbps9ogSKK6MySXDrJU4X4DVr2cKBg?=
 =?us-ascii?Q?9uh92J1euw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	jV9qNYjSjRpeq/eXZ6B2fYOYaFWWlq1AuTocmT1uD1M/vZiXMv9Ae6QJ8t2ucXhBks+tpJJgUR+FUXKifQLa1uDbqMJbO6HHDYAxHEh7DxABY9f5I6arZvTcXMkrEJ6b+HHgE2mdgH6Qb9dQTvcMG1hP0m/Db2nFgauk6ic5h7bmWOJiMy3czsAs8fx+mpcJakJaCOPlt5OAMwrCMSbvsRwCtcLryFrLvkfXQ+JMIvmUDl9gy4nz4xXg+tudpLTrNgUbADSZpjMXId0hxFNdCZofDZamOAeiI2Uut6KSNx+FXrH7UBcCNkj9gWk0EGzWxRilsHCNbpPiuhxnu+7R/A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb732df-93db-437d-0c97-08de8881ed99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 02:14:35.3106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ap72lbwPE2u5ZFI+or9NtoBBrN7kn+WwrkMg03uc6AIPB0Si1dVql4UDBQLLrvfiBIkvTGxRqJRB7wce+WgMcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
X-Proofpoint-ORIG-GUID: 92bynBOA3mnCNWCZ8vtsH2VxbHyotMXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAxNSBTYWx0ZWRfX/MzhdRxIwjBV
 tTJ65XPT8PdJf1DVnzh9FTVbW8nWrfG1mJmPfaN7I6R6qRpBYPDuaGwsu85u3zQegmKrp5/RCaR
 P6F3pNh1W3vqXMTLmc0Yl5+6MNIrT+EBXXkgRaQsRO8vZqTsJ5k+DxJbmZwpC4QTZXoWbNvhVHH
 s4tjPb0UAv5igh8ggK4tGTyEKLpxjcrv+dCO6upTTz5H/4it3UpkHwrl6jsbYIy2cNGIOTNIPWk
 tIgGMCmxtR96pa544EK1X5N8pLnLRH41MHW33JcB7zotvRY/c2tAVsFAnTqWlXHRY/opAPo1Nqw
 QwNLq/JlzO7pOeufS5U/hgozwlBS4RyOsdBr3HMiaztwBRk7SCC/5jQW5Iyc3TfeHWhs+4vtRJU
 Hqd9bK1NU0/9GIlx/bETmDcsj0Me9G5vSMjvX0QwB8Jtxne6LHH2+qEQWCJsHwJJCiexbT3dz3x
 NXzDRXqPNqkkET+1ZjA==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c0a20e cx=c_pps
 a=vP0OKLXe+mBq485nSWAwQg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=-AOZETJZAAAA:8
 a=t7CeM3EgAAAA:8 a=kaJ_zfFE1JFjdlvaqB8A:9 a=gTUbfCpnf6_oZ-kkFPom:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 92bynBOA3mnCNWCZ8vtsH2VxbHyotMXd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_07,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Mar 2026 02:14:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9670

A summary of the changes since 0.9.12:

* add a command line -f, --config option to specify an alternate configuration file
* add a command line -t, --test option to check the configuration filevalidity
* support passwords with up to 255 characters
* fixes for potential memory issues in parsing configuration file
* fix NULL pointer deref on out of memory
* fix race condition in thread start-up
* fix issue with stopping threads on shutdown
* provide compatibility with musl libc
* fix compilation issues on NetBSD
* use closefrom() if available to fix slow invalidation on FreeBSD
* fix file descriptor leaking from process starting nslcd

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{nss-pam-ldapd_0.9.12.bb => nss-pam-ldapd_0.9.13.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename recipes-support/nss-pam-ldapd/{nss-pam-ldapd_0.9.12.bb => nss-pam-ldapd_0.9.13.bb} (92%)

diff --git a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.13.bb
similarity index 92%
rename from recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
rename to recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.13.bb
index 98fcc0b3..74198caf 100644
--- a/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.12.bb
+++ b/recipes-support/nss-pam-ldapd/nss-pam-ldapd_0.9.13.bb
@@ -26,8 +26,7 @@ UPSTREAM_CHECK_URI = "https://arthurdejong.org/nss-pam-ldapd/downloads"
 inherit autotools features_check
 REQUIRED_DISTRO_FEATURES = "pam"
 
-SRC_URI[md5sum] = "cc30ee0ab91d6c94b7a343ae09b5dc69"
-SRC_URI[sha256sum] = "c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14"
+SRC_URI[sha256sum] = "e01784e17cb533bb66bd0601e205e785263445c3c2df7a6f90232ab4131c716d"
 
 DEPENDS += "libpam openldap krb5"
 EXTRA_OEMAKE += "CC='${CC} -std=c99 '"
-- 
2.34.1



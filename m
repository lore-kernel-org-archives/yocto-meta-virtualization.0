Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA0EF3ED46
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 10:19:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.188724.1775902732118097647
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 11 Apr 2026 03:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WgewpAHY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=856181f2f5=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BA9d7J1491964
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Apr 2026 03:18:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2aXU59NYUb30kHv8tbGzdHDxNH1yJq+W6Ej7BYhST3o=; b=WgewpAHYFy8O
	nNBG3lJb8m2sAm9/5o4zTL0VQ/sNB/6uO8flF9hzOi3rJ0VXZ6bSxP1bfkA7ttiy
	P/rdWYt3kpN0xWjc1n2NvfHs+yxqdgiwU+aG9fjM45uF0g1bHEZVg43fC1ibLysK
	5TOlySGloQXY/EzKyj+jNRd39nDeEluAmz9/NCG8hP/qmRvb/BJGbmygAMFbUl64
	FkPKL9c3NiMKLV4sNRkT/qiS4Pxo7DJGZDUWXdQWIX82+sxzin+MAhM9X5vRlIkv
	zHYNTJvt1YvV79NCJL8tudlSbENIPZamYRREPCflrmu21CWozzEsIsapKyhkbpFA
	D5RLDZG13w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfhk2g2un-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Apr 2026 03:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWKd6KF6HOk543Ikz9Ex3hCn7iMRWAvYC1XIZggzoPw9g1+tdA9cTCiFz6dGD8c/LZFIiBVBC6aYB6lLr63c4gAAI1bFtXTHgcAFS6okz72QdmS7kaF/G8cXvUC1LN9eVvLVuNsij7OBYY5t0GSfU/2rFh7CA6M/TQbGXr9nlcXtIM92UXEc9PCm1PSRDNKH/0UKDQU9WN4y+6r2QO4U6XkA7QQr60ZqT2ftWGB++pDLT2BEm9HXNfhj3F4mOKQx9H+OGy5r93XVcA7OKWNw/ZHn2olDYPMuU7koDg1CbTT0P1/UuXOUCu+us4hr9jZ0StnI7QwEqNStQ6aoSImjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aXU59NYUb30kHv8tbGzdHDxNH1yJq+W6Ej7BYhST3o=;
 b=Eo4NKxGhP1D75poEJfanoOKx8op50VummO6abrwmwavMV02on/IELPDceziuPjcoVsBxBcJMSO8AfBCZFUsKcgl6qyLs9NRAYHwdbGn4tp7D4RLteL32C/FJgzD3Scba4N7Ih3n0HXx2UexOKWQazlrPIer8BhR32xqbaAWUchH1Go52DITmueuZysW7dTYUlHrC/eYWjv93axMSEA/6HHgOhqzAEhqrDzK8djpPcOpSvfE+apfguidg5ohP5j1EnMfhDlanppauHjgxL2U488JNCeuTp1mZBd6JB/3irOv1gmeFIEx9ma/LEVyxDlrYgHPYqA4ytmRYMdBn4AEUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0SPRMB0094.namprd11.prod.outlook.com (2603:10b6:8:1d3::10) by
 CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.42; Sat, 11 Apr 2026 10:18:49 +0000
Received: from DS0SPRMB0094.namprd11.prod.outlook.com
 ([fe80::ab67:3026:77b:255e]) by DS0SPRMB0094.namprd11.prod.outlook.com
 ([fe80::ab67:3026:77b:255e%3]) with mapi id 15.20.9769.004; Sat, 11 Apr 2026
 10:18:49 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/2] libvirt: add secrets PACKAGECONFIG
Date: Sat, 11 Apr 2026 03:18:42 -0700
Message-ID: <20260411101842.3462555-2-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260411101842.3462555-1-zhixiong.chi@windriver.com>
References: <20260411101842.3462555-1-zhixiong.chi@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To DS0SPRMB0094.namprd11.prod.outlook.com
 (2603:10b6:8:1d3::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0SPRMB0094:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: c3da75d5-b57b-42e6-725c-08de97b3b8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	SwRFKeOIDgwpfeLCciwaOKhnc6BS19k+wTopF7sBrv+WmFldmp/KKXy5MspTc2trTDWX1Y86KA3Eio906XYALpGBeS/MBwxwAoPPkR2uas+Uf02O5IB6tU42AkbzzwRiDgTURUDUIseU/Df+QMUII/2Aewb5yyXhSEVAcyhg/v+8Su7RT5+ExROH+erG9420/7vue5xiwaxUjfap7uFszFEQQ2ds4aIIDTmbcm32nXsz6gJ1hxyGGfnVdskl1EZ4fZpCC1yCiuF64RQ89pYIdxEWZie7L5fjujepOycPGTHNoJtqckv7Q94UUisjMlo1TGWAyo9YXtOotcUZR3+6zDrCohugbyA/pI7Nn0ayQk8Q1VLCxt798NWsPfVAwgM/Z7h7+nAteR9Wpng7/mc58ZBK3dss5SzEo95dY6eAKbSCgEXvOTRwzx4Kp9RdqQ+LEgM+OmjJPCP6US60BZzomTD0x32wgK4fJEzPdNOr52Km8b6PCH3o/N3ECk3vz1DHg+paQqwhRduoXBKD8iWZ51RjEyEgnVDu6mLpNt2bQ+Rdt4wj3ChFsdeOEJK0Pj4svx5v593J/6nuDeOOHrz5b+1yXU9kbIhVIpF5TvV4D6afvyEULrJWyiG/AEXUzJRfegOnyVVCwpCCowYbBwG0mmX3RHgnsqR8m5xlWwHzO4sAcbN5pd2IOzO/Xhy1PBnamLOg+v5VV/hr3oI3oPg2S4dU7d497eND074ORYJQ3nBNq5VX1a9X/FYinoygcVmrTZhSRwJYTCmoRUa7c2r2cFr7j/QPbDBaS50JCEAV30s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0094.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sGVqejgMlfHHrVtebKW09wIw47pzvPw8n0poIy9Vl1JNlu+yMz3+PIUwXhie?=
 =?us-ascii?Q?GX8F4UbY4C6flYCkMTfiFGHnMNn1jb83iADLU9zPtxpc0XgsnpV6QiXTjPr6?=
 =?us-ascii?Q?jHhLpI6LZN99ym5nVSsT69A0Sp1EvIktBNhxGUlb8b8tTs6/kDeZcSCbnfsF?=
 =?us-ascii?Q?gsyddTttgzFkfDj/tVXLtv3wwx/dFUQk4lJ4Rwumu4BlNHyZ+BTr/fTMC3vW?=
 =?us-ascii?Q?cU8Peubrjg8AX31KZ4ez0gqs+XUqnGAi7be4FPT7xZn7xsHplebDawUnlg0v?=
 =?us-ascii?Q?mvQOa1wgzQw51ZKHfzNj3+ULLHvWxzJqzTvz2Nj6A2NDn1QEL1vThidnLVgD?=
 =?us-ascii?Q?sof/dlQ+/L8hDNFnDUkvFuVSm1x2qiwqu1Qydz/l4h1/Ww6doV9EikHAGzHk?=
 =?us-ascii?Q?LOdpH6o/5aoY4AuDVJp1SvLv03NF8GvFWxaLZFMPNlFfjWc5/1fC2pSRuIpU?=
 =?us-ascii?Q?+2TxE/2CEJiRIZf+6azaSbRjKUJ+g3/bysul2PuK3sCM2ZBtnCkbxB8Ltl+m?=
 =?us-ascii?Q?C9NIoFfaLXNuP1yWHSa2wXUB0fjWYZw1DBqY4Mv7yf+HgjgqrIrY8cPdK9Cv?=
 =?us-ascii?Q?SBbv8zslw8fhCm4uEYCUqJnBf6lr42TrYMGaewbik9ia1KLXTZjyyyGEhyAO?=
 =?us-ascii?Q?QwZ8LH4pIRPto5jmqq9pHd2rUk2xLsRxK008hKNVSNLA6AgoQjQIqBoYBXv0?=
 =?us-ascii?Q?kSCCFON4hdmj1KqbXkvzkkv65FROGP679ez9VBV6KwrEjvaxp2tgaUd0h36E?=
 =?us-ascii?Q?Iml3AZp67Hnkc0AvxKeOijxRps+S+AUusD//qpP2ULDY38A7xuOEI1ebAT3e?=
 =?us-ascii?Q?hAILCw1S7WP8HC5gS5T3CFuCl+GIKejlIE5ha/HEGIIcB6o2KDPJhnFpamr5?=
 =?us-ascii?Q?TjW/srvhd/yWef/8tFJK1rnF5fmB3pQraQ0grgTnHpVkffp2wCi3WJeSB+UG?=
 =?us-ascii?Q?MCbK8uh+HB0H2tT/X6mtM/V70a49i8t/PnGPAR40Ubp4/geHILTSf+L16Gka?=
 =?us-ascii?Q?KslRx6rxlJ4VouKNeMITlGsgImYT5u0I+bQ+nMoby9s7Kw36rHaKoB+oAni0?=
 =?us-ascii?Q?O0qpxDNC1Mb3fsyk2cFiAdtoxJxgiHR+65xuMQw21o5CizlkxNQ0kXwyBUsf?=
 =?us-ascii?Q?BzKhauips+bK/imYsiDLqSw3MpGMDKpcdvoGGpfbE9md8fEXRZANHJB9xDA1?=
 =?us-ascii?Q?mjwTmw4qSOP3jbpLhE3jE0adC0bcZEcuhkNWIdJXJteHU5BgFrl5iO9JCUBe?=
 =?us-ascii?Q?1zbGDiTRN9Xh736IUzJTi4RsU4xCyRPft4zgpFmWpd8oCYW3mlXSZoVFxtL1?=
 =?us-ascii?Q?qXz6an/KVAy770aOegub1Wcts08wQHqDHSGS7kww4MnDLn5Uzoqs1b4oF+lb?=
 =?us-ascii?Q?NZK4RIpAxxlA9JNlD/EBJ5UCho6mhoHFyLQXwvJSw5VT05TAhPfmL6UVnzpB?=
 =?us-ascii?Q?q6Hnx1+V3nVGEhW2yajTy5T14TV4ZyXZei1ZoSrVTrq7n64GpolGnW/v2JmM?=
 =?us-ascii?Q?bTV9zkNNKk+a5QCUg281oO1A/Hgfvv1YQdQcsKML5G2vFZQmecGFaENRYlHU?=
 =?us-ascii?Q?J04jCsUA8r+XugOU8/a312VpJXdpUy5sY0C6KA3PgeXTl4MCVUfKa3bcPnTJ?=
 =?us-ascii?Q?iuLomjdWAaTGQrXGidmYOIxwnQ5nbWQDhKwpoQyKX5DOk1fl6op8X8k13RNo?=
 =?us-ascii?Q?a8BQ0mKTaIJ2Y9eHQiSb3uHse29Q+7r9rEB5dEkpzzTITamBp2SSL2AkL6aE?=
 =?us-ascii?Q?FtL9X1SEgQGKSJyxjcEfr4Lk8OjOt6Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	f0Of7kmtv6EUNTYabiy5b1Pn7XnzcvztXK3ifu95kt0HLynxAXIAHcfZBgPDOQIpAArHI2Q056bDyIQPHZPOTtz/ObWXE7RSvTKAIMqtOkVwEMy8Eyexw7Q0g2HQemwSiCThOp7SIJXrblyEk03mI/J4g1erm9eV0kZnZzLMOnniGO+uBBJtxPNWKhES+UTVjbEHCeLgclV8Ia+KTbOb7xaz4rkGJbzcBCl9o39dbcXe/zbWLoyRen4zkG9T4JD51VpYQ/ZWKnvTOLCr0j9I6Bjzu9hzSXae+izj6+ualIBmrcFQgKnSXb2E0GBJw8AlfSceCjUDxRvJVadaKnsDuA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3da75d5-b57b-42e6-725c-08de97b3b8f8
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0094.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 10:18:49.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MQxy9WGDugHcJTpuSd65H3tC54DFxfbU8duyRajNamJt+dxLRimOxojm8PA3CBAy6fLiiqx29KXCbOk1Rqwf598+6uyRoDocz6HsQ5rl3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-Proofpoint-GUID: fN2WFL04SZ1LBTDceOlqFOdxNRgj5wRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA4MyBTYWx0ZWRfX6paBp6xLsg3m
 sLyUx8EPcLu57N/dbhROc4bUEIssrukYaBtGfOC06iY9Uh06IKfwuMESlOywbOpF/FwwZDMm+zp
 nDtUbTyPSodHqNJpAEWSeFahrqNJ9qvRC3JC6XD8mwDfChKBs40rA4AkXKAwWBt48QJbk4VArBr
 lV2++YHi/nfr3+l2eTbj30Rceh2SROUsz78PW42UbbmN/aWwth73SRpI0M8tsValqdxet3JzYpd
 W7oejR9z8B5rYs5fZ5hgpMLhdjOJVYD5wXflws5GtbPc63Y9iXZIwYyivbZmYQLdhepFMtst382
 pSihGBvoeXV31GMO4WlNsY35yabZuRa+ib5LVbvLabq6J4Rjf7WufoRx8b8lkfVh9tNL4tb5eQF
 KMIpoQ452YQPjPWs3bqVbUrMDyyshHPUrmkHBM9ixUht1SxFLiapbXlvsQM0BSAmVBMN8OAPz4w
 C8rMQV5XkphP7dCzsXQ==
X-Authority-Analysis: v=2.4 cv=A6Jc+aWG c=1 sm=1 tr=0 ts=69da200b cx=c_pps
 a=WlRzkYvQEyJpYq9ouSSplg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=eCqlsyGS954u8f3FZCoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fN2WFL04SZ1LBTDceOlqFOdxNRgj5wRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Apr 2026 10:19:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9692

After being upgraded to v12.1.0, the new virt-secret-init-encryption.service
has been introduced, and it requires systemd to add openssl to PACKAGECONFIG.
Because systemd-creds encrypt command will be executed in the service file.

Meanwhile this service was added into the dependency chain of the main service
libvirtd.service.

In systemd recipe, the openssl PACKAGECONFIG is disabled at default. Finally
the service file virt-secret-init-encryption.service and libvirtd will be
failed.

So add secrets PACKAGECONFIG for libvirt and conditional removal the new
virt-secret-init-encryption in the libvirt.service.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index fbee9c5b..3075149b 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -177,6 +177,8 @@ PACKAGECONFIG[firewalld] = "-Dfirewalld=enabled, -Dfirewalld=disabled,"
 PACKAGECONFIG[libpcap] = "-Dlibpcap=enabled, -Dlibpcap=disabled,libpcap,libpcap"
 PACKAGECONFIG[numad] = "-Dnumad=enabled, -Dnumad=disabled,"
 PACKAGECONFIG[nftables] = ""
+# Require systemd to add openssl to PACKAGECONFIG, so disable it at default.
+PACKAGECONFIG[secrets] = "-Ddriver_secrets=enabled, -Ddriver_secrets=disabled,"
 
 # Enable the Python tool support
 require libvirt-python.inc
@@ -225,6 +227,15 @@ do_install:append() {
                 mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
             fi
+
+            if ! ${@bb.utils.contains('PACKAGECONFIG', 'secrets', 'true', 'false', d)}; then
+                sed -i \
+                    -e '/^Requires=virt-secret-init-encryption.service/d' \
+                    -e '/^After=virt-secret-init-encryption.service/d' \
+                    -e '/^Environment=SECRETS_ENCRYPTION_KEY=/d' \
+                    -e '/^LoadCredentialEncrypted=/d' \
+                    ${D}${systemd_system_unitdir}/libvirtd.service
+            fi
 	fi
 
 	# The /run/libvirt directories created by the Makefile are 
-- 
2.49.0



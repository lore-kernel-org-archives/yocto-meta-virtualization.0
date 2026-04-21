Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF049F327BB
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 07:46:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15446.1776757588837823332
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Apr 2026 00:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e694csk0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8571ea7b75=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L4sfqB2593817
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=OhjL8KGpduRkuvChj5aD
	j0x28l31sDRPFue71IWYmnc=; b=e694csk06iTQ9wWx+r/sG69OMxNlWsy6xd/k
	zFjK22Xhb4Vg9YCQdvR3s/XTpPU8HCGFO3gprCz9khA1uwIIuWs/6CQwiOfcDcQw
	VECfI4+9kiBJZtbVoQIvRdGivjaTQa2q04PZjBmlt7xV3FpLkIWfKnL5PJnW91fE
	lLxymQgNQ/Qh+Z4Fzg5XsppldBPDVAiAFDFLm15Ku6TZVeqJfzzOUiSZOoBbtJWC
	6jTyN4eTyPje3QWRWoFVCsBtBjmEXVnLgU7rJlOV4mmhdhon34WGFPcAHhiQZ4Ir
	x8ysb1kqTKmFTjKiQA6CXvXb8BkiJ8NzcS+MBI0dlCQZGU8lQg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012061.outbound.protection.outlook.com [40.107.200.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dm0x6u19t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:46:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCb6RdA4CtwHpXjI6w9VA6wEPAUB/FozmKt3cH+xpXXuFLR2+ghxj4R1rWZFki09JQCE8zKlCYJBP+0W3Btb+ntGYwQWoI/fVRvUzmdtcJgW3SvZCdS/gGCdwUnNoF6SXY7FGy4rayOqLYWCl+LldzkOI/o8DnTlwFxUU68g2EGID9XRNby0/tQ8KiRq/hi2gBX5GgL8yOZx9/2ILN3GSw0l+jLrqARV98CkKpQGntejpOMVc8P81r+bmr7Z4zMEOuNLoFg00D1Qvu/cNFT2pHpPmLPBKrOfvm6WaA2LfP9VrXAX+oyL8KR5y0t+YtYXjhRhXGlYLbheQ4kWCCJJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhjL8KGpduRkuvChj5aDj0x28l31sDRPFue71IWYmnc=;
 b=StmYX5VvduuwALJNeq/0mmTkGPLWhnKM8JZqojoTEXNJWGXVlQEBLYM1zcmh4IODvmk7FwZ33oGPP/aB4bSxx9IL3Pj191Grfv2kVJU6rE5uLLLg/EHCFI5Q6Q8XzkuyytGi5gjqGJ2mPD2oDk78CL/hkHJpeBawP4cgbjxJdjjkdKGegP3gmN4pHmdnaUx5etM81xq070jrCnrb0ChTxhRYfIKzRoOLDTpQk0xDyZkMXMQiTQPjcH5/tZxrz5lOoTozLgoumAUvn7VUTzpxwx0nHZukUw6oqq/gPh+DsgMNgL3DMYfbPb4Bcfco09Z1uDsWZu3ZMQxRhxDviKMmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by PH7PR11MB8552.namprd11.prod.outlook.com
 (2603:10b6:510:2fe::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 07:46:24 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%8]) with mapi id 15.20.9846.007; Tue, 21 Apr 2026
 07:46:24 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] systemd: add openssl PACKAGECONFIG for virtualization distro feature
Date: Tue, 21 Apr 2026 07:46:17 +0000
Message-ID: <20260421074617.1646975-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0902.namprd03.prod.outlook.com
 (2603:10b6:408:107::7) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|PH7PR11MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: c038a3e8-cda8-4a47-bc1b-08de9f7a1639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|56012099003|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hjdeZ+dIG01aUWwlXmple/is15gdzyyAXcUIEqe6Vh2Ks67hqYH64Lxgu9bo5HRE0qELFrNtBvWgX3C4FthfzjDbiET3JeRl15hT8Sc1kIm+dscGJW8UIeCrxpOmoZ+Ronef3MvxONxCllzI9WKfODfIE2OycVz1pdzGflUi4Sic7aS+gaSPdN1BPedzdtKR2akkfYsqVCE0VW3ErSzXy5a9qX9cyZqCCUNm4eAAfoclPob9uevmrPzBCsIx37+QeLxzQtverC27LgAV3hFRhNN2DuxkoCHUXjb1ukoXqlgKpzOHQLNIZRtYwf2b7n2TVtWaK6pzA7rthqvB4uYUCpOJcDeJ7MCP0iNk50yY2+GDL/LnyJAqpAzJ00qZTQ9PClrtTNMJr1JlLI3Gk+h9AFd1souasa3q6wuNANRail74uqierpLoDJM0CUoK7pIhzuzynXQaBxUTmdH0sKf5FhJfjKLWR5oYAkutPgz/bnGQEiCfdI/KxhvHcq5EuzYKWrqBL4X41yL6Q7IsQ9714MmfD63PLE6Utru+IQ74241uXV/swX+AxBbKGeOUw30eRoZRWSmECiXv4cO0bhXjMVcSFglkkq9/t324HBVU9t2nFDGTLrT+e9DYmIi/+CfA5qLJ+t30FxuekWqyhynw7vdfR/9m2LGc5HuJZ+4PxSx1mPBlvyZjI5qw0i0YKuyAhVFM0PMR53BU4fmTSAE1I6M7TconWGlhIYa93eqAB3E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(56012099003)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+M6Q10Uc1JSYCdTvJDmVMuRFI4AAstfI5NXmmdrsRwrWS7uKsrogttBq9YPu?=
 =?us-ascii?Q?w2RG6EBuXbj9KPFmP4wZM4/PW4JTL2hS4mUvSdJTBITUtD9dhowOJMDRgb+P?=
 =?us-ascii?Q?IW80oLUEMm5VnDAgXlCsRrxuTUSbRa/AXGob1lvyBMiXxAQmh0EPnV99KZG9?=
 =?us-ascii?Q?oHRNUk+HeFMxulk4FeHLuXc/5/UZFIiHlaXGg72hmtP8FexL2rdXdQH96AtH?=
 =?us-ascii?Q?NPEw7Hhmzk5xXR9eyv/QQ58j3PYLyowcKakP9BCwpkKKxJv4/gkA7AmYaOpH?=
 =?us-ascii?Q?qiyuWDmm6SQjVJsrgcXVOFaQLNwr3FJeOsySJ5bAqSYoihE4hR9rqpTiLlFk?=
 =?us-ascii?Q?B5Y+wKkaU74z1YJ35eQK9EaNwKkvl9sNg8J4Ep47Qj5TYvV/drvlfrFY4YhK?=
 =?us-ascii?Q?28Uru9tRKsRP2NVRUlfhMRRlA6TKlZeK+k2pEMyXaOOSAC6fRx+1FPPMP30l?=
 =?us-ascii?Q?tAwUi0QYM1Mw5+QSMMjO6EXFcVowQT3dO9el3xAX7ZGiGqVy6/iQMXAUe1BZ?=
 =?us-ascii?Q?5noR3hUeMGCPEpUuWEXxQHKcxPJLewI3AQ1kSoVBiNEuR7ZCte0ZFfMKJd9p?=
 =?us-ascii?Q?DbE7rW99IvWMRJQiVc3vV4//sjfhO6Q6MvTMKqd7AKTnRuvUgoPbEeNX0R+l?=
 =?us-ascii?Q?2ECmxQw8syyM14SsM+4TxBUjmFBwgHoiBQzT5hZK9Z9mg2J0vELfhE0QHbGy?=
 =?us-ascii?Q?XiwiGdTBVhoySR8j6YUQpMtHaoMnChwXSoTUGo72E+TwBBJ5v88saRagnA4x?=
 =?us-ascii?Q?MJ9cPGhyUDP4YtOKchK1DoBPTrzeT4F/Lm0UX2A5270mDJNh4XszswSw4mUf?=
 =?us-ascii?Q?0+7e0FAAb4ucEFVu3AdP3Eh7K83WdQOFwuYB7WmlYMrZLXt2FdjfMf3+8Oau?=
 =?us-ascii?Q?krodC1li6Z7pjLscxuif8io+zhCNBILvB/GW4sNIYXSu9DP0+6HgIPZpgz7Q?=
 =?us-ascii?Q?pMBAq8GVIGzO66fx1BAPMk+Y2k/qP8MYIv260X2l08yI0sUDKITNGOzf+pes?=
 =?us-ascii?Q?x03PEyP2kz0PR+24eK77Gbk78JP1Xz25frb1tpBtumyIkqXeKxEi/emVUmUy?=
 =?us-ascii?Q?hh3g8VnFX0DIX4EquUuRqX9hiU9luol3eL4i2Cji2dv/MWT7kmyjG7R0FWNW?=
 =?us-ascii?Q?N8E9pyWwNbxy4hZ6E1yezMPxfaWItQ6fdxuRBHTpcbxJGW/Nlbg5QOIFDFDR?=
 =?us-ascii?Q?1VWfIhqpFBN2YE7h5K1w4BBQ2POqRUq/8yz8BQYncKxQJLIPClPqmczWB+Bw?=
 =?us-ascii?Q?HHyi4cC2hpRoVaU77bB8UDj6OPtOP72hq3oYGwgALT7ugRIiN29VxuRw8m5W?=
 =?us-ascii?Q?fGWsQpaGvMPHtKg5GeCT9Rsl7Ku14KAgp+JKMtfzwiCsOYecOPp72/hSK5zL?=
 =?us-ascii?Q?cKw6C/nVtSgyw+c+Y7uGTodjTxtFp9MbXIGDUHiqg/p0qEvNV4tAojqDEkmr?=
 =?us-ascii?Q?b7MIKX3tbUaE6qB2FyGxo86GG6P5sGB0syHjxGvY9mCA6jZb8gltlxxiyiY2?=
 =?us-ascii?Q?6uba7DebIQL/Z469HEDLy9hXGzsDqq2M+JpH44DBV5AmeWCs2NDTat+hIE3E?=
 =?us-ascii?Q?Hz5eYf9W/1y75QcheylQBWp64sp9l5gR9RY/u3DddWMfXKBMFmElAdM3KaQI?=
 =?us-ascii?Q?IhTdhgXw/lDF0o7tPX3ksbe4j2wOb7sPPMUBhKl889eUS0GRJHirhdB3h6ny?=
 =?us-ascii?Q?AzpHqSgx8PaaWwUSiFCKZiuYDuqrFhr76j/UsG0XQKEeUDDfOCQR8C8OoP0A?=
 =?us-ascii?Q?rvvNhEvlgduew5fjVKjCGitbvfZ4GT0=3D?=
X-Exchange-RoutingPolicyChecked: 
	cJX4WmaBYuECjoSRdYkN/AOIgTr5zMpvPduBLjLRTh1x6W8K4JBYmNML0iY2K2NQMTcPATFySJ1+iDAML2f/M1llZN+5VaVf/Q+u2F6XuOUpiENlZv8iuaN3mWmO8+qRsVQeZElJO9tAonZYNb/g0We9Xo6HFCFAl+A8UX4QTuwa2H5jN6bGqSEIPxKhNPKi5RBx6Pdno7DpCEWZn7Bx9q/Arvq5UUv3IJs7MeDjM1yW2XTZ8cCJ1wN/Q6bBbne1Od6vu9ejIrdC0kDiUsDFK2I/YC5NrSYAM67jy26qYlznwG+j5YCeL/65/zinISewKeI+eAonD/5scJVGptDgrQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c038a3e8-cda8-4a47-bc1b-08de9f7a1639
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 07:46:24.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbXeV75LRRhElyaoyfYcxvFVoMSem998FC6QPmquexNo0vceuBg2Do+SLd5T461UfdYxILvM6a27OHe+7jFXdB6UbaPx2QUa2SEDWpbDvyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8552
X-Authority-Analysis: v=2.4 cv=bOMm5v+Z c=1 sm=1 tr=0 ts=69e72b53 cx=c_pps
 a=1c0oZQ8MA7sDNsoFSDv1iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=SqMvC5kiAAAA:8 a=t7CeM3EgAAAA:8 a=FRgykcoHgNDUwOF7vDUA:9
 a=_o8VnCo6Hb5Oqlm6Mk7M:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: HIeVk1sXp9CMLRP_dpWXFyrSjmkXI_hg
X-Proofpoint-ORIG-GUID: HIeVk1sXp9CMLRP_dpWXFyrSjmkXI_hg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3NSBTYWx0ZWRfX8bgHUJg8pwfq
 jGSr6Yw3yiHpuYgbYsgu4+rqr11o4dVv6MlnFzFEJl5bhcJYOx3w7QfTDLoJ6RK8CrR/B1AxLgf
 RdkF2i578tfiizvh5LsU3vYx7lkmQ6gDUnFBH9acRjjYlOwo5q0+6E/d84baoxp4+Iesh1MkMIM
 cKgssUKtWCqp1iMZfoyD2aumljnuGEFxLo75/rUAubZWGgnPonHjSC/q9aPF6K41/pxe1aj60cJ
 zdEK1Kh+2lWPsPXyKkeXZJV0aXQZzv8x8wZimXMTZlC9L53irK8O3bM7KKXLLRsL7wTBddvblva
 Q/qwm6YI86uV95pxaEnOk/qVCAcBlgtZByCFai8mTk0twRmwiqja2C7HCbEx8RGHax5a0qj+wFP
 frULCLvmnTZpoze1b5xJ1vrxE245Y5PgYYg2S4vo9SnD9Z8gpazus7m7ahC7Ia0dg1O9TZx3qqS
 QapRkIObOlwk55uU8/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210075
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Apr 2026 07:46:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9718

Since libvirt was upgraded to v12.1.0, the new systemd service file
virt-secret-init-encryption.service has been introduced, and it requires
systemd to add openssl to PACKAGECONFIG. Because systemd-creds encrypt
command will be executed in the service file, which depends on openssl
is enabled.

Meanwhile this service was added into the dependency chain of the main service
libvirtd.service, and will be enabled by default by libvirtd service without
any build dependency detection according to the original upstream commit
https://github.com/libvirt/libvirt/commit/97758bc9a0b1fccf8c0009308658f1204b113b89

In systemd oe-core recipe, the openssl PACKAGECONFIG is disabled at default.
Finally the service file virt-secret-init-encryption.service and libvirtd will
be failed as the following error:
> # systemctl status libvirtd -l
 * libvirtd.service - libvirt legacy monolithic daemon
     Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
     Active: inactive (dead)
 TriggeredBy: * libvirtd.socket
              * libvirtd-ro.socket
              * libvirtd-admin.socket
       Docs: man:libvirtd(8)
             https://libvirt.org/

 systemd[1]: Dependency failed for libvirt legacy monolithic daemon.
 systemd[1]: libvirtd.service: Job libvirtd.service/start failed with result 'dependency'

> # journalctl -xe

   A start job for unit virt-secret-init-encryption.service has begun execution.

 systemd-creds[1251]: Support for encrypted credentials not available.
 systemd[1]: virt-secret-init-encryption.service: Main process exited, code=exited, status=1/FAILURE

The above error info "Support for encrypted credentials not available." comes
from systemd-creds command provided by systemd without HAVE_OPENSSL option at
the source code src/shared/creds-utils.c

Here we enable openssl for systemd when 'virtualization' is in distro feature.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-core/systemd/systemd_%.bbappend         | 1 +
 recipes-core/systemd/systemd_virtualization.inc | 2 ++
 2 files changed, 3 insertions(+)
 create mode 100644 recipes-core/systemd/systemd_%.bbappend
 create mode 100644 recipes-core/systemd/systemd_virtualization.inc

diff --git a/recipes-core/systemd/systemd_%.bbappend b/recipes-core/systemd/systemd_%.bbappend
new file mode 100644
index 00000000..617caccb
--- /dev/null
+++ b/recipes-core/systemd/systemd_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
diff --git a/recipes-core/systemd/systemd_virtualization.inc b/recipes-core/systemd/systemd_virtualization.inc
new file mode 100644
index 00000000..585f4c35
--- /dev/null
+++ b/recipes-core/systemd/systemd_virtualization.inc
@@ -0,0 +1,2 @@
+# libvirt acquires systemd enable openssl PACKAGECONFIG
+PACKAGECONFIG:append = " openssl"
-- 
2.53.0



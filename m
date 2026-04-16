Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76E6F8A15B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 10:46:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10952.1776336367871003385
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Apr 2026 03:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wrycj9v8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8566347a15=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G5Tu3b321589
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 10:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=YG6C28k67tsA+5BnrIVp
	nYKst1slqEfeflmx3fDEMh8=; b=Wrycj9v8YMaEW0qDKBL6Q0d7Xb4XY55vVLwf
	0nK57vW5LlQEtiImTqTw+jhImdqPcMOy6OitxzIuSvNDZ0vxtXN4pC/9wgyAIO5y
	EG9rzwqNYDySKKdNEernkYWM2NMXNWZdBVe8/HTvGyEvS8NHT0xWxmVePxf6I5Ae
	11IwcvTDd1xVlpJovRvGfTipdpVWm1meRgnFlleDQkuEmRyxYmbiCwk/hpN3IDEG
	Ko/LCRl8aue4vemB8K2+VAbIq3RdTgT+WuN6o0Z3XYjQJi5gRGV/Hq2orKB+DjZO
	ATqBCHvYx3rbvwVfzn9d5f8W5LlM0vfQsIi7ADe9k93vFKJOkw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010058.outbound.protection.outlook.com [52.101.193.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh87abjea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 10:46:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9kLuN1g9uBsSCxOQk8uJ+lk2b4yPha/zCltSHVsw1yNzSxSRNIKy+9dfO1W46cgxE83TBY0eUPj8dJXkgiKdp52YgLWH8dWJY2hwWDW+D2bFSusOE5x5P0jxcQfuoFDZ+RRT+U63od4llhHpgyQZ+Y2flSMJPeZv45+LBgAgNqViDdfAjc2WBCbVP2pc0PF5sfOkeytB5BYxTB6cJ7Qi/+8JcyzQ1cgb+TjqJI6xuCAjk8LSO5m1Fphx1PDD/xFVABjl4f+oENJqEYQWiqJI2FiigM/qIfqvksMX0+3qyO1eBOc8+u7CQ9bC0K2tjxAo4K3dnxDplRtvOCkPC8t3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG6C28k67tsA+5BnrIVpnYKst1slqEfeflmx3fDEMh8=;
 b=NUaXwPoWYvcnnEm7SJoFZZc0AM7JCfdeT4WyVozMeI7KmfSpBEViN5I+mtv0GwNYmtLSgIXA86LDR3J5j1yqRlG1cNXlLTy+qfytlc/WaISfhO4lXGeu1twC4cu5hz8K8WB8Ip3i8CFuWnEoyKSHaxooHmcqaL1fZ4TiOfWSBNP+ICheO3E54ovQD5IHppBHVhDUxeq05JDz95WzDWDGZoN2bWM7hK2YCgb2kVf9CZMEsebh7TlUBn8nhZ3GiHtmNiK5O+ea523Mw8W+RqnSw0WuwzIZkI80L7Sdv6KUuCuaxsU/X+cUhEafaGHJtm9dVBDP2JyuNDdZSk+pYm/YXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 10:46:02 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 10:46:02 +0000
From: peng.zhang1.cn@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] netavark: remove nmap from ptest RDEPENDS
Date: Thu, 16 Apr 2026 18:45:51 +0800
Message-Id: <20260416104551.1587064-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0193.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::17) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5838ab-4224-42fd-c24f-08de9ba55a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	9dag4tSsqPJWaAVy3xeQJ7ya5TnytpxTpeY+paseoq2L7rmA/IrUrPcUrTfxNOwiSDlB4b0YhI8vWnhnD323LIJR6LFnoIu3S1DgeA5WHrtRczm1/nOI2KnTEBerB7XyUxa3OfxNTqlqEzfmOIfo5u4qeCIa+N1Cj9tZXAWBRdz+Ix7Uw4E1BHKYZCl1nDZD7sx626zeAGqSyGeb/avzEM6rqUkJ67kRZxHjV9RVxfAVdByvYuRXUkYv3WKGUZz3JfX+Xx4UQ8wvz3OEx7AcLFfte+NhWb0tAcVCuq/ZymDwvljZvknnxhBet8TZwyPXWaaPBXKNYdPL3mEiVE8FhBLB59kCxFGXjXW4VQXExXZgGwv4I5X08p9TyXwdLV4QR/+y0R7ScHEq5aQMuDAiZ9y3Q3hCSqN7s2KmBXnqjTYouWZ8MoqbRmIrDPXFey/BN0wSEqSKudezJyqs4HnNXAl/CYGHmbzW14duoiPpitjl6TSqzTWVyRDfrOH3n7tIQn40nOKU2+dxWHWUwU6gAEWG4UOinLlwV8Odn+opqA4tnIWYp4iyrfLlkSjzD1RK1ok+RZdFvWyhy3p/WIRqKYI+1qpr27fRbbNNYdAiQ3Ao3Y2DbH3MbWpfi0ibtsvv9yYZrDZOfrTDCjPz7M+t3e28yPveWONR87xEQG665BCA3sDEEALizY7lKwcy/tiCuCkiCvENp/lXDkNYeK50o4OOY+ybQqZmxgXvOGivTkOtMNoLfESwHcABnkRgnfqQ/ncGuniX/JKSwXVrOn5xB/slZWxoT7dHRc+vilrirkA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m2jY8Aily+XoMOUVtHAQR3Zr5veNS9fWD0khly3ROBahwvQpiyWRQwk1coTa?=
 =?us-ascii?Q?vPj+hkwFR2XrwrI+owJPrDl0EcwqYoFqPWzaU+tg1HlN1FFC64h8Q/syzXn9?=
 =?us-ascii?Q?hOCSLp522XKfIwoUwepR/qC+8RjByD0Y+W/qmaYnZnoGoMqn+MZ6C/LkPLeg?=
 =?us-ascii?Q?NlMRSzWg2Au0sRzfe7C611tDLGUOufTVihPAJPrOV0Reo2V53TYe7wh3rC0m?=
 =?us-ascii?Q?hs/tzwEOJ9tFlxhvMWyJvqgORyRZDh2Ua66JSqZ93ZJKVmOjUKCWRM8U+X4p?=
 =?us-ascii?Q?4wyjf+MVFez3V/ISLSGinGd74Sl0JV7hV2ayYg0nhlthZNMydjXdTAQGxgeD?=
 =?us-ascii?Q?AsNVQqQ/Ti2Zbq8TvPaHOukYW4IzYtHPPeGMRg+5D7A3K2hDo83hbz2AVeyx?=
 =?us-ascii?Q?r1S60mda/fiQYxhkJHZCfw1Z/Wokmi6MsHIsFJbe3gj/U1BPNbm96IWE8V0H?=
 =?us-ascii?Q?xwVei4QgPu3qvfnBoG9+pqu9MXdCqiCkjI6UD1G4kJt+vqB2k9Vwg4YmtU1e?=
 =?us-ascii?Q?+mTi0fxnypEdSYYull6kOCGQi+XVTs4KKA6v6ksBEo0ymiCCwgPA5Lk5DPo5?=
 =?us-ascii?Q?a59MngU0OP60pPWVIJ9MY0iTbfkj3K1oKv7nL6jq0RpdyMIPtck6Ybk23ZB2?=
 =?us-ascii?Q?Hz7n0QJF+U+P2xDBUsIiTyCXQV9Cjk9KQCEyIWbcZvp4Y+z6ubwzldPP4DNu?=
 =?us-ascii?Q?KJjzZpP0LafTkG0dAO996g694OzmYbsVkdpLnQMkjwSzXqBoSnkLFrsneGe1?=
 =?us-ascii?Q?pBFUAac4piIJX0InwILGJPI8T0DqsOufsM0CNylhalkueN+G8iQqf+GzC3gB?=
 =?us-ascii?Q?4pCnMgsshVMzc42x5zwlbMPLRTUHqo9HjFQjwzHQn3JVsKZK2mSVQ8hdYNyJ?=
 =?us-ascii?Q?Yd8X8MDOrkjJ2/1i1jzk64pPjZQ2boGtYmKLHTDL+YshxouEKVPB4es3igyK?=
 =?us-ascii?Q?y8iGBDzgWiL8KQ6O6oEiCRojPQvfcx+Jb4Jl9kp/cXdCYE/pxO+aA0XCz/jq?=
 =?us-ascii?Q?2tn/3X/c4DOTKzYtc8/tvyr/EmaOLLTNh3kiOrFoFA0oHj911MnV1qX4LVQ7?=
 =?us-ascii?Q?Dw2wIVMMbIshA2YntJobYH0Z2zxXqovsoeq8VeJS4bZioJRIddH88inh0Skw?=
 =?us-ascii?Q?diDkneUQjmLTYe8S/q/JSjFlAHku45cT0iMWC5ICF0AnxMZE0Fb2WfLRpWzk?=
 =?us-ascii?Q?zSs2OGCw5EbNUf3wWE8LjnLANjZ9Qs1+oIMN2XQrQd0zROc928tdmhpf+btu?=
 =?us-ascii?Q?RAIWXoJROwXOWudAw17JJ/Qr964aHortvikCdenR4rLr1Nzi150Oaz+lIzTP?=
 =?us-ascii?Q?6ixK5SAq2YUMrOrMdfckrD0deeJ38HeZ6ym/xewcCQbu10x71yFons33opY/?=
 =?us-ascii?Q?AIPvlEw2rLuyARo6zIO8uCFyMIdqxb9UbfH9DWABHUD2e5OzDNyZXWgM9saA?=
 =?us-ascii?Q?TWFxwIpc/Tu3wEc1iSub7T8O4VKz3putqsrS81n+X6zybGkNegl/6nQStHME?=
 =?us-ascii?Q?QCcUieVbt9Aehd9LUPkKUoTNezFISVS2SEOTBHX+/T3PcjWL6m/cFPNM00BD?=
 =?us-ascii?Q?YLj6ZYE5oXEWvyqWkBIvZ8VZBE3uykjGkI2rbbt4iPGWEdTtzMuK3MMH1tLW?=
 =?us-ascii?Q?ov67iesrHjoY6Bu7OZCYaZRdO1G0UV9hUa+dNLHaZAr8Vz1pNFLijYyTRer2?=
 =?us-ascii?Q?JMJH5/W6gWzBtdHQfU+CMTuNiuSmqOux00gOfWm1+clTOKU/X5kahsr8LFXE?=
 =?us-ascii?Q?zPzh2ETS6z/Dm73XCWyB7oqBrzdL4BI=3D?=
X-Exchange-RoutingPolicyChecked: 
	OAM9Y9pYRq2G0xitEY9l0pL7ntm7IHTaPfFOzPsgi23/C45SVPHvO6xnuqKACjDd8uTLjQu1Eqsrprz1S40Nnw3syQo7QyXAMrMhVj7HncIGbiJ2H9irOUsD5PdScwhpgrp6sr5onOtEBLyMwmWAcR0DnsouMHrT0TJbIMVAi3zKzicWNIaTAHUKpZhIDMyAbbdgWzaNUEMm2uD5YcEW9g5W4g8pRKmcCRS+C5lk5uEYxHJLXhtX6JwIPHqpXnYh71+u6fCD1342pVi2IGAyu0k6BrKQiEiiuPMJ12WsrYD+JpVqowjUL1iz62lUGZg8bB8mm86yfXFDKM+8usoCqA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5838ab-4224-42fd-c24f-08de9ba55a59
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 10:46:02.3946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hGy/kWnkuRJK2vt1lwapjcT0MHFeVdcVnzcLWlcLf1QIIeKlwbXcmxz59U+rDu+QjE2zZ0Y47Bqou6tgGKKaJqNMsM0X+zouC7KwI+8+vY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
X-Proofpoint-GUID: hotM9ks4b_XqplRp89eBieqeYwQIVMm9
X-Authority-Analysis: v=2.4 cv=Q4jiJY2a c=1 sm=1 tr=0 ts=69e0bded cx=c_pps
 a=jJEkL6Umpl9hNhu6gfQ4Mg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=OKw9yWwUeoe2wB3bfCYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hotM9ks4b_XqplRp89eBieqeYwQIVMm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDEwMCBTYWx0ZWRfX0BtmlkbKfkKv
 N1CXEOCLQXF9JwRG7PkZ4gOTLNXblRGVDSnA6o6A9O+P/X87xQducxuYYLOKXPHAeR7LNHpNncb
 pt40DpS1RrnUc6jZN+Fev52s+QzR5EXVbgSgHBrCC4grTNdYEugiAK+kWamPa4nMNGWq2zsoNKx
 T5LRmky25hruZ+Eq4jAtoyJrsyiWFy+NSKoLaqKSaWpzWm9t9ArXlh6uFSTS893v2UYvIxPLTQj
 Vfr810CwYnK/I60owtYZErFsG6xw7D/wAVS2sARztp/WTewnm9l7rbvhGnyuUo5kJTim+GmGRS4
 JHNroKI2qfNt66yJo6HEnEZU0qDRgu58Lu3aOiMYhYoR+acmYENU7uVN6N5GCG8VeJ0B/mKz5L8
 yE73irRctK1uNqbVKBVKJsi3iH1LrhF0HSH/YfJFAcqMJQWY9erkmGV3xlH3Q1YrOWl00KvsEFc
 FX5O2oMflksXKQDyUEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160100
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 16 Apr 2026 10:46:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9705

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Since upstream commit dbc920030 ("test: add new test program for
connection checks"), netavark test suite no longer uses ncat (from
nmap). The tests now use a built-in Rust-based connection tester
(netavark-connection-tester) instead. This change was included starting
from v1.16.0, so the nmap dependency is no longer needed.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 recipes-containers/netavark/netavark_1.17.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/netavark/netavark_1.17.2.bb b/recipes-containers/netavark/netavark_1.17.2.bb
index b0790d92..b9a69e54 100644
--- a/recipes-containers/netavark/netavark_1.17.2.bb
+++ b/recipes-containers/netavark/netavark_1.17.2.bb
@@ -55,7 +55,6 @@ RDEPENDS:${PN}-ptest += " \
     iputils \
     jq \
     nftables \
-    ${@bb.utils.contains( "TARGET_ARCH", "aarch64", "", "nmap", d)} \
     procps-ps \
     util-linux-nsenter \
     util-linux-unshare \
-- 
2.34.1



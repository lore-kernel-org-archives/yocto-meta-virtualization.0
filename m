Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54C9C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 04:09:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6370.1672978182512298690
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 20:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0370eb050c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30649gDm017168
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 5 Jan 2023 20:09:42 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87unyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jan 2023 20:09:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJ0PG8Nk55sCpLmDp90qy0eB3SPevQbJZdKbf55OQnKopQo2s82vJExAZT45R3N4KTlZRAavnWAVadp2oUBKmzrpss98978V1XyKVSZhOxwx4hALCR/Hmb+ZeCSbbL4eiL3vm3hU67e8LNQa966nwUkua+/7+5Pcphbv+Z9tI4aFPSrsdVLORhRzleXhah7Il6A+FxOFRg2aNhMe/ynA4hyS8stX9lZ0+6ceQBlobJinigq+khnJ7Qg3KHPiBeQAehWXGnAT5ktVt6OtT1JLb1/LNYwK7jXz7WTKMXTM/dcXfG8lFTqDK4P/ons85jm6N/U6qOnofvQJIo1lRAxY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/p34bwzhedsmOK+l0j2aj8n/2Uz2yilLbsWvXq8nGo=;
 b=g0rt3y6Ar+gD1NxVZyEziM6eu3VwdoQo+Zxe6tKR2igpKF1mpw4/fwZR9ww8cw79c5557xTmYMTirUiY17+rsIfg8WXpOK/UujG6+Sg90MeN9+HqjPRiMwBMpM/AU0QW90YwaVKJH9BbcxRLttzVl2drYqtQAnbFIWafLjo946a3Se0jlQ1WEAUeP9XJAVP02YY5aErMcDaHvLeA1et44K6N0JM48FXkUr4qrUTSSnYZGo5NXJCRwx2dalJ3d7mKqCk3roOvyhllnFpObCl04yJudJNjs69d/5QrTBkcXAIM9s0DAz1W//3Ac+2mncAhP/TJNqJQg5Chk4p+cVZtbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 04:09:39 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5944.019; Fri, 6 Jan 2023
 04:09:33 +0000
Message-ID: <cd8582e2-5a67-d753-6ea1-5c181569f731@windriver.com>
Date: Fri, 6 Jan 2023 12:09:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-virtualization][master][langdale][kirkstone][PATCH]
 openvswitch: backport patch to fix CVE-2022-4337 and CVE-2022-4338
Content-Language: en-US
To: meta-virtualization@lists.yoctoproject.org
References: <1734D8DBF4A40DBC.27785@lists.yoctoproject.org>
From: xiangyu.chen@eng.windriver.com
In-Reply-To: <1734D8DBF4A40DBC.27785@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|IA0PR11MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af46306-02ab-42a8-3ce4-08daef9bd12a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1JsFQtl3aGKd+i/TLO8VFUuzeuQT/KzPckKlAK9rDFeMhc+QxOWEu13WUbYX20QinYwjbZpB91njYObdW7r9pr5vX0Y1L9LEFEVCTSVPsGMPzg0PgEb7cz9hBe7c6l18T5sSmR5bYjZHXra2n07wy4m/dhVuPAOCrkBy4beSaCUA2ygMIOqUWQvgU+ymZBLJ2GsWUiADJdkSPS9Lxm0+YobbcMxDcN9kHA9TrmE8tYBcDgjBKJyum2PRZyynUuHUTQOXUt8zaS3Oq8km2v5YFZgeBd5yXcsnEfOw8T6IZ/pB+Z76szbD00YaTpx4z6ZfB5umQT/RrCYZxXGYh5Fec/MYm4sLdFDEITUPBbu48N3jek4A+R6fpG5s3betl+7ZKCeC+SJfyfN9v6HIDv8NikqH4E861D4pS6aSFgLcqB6ixsuinkdMncn2Rtr/Y+DRr5YuPfNYH45qDqNQsMU/GlWqlp65kv5/DLYN5X5eg+736AeYGiH4dTBZGYPTdrj77ata3vz6j7JL6eqkzow8LQBwPWrEJryJv3NUIx836XsdvxOV+Oao/g4HSk6gcZUGvNj3Q7bxJneAuPew3lTpKM/LLZzX7iiGkl7MQ7W8AsLY0w99PGRSAT7L+mnIyku2US0HBKFyCbfDPDQWH1AhEoNDaIAz5Zx/vnraTc1cuEZdosJN2evmHg6cfiu6UetTPZXDtgjaRok2D5XvnR0WlTLtoXsyMiS3fxTm+UVX6Gn/DwBYWPaFH2KvvPw+ATiD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39850400004)(136003)(451199015)(38100700002)(66899015)(31686004)(31696002)(36756003)(2906002)(83170400001)(316002)(6916009)(9686003)(5660300002)(41300700001)(66946007)(83380400001)(66556008)(8676002)(966005)(66476007)(6506007)(53546011)(8936002)(186003)(6486002)(26005)(6512007)(6666004)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2hUU2ZIK0c0V0s4cFFBNWpEL05Hb0hCQnp1Zi90UXlNd250THdTSjNacjE0?=
 =?utf-8?B?QW9IRDRJRGxaWU5BL1NnOWpTRGM0KzZ5S2FKaU5VS21MMWM5akh5cHl2dkVQ?=
 =?utf-8?B?dy9Od09zajBDU05LZXFmZFJiMkxCYXdJUkx4UFdiWWlmYVA5bEZBbjkyTjd6?=
 =?utf-8?B?T2U0eVlnUytqRTlkT0hTOVA2RkJaQUpIK2lZOWZKNitBT2Q2RlRUS0NYbS9G?=
 =?utf-8?B?am0rMHIxL3dndHJQb0lCVld6bjljcXRVcTE2TjV4Y3hwQ0ZoTjV4Wm9yRnpM?=
 =?utf-8?B?dDd2UHhpKytVMGZwVkxid1kwaldzNjlvUzF4eFFUVVNpaGt3cndSb1FpczRx?=
 =?utf-8?B?ODA5TzhPTWtrajUwTldJMnlRVE5TUGRiRCtsSmh1c1VSbDRGK2xvaDl5eWJP?=
 =?utf-8?B?ZEpTeXhoMjRqbU90OU1HRXhCUmtFbk5MdElQYzlnNmtKWHV5VDdIOS9PNXhu?=
 =?utf-8?B?RFRQRE5zeTZUNlJyQW1obDVab0FYaVRmR0FjV0t2SzR5cGJ6TG9lbHNETVlw?=
 =?utf-8?B?cUZqY3NJdndvbytkc2RPNnQzREk1UU16KzBWQjVYaG9XdDJVOTlIZXFaSFFE?=
 =?utf-8?B?WHQxcHhFSHhtRjVtMEhoU2pnRkdXbUFkRVQ0T2kweGZ0Zys2TjBpeEs2TGRW?=
 =?utf-8?B?WWpSd3IybXhrejdXNTlBTTBYVkNSNExGelRzK2lDd2JJT0RTczBuQkRZbDRu?=
 =?utf-8?B?aUxuSDlHV0ZMWGU3UHN1VldvTEp5ekcrRkZ5cG1Nd1dWdGh5aVA1Szh2aW5i?=
 =?utf-8?B?Z3JCbS9ob0hnL1k4aUxmckk0YWxJSHlYNmlrdHp5cnphZTdGaVJFeXJrV0cv?=
 =?utf-8?B?czdoV1hMcUxiSlZxaERHeWgxVEdHZkdnLzdsQ2lwN2RWL2tXRGhYNWM2a24w?=
 =?utf-8?B?NHFFOEsveXFyNEROUEFLOS9IQ3dEQzI0TWhLWGFnRVkramovVUhPN1RXRWtw?=
 =?utf-8?B?S21zeERRQXBCTmlyQ3RWSVZvY3pBOTB3bUpuaFNhZHRtQ0p4SS9sV29LVWgz?=
 =?utf-8?B?NWIvYUJyU1REQlNORGhpVzBPakp3WGFrODU2ZVZnN2dZR0ludDBuRnBDU01v?=
 =?utf-8?B?aEhBQytvV2hxdmdLYlptTXNHQW05Q3Btc2RIQlhQVXpGcVBFN1N5WUhBa1VK?=
 =?utf-8?B?aFpwOTk1dzJweGdhMU9iS04zMTVLeDNMb2ZlK0dOWkNvcDV1RlBEY1JLQStW?=
 =?utf-8?B?OEpCOG50cFdrazI1bHNxQVprWWZoNUMzKzZXSzUyL3dqd3pLdjFOVGlQTVNz?=
 =?utf-8?B?U2MyaDhxSFkwMk1iZWNhVkorYnc5Uis1VUZpTk81YXVaWGVlai93WmRMWXpJ?=
 =?utf-8?B?NDEvZmlNUk03WXBKQkdweEZVMzVZQmMwUFhGM2FuTE1wRkx1cTA1Q1JiM3Er?=
 =?utf-8?B?dGx2cHhFelh1d2E2YUIvcUhLaXRoQkhZUEtHZ2NON2F0WndIYXV2SnJ4Y1NQ?=
 =?utf-8?B?aTRNSVhFOXJURmlNcTZUdHk0L2FNdGNuUnFnaTZFeGk4ekVTVzhzeThqMExB?=
 =?utf-8?B?RCsxQlpVODFJMVMyd0pOVTN0T2ZuaklvQ3R0dlpVMUw2ZkFIcjYzZHMwczMw?=
 =?utf-8?B?QkNvUE54WmpuWjNndCtyN3ozeU5kMnNLQkU0M1lnY0hFdGp5alRETGtOM3RP?=
 =?utf-8?B?dnlyQWxMcWlxMyszK2ZrUHg2Qit4bFh2VWw5bTMwczNYdWloQk5Zc0VTakcw?=
 =?utf-8?B?TU0xRnYwdmVnWEJ0V0hMSWpnREdieHRWMW1MK0M2Ulp0Z010M2p6b3hqWmlL?=
 =?utf-8?B?Y0FEakF0SlA4ZHNaRFROdnF1M0lDb2IrSDBZNVFWTVg4QlNsQ2R3WHNEL2JT?=
 =?utf-8?B?NjhQWitlYVBjeTBhbVdaOHozdld6ZTBPY0dHOGs2a2VubVpUeDZSOXNXM0RB?=
 =?utf-8?B?cmU5d2J3eHJwcE5qa2F0S0t0S0RtL0VtRjkxeVpaeVN2ZFNHelpyVVVyRWlo?=
 =?utf-8?B?cVlENlVORzlFSTdxZzlEakFtNmZQdW05bnAyNTk2aGtsRHgwR29yV1YrTS9H?=
 =?utf-8?B?d1NPQUFsY2ZzLzVydUpndmMrNFRrNFdzWGgycGpMRHJtdTVpNkxnZFVqT3V6?=
 =?utf-8?B?KzBPc0dIMjVZdVBsV1g0SzlmZEs1b3VDdGRzWkZ1Z3B5dldoU2lobVVsdkJ6?=
 =?utf-8?B?Q2xuLzNiaVpMWWlMMENMV1J2RzU0VnNOdDhRNjZNMW9jSHdNYmQ5YkJTR3FV?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af46306-02ab-42a8-3ce4-08daef9bd12a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 04:09:33.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYb8LK/rJhlGg3E3iQ/rz8jFdU5d45Fc8Gfkk5cA2rqKqr9go51GQUWLgVWc1QTjPTGRkM90XiWLUj8wgEEQmxYuihfNQ1fkBY/lV0hPoVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
X-Proofpoint-ORIG-GUID: kb_CAdhM9MiHxWCocEQTLxydZYG2Ux1O
X-Proofpoint-GUID: kb_CAdhM9MiHxWCocEQTLxydZYG2Ux1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_14,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=822 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060030
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 04:09:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7793


On 12/28/22 11:56, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
>
> CVE-2022-4337: openvswitch: Out-of-Bounds Read in Organization Specific TLV
> CVE-2022-4338: openvswitch: Integer Underflow in Organization Specific TLV
>
> Reference:
> https://github.com/openvswitch/ovs/pull/405
> https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>

Friendly ping, thanks ;)

Br,

Xiangyu


> ---
>   ...gs-when-parsing-malformed-AutoAttach.patch | 86 +++++++++++++++++++
>   .../openvswitch/openvswitch_git.bb            |  1 +
>   2 files changed, 87 insertions(+)
>   create mode 100644 recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
>
> diff --git a/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> new file mode 100644
> index 0000000..ec40106
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
> @@ -0,0 +1,86 @@
> +From 7490f281f09a8455c48e19b0cf1b99ab758ee4f4 Mon Sep 17 00:00:00 2001
> +From: Qian Chen <cq674350529@163.com>
> +Date: Tue, 20 Dec 2022 09:36:08 -0500
> +Subject: [PATCH] lldp: Fix bugs when parsing malformed AutoAttach.
> +
> +The OVS LLDP implementation includes support for AutoAttach standard, which
> +the 'upstream' lldpd project does not include.  As part of adding this
> +support, the message parsing for these TLVs did not include proper length
> +checks for the LLDP_TLV_AA_ELEMENT_SUBTYPE and the
> +LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE elements.  The result is that a message
> +without a proper boundary will cause an overread of memory, and lead to
> +undefined results, including crashes or other unidentified behavior.
> +
> +The fix is to introduce proper bounds checking for these elements.  Introduce
> +a unit test to ensure that we have some proper rejection in this code
> +base in the future.
> +
> +Fixes: be53a5c447c3 ("auto-attach: Initial support for Auto-Attach standard")
> +
> +Upstream-Status: Backport from upstream [https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4]
> +CVE: CVE-2022-4337 - openvswitch: Out-of-Bounds Read in Organization Specific TLV
> +CVE: CVE-2022-4338 - openvswitch: Integer Underflow in Organization Specific TLV
> +
> +Signed-off-by: Qian Chen <cq674350529@163.com>
> +Co-authored-by: Aaron Conole <aconole@redhat.com>
> +Signed-off-by: Aaron Conole <aconole@redhat.com>
> +Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + lib/lldp/lldp.c       |  2 ++
> + tests/ofproto-dpif.at | 19 +++++++++++++++++++
> + 2 files changed, 21 insertions(+)
> +
> +diff --git a/lib/lldp/lldp.c b/lib/lldp/lldp.c
> +index dfeb2a800..6fdcfef56 100644
> +--- a/lib/lldp/lldp.c
> ++++ b/lib/lldp/lldp.c
> +@@ -583,6 +583,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
> +
> +                 switch(tlv_subtype) {
> +                 case LLDP_TLV_AA_ELEMENT_SUBTYPE:
> ++                    CHECK_TLV_SIZE(50, "ELEMENT");
> +                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
> +
> +                     aa_element_dword = PEEK_UINT32;
> +@@ -629,6 +630,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
> +                     break;
> +
> +                 case LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE:
> ++                    CHECK_TLV_SIZE(36, "ISID_VLAN_ASGNS");
> +                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
> +
> +                     /* Subtract off tlv type and length (2Bytes) + OUI (3B) +
> +diff --git a/tests/ofproto-dpif.at b/tests/ofproto-dpif.at
> +index eb4cd1896..fa6111c1e 100644
> +--- a/tests/ofproto-dpif.at
> ++++ b/tests/ofproto-dpif.at
> +@@ -62,6 +62,25 @@ AT_CHECK([ovs-appctl coverage/read-counter rev_reconfigure], [0], [dnl
> + OVS_VSWITCHD_STOP
> + AT_CLEANUP
> +
> ++AT_SETUP([ofproto-dpif - malformed lldp autoattach tlv])
> ++OVS_VSWITCHD_START()
> ++add_of_ports br0 1
> ++
> ++dnl Enable lldp
> ++AT_CHECK([ovs-vsctl set interface p1 lldp:enable=true])
> ++
> ++dnl Send a malformed lldp packet
> ++packet="0180c200000ef6b426aa5f0088cc020704f6b426aa5f000403057632060200780c"dnl
> ++"5044454144424545464445414442454546444541444245454644454144424545464445414"dnl
> ++"4424545464445414442454546444541444245454644454144424545464445414442454546"dnl
> ++"4445414442454546fe0500040d0c010000"
> ++AT_CHECK([ovs-appctl netdev-dummy/receive p1 "$packet"], [0], [stdout])
> ++
> ++OVS_WAIT_UNTIL([grep -q "ISID_VLAN_ASGNS TLV too short" ovs-vswitchd.log])
> ++
> ++OVS_VSWITCHD_STOP(["/|WARN|ISID_VLAN_ASGNS TLV too short received on/d"])
> ++AT_CLEANUP
> ++
> + AT_SETUP([ofproto-dpif - active-backup bonding (with primary)])
> +
> + dnl Create br0 with members p1, p2 and p7, creating bond0 with p1 and
> +--
> +2.34.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index f5d85f3..4f4efe7 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -27,6 +27,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.
>               file://kernel_module.patch \
>               file://systemd-update-tool-paths.patch \
>               file://systemd-create-runtime-dirs.patch \
> +            file://0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch \
>              "
>   
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7781): https://lists.yoctoproject.org/g/meta-virtualization/message/7781
> Mute This Topic: https://lists.yoctoproject.org/mt/95915106/7175143
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [xiangyu.chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


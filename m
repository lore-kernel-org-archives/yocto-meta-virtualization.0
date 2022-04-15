Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF7BC677C4
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5482.1650014682650694386
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 02:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WKfICq4k;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1104f3b100=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23F8ijdM006548
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 09:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=55nR68Tk7YWysiily49EIB5iQnarIYPOtitIE+315Q0=;
 b=WKfICq4k82FltCWaDS1FIul89/9OpFj0u6b7TbXc85FbtO5LzZMdYPyEWJSiUf7kooc8
 Vb3FQgMHWiDvsIl85KIlq4uTPgNY3hTcgL2xmLDBuaq9UUUvzrRo2wGOLXbUIUdVcjOL
 wMoCWxz0IAb/iJmA/97KmK1xPSBZEyqQTV93nfrGk+DzxV0ac3n8ljTFyeIMMo8f+ubv
 QwOJrbY5NBFnX2tzuy7bNklAPLqodOcpZ4YJP+1DwJ4IT7rnEGR7XF634eOc9tvRmJGt
 uvFaBChoLtNtMwAVmGIlw7s/vvy8LJfFNCW0FKr4WFclo0npSFJp+pRgu4cnrZq3NcrX bw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fb6fwcmgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Apr 2022 09:24:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWG2kEu6NluL58hqRSw8jvXVma3kqSyvjaTm9fiqnBKQ3BUJvTOYhdCQQLiJoODAAiH0ccM3TKn/BxTTZsDExnc14FPELvVHfr57hP94Di72T/HgRcqEGgKqvSpGG5TEqL93k4G9Xud1YN/fH8PEOIE90juOD4/OSMZruvbDqaM53ePNKHI6O6Q1PWyNr20EtJpVx9iknd79BHehPaAlyFvZel+vGGYBlDzoNbbkzloE9VSLhtp9MP1sETGUMBLem37kuGGhKB6yDM9jc1yePDJXhY3AlofTJwn1Nbt6wo3Fu40p6RlgMnztFgUV1rKsosqIRvalw/cNXPlWNS1tCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55nR68Tk7YWysiily49EIB5iQnarIYPOtitIE+315Q0=;
 b=ZkIksbF21eXLkHg7RrmbjPhag8tultFC0e5RzdYMYeH9iOkG8WSFbz+kyzFpgYhX6mznwqyzZeWqY70ZpD6mGCdFNiZZ+lcuoKmA/YxMcNzSZ/A3E+UEB4larURa8xNjItKqUVyZQookvSIdjveyEhWZBe9I7frx0w5wrNcWSARTUaaF5Q8W4ka84Qy9IGi4jH0nsqEovDsz4YiJlNPRAsfqziwyW+Vw8N7lDYGhnYOgU5svhVQWDphNjqsw2tFsJAHa1csxxngmxOXiuyc2U1VBwrDTelZy6mag3YwdMfuMwpFxqPEbi3/pXku3N9NvEQExMzEMAuKw4fZw4n+L/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB3951.namprd11.prod.outlook.com (2603:10b6:208:13b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 09:24:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ac26:a55b:f183:d9a8%4]) with mapi id 15.20.5164.018; Fri, 15 Apr 2022
 09:24:40 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH V2] containerd-opencontainers:
 bump to v1.4.13
Date: Fri, 15 Apr 2022 02:24:30 -0700
Message-Id: <20220415092430.108366-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d1415e-1a5c-4944-95b7-08da1ec1c482
X-MS-TrafficTypeDiagnostic: MN2PR11MB3951:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB39512918E8168DD7ED4D7978EDEE9@MN2PR11MB3951.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s1oNKU8fS4xVKdRMXGKQ+Vv0q5npZEWrUVwlWh9qtHuAlvpfzELACM1izDJejUS4bkws/aPVLi9XlzatwelPEuR9gsVCmdguZwkqEfy+9u9GuianAq75MRKgJpxgcYc+vNlk9WfjDF4qMA5zXiOg0DAsyErjvqxTrWJur7n5Xhkvu3LdUf6nvWT6C5fOYjbzF2vJHdkU/2D3XOWc2xJ/ZmwT9gelc5UdPkW07HeR34OfqyIx76vVa7NKsY+YMFsEiVjzWAD7MphZp0BrbLXGDa1rZ+qvxcVHZEA+wB1o4yDo3gdgD7qMdiQP5NftXbsPosJTN4z6tGA16Qvt7lL5Uyx55/io/t+XUafk/L+cQazCYXBuvM2xWo/BYyVEIahJZDk9+eTYNJkikwGzVES0/nQhnV8aZ4fTenUd98ls8o5Gv59rmhtBsMTLbQoP4ylrnOIy2/dK4i8w0Da3esswmaJ30sAvtuR9DlVlbiJ6jKd/nFaD6O9HP5AwDKNDR243UHUZa4447HEO+YEEDR4LVu0TcMUST9AeiYvu2aR/ViDisJP+jExVZU6DnhhATLfKPIU4GedNYkhdp8YThYED/aGkHPK5QH4wrRDfYhIo8ZbvcJpEx0Wvaxb7BknGRZbdu/gwhM4M9bUz+1Pd8gK2rwe2uPlMgckOugtCIUt97e0SIem41PvW4tsRJP9NPivoK3cXlZAxI+ypS/6LEPGLBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(508600001)(66556008)(6512007)(8936002)(2906002)(66946007)(52116002)(6506007)(316002)(38350700002)(36756003)(2616005)(5660300002)(6916009)(1076003)(186003)(26005)(66476007)(8676002)(86362001)(6486002)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qud2LNOCr6VuuMT0FSMZQWENGHRmT1YZ+imkrfbOzb6ZhyUygR005QAW6ia7?=
 =?us-ascii?Q?qydwpcMFQBbitfLip2g2dhhRBaGm4PGchV6FuGsWsXUxj1B00DyvwKanxTQG?=
 =?us-ascii?Q?rHPNOC+GWohq6WWlhj6uGiHm/Uv2jqWtUgnlYLoIpoEX/NDf7vlnf4V3sd4p?=
 =?us-ascii?Q?99cg6BEWSQdIb8blWL9wKf0ZpTXTVqCD7c/nemRqEwwvO0/Kh4q8GQP2Uy5G?=
 =?us-ascii?Q?bRy8t27v/AB0bD+E4Ghdo0AA8OQvNFOOnkjT0sWFabMqRnvmrdmjZPPT2DxK?=
 =?us-ascii?Q?eDgPbYKbMdS54L4mvGVIXHQfAC59Z2WYiBgo53tE2nVg1hhY5tTyVIGFUfCp?=
 =?us-ascii?Q?/qepqqgUGwMQVH0Nk5frjfITrG5/RIy3pAqeyXE0nIX1Oe0E1dwkDnV4JQeC?=
 =?us-ascii?Q?I7kJkS8JLmNv6/sfGHHQGfcdwkRN4f70nZSjq89IDLHivMUCDQHuo6qDFX/l?=
 =?us-ascii?Q?Dqp7gMGyWTOa3zx6yQcpuPL5j8hbKVkMEFEtjSCwOS2LRHLqDjk3z0EW52hd?=
 =?us-ascii?Q?TqgC7kJA6Pjy4/k62Q4XjGxGbFcTO1LygKNnGqpPIW3Sia+8pStgWu/q1mLL?=
 =?us-ascii?Q?FOvNZCspUCa7l//OE+g0MQbXrtfVmMTvZXnLwWoS3/vTlBV/ou+cuTZ+nuOe?=
 =?us-ascii?Q?GiOosYiQarSVLpJAjVb0h7b/ZQ+ZTlZg77R+5aBoSEl1rXsWgnu+uWbkfSkA?=
 =?us-ascii?Q?k19RkzgAmKnCWWlKLxAdZPqViD/ke+TJ+mXN5CpICKLmFM9AZSX2GCr1xXGv?=
 =?us-ascii?Q?2nE9Hyriij7OTL0Fa+WhwzrGcyvayo+bZoW90Z/n+HuNurnCQZLOf+zJmDHQ?=
 =?us-ascii?Q?Oi3bTurX810KFjG+6LSkrDWAkH4GHBGbQDXvLO1Xon3Cny4N54TzIZyFdmaP?=
 =?us-ascii?Q?g3li1WGoq2EUjS8UfCG0HJp4mJDdE+MQuxxsF6ZIfqw45SuY/yFHXwlrFXcE?=
 =?us-ascii?Q?LwJA1Xz2Ajm4Bbze1zW20BFF0VKHwsLXk62R5eIk9Kbg6EMXIMEWf+2ljOGv?=
 =?us-ascii?Q?6kopVpDrcvWjMW9cnVGVAGHDhUN96i6934KKPAYvjFhHPxNNhszEiuh2tJmQ?=
 =?us-ascii?Q?gg4EV+51BnksJKLgDE7Ng7e4K1X6QFU2z3cl2Fej58HAC/cm1KKXRbvgiPGV?=
 =?us-ascii?Q?CUlt/o2tj5EMw7puNE6/g7EUcRvJmr16/rzJdYxxbZ9fTOa3F7ewhV2TriKt?=
 =?us-ascii?Q?4KqQ5np3vKLqfSFaSnocdO0+XzPtVa/0lkcLoXkxfcCZDE1499vrHBqZCySt?=
 =?us-ascii?Q?/yKYUCdaYa+pWmvT6x3+mwXR1j8m50lADu0tIO88kv5Peua6z+L9NHMQO9a/?=
 =?us-ascii?Q?tA5e+coH4bYgm7qUL8WwnzNzmjOoONZr+Q5Xjl4jpYPKHSpl+f9EyREaBrdP?=
 =?us-ascii?Q?AI9TY3MXYaIr8G9hr3wUNhZadWv87qKaTYxHWsDNULgxmas7C2ntqF1mLJrz?=
 =?us-ascii?Q?wxP+sJ58q0iYWvxNTxnNi/Oa2n39PEW4YMegeYoClyLmjQ2Nek/GsiSiTk/d?=
 =?us-ascii?Q?2p78iTvpbhZ296AoGPEJaP03q241lbzGO414CYGSn3h2uUk8OZP8nBSTI5YQ?=
 =?us-ascii?Q?SxvVNILze1d2uRt7kcazArh9oRmk8tujlsinh+HXSR5EnrlWtBhh1CvkblIM?=
 =?us-ascii?Q?mSVJ7W3A7lzILerwqi0zIOBNJ4BSMXOocC3Lg4D6bl9fU7wDMYjrOnTToooa?=
 =?us-ascii?Q?V9k9bj+D88W38DS9kq5yLixAtYvlaL5vaTgJ2h8rQulnu6/YuTfDdq+78DAO?=
 =?us-ascii?Q?gDIk6UZ3XTbkp0a41vnVAPgEkeXlcH4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 64d1415e-1a5c-4944-95b7-08da1ec1c482
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 09:24:40.2634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BbaPba+mKKENNgpXoXFLrIWcy1vDZB3ybnTsOLxMcJk4+DVjtqxgGkNNBumDjISJviLMzRyW2u1JIDr6Mtjysg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3951
X-Proofpoint-ORIG-GUID: kov6WE6r6OhVEF0dULUPROf9YwlyQEwd
X-Proofpoint-GUID: kov6WE6r6OhVEF0dULUPROf9YwlyQEwd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_03,2022-04-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=850
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204150054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 18 Apr 2022 14:26:03 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7180

Bump from v1.4.12 to v.1.4.13, which solves CVE-2022-23648.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 7f6c75d9..40b03163 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
+SRCREV = "9cc61520f4cd876b86e77edfeb88fbcd536d1f9d"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
            file://0001-Add-build-option-GODEBUG-1.patch \
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.4.12"
+CONTAINERD_VERSION = "v1.4.13"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.33.0



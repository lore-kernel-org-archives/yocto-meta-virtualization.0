Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.3679.1637566675769183450
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Nov 2021 23:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=SWv7/lQ2;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6960842fb0=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AM7Xqte006017
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 07:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=ynzHkfLdJQ4wh9ZzvXcW6IjmWYT84jVAwPj0ESBXOmQ=;
 b=SWv7/lQ2SLRcIU0w/5HlQw2jYimMr2mHBGZHRszq7V+Z6rqtdhx0UNQA6Aj/xHFq96O8
 yBDH2YNyDOIk/5ZiI6Gv4wwGhozizCbEn/qHEecS/5Fl8j6k/dlOv3htNMHo5vo6wwJA
 tqguWqgcrO6cSvffRLbgfsPQOUBMsZ235HtcEV/0eKF8ANNr57n2A5jc96F19CBYept9
 fdGZqN0KqrBxlFhVi68ifunEoIM2lDiONdInO6oUDDrOy99SZmfth44g6C5+08FI5xrV
 P11RtKunFf75JRq3vMaQVvQqCdclnVe0w2tb2j+wZKinwNG4sr/SfpGB6Ou0vC+xH+cN +g== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cg530r21q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Nov 2021 07:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoBBdj2tLfo6O9RmJJu3lRowfw67zXFia/PjtHUyNKJXhgf0VM/6oOl3h+ESY2Ie5cBLhH+fvVNczEPzYr8zGLYU6+Lt07sxcLrP7FDt+hbNBPYIVB7CURhkJ24BGMf3zQgy9mXrYqxG+168I1MrKjWAfbat3sCXbiucKyKpKTvBAg9zq+GUdV5iMyt48MC/ZAarH5AQOYrRdw56fDKWigQPPf7sq+q3312pyNScEw4Q4R8Mb4ALSe/ucq9EIrLHKQCc6d94M67EwbJhJQ4/OWwW+u44icRoe2AZcbFX3cPaMvrGLy+NPP80xwgmo83Azcr0gTDoE5S6OrFspGyDsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynzHkfLdJQ4wh9ZzvXcW6IjmWYT84jVAwPj0ESBXOmQ=;
 b=QhAeFSDihGEv4GwdJM7jL5YKWzn6oW8lgpHG1unUS+i9sk0Kapxdljki6CTMpsUtHWqMoxnW1Hetxbn/igfFRQyiCFOF4WazZvyt1aSFCEYwL/+IdHSmKpuFL6n0VSlcrea6zAiBkkiPh6OA7mHYZW+cK2HmVbpx4MpcbZSOvPcWO3QFIms0PsmrFe6DNKQNK9ZHFzjMaOsFuLUu6g0G/EOiISS0IKoOHgzBK8rEqyepTWn/BsfZzZQsXaHfGePj6N3n5acTJS6D6SfFHsaMoNArf5a9GlJT04EUg4OwNZwDq9Y6lM6rF6LWQitu8YbohbIugohcMx7y3qFlXuj2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5604.namprd11.prod.outlook.com (2603:10b6:303:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Mon, 22 Nov
 2021 07:37:53 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::98c4:c603:2360:7b8b%9]) with mapi id 15.20.4669.011; Mon, 22 Nov 2021
 07:37:53 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][hardknott][PATCH] containerd-opencontainers: bump to v1.4.12
Date: Sun, 21 Nov 2021 23:37:35 -0800
Message-Id: <20211122073735.99777-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by BYAPR11CA0078.namprd11.prod.outlook.com (2603:10b6:a03:f4::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend Transport; Mon, 22 Nov 2021 07:37:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b719250-5544-413f-f3cc-08d9ad8afdc6
X-MS-TrafficTypeDiagnostic: CO6PR11MB5604:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56043520D51AEB275ADEF196ED9F9@CO6PR11MB5604.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FkWKNqdksHwd0sKzyWy2JoGwsvPDCeQKuDqQRRK7QeO6Bc8Emx1rAzqayVOZmmhbqddcNJvSIx+U2SPEkuqdmGqO426kOWIPkbeamYkfZUkeK3WfQSNyCMhVjvynE8qO71ykmJjDMrJcjXyb7cz6VOP/VgitCdKfOZYqVSy7HZmElOvbXHiqC0/DLZHGk0Wo6J3tskDEutXD0e24RyrCmu8PY0xDwmrmJAcXkJI9LcOYnWQTd0BoSLYtYkMzt3k9MdNhxgrQEVorgRvFpgwHpEknxzkDLkaLA9lEKqY6xYB0HzZG4xawGmJ3rC5anZX7tF6HSyxODdVD3TMHYQN+Ex6hKSYxGsfM4ihJC6C1X291XNXg7gdWHE0S+jvusAIxeyKNIgzZFOdzZN2DicJPOfOafreAizqvng/YO7W56u1/cWe41dPax3Ohq33gaBptoPiEgjbqxyFfMghgIEq6SfOfDi57rFhRSi67ZKnFC5Sam4Vf03HsBI94VO23Lwm6uQdbrOPzXnkMLv526170w1He90gAEPrxGJeN75BUZ28T/fmp7pOFVdpGbHADuUIX8YHIqDElGZjDKm0OrCAbtGutlRhS0J1wNuBR0sak4bfr8QFYgYaBkTm05NS0UYJO/RmQoeiU5RideVmEj2vED0d1UlcStLpTZTNLzUGWPrFO+zdiQ5dToMWaWebJajUTyUuuAKKz+l/o8KH1EhwqEA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(8676002)(6506007)(26005)(6512007)(86362001)(186003)(36756003)(6486002)(6916009)(8936002)(316002)(508600001)(38100700002)(6666004)(2906002)(66476007)(956004)(83380400001)(2616005)(1076003)(38350700002)(5660300002)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kZ/XSEAgXMd/zHApRCahLCJVmkvqwpKgi8svO3RHLA0XGRLE2hxE2JWJCnFP?=
 =?us-ascii?Q?s4NxZf+Ql+/PSIWTgX1kPEOYrRv+SqDdlN4noUOQ3NM7gwY4Dk22qdHdJtRS?=
 =?us-ascii?Q?Qi88wOnj07slvirzBwArRNXBxuV3E9wyg+HX3QBbUJZC71abiuqdAccewy4l?=
 =?us-ascii?Q?SG96sCm511/t6GSSCEmdQgz63t9MGm7YStGzphoNqQLFKfKniXS2/RQmn32O?=
 =?us-ascii?Q?btnm8laMnggiHnTcNuBEMh8xBKHFS6SAXkwKcRzXy9Bq3S963Vu8Eallwm0J?=
 =?us-ascii?Q?WxLXozZ8ouUgChvLSOmN1L3/QVbNxyMrmgJO2c+ZiICiHHKFSmnlr981Whjg?=
 =?us-ascii?Q?d8OJO5vG/PNVLmvipl2GXDbeJjPTTaiUxIEvpB4tBiyRXBby84vSkdzKspzv?=
 =?us-ascii?Q?anBHgvjVTvuXZzIvwsJbT2gdvdK4PibpenwKvlySfjKok9l7kjmC3f8MHzWO?=
 =?us-ascii?Q?IBHqhEG64ws4WE61t/COCdwYl2GObnIphfg7/tf88yRwP7VVZMNFOhveWdn1?=
 =?us-ascii?Q?VtCZwwGxgEF4iDUacxRy/D7CJFy2SSFUrKKiSmAvelpfOxevQnyBFxvfw9W5?=
 =?us-ascii?Q?fTkq+rWrEdeWQF/8V+FJTYH+Oym/dk5o2VKCrrSmNdg7f5vx8YGoqigL6daB?=
 =?us-ascii?Q?3gHBUX693KMqxkrmiPPHO7r/bJLttLelOs9jcg1JPuopMDv4ud0TvBSUSG7o?=
 =?us-ascii?Q?hI3qomlBBQwPwSk0QhT6pMZ/QugP43SXaeaR/m0VZgNfpXm/L1ym70NgqCMk?=
 =?us-ascii?Q?9gtrzgEpvmb2KPtqAj5P6m2ZSC4DbIe4pY7L+cIDB+A3XvCxibShIi9Rl2Jw?=
 =?us-ascii?Q?W8x3vTxn2ixUFRO636FsujA4pLXFxY2dgeSDgrtSlGKu4YjdwAXLuUNvP3vR?=
 =?us-ascii?Q?ileoiXhKQypiB7M2+XKFPQszitWxfbVbx3Cp3nqSFA3vKenpgHDQllb3wJN5?=
 =?us-ascii?Q?nvOXF1bKTrq7l12/AO7xBrBM0YJwMrKLaZJYEJNWq0RDmgicIutJR0y1lWpR?=
 =?us-ascii?Q?DtzqEco27SRvzce0UoPxY27ig9njro7kqLzQUNY15AJowmp1MICfVYI6Bprp?=
 =?us-ascii?Q?HXr2xOF/tlf1n3uDUY0M5V1t7/5OIpTz0o8gmW/QqbnJVyhrw0qrlb/r6880?=
 =?us-ascii?Q?ACOGbSmHGr8CVff8G8pby6bux0C51NkTWJ+IwNZcXuxnAslwamlLiBOSYa23?=
 =?us-ascii?Q?PAO4O5rZpk9UorYfp0g3whVKu/PSn385tXoyaU7fZg2ZDyfeZ+at4sYFO5tz?=
 =?us-ascii?Q?hSAXkg7+g3LKTB/6wUbiTFYOA593cpntMdsGUw3EGoayQ9sokbx5OefB3VsW?=
 =?us-ascii?Q?LAruG5bQul4qGJHT+PLVKNz3cNL1yVEYbPW1wHD59EFe/qSJsxuO44hcXxE4?=
 =?us-ascii?Q?VHiBTf7i6Gn9ESojuezW3UUVaEqzS4S0yNlIQc+5sKk3xtBlznhc3U/5XEsn?=
 =?us-ascii?Q?7ax24OLMWnOYTgbmaTcKI2EdcAZTxbr3iO3nC/4KWWXr9vq3N28K83khgn4g?=
 =?us-ascii?Q?Icn2uh4gfGQDWLYHQZpi+fmy0A4+5XDOuPs2Gq/gCBMdysUx8Ek9mlW0omIr?=
 =?us-ascii?Q?nGeOXTZWBqrLJfrrVWQInzUU9+6KDARe3NwLpw2m5Xv9mfHcBsZhU21QkYCS?=
 =?us-ascii?Q?WoLjN6NIhlXhfKVgpXDuJcQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b719250-5544-413f-f3cc-08d9ad8afdc6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 07:37:53.1461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XasKKa/Wfg5Q5BuhHJqWC/hGggXJQ05dVvubxZf4CBaRNesx7DjwYFtqAmA+7C54jtFxnX6EZNEC7jx+Nz1Ivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5604
X-Proofpoint-GUID: MgGdoMpPEDTHDCTyIYjDfuCqNU7Hhb8T
X-Proofpoint-ORIG-GUID: MgGdoMpPEDTHDCTyIYjDfuCqNU7Hhb8T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_03,2021-11-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 mlxlogscore=982 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220036
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Bump from v1.4.4 to v.1.4.12 so that some CVEs are resolved,
e.g. CVE-2021-41103.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../containerd/containerd-opencontainers_git.bb               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
index 774a28c..7f6c75d 100644
--- a/recipes-containers/containerd/containerd-opencontainers_git.bb
+++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "containerd is a daemon to control runC, built for performance and
                support as well as checkpoint and restore for cloning and live migration of containers."
 
 
-SRCREV = "409c87ba59dd96965239573aa9458a3585c05468"
+SRCREV = "7b11cfaabd73bb80907dd23182b9347b4245eb5d"
 SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
            file://0001-build-use-oe-provided-GO-and-flags.patch \
            file://0001-Add-build-option-GODEBUG-1.patch \
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
 
-CONTAINERD_VERSION = "v1.4.4"
+CONTAINERD_VERSION = "v1.4.12"
 
 EXTRA_OEMAKE += "GODEBUG=1"
 
-- 
2.33.0


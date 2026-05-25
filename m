Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DB2CD5BBF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:26:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12475.1779701195535713898
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 02:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R5s1fzH2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6TLLh1823333
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Vhf+sfOG6VSnMrL+sM+i
	McBcM+N7GecHLlFHL13NNP8=; b=R5s1fzH2hdd4V9O6YW7NQqHciwjTpgf4X5gI
	37B07hSxGYrOdEuZBtI5q6YJkdIQsE9wgolmGaYE8KHypBgr4G4Kvf6NEX3sxJu1
	KLUtfDmIBUsHE8RdnXmQt3PY4OORLRxPjZZI44pCOezl3R9+RaBTvAJ/Uc2qZXt+
	sCwc9HGuw4EQF87P8RcAsvUU5pr67c0UpJSAy2++4psr6o8sHLZCo+/QtR+GVUud
	swnHJdxHeKkcfM+tZrPlfGXZoU3N6OJYEfgetbHuw0Izdob+Y0eBtGMnYbsLlcs5
	jDseZj+4foCbqEkUWg1Fo31c+qt7zNX/O9Su+KlGETne7FfvJQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f02n58-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFZBvygT7HjJ1fBGbp06Od5ASoRFyI6ny4iihqrlL2Zr5GntMyIynJiwgA7Qnc6kVkgYqg4RXXrcsd9H7Mm4GtChXUNrpjFkT946CyP0b4aSJ9JoPlCJ0lD/vNcfJTvJGvDz0pk97uR700oDmT0sG64vQjEf1+fpBGu5qs6AlE2QQqZiUOYmf1Srm909Z1VRdFCESQTLbpL/PM14r4Pf5l7qWGh4SlhnzzlTx86zkWR5Mgtb6tSFJ4UiqQ2MCyY0tfv3+LblMIamp2yVSIgJD9C04OeWb24dS9bLg5PcFxSTv0p0JByhvlkRp0CHVUaERjSt6lWjyRdRlEC+tkjJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhf+sfOG6VSnMrL+sM+iMcBcM+N7GecHLlFHL13NNP8=;
 b=gipLivS4kn3TC7KHeDz4L1BJu+NXedeBOCMpz4CILzrVUb4n9w53YMIv7RAkE/Sx+ogDVr2rj4fmV92SXMgVW7ZU9t+vT/EqqSH4Wo9TdYVMVd5M2yPzVwth+TGIg3dO0blbG7L/sLaOXVGBMOviXELhar0GfPDTEVotRlzpWGVF8UHFZNcDo55uPnXtrciWqje/WCz5FuOhbxQ4w9QWzw49VN2SMxLaHOm9arRnCUItdhVTa5edWicVrW5PpnYqNTNQtnbkJNQPYMPYHw+AhQm3FBgXba/CK1uTq9aGSHnczj5UwnUXVBgyWioQhN4HanamImlzXDqtAgO9Zq6ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DS4PR11MB9532.namprd11.prod.outlook.com
 (2603:10b6:8:34b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:26:23 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 09:26:23 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/4] crun: upgrade to 1.27.1
Date: Mon, 25 May 2026 09:26:12 +0000
Message-ID: <20260525092615.742129-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:180::25) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DS4PR11MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: df866ac0-b179-4489-9f23-08deba3fb028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	hBfXZmAuucLZYAQBTEX5Ub31v7M8zwkMBhu+4w9YvQn4KVIfEAhdvTUoqjqo90+Jdmf+BBobgUtX59gIHtfYhp/IfI2/n/aZDQ/OfiHIMcuk7UxazJiVsPuGqXFU+CTKxCK+QlJV5KWwvJbtz3SvqnNiH4683RP/SRKM5J3QN7yo47l32Q/4dh/cuPFvYvi/p1seLWlgZ/pbbR43lvue3KXs9cXMPb8rmHQq1z0CG6vVJdvVpRe6x1PYVbH49If9pLCt0Gb+HApcbCgiWc22P7uxFTxrD/cKvATC64AanLn8oz8X+5zxBXg/OktMan/IhjPKHT2RtQfxn5kBwXOgfnkxawAmp9qquvhVgzdyLvQo2jsRmnqBW6s5JM2WCVkMPgHFJRIBxDDCYyLoQ7BshQxQAbZTE/a8yWu9Y/kLzv+f629mRmVVceytTIlXqZz7+SbpJ2wbiBn3HGzvoOYJzudjpolHEDTEe/YcKQ/pBkB7CMy2gXql+jPxGyf6Ga3xybkCks5tVHE/tmJcl28Cosz7o+J8pbqdcHJhvp3fsJpr1x5ANDBlqiD0GvDNA3fUH+NnvoMRy4or7I6zD6pbaXI5ciREhu3KSX8MLh+WbKabwPfl2rkfSoJOP9UtI9tLvJPlLTBK1cAu66OzGESIHZer0XaCcZVFK/spnGSMC9wNtr2FZYHQu6xOdlDNIYnkmVVG6bjDHJTASUwLzKnxPqGOqC7Op+0eZQpUfD4UPBLeIQly+dlm4CsWnCJrruKe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QfcexkkIId+Z3fJrztrgbbI9M40isfEo4RmJua9URpAPZjhGDJzKB1FFzvzi?=
 =?us-ascii?Q?oXzBPRv+AP5/VwIFont7O9X3W7v7Dz4hFd/CBfACs8CAdpogIBj5iBac1gJ8?=
 =?us-ascii?Q?YGq1EdeIorXdD+IgW88hyZpn907NMPFIQ6+nx8QMxZ0iuxTaUepiGx7/Hltu?=
 =?us-ascii?Q?cDFvE9gr18uE5alkgO+K0iIq3mXDx+Pey8dIhSCICLNcGTJtW/M9hSxYdYmG?=
 =?us-ascii?Q?u9JWLBMwx01KDrcqzDTSuSdY2WIwPWEoymkMDtP5p44obH+ZJNqHf8A+mDHT?=
 =?us-ascii?Q?wZmBANQx3ap7LTqxZIehFaOsHjvxc8NSLgejHnErbEdH42EOYBnbKMCPTe3N?=
 =?us-ascii?Q?c9907UvFalr1EAco1A93vTHJRquVHIEeEmciWnv34XCv2zBgfksY7fw4EzvM?=
 =?us-ascii?Q?9B98dbxq7TnUF0htnCdU/QTV8xI0opK32NBmJpABhHPHL4E4qYJB6GbT08vC?=
 =?us-ascii?Q?UU2hM2Y5A2+MH+/OkbdWNn137tmQJoFbz8LsIBde+9F8MluxrBlkGFcIXuid?=
 =?us-ascii?Q?Bnoymwty5yEJiXPK6kYuZWWWg/1EtdZqTKaiq6zIMVlsYPk3Rc6kjcB52Tlp?=
 =?us-ascii?Q?J7fJNLCPSbox3zTHWhdITjMc5L8RsDrjqNrWuMVWNoM7tcn9Rhomf9oDrPxt?=
 =?us-ascii?Q?GPZ3IrIfSqk7aXUV3dRYu74I2+OtkxwXHZF98tYoDTLSYRAG+5qhum3dCjNK?=
 =?us-ascii?Q?+Lf7HMElPGN0+MhrbkXwLGKgZhwx5Ngo6Jrbj4ROm7XNiQGfOpboSr75St04?=
 =?us-ascii?Q?9yT0zFrGSDCUUg0Hb/n3gxaxS5Z8AyF2NXmFA7TTy0ZaJbhBPgWRPRmXGRIM?=
 =?us-ascii?Q?AgPjIUXQB+sTHCnldI9T6iNlw5AxgdxUeuwa2LywHda+XAA0nzXYjBnTiaeU?=
 =?us-ascii?Q?4SFrE2VUVSLrnmZawBOCaBkg9TF3GI3/Gqsrhg0K5W1Vv2FjptdWxwHnc+KJ?=
 =?us-ascii?Q?GtdH3ZRApMr8ZUGvR+PaPlWAQbde1B5X44BbINJ5qWtLcJvk5gh/BdIPgWqd?=
 =?us-ascii?Q?XpgzvHj0OFhY6wy6RLjdRc0bSjUpwG0XHfnprpTpD5KkFWNKYzdwUcTS39HV?=
 =?us-ascii?Q?nLEnepwSJmOHBoqv2+cDBxImUGxvlinU4GN+jTcBJ44QrXH5mlFKetpInh5Q?=
 =?us-ascii?Q?nqHDhomfL+YCJEjboe6pVS3jzwDTaq66Tp4xoYqXVkPoUEHNfyoGpD/vLqcP?=
 =?us-ascii?Q?eJqHaR0oO57mow9w/4m7WTCEDa+Mu6mpF54Smn7qqalAnF5F8dWvu3ZknqxU?=
 =?us-ascii?Q?qedYXC8amZOJaMSqrbgOD/U6OOxpvQXh+EobKwr5msptytCwg8gTpqIt8Qiq?=
 =?us-ascii?Q?+jEYdibDxV3/nNJjoQh83Rh87pShVG2YDg6amRbe0/YWpawUyK2ne7XU6vYH?=
 =?us-ascii?Q?/n9mbdwWa5SM43eXHl9PO2k/NjbsKQY8CDKyGy9QrBeV4vhwSfpjAWnyWdxF?=
 =?us-ascii?Q?5yt4mcA5frnuSD3Df3xMQMV5RVQBz/whZvRjjLgYM5EGQVL2JlWGpRqJqh1U?=
 =?us-ascii?Q?6YDbNcGFyvHzjIXAflfEU6Nlz1gqttmJGRwXd8RTHHygD2YURHDctCY04nbK?=
 =?us-ascii?Q?nAQHeMvYHppNVc1eqVx2WSo+YEzEWOcykF1c0OgBhN4mRgTc4shIgIfmL7Fz?=
 =?us-ascii?Q?6stpBQkvQ9Df2iVSvcKxgGtaQo4d4fm98HZO19oBnGfpDHyc82QBlzUGstPV?=
 =?us-ascii?Q?kdqKckOktE7y5RRgoRz2xmOYrZHwkv4y5smQSz/+Bsvi6bTreqxl6z0qAtUJ?=
 =?us-ascii?Q?3JBM49oDf9TdD6BQ3uma6Z5Ynl+a64Q=3D?=
X-Exchange-RoutingPolicyChecked: 
	ii7mpxJcrslqomfSE5kfBo+5nR2g5OcO8iJ6z/n9GO0GL180MSYR7avZ7OJlIIvOlneJAu/f0SzTvex8yAyOspcTMaCZYYLwb3FMxNECSHSj3rnoPBlJ0LABLEU2vrgmMyicZ4gugPHD0Kz13V58sAmFcr/R3fUhCS82HdyduU9EuuyzcvTwJyJIziGfGB3iwVZFuIa7M9BRpYdvnsZ7OXiRzEF7vTboNfZPr+mot+KOS7gsQ5qeOQDLkWj/TUwilbUwEyd4hxwBBrnjUE74Y2SiZ7Pph2eStESEpYS1MSLGU3VU1kDyNLyKl0Nbks95VC7mAoaqMVqsZBXiT+HriQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df866ac0-b179-4489-9f23-08deba3fb028
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:26:23.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIfDFZrstoxXVoOUGRZBwoYNJa9UdGYPSPtTy7u7rWibm4sttt2/SxOup5UJbPauq6/iroIfjs8zTkh7KW0vcZtJcrRuurTHkQLxSeNxv5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-Proofpoint-ORIG-GUID: KSEyMMatxDcDONhXzblIuGRq53Ietz38
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfXyC/Ckz1bFpJe
 P6T7XuETVcYx/23uSsHxyufuTO7Zu6qMa64U174yweU7Byge0RYkev7Vc9cEvEuK6tNGmbbRek9
 9IA7ovPZ2rFOAL/tRawUi41Oiw2EGbvIBV2AZKMzg4yG9Qp4EQJOjc/zgGaGrkqWP/tmiPWMVf+
 r1liI2MO0/QE84V/VlBTnZSrFEUgBSAx048I0gvXdYzEjuygdmTFV90eMlNYCb14iFfNaD1O0kT
 Khf6lDktZ8W0MeMuNsgpXqskHkpr/D2lJxiX02vMTVznJs2TyXemZ6MsshuOiSwvb8GxPTmpU+X
 9j+g/YGWMrK7cs6Mcz0P416sw65qgv9Yk/clWABOPVJiYrTd127JmiqDDAUy1YvosIKrkJvJxLh
 4XsMgMB0m/v3XMFTgRH7dTPIV3mex3WX46P6KjWBNu0mme4qTflMopc+8HXQHreTkEosjaiP+tM
 aqAtzznd+J9qlYWwUkQ==
X-Proofpoint-GUID: KSEyMMatxDcDONhXzblIuGRq53Ietz38
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a1415c8 cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=hV8-maZK1Mqr7Hl4qWUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250096
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9803

Bumping crun to version v1.27.1, which comprises the following commits:

    3ec076b3 NEWS: tag 1.27.1
    60b2e8f8 tests, podman: pin to 5.8
    3010d29d tests: fix failure in user namespace
    d6ffa244 krun: remove unused variable
    1c5c2f7d linux: pass correct propagation to get_bind_mount
    d97461f0 tests: add regression test for idmapped mount leak
    59cfa8b8 Revert "linux: skip redundant MS_PRIVATE propagation mounts"
    f1b70c0b tests: add subcgroup cleanup test
    6177dd86 cgroup: fix recursive cgroup cleanup consuming caller's fd
    6c58b0c6 fix -Wdiscarded-qualifiers warnings
    acb904c6 krun: Build passt argv based on nitro variant
    8199cbb2 krun: implement support for passt networking
    7c2500df krun: ignore RAM configurations below 128MB
    23f7d9f0 krun: consolidate configuration in configure_vm
    04c19ac6 krun: process the vm configuration earlier
    81c21e0d handlers: add new hook to close fds
    d8813f3d .codespellrc: ignore passt
    94d7f641 utils: fix apparmor profile not applied in user namespaces
    805e6a44 libcrun: skip cgroup filesystem type check when cgroups are disabled
    4c530d43 libcrun: fall back to bind mount for /dev/console on read-only file systems
    a718a92c NEWS: tag 1.27
    6220914d nix: generate git-version.h in buildPhase
    9553f8b8 exec: strengthen -u value validation
    1bd7f424 exec: fix CVE-2026-30892
    5699da29 nix: fix zlib cross-compilation for s390x
    237f8100 nix: remove global overlay to eliminate rebuild cascade
    b37594dc release: use path: flake ref to avoid libgit2 safe.directory
    aaa6056c release: seed /nix from container image when empty
    c4e3fd22 linux: set MS_PRIVATE on detached mounts from get_bind_mount()
    360621a3 Revert "container: skip sigaction reset in unblock_signals for the run path"
    5d1b0284 nix: migrate to flakes
    246a3367 nix: generate git-version.h in buildPhase
    3e9986bc nix: bump nixos/nix image from 2.24.9 to 2.34.2
    094c97f3 nix: update
    195f664f seccomp_notify: tighten crun_make_error input
    1d76be72 seccomp: tighten crun_make_error input
    62d3e852 container: tighten crun_make_error input
    254a8a75 linux: use open_tree+mount_setattr for device mounts
    2d6f4c0e linux: use open_tree+move_mount for masked paths
    45e62ce5 linux: use open_tree+mount_setattr for readonly paths
    f53aa376 linux: use mount_setattr for readonly remounts in finalize_mounts
    2dae2238 linux: skip redundant MS_PRIVATE propagation mounts
    38e17199 container: skip sigaction reset in unblock_signals for the run path
    4b66d8f0 cgroup: skip enable_controllers when joined via CLONE_INTO_CGROUP
    a59b186b linux: validate run.oci.mount_context_type annotation value
    16bd4e48 utils: do not use errno after success

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/crun/crun_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/crun/crun_git.bb b/recipes-containers/crun/crun_git.bb
index d2f7b63b..f4e489d5 100644
--- a/recipes-containers/crun/crun_git.bb
+++ b/recipes-containers/crun/crun_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PRIORITY = "optional"
 
-SRCREV_crun = "393509db566bedea037d1599c5a58b896f5d3b01"
+SRCREV_crun = "3ec076b3b6714ec2f1a10533cf18d5605a6de637"
 SRCREV_libocispec = "8b07b619df73a113f7721f1c7ce24f2572b04cea"
 SRCREV_ispec = "a4c6ade7bb82b316d45391f572727a63e268b252"
 SRCREV_rspec = "6f7b71c2d216403715f7364ac88dec88d9da989c"
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/containers/crun.git;branch=main;name=crun;protocol=h
            file://0002-libocispec-fix-array-items-parsing.patch;patchdir=libocispec \
           "
 
-PV = "1.26.0+git"
+PV = "1.27.1+git"
 
 inherit autotools-brokensep pkgconfig features_check
 
-- 
2.53.0



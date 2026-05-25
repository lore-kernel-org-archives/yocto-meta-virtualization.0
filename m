Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D70CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:03:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15358.1779714211638780939
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HFUFNfpT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PBFrJ02120953
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Vhf+sfOG6VSnMrL+sM+i
	McBcM+N7GecHLlFHL13NNP8=; b=HFUFNfpT6A/K4iZCN5K0rR49LVZwBYuzGP53
	H9+Mr1dj+qNa8Vc6pyM8Zg9IOPi7oe0fU06Eod17SkIO91CbyKuoNw9hwXBwGAMh
	yW+TDmjsP7xR35zMJAR7747lmYmXolApiSOJgzdbq+42YceVgZaVe2rKtcUISS5I
	qAwADZ8F6Bf6ksk8PO9T4AXuAVJSEan/x/dnzrDxbZV265fuaIfmFs0SlcCghzL2
	q8U8wAb/Smmdrwmvv7xDUr3Ts1tdudL44jQsisN0Ye38zuF7yNetuXyMafgPpjeP
	OgtbtM2YiPZfV7KuIj2Y18Cqa8aOx2pl5jNxZ3FYKea5SS1vsw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010047.outbound.protection.outlook.com [40.93.198.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376apfk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjsnGQ67gHgihE/Ju1XlYKq59aMQ+E+YbhC7E8fterOwkByAZuOThROM/S1iTsV37v0bpVGy9hurGbpm7vh1F/dso1c2oQrC6SQTkDVDf0fPPBeCfE5rU7JzgNi71i0fSNTPSPvbza1ikZHnAwAVRSy78GCxxBIMKiok64QFMOVXlaM4jTXycV5fuSCwpDGtX86WtZtzOYseKg0+J2fn3/+lbbaRNM05dD9SADjAFG/Xdab/is+8+DoTVRv4u7xXeMdAnZ5cxv1NmB9D5l1VzcI8tA0mlR0YD++xtBVW0zVkusuIVLTgNrme6/dB8hMO3kOJUs/l1IVoHm0+TxGq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vhf+sfOG6VSnMrL+sM+iMcBcM+N7GecHLlFHL13NNP8=;
 b=oZjgseIFcyoX0pEY9UXT0Un1NOG3RLSlkKlYlBHwGJ2rMEpLcr5qxdvPoIj+AkMMx851o6IHmedIFDaqkFeowQn7f0tUfzXamkv2janmLQcBQ/l54lpJBZnJmvfyF19LJieyfqLclxBj1wPWT83AFFnHH4TrGqpoi92lQxWvjNK6pSoW9KheH26KTE3OgPoTmdDjwSQSvZkzP5/hPqU8khBynadAsd9LznQ58iD74WMyMqKRJiTtWbSq76ij+9z6WKcgucUbxZ0vRLCOzyMzUJuMTXb3LpP+hA8M6Dz0UI3gvkmqRrWB7C6bqEucSXDhX86JDpmA/xiS68hVUGmYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DM4PR11MB6285.namprd11.prod.outlook.com
 (2603:10b6:8:a8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 13:03:28 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:03:28 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] crun: upgrade to 1.27.1
Date: Mon, 25 May 2026 13:03:21 +0000
Message-ID: <20260525130321.3963861-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DM4PR11MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc13243-232a-4098-a5f9-08deba5e0362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	FUoZxLC+BpJfQaB0DBzkuTu5/gUvY6Y9xcAehBK3zyZkXnhQdcCRqnK0biYY7lZddXOSorI8CdJVVkwJ7gnlyENNXGqbNCPdcRiwikjTrkpk3DjH5+YRMrhEYc4wMfgXOw9TVNHF4dRcIMdzR9xwY7/CnbBCsViMURoApUIC3udu4SR0UquvQnyyvPYfa35unJA5lMVo6u012GPFNjsxBJht92hHveBE+5BLVj1kKVaumIDEf26ZfOEdyxRxQuY3rETBjYwoXgYUM+m7D7Y7BGqXAniQria7oUpurB03NaUED++14RoBcUWIxE1sttYzr6KF7JOwR8heeGxUZj4Qk3jc+umzVcBhvW69bAjJAVKQ1EqOXt0KTDdtv8ipVKn1RTNksiFrHvkqb/WB44YmTLfeXSepVBufQlgs1JriQzIvxsRBpTMIZjgzlXCq3elWaQ+hfp57VNZJdHwfk8QN/eycwlfk8uH1/+pAvG4QcnthLzx0u1oVfx/RPgEBrrjtQPF0dtRqejox+IX04yKr+9oPLLZ3WLPf7vYqyqiErDkDiFpc00c7LnR4rwX0aFSA9A0zelSDcGPgZ0ZahGlDpn5eoKDdlku+14H6xdtnl/01PuoXLpdCL5vldZ5C3Epu3TeGfVSTnLZDTTxtIfrvDVnVKeXQTujiioaJKO8jN0cmZSyODRjaL+OrFk99WyRr37K3hFlcEspkPruPiN0tuOrvrSTqPY6oV86f3Jb38IdeZBB93PHf+kSZKKheoCTy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ndsR1Mz1j2IQlbIK7BvLVvY/VCDQPbusjLn22+01LJBy12llBLL5Bmjgop/M?=
 =?us-ascii?Q?YN9QS/2zoFSk47A97Dkv3+TXJ1Fr9qkugyB4x6fN9NpydZup7JPbpB2+QFA6?=
 =?us-ascii?Q?EQd4+syC0nozre+keSTKYN9iUUwt1C0AWEUAhC0Gzemf3y7AHtISA6HcS4UK?=
 =?us-ascii?Q?KNSciifLi8Nf/Gmox1GgU2hhu0kft+SKFAzZU0iP8ld9UTrEXlIZfqnSAVAg?=
 =?us-ascii?Q?gWHRdWdiAmM7dDUie3/4K5tezBh63bHeCYaG3KwCm3Uzd8rH4A8fTcmA5dKA?=
 =?us-ascii?Q?pzmO4E7AJ2IiNscZvYF3j1MG1cqe/kKP0QB2ljnXZZXLzR3J4k+uNLjefF1R?=
 =?us-ascii?Q?IkhxDjuKEx6IXE1BMp653ZYQ7Mr+dISw9npMXa8GLi2AC37k8k8FSc8GNCvh?=
 =?us-ascii?Q?3D8WtVs3xmtycfNllDXASSQc5lfzHjEHkFHK43A1LnBPbOvD34PX9iqFI1ni?=
 =?us-ascii?Q?AGlSBCiVARVRmX9qjuUW2V/tH0dOGpEcrf6MCR1Wno763IKGVretGFaimtWA?=
 =?us-ascii?Q?r5AcWVWXrRHU7RgYELh5EwZcCQpHE6lu/XIo10hEfmjex59ItvUqCTsWvNis?=
 =?us-ascii?Q?R5PbSU8w5haPe+p0sHTlQTekanFfhXRddTlgQgslqADmtaBh44np5e7GEnIy?=
 =?us-ascii?Q?TWIAYkpPA+cFlLsigF4SAnzW3mZ8O/1Ia4kkkCySiAUnHvmslRfQCwS1AL+d?=
 =?us-ascii?Q?ZcSAbThnuh/5AEf+nvmtjyxkvte+FMmymfAw4vdoDA+BTs7m2Z1ysMZKyW2H?=
 =?us-ascii?Q?wYG6zFTJc+IbrgSEh5cCI+Kz7eHXLJx396uNNp6MJQDsYq1H77oG2upChQrn?=
 =?us-ascii?Q?4i1fTecok26vfapOY9kWpY3uiI8P5LQhPUo0wy8Mqo9oN1gUbx4kqqG498ag?=
 =?us-ascii?Q?L5GqDc4Eg7soHJijMH4m4wrLocCA5Co+9LQf+EfOXmI19mnfAi4RVoY5JRuP?=
 =?us-ascii?Q?jgolOpaHySPP2pfe4oY7PrPOHQOLmmMnuSilBfNoiZvnjaB+7hK9XMyIqZFG?=
 =?us-ascii?Q?bkDWQIaUNNjjvGx1xqHJ5QRdFk/Aia0F4tOGrtHi7y0jdQZ2W8b3Zm+3n1GU?=
 =?us-ascii?Q?NV8TzFR6lTYMp0UGnN0QIneYB0IEXcKcVspD7GnTieDhVL4X/UBk4XbcxmD1?=
 =?us-ascii?Q?rPaOKzfGvj4Y1Of1MxHwyl94vPIFaLLAj9GtMMvIQFqyC1SHuB8ut9M/wYWz?=
 =?us-ascii?Q?7TkX0Yj++1Orddw6VBnJLPGL3FQvHEIku70opIEeeeGrluUefDmbq+qUDLbY?=
 =?us-ascii?Q?6xtzntdvvFW97hUmsVGzbNeA+ZqN5/kn4WvKXGQ8+GxYXF7RbO/hbg9pssuV?=
 =?us-ascii?Q?B7Tf5hwfiL60cOBhda6rrsW+iDC8JiBxbUEBQfNbUWFHGOrWU/85ACW/w0TH?=
 =?us-ascii?Q?ySC0Ix3qWxoR9fAJ5IiLU5yrf/oUGEv69r8keOWNvpnE1giYHx8xTDpjJ+pE?=
 =?us-ascii?Q?97DjzrlKs7L7gNC4lrOoxCfgf2o4JphBY159t6P0mKndCiC0Xt7Y44qHtiMj?=
 =?us-ascii?Q?mt0aj44GuoHu+G2alBo/OEbuE29VcwCWqlSJ1PeJnlo68mllcd1yQzei5Wkk?=
 =?us-ascii?Q?MK/n6V28w9DupA4wImB6u6QHVjYzrI5ftcbq75JROc8VjLyoSAzbHGe/ykoh?=
 =?us-ascii?Q?XYq0Y7OUA/22h8Ao6GC6JZ4BTEmvZnnPG2hyoJuvonJWj5Lg9wW1v696bAVF?=
 =?us-ascii?Q?BYO0UQBU93OhDwGZfPPciMi1Bva5/eJbLpJHkFbvcPcVvAx5xIrA12oCitIH?=
 =?us-ascii?Q?nddHD+kULB3aULOrV75zZdzVIh8IWrg=3D?=
X-Exchange-RoutingPolicyChecked: 
	XHPggdVTgiTtgE+Bqs6eLI3uIbfKCyrFcLWsGzUMjUnEIUqMpIETmTo+xJNEy+4ctjegpDIO97HsrUGF20/mshXhVcfk+OurP8qNlgUPeWd0lz/F9f9slgGIYHXhINC90IFsZI9Qmj+87OHmVEaUA0dX4NW5URdRn+osE67tD38GJ+0KnHncLr17xrKYDkMM79MihQ5FXyKl8CiIYGIznILlMt4liW7QgAXju9tPTryZz/u6LzJ1GRRHZa9tRg/eFEhVEO7KotXY5R/HqSyld42ed10oCY5OaK6HWHZCGrtn2BKXog1DOSpiSQRT+8l9hmr9x0ye7cm3EkfgHaqE3A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc13243-232a-4098-a5f9-08deba5e0362
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:03:28.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmtIB0+vRTxRBVd4p6GFpHYZIIi9rQBE6BWtJqlx+HTBB3oiRAv2cds6JEeiZ9SyOmmcXSP8ipsdZROkNWGdENkc1kfnJqgNEjA1SIMuf/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6285
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMyBTYWx0ZWRfX6V58OJmQ+RHU
 zxeOujKM6zPvyeTB+SFLIpAsB/o7mu86AFAK77Rv7gXCvLOuqoonpHPH5oZW+Ge6/ijlUoJD6Ju
 0HMiN6hJ1YKbH/pUWy4WWr/N67ePZBcgdpFMetBs70xmi7adPH7qD5e5PK7Sf02vRI4l7UHpE5u
 oFL6pDwLtzRMpyOM52WVzaYsWcw8RBxB1ys0eDZcRNTDCR2/kUMQe9PJSu0+V+OCRLCmIdvTE1V
 rMCKcf2f7BS+9w5SmMlC916obQDpawn2XENkUKpomm9JqTQ5rOrR9QkDlBczSvdDDrwqNhuvNBT
 FA1FmxYACR21ngXTgv1ICHbyubu1tGHf2J/laRFxiVgHchQp5Io9RdDjWf/9Ar6k+iX+FQyATok
 RdrSU/VwbxBzsV9jtAcRlGap5wlort3wl9KijVZ4ZsCCAxZndRx9Te/GecolYjccAPWaocy0fRp
 rV1qMiaDnzP/R90U+zA==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a1448a2 cx=c_pps
 a=NlF6qXdsITzFGNsd7EO88Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=hV8-maZK1Mqr7Hl4qWUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wyVB3KwLkqwjO6D4pKuN2F62rKiYV7p_
X-Proofpoint-ORIG-GUID: wyVB3KwLkqwjO6D4pKuN2F62rKiYV7p_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250133
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9809

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



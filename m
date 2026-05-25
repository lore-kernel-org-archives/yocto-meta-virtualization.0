Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4684BCD5BC9
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:26:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12476.1779701195832680305
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 02:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VLGW5hsM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6TLLi1823333
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TjJ8apWKHMzy9zR3DswV0iPYZ0vqCCMnaNEu67bWHV0=; b=VLGW5hsMdVOU
	x8dsMP+V/By2yXWXYTvL31d9nsucWK3AFvUCaUPdPhxXjEvbbrydw0J/91IXMQaw
	oGqV1nC70s75WgjJzgd62jpVqv44z26ARJOjq8RMwaUZbyAVRciJdedwQBNc1iEB
	3wWltax33R0EKg4ARaDQfUfgutmkZ1O+yn+fpmvLxOXmnpsaw5JN+LtTkiYSdfQa
	mbiZBloCbjRahBe6vMuRWa4qT5D36n8fmmY8d+XlKIeq9Xpj0RyE9hnK1EfBsEd+
	+o5GF06SQriLTBuYlDiCtuR0Jp/nHrQNR99VgHDbaMgfj77k74TlfjxaPnhDCzy/
	Ct7hgKaV7g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f02n58-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C45zU7elyFqt7/T5QNahoJVUi860dtN28fiF6C8KWtrgo8c4s9wU9+RjVA5i/rCJeayidLH91NIlFo7nAKSNnYmScpzwlIMWu9zxl1goAfNjw/sx7kF9NXhEw77YuylvitjcUg7VEDvhiwDeiA69EP1SQjHnyTVHxc4W012Y7MZWuis+ji1++xdoSG1fmSqtpqHMwcnbrC7BfYjFnpUehSW6KywQaGoSs4RAOqQsDBOodXodlb7/PeRjx35BVmQOeRVjQJveNS3BKR8YSWdtBv+gGEMjWGKFKw2auznR/zQw76PKHdFiztKZLSRwvA25dpQyliJHPAmkgPvuDiYveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjJ8apWKHMzy9zR3DswV0iPYZ0vqCCMnaNEu67bWHV0=;
 b=dRrPe1eZxaYuNaXjl9DD4enqf8Vk0MKxT4wmSXqQXjzP1C2pTIt2cYloHS04rdfb3Uuh8uv0fwLWuZ/hjGhOqQlQpSt776XYPTXEesQvxRy/UB2Ixyz++INdbFDKk94sJoQ4wuAsGf5rbqdQTWwVYtHTs6Dfs48jon/KfKKwuXwBtV/EThoJr0/dlSvyEvvnw42JCt53BXBIw4m+5nS0y1sglkj7jSHodjxnzMRGQkuk2+rZ2P1I5tp4cJ3OaISH+975mynovqXmFLxDYD2OGO0qvdSDizBKMs19lLGxvZ7KJ8mriOkQS7n8A7td72HHX/lOE5vzn954RG/uRGILZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DS4PR11MB9532.namprd11.prod.outlook.com
 (2603:10b6:8:34b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:26:24 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 09:26:24 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 2/4] cri-o: upgrade to 1.36.0
Date: Mon, 25 May 2026 09:26:13 +0000
Message-ID: <20260525092615.742129-2-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525092615.742129-1-zhixiong.chi@windriver.com>
References: <20260525092615.742129-1-zhixiong.chi@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:180::25) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|DS4PR11MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a12bb92-3942-4c1e-2ca7-08deba3fb06d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|22082099003|18002099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	nA8hrVbSaPoPwgaM6aKD2NFCah/FW3noMRUEqcIssjNX0M2Pb2soQlOy+2um7W7rsQR4ygCyNhwtCXWCELsuQNmC5ndg54BIXOxmD53g+1cgmJIEJ7FzF4SCxXnLfuQ5TXb6ShtC51hkkHZ2RxMWMV/6lrONugrFkOBN/Daa55GTeb/fNjVS8bPG3pPxnYlgSAYG0gDeKD4Be0KEgAiB5k/Nd4bHwGgkeWrzwKdkCtkTOaurm+JBj0v5p/lnujyJpw/fOy5Fz99xnECNYHJpJwdKBLiZKEvMNYEDDPFwZeXXcfvV+86Fe/cI0fLLuHe+hGWAcSyf7c23VBqjIVOvPUPMMz2eeNSzaHPj2DkksZUglDv1/EDYOirJ6em68H3yWMs72oLCD6GWVPa7W+dcFPYx6FDE33HSksPeAAEOuMeEplEaQk1EKchJvfm57bQKDDfLG2bvzIpAbE78jANXgS/FOVlCxmAiyiBRBim0f2EIV9VRqxmOtccSFXdsmo9anCr0h1av4IDcWtFwI/O7OwiM4Dtyjw1TiSfZtP8QC6drg226XDrYt24AGbuBZ8YeY1b3loKMM7V7P3fem2QSt/zwKjgaXhJ9rHiTxymcxKDB0zzofYcmIv94HTA5m6UGk4AvpJ5R10ptry2JXE/DVTiQnxqxEiFmDSik00R3ml9YrVCKukvoFSpDDPowYR+pxKrlQGPpgILavBjcMHJj7g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(22082099003)(18002099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N24ecsEuMy8s0207D6jhA00oz+K7zCaL6Y3i5UX5aQ8tx1rfM5CGJRjqWAde?=
 =?us-ascii?Q?z7FFW33MhWh4sBqdT6AZ6QmLpp2Tr92/ZptbLXjQdhTTdqLR529pw3dzpWSt?=
 =?us-ascii?Q?vCI0VXEw/C2cFLmEE/CrPI5fK4xkp1jJIp6x4WMqSSlkMUMSnEEF+JFU2Hxy?=
 =?us-ascii?Q?CVuRb2NKueSAYn6Z3EwEKd787i7PhZQNRgxkKqgu0Z15NHlkn5tCRwbc4Eid?=
 =?us-ascii?Q?ZQ9UBjDBChB8PmiR//NRs+wWbuJqrniQxib3gSkwUQvP36orukd2VJN1o8wk?=
 =?us-ascii?Q?tSv+Jlnq8nKKfHH1xVspCuwMILJE+WdX84jorm1QqZZyiPibJ1n1+b8FZdxD?=
 =?us-ascii?Q?+30F5DGWXIRtDGmZYBzvb+X4Qq0urfaLdGfGUfyc/HRjOaXog4TstgDvmQek?=
 =?us-ascii?Q?gaNDBCgMa815XsPhtDvRAm4101xAD00jY0aCMA9Yhov/T9KBatWnBj3/v3nE?=
 =?us-ascii?Q?ohZnKbl0ws3fmSyCbBboL6xTuj31TgKf9LNe3isd1S839APsHtd4t01PX8S0?=
 =?us-ascii?Q?6uxu4owp+sX5lErEXnq9l14gjRHSIgjfB7I4W387YY+THckiSgHxUowDa7KW?=
 =?us-ascii?Q?90wRozX5Ll8NUbErfY1mMPIKaonbW/0gLkLcfaGTQYsnsAaWrKWUVu9trkc3?=
 =?us-ascii?Q?FLznE10hSHcf9UTVM6kjGa6kqXtFN0WIIZGJy9HtWLQymnAF1Kyj3fBSCyIn?=
 =?us-ascii?Q?zTZ/kSP/AgJ/TE0/KBFjZkuKOYkMB+CtCQqgqsDCxKrmJM+D21isuWHJoJPX?=
 =?us-ascii?Q?2Qq1ZnO93D+13G0QfsV1nlxjyugO/OY4DmueVhy0hm/+dE45hFQIxksq1Kte?=
 =?us-ascii?Q?FH8arMf0Rio3MA2fWMmPf8YdeV0FRxwLQTKStDPKynU8UGp5/SHoW1mK7Y8o?=
 =?us-ascii?Q?AuS8l4Mqj5cPIa1j82Q5a5bv7Y4tYc8R3ZXQr02bAWSTg9LBmYuEMHNQ27rg?=
 =?us-ascii?Q?OzOo9gAFw4qGl4a32Bx6HqUyMsQZeZJvv7o42rzH43NQ7+zgsObiUnNIu7c/?=
 =?us-ascii?Q?0Dp6ekT5KkdsOzlu1Aa/Ru0oQO5i5gtoWBCgP1OxcLLKL4mHVHYPnRaJLbHY?=
 =?us-ascii?Q?0oSPAjdmItEnVxtYG6e1ntUlzDgp1XW/ZBbl+bb0TVqVzCEaV6/KngllkKSB?=
 =?us-ascii?Q?l7OMTKV92mtOtqNWZf9eyIOQin5drsrWOamQ3fOUHNcRIl4lVUh+a/U7LhP4?=
 =?us-ascii?Q?dcGFf9XeEzXEWf91JiDyrtlCUdc6Y57g1Kgz8dn/WSUWv72efL9MfV3ZNMB+?=
 =?us-ascii?Q?NHAAY5RydkvW8Qucd3NujjcrWzUzzZVV4JeEE8iVW82IgpfQJF+x2l9mvvBn?=
 =?us-ascii?Q?zDNHmjx4ys0V0d7ZWEvuavq8/1zvsEVqz6DEEAjbmRA+mCwwa14pm6vAX4pz?=
 =?us-ascii?Q?kZZiaEz+QZMzT9uuT1UpJAxqESKon7B+szIR/U7HX15xKcqAxAWEhCmmfLVW?=
 =?us-ascii?Q?ZO7+Q8BEGlHff5AqezBsxeqv+jMXqt/FqbYlkjSrzMV9ecFngPdLzJsIaojx?=
 =?us-ascii?Q?rwy7TbMNQZP1SkRajQlxouVA69Zpk8aF5uEYCEcL6pxlHEPYLiV0ilJJzmog?=
 =?us-ascii?Q?xb+BuhrICaS90kGMvBu6kc6jKqAYgkqjeV8O7JibaOuuYCUWKGFqXxp3SV/y?=
 =?us-ascii?Q?aeamIjosNyfxAAZvZdvcv8kpd0y0T2LAW5OK4kCSVw20aorU0ux4CwUSWpvu?=
 =?us-ascii?Q?5BKv9OwG9+l7vmGgMGAmExzsr1rn6UlQM562jP7JKFUDSGt9+THB9OciWV7L?=
 =?us-ascii?Q?vKR8qRS7EFS5OM40yskS79rnWaYcDWE=3D?=
X-Exchange-RoutingPolicyChecked: 
	IP5+wm/GlC5zH4zSWgS73GJLQEDpJrnVpYqqoffLxVW7Xdnz6r+1a3wpJ6JPbpfWQ8pE6VqBVDGp1YZqxA1kzMmPjE06zscUTT89JA8x+/OyfnUNVPPXDc4SyMEd3gzesmzUFiBoFRY9N1m3jTa6J3aGN2ceT7LqtVRBKRgYtdZrPjEBdzlvuoKFBIoNkman4BP+7cgOzqlfwtHjZSq0k84HeyTJxVBV97UiLqxhw+oQHRda9/ifxh5QMvo3xejbZKk2zqDojQNgh71aRZYp6GHuU7cr0Y0e6nq+Dasu5eSmrXLyItgKhbp4sAflI5dnifMnmX6AiogCAypD6cEhMQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a12bb92-3942-4c1e-2ca7-08deba3fb06d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:26:24.0777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2v/j7TLBTiQZSEAlV8wOM1lo+UD65pSt7xxNInb2NpDCyjukmPS4g1aKzTs6jAXfBT8SISqhytBqfE1GhR7/HozRbIuulm9aQdbzQsdN7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-Proofpoint-ORIG-GUID: L7GBIoAOqSlE4TycxcmQeg0xpytFDtVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX5oEgR9l7mIum
 vuv4TQy5xdMXlUctx0nHGzyLOCsATHNh5GWPaX3QgvXUe6NFMn1xhtK+6USGkUoRJ478NxRVrCA
 z1SCBBvOwjrW8ZscpmYjQ4IWMH2xsbZVwhkw9c6nt0lh65oZHYt0lqr3TBWN7Acy5Q8t/zAVHlF
 PanlUJi7zLPnhPV18125jGwerJQwgBeBdeIl4+xP8DFozmLzJx6TRrwNG5YVPmc1TxE7HNB/xMT
 YmgyI2xq0IfynVtOSi6i9Do+h+NZeWLjkkyLLDA5R5ksgI8fCDBkj+EIBc9iTwv3D/NXpt41136
 CzgtNzA+TQOZ4wYe2Qf8aSCxp4pQ17qOmc6iY0H0IQ8kjO9EEQ+Kxb1Lt3HEB8qOITWZc+yqXvE
 J67j2gAWn8mAUFmU+ZsFJyW8BZloUwqzk5su8lOy0JopJjdCL7kBKUohIM0dzuZ1GREvLqCd/jk
 tEDb6JyB9z6eX9UPKeA==
X-Proofpoint-GUID: L7GBIoAOqSlE4TycxcmQeg0xpytFDtVh
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a1415ca cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=KoQRYmnAgUsuZA4JF9wA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9804

Bumping crun to version 1.36.0, which comprises the following commits:

    92b75982c Update nixpkgs
    e5a6f664a Delete updateunified binary
    698c22245 Bump k8s.io packages to v1.36
    ff69f0eb7 oci: clone execPIDs map to avoid segfault
    8ff525cf0 cnimgr: continuously poll CNI STATUS to detect runtime health changes
    50bad6de7 metrics: add default_runtime
    d73341fb4 deps: bump go to 1.26.2
    f50fd5bd2 vendor: update github.com/moby/spdystream to v0.5.1
    1b111f660 Add inject_gomaxprocs via runtime handler precreate hook
    88e8f422b oci: wait for exit file before defaulting to exit code 255
    8b9a4a37e Add SLSA provenance attestation to release notes template
    ca4496cc7 Implement Stream* RPCs
    e70f41a32 Embed git commit in static binaries via ldflags
    6c9718d73 Disable zlib s390x vectorized CRC32 for cross-compilation
    498e33a72 Update nixpkgs
    ded8ab8c6 Modernize nix setup to use flakes
    9c75852b3 Make artifact pinned status respect pinned_images configuration
    a21c68572 fix: address review comments for additional artifact stores
    c608ffc3a feat: add support for additional read-only artifact stores
    5ca7b348a Switch to go 1.26
    456e2e70f Add integration test for updating cgroup v2 unified resources
    cd2b28f0d Add unified cgroup resource update support for cgroup v2

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 37a0b84e..f9176073 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -14,7 +14,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
  - Resource isolation as required by the CRI \
  "
 
-SRCREV_cri-o = "8273bca378a36dd225fcaf90b6b732cc4c6d4248"
+SRCREV_cri-o = "d1e7bdc854ed4846a7f15c5e0c17e0140a1d817b"
 SRC_URI = "\
 	git://github.com/cri-o/cri-o.git;branch=release-1.36;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://crio.conf \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.35.0+git"
+PV = "1.36.0+git"
 
 inherit features_check ptest
 REQUIRED_DISTRO_FEATURES ?= "seccomp"
-- 
2.53.0



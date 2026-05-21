Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0575ACD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 03:30:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28818.1779334217392623164
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 May 2026 20:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D58uYOOV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9601e2ef27=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFHPTi2347690
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 May 2026 03:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=v1KXDqjaJNNFKMYdJgX1
	x7UXHYk395UC5mum0lgUaHg=; b=D58uYOOVFNwf2td0aZl1rjAMNdoSDCMbJOt/
	pvBbe2m+yLwxoDWwB+5K1pAR/m8jeTZtHCpyGCFLmB3ONTQynqyLXmVZv0fVLUnJ
	sE3yExwnJhZG62yjhwXy5sbhenCn8zBvyBpsfonEL1pEsrGvLoNphVqGHTHJYzuS
	KKxn/K/Yx/bpj9T6XpeI9OFfnKgK0LHt4SLtcWbW9yVBx2sHa4cO5W+jdbfHhGjn
	1jO04JMVjo+kxKnIkan3rnujGUkfQTiNX1neEme/pAEPB7NCvceTaTRdN1+AliUJ
	MQ+muV1+3qmsKC2LfTlSd6FsY2YgKh85/Zbvf32nH7hODD8Wdg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011046.outbound.protection.outlook.com [52.101.57.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3xgku-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 21 May 2026 03:30:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edIi2hckAAV6pDMCn6OfobK5eDUn5kKctBvV4gYP3OJt0l61qv1Lme1oTQ6rAn8dG+7KKkcI08IQPrYNhk/AHwYfw+PEL+l80kOepLd8+ny3YSWnhUpc2CRG4Asc8i5hNWqzvoRkShPQ1+HfrZBIJe/YtBSjjIYsnaPYA0sOMePgwBwWIpCqS9wsFT1nOA2jJveaLs1Wh77+y57mDk14Gc1MZbDEw0p1BiRZJxEUADBVcjJ5d3zmc3oJxqn7yZsgH3Cqb2F/rHbIT7Q087cS9MaX7ZzWXmtNmjnFmAcloXEmEiBO6uvvgAVMGqHY6unJqTZHPWTSLczvGHS2lCYMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1KXDqjaJNNFKMYdJgX1x7UXHYk395UC5mum0lgUaHg=;
 b=VCCfpN59rWmAIiljQuo1knz58pFg7tH3ea+AbUasVFoCJCv0l+BvB8IP1Rsd2y2GPCFBoy90JsZbHAk5xQwram2pbCUBXQyxPG5u1/C9txIxIDrwx9T+P42bRqZms1HYnntcIDue44gICQ1p1kUqqNMVcQJuWPEbfnj5SPOiq5Ym3ia8S0WqXbr9Yjpl8aBVNUYwVyPzKQUBIaowHW3n7gajZsp4RaMssST2X262SKVJSyAUtCebJ0Bk/MoinohG3jdIuKv9+HGJSbbKf9QLsFSs9XgwNJmSg3pu0kbIJLPHYdlcWeZMEsx3oO0CeqpA7XbMYDl/XgWJEYYHXqlcMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by PH0PR11MB7586.namprd11.prod.outlook.com
 (2603:10b6:510:26e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Thu, 21 May
 2026 03:30:12 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 03:30:12 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] docker: upgrade to v29.4.3
Date: Thu, 21 May 2026 03:30:02 +0000
Message-ID: <20260521033003.279488-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 59909166-7fe2-4fb2-74ea-08deb6e9441e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|3023799007|13003099007|18002099003|56012099003|11063799006|38350700014|7136999003|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: 
	YxGnacjnNSoHQCUnY6R2qy49pvSYhfaZzPpsKiyykB2oawgmDN8KpG+tKzvoLjMivoHPGB4GQwr/Aom9PGzqjbgdoHfzxmkEh2FgwR4ASWN9QuDjnMkMX6ZiR0toE5h2vdtSO17V08zgKyw696Al8u5OKwHhqh/8cADlBinZK4sHrQ/wGj9wMeKLrYGGtEt71Lpyxd3W6u2E+LqFA3mNTqFJfj/kErgB9iBJN44lJMFomuZS+inrYlz7NW7XE3Oaad2Cz9s5oKmi9xz5zkMJbjMcJ66bLqsmFe5JzZnQ7r10lYbQU/vccLrUA2SsdETdQenY85I+66TEqrwsNTGzZiNBB83lexTViNmrSC0dy3h5ZlYG3zwcSEQetEqOVuJxJK/gXOv9yk7MfPWPV+/ZpPhPV4lzT3E+GkC9jlZVDZ9oeA3oA6pwfatXULeh6yuY0og34gjQefTcxaPYcubQ7gpxJC2eyuwe5mCRAqsPytoVPMMWgCFv5jCYbleVsBDNYQyvRoUSLS3OZajiGPGe37m2OYnqOq3aUHhn11++v/6R9szEO9qaDjC6QHy0JOAVLaYu6m4b6xyoxB6mY6QpuVi3hMmQWwt4BYryUe9ppqpul7QUdLgRMfXbmkGpiLzyZhIwlobDPu763EXUWJJHrO23WUfG6r6OM2d/mCVuMwukDtmgscPkpHK9ly2aXYs6BGA2LtHKThAqDF9PlWDMNg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(3023799007)(13003099007)(18002099003)(56012099003)(11063799006)(38350700014)(7136999003)(6133799003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DlFmFZ/RYb0aZnuBIfc2JpcCEb6bNiP2AFE83lc8TlAzOrK+Y8lh9Wc4xuY5?=
 =?us-ascii?Q?oCk6evQQpSoUD4Lc4p0XZ0X7/xeXPXjLoZSCp/amRsX5hyfw3PJBL9iJH302?=
 =?us-ascii?Q?/w0wMOU8Y+bAKy2cJKs+C4FAOE9llQZx5csWK9dZdGan3A2ACUlMvMutPYGP?=
 =?us-ascii?Q?tnzCc6te9S4JexSkQfG5CMwdWZ/amk4en+hVgKv3EdfsNjA4u0avLsWGvpTW?=
 =?us-ascii?Q?tV/W8XEosBZ3kHVwfbZkTxiYVIh8FFloMhnq/3corTk8sYJJd8NqsvsyFnBN?=
 =?us-ascii?Q?6W8NdUCwa4TQnQgdp8EWv+CptW6/JEWIYleaCR/l02yAFQKNaAP6p2RqMDoS?=
 =?us-ascii?Q?dYUX9CGuEG9jRsaZw02eJDbJ6DOoZD1h+GmhyJHrhSBVkJtHbN0rSqvSTXKt?=
 =?us-ascii?Q?e+JEuo98LHJkucYNN6DmQpbNBzoLglkDHcNfFsdZ1WRrMHkrUmoRxLFHXvQX?=
 =?us-ascii?Q?1XHvJYHVU7E9mShgIIa4fMZi8mZ+IsZwMAyWN5d2gugIylBZUMwPEuEViHvU?=
 =?us-ascii?Q?yjW9dx7YmzI1uO0bxrrh5bOuhhsHm/lvr06Ea6k+eNM7plHNdhumw6pxRPTX?=
 =?us-ascii?Q?b5MKvpVZqwIpixEV4RTGnq2VnLiN5dPhC29GetXFQ9GzzsolYibQRZZVXFZG?=
 =?us-ascii?Q?gKmPk5HtJvHrGXYJxGggfXd+A02vuEFhsdQ/lZCGK3GuIsyArfCuGKV6MdDT?=
 =?us-ascii?Q?PnYzRiDWgzHXU+p7Krp+qJxqISwDhmzWqZyA+Q1ic0rsUVcritDUlrZXtSUw?=
 =?us-ascii?Q?KzcGgoh4/OjjdzxkGKE1ao3yxKqc5xWfoRFaP5O43GhZWRaXXx5YcFgKXRhs?=
 =?us-ascii?Q?tiw3r2kcoKo1iZmjGF21l9uXjFIO4mdP+7ENOlzXZijL+A7zmgG6mk4IFZ7p?=
 =?us-ascii?Q?KB98tO6ulCoPSh+C8BRJpjngoeWzKR4L+v6moFnQAHPST4vmxzOANh76q/Uw?=
 =?us-ascii?Q?+7aI8dWsDYKGgInBF3/ydQgrQWu5XtHr0VQqQXUi+pmqTrTidkzUp1DNcnf4?=
 =?us-ascii?Q?MSh9aUAfe9Jer4CEtsSpcGGiszwmOxISY1maVlaPNzb06EjOVEnRr0S4zDEQ?=
 =?us-ascii?Q?6jtnqn0axnT7vw0mcTiQYxzo8NjbFUURh5JyBIlQdiHoHQGLgtJjI3+dDpnW?=
 =?us-ascii?Q?i42di3etg9H1gTpiexUbNSsaVSEZvZIO7yeuZKpRrJatNbSuQLHTGKfhiHlK?=
 =?us-ascii?Q?B3FxCwxzh//DqsdYp6CbehgiOaa7AxC0WfeDQS3ZmGAv+GCuJUuPRuNNffyj?=
 =?us-ascii?Q?blfPml0k+8XQEo7YMqQWempiRqqO9bUejPk74x45EtuJe6xz3qe4Okbqxfmp?=
 =?us-ascii?Q?1EjqihHHijfNveDQloDXEDCBudP7gnXBY2jjFXV/ImpMfc6H1UBTkMdIQ5U+?=
 =?us-ascii?Q?mr8UiG6/H3vDLrxYEj8B82EZPK0YDgYrVKsCTdWSALPxjZ3HRyM6+6stjmS9?=
 =?us-ascii?Q?5gliR+3wQIZ+jhvdKvQmHiIP+Uv27Sa/FAOGHx2UG/8Bhp3cNKzRC3fKs2Ha?=
 =?us-ascii?Q?WXEPE2ZoivTKPUasok+EtASqU18E0zjX1+5AzL2UZ0Nwo5wReLgmQaTT1E2u?=
 =?us-ascii?Q?0RVQc6FkLts1HvBA5cuXCAL9u9VocNxvOY9+jZ+/xxtVhMQXzmj2diCe/Vuh?=
 =?us-ascii?Q?RGUECIBQiUEAWYzRfT87q7qssjGt91BbYYUiZi8zhxsXYyeuJ3qX9hIYV3oz?=
 =?us-ascii?Q?VCHVY6CDbR/If3Sr3U1foQtAVm4QrEU/EZv1JZGauv0VykGL9t9HA2ClETUY?=
 =?us-ascii?Q?dy5783fRBRL3Fcc4Ec4nSWxKxuCBZE8=3D?=
X-Exchange-RoutingPolicyChecked: 
	fvzhQOKIBAeIgwDYJ/dDTFmi6NFVMYcNQuUMUEx1ov6au20jdJFuhzpPeVHye//+FGUFQul5nLbdF/frHNJCw8CPeup2Jti6iOytx1nVUCTDQ7UWNxwV2QxmhqFtQc16lyfoNEiUidlnYUzgxv0cg+DKVAwTDsV2wDKvkxT/2duji+CIgtFSa8WeK5XiUQjMaH92899VlSUzL7uXyAPvlOOtUTJcNmAy0K4E+GfLTQAwKGAjiLDeIC5I3+NFRXOFFmEm2711GoHIc5EAX/Wjln2ZsRn5jVQVyDMaMP4j/A+6OYkQW0deakT0pVgDhDNrWE1AprI5K58+6zp133SW9A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59909166-7fe2-4fb2-74ea-08deb6e9441e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 03:30:12.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YP9VqfbX4DQdMaQpxuj7NAvsVTXcaKKwG0nGQ1nENSVU5oYdIbt62wuchRclq5qXC89h2hzsac39X6smaX43iHmIv6La5oAAHLuGxdPB4I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
X-Proofpoint-GUID: OnK5uklLpcFsxf8nUYbVJMZYRdV4B02T
X-Proofpoint-ORIG-GUID: OnK5uklLpcFsxf8nUYbVJMZYRdV4B02T
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0e7c48 cx=c_pps
 a=foOfPl9YvWvIvXDtd8Rkbw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=yMhMjlubAAAA:8 a=NEAV23lmAAAA:8 a=pM9yUfARAAAA:8 a=1XWaLZrsAAAA:8
 a=t7CeM3EgAAAA:8 a=8K00_f3daQPjKukIRgoA:9 a=YH-7kEGJnRg4CV3apUU-:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAzMCBTYWx0ZWRfX4HoIHGSVjNeD
 3ulvRgioMYhPVRC1gCgvZcdBMvBSsTpm1zYNEDA9nYzCebSFzrLjVQvYx495U41jek75ANw9xLW
 Xr3/ebP7KaIUk6hp/FIFFc+yKS2v15D1rcUJwetvjUhUSZYb4wZG3ppK2kTYUIbKqpUSUMranB8
 Qb+4jnD8UToxuJ/QEOrZpYkll7pAyIsmeBJ9shPYvbN0GZwPIxcvqlm0yEypscBTlyr3v7D1ms3
 cWQ1iSRtMG//rhzO5/uBEKUhIoumhgNeMDLJwBFRzUgkRuZM6cRzp9c9MfmzjxmXypbrhAKOEf8
 gqUClNwl9GL7lLht7sdM2fAW+9E1R1SOreFsjZBlWPKH6zAYyqmJQtANTGJXBBgQSjD0YNIrGqI
 tg5UTKJ18Vn5GhD8t8wmjOph1fUBjY9B4RguSan9tHYSwkVmhFA2jqr3LgrEhE96IFfm3FB8blu
 KtkZd1NLQizZVKpUe/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210030
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 21 May 2026 03:30:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9799

Bumping moby to version docker-v29.4.3, which comprises the following commits:

    96127a375b daemon: Always reload AppArmor profile at daemon startup
    4dcaf2c1c6 vendor: github.com/moby/profiles/seccomp v0.2.3 (Drop socketcall block)
    b8cccd63c1 integration/container: Handle socketcall return EPERM
    4bce638439 vendor: github.com/moby/profiles/apparmor v0.2.1 (deny network alg)
    67d638fca9 integration/container: skip socketcall test without AppArmor or SELinux
    ee5ac4c7ca contrib/selinux: Add CIL policy to deny AF_ALG sockets in containers
    dc7f064875 integration/container: Verify AF_INET socketcall still works
    f89c5935ab integration/container: Drop i386 cross-compile socketcall test
    729750e8f1 gha/validate-milestone: Read versions.yaml from base branch
    56a72c7494 [docker-29.x] update milestone version
    becdb42e26 vendor: github.com/moby/profiles/seccomp v0.2.2
    a1197d997e vendor: github.com/moby/profiles/seccomp v0.2.1
    1818ec7c13 integration/container: Add socketcall AF_ALG denial tests
    c7337e2430 integration/container: Add test for denied socket address families
    a529a27817 integration/container: Fix flaky TestContainerRestartWithCancelledRequest on Windows
    a65bd0440b releases: Bump patch
    34bd1ebdf4 vendor: github.com/moby/moby/client v0.4.1
    b63208b64b vendor: github.com/moby/moby/api v1.54.2
    5be108f817 vendor: github.com/sigstore/timestamp-authority/v2 v2.0.6
    727b81991c vendor: github.com/sigstore/sigstore v1.10.5
    bad8e1b799 vendor: github.com/go-openapi/* deps
    f3cadf69dc vendor: github.com/Azure/azure-sdk-for-go/sdk/azcore v1.21.0
    5c6a343842 vendor: google.golang.org/api v0.272.0
    463f4c0943 No longer a reviewer; update email address
    98c7106fbe vendor: github.com/hashicorp/memberlist v0.5.4, hashicorp/serf v0.10.2
    f69fed1350 fix(deps): update module github.com/aws/smithy-go to v1.25.0
    eb2672a3b9 chore(deps): update actions/github-script action to v9
    75c2f4fb37 fix(deps): update module go.opentelemetry.io/contrib/processors/baggagecopy to v0.16.0
    6fa46cf8c7 fix(deps): update golang.org/x packages
    0aaa2d3e3a README: Add Go modules section documenting the v29 module split
    68d1d1a947 vendor: go.opentelemetry.io/contrib v0.68.0
    8384598603 vendor: go.opentelemetry.io/otel v1.43.0
    836b06d8da vendor: google.golang.org/genproto 9d38bb4040a9
    0aa66fca01 fix(deps): update module google.golang.org/grpc to v1.80.0
    7ab051cf89 daemon/logger/local: marshal: remove redundant resetProto
    23020513e6 chore(deps): update docker/github-builder action to v1.6.0
    6e22bc8095 chore(deps): update docker/bake-action action to v7.1.0
    b1637ed54b vendor: github.com/hashicorp/golang-lru v1.0.2
    d994daf576 daemon/containerd: fix label!= filter ignoring images without label
    c255b67c0f Update github/codeql-action action to v4.35.2
    9136afe4fe Update actions/upload-artifact action to v7.0.1
    dc48cea266 api/docs: cleanup changelog
    9c084cad3e ci: skip using xargs
    c621624e2f libnetwork: Always clean up endpoint driver info in sbLeave
    6e9f9bc0a5 ci: fix workflow permission errors
    10b0401423 Update actions/cache action to v5.0.5
    b7e7d3f065 libnetwork: Remove montanaflynn/stats dependency
    70907e2988 libnetwork: Drop golang-set dependency
    2437d5d646 ci: use bake matrix subaction
    1743957d3f fix zizmor findings
    7136f5e946 Dockerfile: update delve to v1.26.1
    0f5a7ae948 Dockerfile: update Docker CLI to v29.4.0
    270b511972 Dockerfile: update docker compose to v5.1.3
    cdb3fc279d Dockerfile: update buildx to v0.33.0
    c6d4830c14 vendor: github.com/docker/go-connections v0.7.0
    5c80a6e826 api: align Topology in versioned OpenAPI specs with Segments JSON shape
    0c878186d3 ci: zizmor workflow
    97cb71d7ed pkg/registry: use stdlib's x509.SystemCertPool on Windows
    ba1f3e8aa8 Dockerfile: update containerd binary to v2.2.3, runhcs v0.14.1
    a2cdd57812 vendor: github.com/containerd/containerd/v2 v2.2.3
    c4f4eb3f5f api: align Topology swagger with Segments JSON shape
    f8873b7796 daemon/logger: use consts for common log-options
    30b7b3f919 daemon/logger: define consts for common log-options
    9008249e8a daemon/logger/local: add a constructor for config
    33261e9a45 daemon/logger/local: unify constructors
    5d5797002d daemon/logger/local: test cleanups
    69caf3d4c7 daemon/logger/local: improve TestDecode, rename to TestDecodeIncompleteRecord
    f3f3040713 daemon/logger/local: use struct-literal for pmetadata
    a331d4d7a3 gha: Add milestone validation workflow
    10eb86543f Cleanup releases dir
    3b22c500d5 daemon: retry secrets dir remount on transient EBUSY
    0ea9255e50 daemon/logger/splunk: tryPostMessages use http.NewRequestWithContext
    0677030570 daemon/logger: use uniform location for registering drivers
    8e79aacee6 daemon/logger/journald: remove outdated comment
    e0b5ab2f98 daemon/logger/loggerutils: ParseLogTag: add fast path
    3ba0b72b78 daemon/logger/loggerutils: ParseLogTag: fix panic and image ID
    4f2553e81a daemon/logger/loggerutils: ParseLogTag: improve test-coverage
    7bfa790f2b daemon/logger/jsonfilelog: be more explicit on handling optional "tag"
    ec909a2239 daemon/logger/jsonfilelog: JSONFileLogger: remove unused "tag" field
    6a5e00fe5f daemon/logger: Info: touch-up godoc
    1a45789c04 client: imageDiskUsageFromLegacyAPI: explicitly exclude "-1" for containers
    25ffdb23d9 daemon: Daemon.imageDiskUsage: explicitly exclude "-1" for containers
    e0fc07b8cf gha/labeler: Only assign Windows to Windows-only changes
    b3bd13ad10 daemon/pkg/registry: minor cleanups
    377e85700f vendor: github.com/Microsoft/hcsshim v0.14.1
    e30a6fa93b libnetwork: respect gw priority per address family
    3541b0d0fd update to Go 1.26.2
    2601915b10 client/internal: touch-up godoc
    689accfe29 client/internal: fix RSFilterReader returning (0, nil) after filtering
    159b3317f0 client/internal: RSFilterReader: un-export, and remove unused buffer
    ba66582228 client/internal: Stream.JSONMessages: improve error handling
    5f08008342 client/internal: Stream.JSONMessages: move reader inside the func
    d5d18015e1 client/internal: Stream.Wait: return errdefs errors
    82ff7e9f76 client/internal: Stream.Wait: fix missing error-handling
    4d1d9ee358 go.mod: add back replace rules
    00840cd39c ci: buildkit: pin registry to v3.0.0
    a2eaebb011 api/docs: lower deprecation heading to a h4
    f44956451a CI: add back ubuntu-24.04 + rootless
    ca69153e28 api/docs: restore changelog for API v1.0 - v1.13
    1055b7a1a6 api/docs: restore API versions v1.0 - v1.13
    0d2d3f348d api/docs: restore API versions v1.14 - v1.17
    dc824e3d8d api/docs: restore API versions v1.18 - v1.23
    70043cd439 ci: fix bin-image workflow
    f42ff6a603 internal/testutil/daemon.New: cleanup test paths
    7094e8c3ef integration/daemon: TestLiveRestore remove quote from test-name
    3a7e8e285e vendor: github.com/moby/moby/client v0.4.0
    f8946fc137 vendor: github.com/moby/moby/api v1.54.1
    f1b420bf02 Drop replace rules
    c286d4ce13 Dockerfile: go install: use Git SourceOp
    d3a677d730 Dockerfile: use Git SourceOp
    07a5e924ce Fix typos and misspellings in comments, tests, and docs
    6604bd0ddc update AUTHORS and .mailmap
    84743bdda3 client/internal/mod: swap order of "ok" bool
    9dec3bf78f daemon: include moby module version in version response
    de68dce70d daemon/internal/mod: also check main module
    1bed74db50 daemon/internal/mod: reimplement without golang.org/x/mod dependency
    74e74ed5ee builder-next/worker: move mod package to daemon/internal
    80c22f0982 daemon: respect explicit AppArmor profile on privileged containers
    b8057a3a58 api/types/network: fix handling of unmapped ports (ephemeral ports)
    2d35a29f63 vendor: github.com/microsoft/hcsshim v0.14.0
    4975231ecc daemon/volume/local: New: ignore non-volume directories
    538f407103 daemon/volume/local: store path to opts.json
    5eeb08ae1c fix: use t.Cleanup to prevent goroutine leak in TestCancelledUpload
    735d17e1a5 fix: return 400 instead of 500 for invalid request parameters
    9aa5ac3034 client/pkg/jsonmessage: use functional options for display funcs
    06b31dcd12 daemon/pkg/opts: fix ValidateIPAddress docstring
    ad67096edf gha: validate-api-swagger: remove redundant 'make image'
    8769bda667 gha: buildkit: fix go version
    e0999bd5ec update to go1.26.1
    6ddd4ff73d integration/plugin: remove redundant assert
    9295e2cd84 client: fix race in cancelReadCloser
    6bfde409bd client: fix typo: TestWithHTTTPHeaders -> TestWithHTTPHeaders
    72142ab278 daemon: buildSandboxOptions: warn, not panic on invalid extra host
    98840db4d3 daemon: Daemon.restore: trim whitespace in extra-hosts
    dd11127524 daemon/pkg/opts: ValidateIPAddress: use netip.Parse
    333f39ce02 remove uses of jsonmessage.DisplayJSONMessagesStream in tests
    6aedc6ba32 client/pkg/jsonmessage: add DisplayStream and DisplayMessages utils
    5672c51b00 vendor: update buildkit to v0.29.0
    abb2a31c8a daemon: Daemon.SystemVersion: align fields with api type
    65ce470c2a fix(deps): update module github.com/aws/aws-sdk-go-v2/service/cloudwatchlogs to v1.66.0
    281f4b6767 chore(deps): update actions/setup-go action to v6.4.0
    38c77a9189 daemon/libnetwork/ns: make NetlinkSocketsTimeout a const
    5378f5427f daemon/libnetwork/ns: remove ParseHandlerInt, add NsHandle
    af73684bc3 daemon/libnetwork/ns: use sync.OnceValues
    635f4c3dc4 daemon/libnetwork/ns: remove windows stub
    579280d444 daemon/libnetwork/ns: suppress some unhandled errors
    dee7411f05 fix(libnetwork): nil pointer will cause panic
    434ec1655c daemon/volume/service: deprecate OpErr.Cause (Causer interface)
    57d0f88684 golangci-lint: enable godoclint linter
    dee3c452d7 daemon/volume/local: remove duplicate package doc
    28aeae20dc client: WithHTTPHeaders: produce error if duplicate headers are detected
    1ec892c555 client: WithHTTPHeaders: improve doc and add test coverage
    d7d856927b daemon: fix typo in filedescriptors filenames
    d71f3ea5da ci: fix upload sarif action
    1769b3eb5d chore(deps): update github/codeql-action action to v4.35.1
    beba95c819 vendor: update buildkit to v0.29.0-rc1
    5da773a71d chore(deps): update codecov/codecov-action action to v6
    1293d50b38 fix(deps): update module github.com/pelletier/go-toml/v2 to v2.3.0
    12ae6dd67e fix(deps): update module github.com/montanaflynn/stats to v0.9.0
    3fa5ec578b chore(deps): update github/codeql-action action to v4.34.1
    0c7f2b3d38 chore(deps): update codecov/codecov-action action to v5.5.4
    c66815426c chore(deps): update docker/github-builder action to v1.4.0
    615cf6345f chore(deps): update actions/setup-go action to v6.3.0
    fb146a3806 fix(deps): update aws-sdk-go-v2 monorepo
    c36e70524b chore(deps): update actions/labeler action to v6.0.1
    0d0751397d Dockerfile: update runc binary to v1.3.5
    96343dd0b5 chore(deps): update actions/download-artifact action to v8.0.1
    49a4a47df5 chore(deps): update actions/checkout action to v6.0.2
    45ec277dd5 vendor: go.opentelemetry.io/otel/exporters v1.42.0
    bb79587d84 fix(deps): update opentelemetry-go-contrib monorepo
    ce7b3aaa0e chore(deps): update actions/cache action to v5.0.4
    f7e4fff10b docs: fix remaining broken links in contributing docs
    9e26694618 vendor: github.com/moby/policy-helpers b7c0b994300b
    044d59bbd1 Dockerfile: use set -x in here-docs for visibility in build-logs
    695e8b3074 vendor: golang.org/x/tools v0.43.0
    e18b58d6a4 vendor: golang.org/x/oauth2 v0.36.0
    cb3065011c vendor: golang.org/x/mod v0.34.0
    c02c294e81 vendor: golang.org/x/net v0.52.0
    7b9fe27a4d vendor: golang.org/x/time v0.15.0
    07304a4ffc vendor: golang.org/x/text v0.35.0
    37ece0f46e vendor: golang.org/x/sync v0.20.0
    c0e612d623 vendor: golang.org/x/sys v0.42.0
    21d4e2525a fix(deps): update opentelemetry-go monorepo to v1.42.0
    dcbc18d954 fix(deps): update module github.com/aws/smithy-go to v1.24.2
    b24c8272e5 go fix "omitempty"
    f7aea04bb3 go fix (GOOS=linux and windows)
    5cf47c0d15 pkg/plugins/pluginrpc-gen: go fix, and tidy up
    91cd097119 docs: fix broken docker docs links in CONTRIBUTING.md
    701ea1cb6b vendor: update buildkit to v0.28.1
    830ddb26a2 vendor: update buildkit to v0.28.1
    c7fdc58b04 ci: pin all actions
    5ba08b6ff1 chore(deps): update docker/setup-qemu-action action to v4
    db1af4f6f9 chore(deps): update docker/setup-buildx-action action to v4
    b588d1a594 ci: pin all actions
    f4d6f25bf0 plugin: Fix off-by-one in privilege validation
    99a095ecf0 plugin: Fix off-by-one in privilege validation
    f302d06687 pkg/authz: Increase body limit to 4 MiB
    7a40298211 pkg/authz: Reject requests exceeding body size limit
    6f80a57b4f chore(deps): update docker/setup-qemu-action action to v4
    849efd0d3e chore(deps): update docker/setup-buildx-action action to v4
    ec76e94183 pkg/authz: Increase body limit to 4 MiB
    7a767b27fd pkg/authz: Reject requests exceeding body size limit
    b66b2f77e0 ci: renovate: pin actions to digests
    f848306ce3 vendor: github.com/moby/patternmatcher v0.6.1
    e1c0b3d487 Dockerfile: update containerd to v2.2.2
    a9dbf50521 ci: update docker/bake-action v7
    ef08116394 update to go1.25.8
    b9e4f34371 ci: module-replace: ignore Dockerfile for api changes
    1175d707ad vendor: github.com/containerd/ttrpc v1.2.8
    968fb5787c daemon: restore: register containers without rwlayer
    1bd71d5d87 vendor: github.com/moby/patternmatcher v0.6.1
    391789a6e1 vendor: github.com/klauspost/compress v1.18.5
    435fd64319 client: fix TestNewClientWithOpsFromEnv
    673e2e2467 client: WithTraceProvider don't wrap WithTraceOptions
    760f375400 client: WithTLSClientConfig, WithTLSClientConfigFromEnv: touch-up docs
    d85e410aa6 daemon/containerd: register Sigstore media type prefixes to suppress unknown-type warnings
    619ecc9b53 transport: enable HTTP keep-alive for registry connections
    26d0774539 integration: ignore container Status field in DiskUsage test comparisons
    d74953b829 fix(deps): update module cloud.google.com/go/logging to v1.13.2
    5220d603f9 chore(deps): update docker/compose-bin docker tag to v5.1.1
    04c1d25809 daemon/internal/containerfs: Retry on ENOTEMPTY error during directory deletion
    46dba49ec8 Fix reclaimable image disk usage calculation for in-use images
    a17a5647f8 fix(deps): update module google.golang.org/grpc to v1.79.3 [security]
    3cb98cb1b3 ci: update docker/bake-action v7
    7d06c6c502 add example for go fix
    20f84d21ee client: add //go:fix inline directives to deprecated functions
    d0a29867e7 api/types/strslice: add //go:fix inline directives for deprecated type
    8582136c90 golanci-lint: gocheckcompilerdirectives: ignore "//go:fix"
    28b29bd8b0 builder-next: replace duplicated oneOffProgress with progress.OneOff
    b5bc84bec3 Fix issue moby#48093: set SystemTemp environment variable On Windows also set the SystemTemp environment variable, because for system processes GetTempPath2() uses it rather than TEMP/TMP: https://learn.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-gettemppath2w
    f04f350568 dockerd-rootless.sh: check containerd-rootless.sh conflict
    405a787917 daemon/server: don't log context cancelation as error
    f401a9678b daemon/server/backend: ContainerLogsOptions: use time.Time for since, until
    210cdcbd46 daemon/server/router: fix "no stream selected" error and status
    568312cb85 daemon/internal/timestamp: replace ParseTimestamps with ParseUnixTimestamp
    cfeceed9c0 daemon/internal/timestamp: improve unix timestamp parsing
    553420b8f3 daemon/internal/timestamp: replace GetTimestamp for Parse
    fc3cb00398 daemon/internal/timestamp: don't return value on err
    f37fc9fb63 daemon/internal/timestamp: use table-tests
    282297aa0c daemon/internal: GetTimestamp: don't discard nanosecs, and trim zero
    8f8b23c729 daemon: fix some untyped "invalid parameter" errors
    2d0676b8bb daemon: prevent invalid swarm events from unknown action kinds
    3debf539c0 fix: typos in comments
    480df69696 update to go1.25.6
    ff5e19865b ci: Remove concurrency setting from golangci-lint config
    01fc4fcf8b libnetwork: fix graceful service endpoint removal
    3eca177282 daemon/libnetwork: Fix panic in findHNSEp when IP networks are nil
    c4f4c6765e daemon/volumes: More fs friendly image mount layer names
    a1f7fff7a9 daemon/layer_store: Use named return error for defer
    0e600c7fc4 layer: Clean up init layer if initialization fails
    734bb626e4 remove uses of deprecated go-archive consts
    5eaae6db52 layer: Clean up RW layer if mount metadata save fails
    8ebb104e36 vendor: github.com/moby/buildkit v0.26.3
    518779c90b layer: Fix orphan creation in registerWithDescriptor
    5a99e1d1a4 vendor: github.com/containernetworking/plugins v1.9.0
    298e2f7d52 daemon: disallow container port 0
    3376758770 daemon: clean up dead containers on start
    bb2e099c3a daemon/container: Container.BackfillEmptyPBs: prevent nil map
    5898ee60f4 daemon: buildCreateEndpointOptions: fix panic with "publish all"
    ab55325b58 gha: Fix PR branch validation
    6280a80f32 Allow configured address with no configured subnet
    9cbafeac46 Update docker-py in test-docker-py
    3c6e5f0f5a Restore missing nwEndpointsMu.Lock
    7faaa44e18 Don't try to remove cleared docker_gwbridge endpoint
    43f91f775a integration: skip TestBuildWithHugeFile
    bb0d79cb1a rootless: ignore error when enabling IPv6 forwarding
    2ad480ccf5 vendor: github.com/ishidawataru/sctp v0.0.0-20251114114122-1
    3076530aa6 daemon: Fix image store choice priority for prior graphdriver state
    7a3cdd2c86 daemon: Add TestDetermineImageStoreChoice
    d7b6f3a7d3 inte/networking: TestDisableIPv6OnInterface: add '-c1' to ping
    7f5694cda1 inte/networking: test DNS resolution for non swarm-scoped nws
    0e2d804e48 libnet: create DNS records on sbJoin (if not agent node)
    7242ccd7a0 c8d/builder-next: Don't force unpack
    b6705d5e1a hack/test/unit: Fix api and client module testing without replace rules

Bumping docker/cli to v29.4.3, which comprises the following commits:

    d0f5b279e9 cmd/docker-trust: bump moby/client v0.4.1, moby/api v1.54.2
    b7f37e86da vendor: github.com/moby/moby/client v0.4.1, moby/api v1.54.2
    266f039bb5 Dockerfile: update compose to v5.1.3
    d74d3c3b16 Dockerfile: update buildx to v0.33.0
    58a7c3155b golangci-lint: fix lint failures from v2.10.1 upgrade
    f37a9e663f Dockerfile: update golangci-lint to v2.10.1
    ee56098b07 cmd/docker-trust: bump dependencies
    efbbc0c68c gha: Add milestone validation workflow
    a75ab98e43 vendor: github.com/mattn/go-runewidth v0.0.23
    b9549d3ab5 vendor: golang.org/x/net v0.53.0
    2edf815a80 vendor: golang.org/x/term v0.42.0
    258010c788 vendor: golang.org/x/text v0.36.0
    cfa80d8644 vendor: golang.org/x/mod v0.35.0
    c20b2479e0 vendor: golang.org/x/sys v0.43.0
    573dd31bf7 vendor: github.com/docker/docker-credential-helpers v0.9.6
    2988338b99 docs/reference: remove deprecated "--kernel-memory" flag
    58c7328df6 man: remove deprecated "--kernel-memory" flag
    5468871a02 contrib/completion: remove deprecated "--kernel-memory" flags
    acbbeb3c3a docs: refresh legacy plugin references
    3362ae31d0 vendor: go.opentelemetry.io/contrib v0.68.0
    a1edb22832 vendor: go.opentelemetry.io/otel v1.43.0
    0a24da3382 vendor: google.golang.org/grpc v1.80.0
    f24c779887 vendor: google.golang.org/genproto/* 9d38bb4040a9
    99aaff1807 build(deps): bump actions/upload-artifact from 7.0.0 to 7.0.1
    f3c060c382 build(deps): bump docker/bake-action from 7.0.0 to 7.1.0
    b9a052a987 vendor: github.com/docker/go-connections v0.7.0
    0d32fde8e3 internal/registry: use stdlib's x509.SystemCertPool on Windows
    ad641e5d61 cmd/docker-trust: use stdlib's x509.SystemCertPool on Windows
    14aa781767 build(deps): bump docker/login-action from 4.0.0 to 4.1.0
    d1920f0b2c update to Go 1.26.2
    b23c1a2d76 build(deps): bump github/codeql-action from 4.34.1 to 4.35.1
    c88681f8d8 vendor: moby/api v1.54.1, moby/client v0.4.0
    5ddc1553ae bump version to v29.4.0-dev
    a347d9e103 update AUTHORS and .mailmap
    5fca671ef4 vendor: github.com/mattn/go-runewidth v0.0.22
    42da40a605 vendor: moby/client and moby/api master
    0029d5936a build(deps): bump codecov/codecov-action from 5.5.3 to 6.0.0
    e7cbaafa9d cli/command/container: statsFormatWrite: inline render func
    c44a4d9758 cli/command/container: RunStats: avoid bytes to strings conversions
    d92d1187fc cli/command/container: RunStats: rename buffer var for brevity
    ee88c60a5e cli/command/container: stats: add snapshot method
    4c5efd61ea cli/command/container: fix buffer reuse when printing stats
    b309524f60 cli/command/formatter: NewStats: update GoDoc and add TODO
    abd2e211b9 cli/command/formatter: add Format.templateString, remove Context.preFormat
    cb615a9772 cli/command/formatter: Context.postFormat: remove redundant buffer
    f7a909d56b cli/command/formatter: optimize ContainerContext.Names
    94d4929a04 cli/streams: Out, In: preserve original os.File when available
    526dfffc26 cli/streams: simplify CheckTty
    48721c2340 cli/streams: don't depend on embedding
    39e82e6524 cli/streams: move constructors to the start
    34805dd013 cli/streams: (In|Out).SetRawTerminal: dry
    6e1f03c2e0 cmd/docker-trust: bump dependencies
    87a222158d Updated example tokens in swarm docs
    98d978df6b vendor: go.opentelemetry.io/otel v1.42.0, otel/contrib v1.67.0
    a48ff6b591 cli/command/completion: don't provide duplicate completions
    091afa4957 vendor: github.com/go-jose/go-jose/v4 v4.1.4
    968ad0ea6c vendor: golang.org/x/net v0.52.0
    78fb018754 vendor: golang.org/x/time v0.15.0
    18739a5ef6 vendor: golang.org/x/term v0.41.0
    9b21846cde vendor: golang.org/x/text v0.35.0
    c22bf3c77e vendor: golang.org/x/mod v0.34.0
    d792fc53b7 vendor: golang.org/x/sync v0.20.0
    e9664a72ea vendor: golang.org/x/sys v0.42.0
    fb776458cb update to go1.26.1
    62d80156e1 ci: pin remaining actions
    ea74248e8e cli/command/formatter: modernize
    5efed5fa30 vendor: github.com/klauspost/compress v1.18.5
    cd9e5ae84f vendor: github.com/moby/patternmatcher v0.6.1
    bf6a1e1fcf cli-plugins/socket: modernize
    8f7dc04070 update minimum go version to go1.25
    a14db81c9c vendor: google.golang.org/grpc v1.79.3
    e660030f3a docs: fix typo in run reference
    58c1585b49 gha: validate gocompat
    ea42337d01 implement module compatibility check
    d573c171fe docs: clarify multiple --filter behavior in prune commands
    07bb479a45 cli-plugins/hooks: add missing "go:build" comments
    97b9e04a94 ci: pin actions to digests
    2bc4307816 fix(cmd/docker): prevent race between force-exit goroutine and plugin wait
    9c117d3c5d cli/command/container: add shell completion for docker rm --link
    df57ff7201 cli/command/completion: ContainerNames: skip legacy link names
    dfda342e51 cli/command/formatter: StripNamePrefix only strip "/" prefix
    b5efd66ba6 cli/command/container: stats: make stripping "/" prefix deterministic
    64c8d68045 cli/command/image: getPossibleChips: simplify
    4bf4d567bd cli-plugins/hooks: PrintNextSteps: slight cleanup
    dd1f7f5856 cli-plugins/hooks: simplify templating formats
    9243240346 cli-plugins/hooks: add commandInfo type for templating
    4a1b2ef2c5 cli-plugins/hooks: update godoc
    4142d4026e cli-plugins/hooks: detect if templating is needed
    cd053606a6 cli-plugins/hooks: slight tweaks in templates
    aadfe6214f cli-plugins/hooks: update tests
    dce201d6ee cli-plugins/hooks: move template utils separate from render code
    e26f94d823 cli-plugins/hooks: add JSON labels, omitzero
    0431e4d23c cli-plugins/hooks: rename HookType to ResponseType
    607ebfca5d cli-plugins/hooks: rename HookMessage to Response
    60180924e3 cli-plugins/manager: move HookPluginData to hooks.Request
    dd91ed3f2d cli-plugins/manager: refactor for easier debugging
    0501cf8293 cli-plugins/manager: simplify ctx-cancel check
    5343bdc792 cli-plugins/manager: Plugin.RunHook: improve error message
    5fb5e0b0da docker stats --all: remove containers when removed
    560db7d451 vendor: github.com/mattn/go-runewidth v0.0.21
    dc4abf8b99 golangci-lint: gocheckcompilerdirectives: ignore "//go:fix"
    7f781688ed golangci-lint: remove outdated exclusion
    21293265b1 cli/command/image/build: use t.Chdir() in tests
    3f51d0a9d2 cli/command/container: RunStats: refactor to DRY
    9645db767a cli/command/container: RunStats: pass ctx to stats event handlers
    2bc66ecbc7 docker cp: report both content size and transferred size
    33790e88d0 docs: use generic myplugin example for plugin documentation
    6b1ba1ad84 fix: restore os.Args after plugin completion and fix error return
    300d8231da feat: add linux/riscv64 to bin-image-cross release target
    9a471180cb cli/command: add missing "go:build" comments
    f7d83cbae8 update to go1.25.8
    39d676c72d build(deps): bump docker/metadata-action from 5 to 6
    6453c4c3a7 build(deps): bump docker/bake-action from 6 to 7
    eef3c957be cli/config/credentials: ConvertToHostname: update godoc
    71db1520de scripts/warn-outside-container: fix font representation
    206fc8c165 vendor: github.com/moby/moby/client v0.3.0
    874a8df0eb vendor: github.com/moby/moby/api v1.54.0
    668b3671bd build(deps): bump docker/setup-buildx-action from 3 to 4
    30a2ace7f2 build(deps): bump docker/login-action from 3 to 4
    32aa575aff docs/service: Document bind-create-src
    c747cff9ab container/opts: Add bind-create-src mount option
    ba349f5afd build(deps): bump docker/setup-qemu-action from 3 to 4
    e2cafd657e cli/command/registry: preserve all whitespace in secrets
    10ebb3b204 build(deps): bump go.opentelemetry.io/otel/sdk
    681f15674c Fix typos in code and documentation
    0bf060f777 vendor: github.com/moby/moby/client v0.2.3-rc.1
    139b58d7f4 vendor: github.com/moby/moby/api v1.54.0-rc.1
    8eedbdc6a8 vendor: moby/api v1.54.0-dev, moby/client v0.2.3-dev
    cd070a5ed5 vendor: github.com/mattn/go-runewidth v0.0.20
    8c3d05398e Dockerfile: update mvdan.cc/gofump to v0.9.2
    b206927e0c Dockerfile: update buildx to v0.31.1
    6b5acd3a6e Dockerfile: update compose to v5.1.0
    caa8a50468 vendor: github.com/klauspost/compress v1.18.4
    5c498778ec vendor: go.opentelemetry.io/contrib v0.65.0
    fbd0e7f7c4 vendor: go.opentelemetry.io/otel v1.40.0
    95a5a9e709 build(deps): bump actions/upload-artifact from 6 to 7
    a7b95f228f chore: use canonical url for buildx build cli doc
    13c993f101 cli/compose/loader: merge: use errors.Join
    8b6f23d18b cli/compose/loader: remove some wrapper utilities
    b35a2d0837 cli/compose/loader: remove getLoggingDriver
    42a211162c cli/compose/loader: mergeServices: inline mapByName
    6e1393089b cli/compose/loader: mergeServices: remove intermediate map for overrides
    78458e11e1 cli/compose/loader: mergeServices: tidy up and modernize
    09cf89e82e cli/compose/convert: convertEndpointSpec: fix sorting of ports
    db28780976 cli/compose/convert: convertUlimits: modernize
    830d05d16e error-hooks approach
    9bc18993a4 Fix: run plugin hooks on command failure, not just success
    fdebf0afae cli/command/container: fix some unhandled errors in test
    e47a5c7734 remove redundant uses of streamformatter in tests
    2fa6b736d0 scripts/build/.variables: don't use "netgo" when building Windows binaries
    61f03db682 cli/command/registry: refactor reading from stdin
    74d4554ccd github/issues: Add emojis
    2ebd137abc github/issues: Add links for Docker Desktop and Sandboxes
    f5b6055bd1 cli/command/registry: add unit test for --password-stdin
    b82e30e58d cli/command/registry: remove uses of "gotest.tools/v3/fs"
    c4fd2406e0 e2e: use docker v29.x dind as default
    fddfe63ef9 modernize: fmtappendf
    6d4b3b5f66 modernize: slicescontains
    835d510b78 modernize: stringsseq
    dd73e2df77 modernize: reflecttypefor
    7f5bb1e99c modernize: testingcontext
    2875e48024 modernize: stringscut
    4c7d40cf77 modernize: mapsloop
    85ebca52fd modernize: minmax
    e8dc2fce32 modernize: rangeint
    e4f6019e62 vendor: golang.org/x/net v0.50.0
    464e14c68e vendor: golang.org/x/term v0.40.0
    1e31c2825e vendor: golang.org/x/text v0.34.0
    355f7bb602 vendor: golang.org/x/sys v0.41.0
    a934c75de7 Dockerfile: update golangci-lint to v2.9.0
    ab06aebd4b internal/volumespec: fix prealloc linting
    9a0c78fdc0 cli-plugins/manager: fix prealloc linting
    2e544d6308 cli/command: fix prealloc linting
    12a0b0b7b9 cli/compose: fix prealloc linting
    99cef6f700 opts: fix prealloc linting
    8a8a3e1309 opts/swarmopts: fix prealloc linting
    9d2816c8a5 remove outdated "nolint" comments
    eaba9ecf18 cli/connhelper/ssh: remove outdated "nolint" comment
    1f6b319d60 Dockerfile: update alpine to 3.23
    b598f8f0b8 docs: fix docker volume prune example

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/docker/docker-moby_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 56d94675..ffd77fc0 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -44,8 +44,8 @@ DESCRIPTION = "Linux container runtime \
 # so we get that tag, and make it our SRCREVS:
 #
 
-SRCREV_moby = "1da6517e1a4381297e56862f6f373f265c28d102"
-SRCREV_cli = "df016a3a9538efb6d7d6e7c3baf291dbbe28eee0"
+SRCREV_moby = "56be73107b381194c27938965bca74c4e2bb475b"
+SRCREV_cli = "055a478ea9010a19d0d4674c0d0e87ade37a4223"
 SRCREV_FORMAT = "moby"
 SRC_URI = "\
 	git://github.com/moby/moby.git;nobranch=1;name=moby;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
@@ -64,7 +64,7 @@ require docker.inc
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=4859e97a9c7780e77972d989f0823f28"
 
-DOCKER_VERSION = "v29.3.0"
+DOCKER_VERSION = "v29.4.3"
 PV = "${DOCKER_VERSION}+git${SRCREV_moby}"
 
 CVE_PRODUCT = "docker mobyproject:moby"
-- 
2.53.0



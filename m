Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87649CD5BB1
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 13:03:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15425.1779714237747447241
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 06:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aZ3kPnaU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PAA26B2008555
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2JDjKlLIlGPArRJ+QyjC
	fa9Hb+Ndxpw/hJKxxRtHIaY=; b=aZ3kPnaUeLn+EDa8wEB7KPI2A7rnbohWMzzs
	vwJIz2v1+e/X9few0StCTatDBnKFMpaHbcp/z3r8KT5TDuzMVdul5Lr9ESGAEy5R
	idhTM6J324Fabnf9uFum+egHf5UM+fIAAGUcAwGaHsPdXC5UhKpoXTZqFCkzCszY
	wDZs8qevmcXJgQimWQZBesYYeqepnBJ4+pMwyikmp8S3ojAKTbKHUS5hH8Jq8S8O
	5UV/8D5z/1gF2uBDN/Dnh+Rf16O2osxKp8gYQG2yQ7bkniEue4rxeqTe6Zg+hEhA
	S7iphtuAHzKxWc206YY/9mzjJAiiKDmz7zY4URySM0UWUMRpGQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010044.outbound.protection.outlook.com [52.101.201.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb376aph0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GhWeXrM6KBga+jeFswGRVn1feOiQDCNsgaAcFSlTMLgWSSeHH3U14kgUapIkzcxzpp7CIc8y6Cx3wRjwiqq7ktpooz41SmtOOggVfrIyuUtd1qfF6NuRBtsfVEDhBpnVZ6It3zkA795SWTmLzWUL4L+2ih//D+T0kh9otGR5Ld+uNcJ7W6IIU3XPZU5aN236bknWDibqiidRU04WUXszYwYf/fexaa5SS1MTtZZR1neewFAkpUsAHR7dF/6cHAU1uvRPl1mlVY1vcvs5VowiwNH5/u5RteamMbC46HpnpjzqzNYTlzSxu+9RQRZ1ihjNHvvfHDZN+z3pRGFLqlaAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JDjKlLIlGPArRJ+QyjCfa9Hb+Ndxpw/hJKxxRtHIaY=;
 b=QHTHTfthXwqZQkUlrYoNSrTq+TIueikcYCDBZyqFCmM98Is/TnXY0r4LBaqj0GqcagAO941rhab1YkGJDV58wBxusButY5goCu9ODAU6vazQuwDux/yKBZcjOwylYy5+5Hl4odAJbfNWdSESuK41ShAHt/99XNzPNIoQusLU2rvxdwJisV+myIjJITXcxWhIS05h1HI+ZjCPQOgmxA2im0ajmF3zUOqaxNPab621ZDvxYEAyKAro50DREf3MbvlI5Uc5OJOCH0qDvsLAevbDW82gXy1m4sA7le2W2i+RmCFsar6LhYdXqfZ9tojvqjq3Ru5IX+MmcSmnhJSZiZhQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by CH8PR11MB9506.namprd11.prod.outlook.com
 (2603:10b6:610:2bf::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Mon, 25 May
 2026 13:03:55 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 13:03:55 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] kubernetes: upgrade to 1.35.5
Date: Mon, 25 May 2026 13:03:49 +0000
Message-ID: <20260525130349.3963929-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF75D68BA1B:EE_|CH8PR11MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: aead64fd-6b4f-45fc-9d25-08deba5e138d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|11063799006|56012099003|18002099003|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	EvsJ8SfuB4ZvmkojFjDH5iWOu7Y2HorgCfYiYFy1NJ2Ri5tO8x6477B7O0axxyInRs3y33vcQm8bzhS9PBI5teTErwbYK+y4VuOcGqYohl0I8BqD/bNHqmGU8rwlaM67DxL0xsLJr9t59gf8zqYk7jjOYyDolZ7cwil10pCPAFF537YCEcr7kf1xrjwO5tYu27WTLhPub/SVdfb529vjTV2f0TTYhLXEv1IAQ/+KfK9M1CfriOpDAraumX4DAGN76gRnHebJ17ODSj2PoReBNAlzpROZT2bbgfk1zfIK1MvJIG4HVE39g18pmvrVu+QU3C3shBjhPBcyaz6CH2pRfYRjEgPqmRQI+v5imqFYeCAR3xZwsIfuiSJ+uWk3GAN4uvKczyOs7R01M9Xa9lmQeF8wNB/CpII1vMySw7byI5AzGgr1FM+fDMyoOe/IltzeXfI9QsAZ6NKx7UDPztWAnGTK0mN2AETmu+oTQyvdC9FMxuoiwkGzo1G8RJaH8fat5p/12r+dYwVpnUL7ZMlOr6sVVFU4fYqf8SO9WKu3B6zSt7H58BX/tOuSC+zsP/DhmkqlR2TcjQLM9eB74Do/djLoPoruOy4Hu5AJM8n+YheXkcOQTR+ltcKjUt9tbLq4ph0AnQ/4C2YrrXVjO+FeCJriOEO6c2xwI8VeoTcw3Vqmh9c41FD0N1JVGzNAq0w4ip8dicdx6YBkTv6NQawq7A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(11063799006)(56012099003)(18002099003)(6133799003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T5sC7K1D3rOFYjNyqlrqZok3KnM4ec4sEwfL+WgCobVFkryg1RvFvgCr6jlQ?=
 =?us-ascii?Q?r8j6uyNdeZanRkVIE3rTW7QLvEaYTbEnju3OYkoQb+FmC7yFTCHvdBtJfJug?=
 =?us-ascii?Q?beUR4agrKkZLHjQig6E17jWpfO9C8IDD0aBGaTf0uH9SpcI3E0ABEUH62uBG?=
 =?us-ascii?Q?OptgXLCjJ8qVcMavD+Z3L50fcj6p/CCTCye2YluMvv4FuzUuvIG0qU4F5Pqf?=
 =?us-ascii?Q?XMXhr43LZPFXxO6TybDMr/9qnr0ECvH1dDnCEDzFUkpEQP8ievD+zkXHxWG+?=
 =?us-ascii?Q?sTd6rolvBAeNKKHdqRb0zgv572mxBngAD+rFcNubK3K9jss+2R1iv5Dz3mto?=
 =?us-ascii?Q?xqHdd6rV26TA5vEIolICZfEXMwL2qeYnkok4jWeCfQBybdUie583fWtOCS41?=
 =?us-ascii?Q?JB7tWhYOyZSJQFjpdO9Wh0nXQwvpelm0BX9wkIPhEwr/t56W4pRmkpDPNvU9?=
 =?us-ascii?Q?WCZwXL0LcPczo6dv7+6rPn3pBDDQ6Hv1r8mPedeIwZKmLDYR2Lz6jD1ym2Nt?=
 =?us-ascii?Q?5bFWXQRxgcofyKSzBANBcbtHyYe5botpD1auvXohQqVNHQckit0n4oQyXWI0?=
 =?us-ascii?Q?uF/RlXMFXYMXX53BGw9uDR4Q2V32mK5crNmmgbbDIVoGPdTWD/gPuWcY1Auh?=
 =?us-ascii?Q?Mqs5pX+6r3WbmnjdVLkuGM+GM+nL0cLeXaMQ9HAs/MepLoEoZx87xq5+ng07?=
 =?us-ascii?Q?8i0lBoBIkB1b1i65hz5HsDKc/AbjRiHykhyP0HMtxCK233u1+LPTIUR2NB8f?=
 =?us-ascii?Q?Goran4RxtH5TmnZZaxPIL7Y9tkqCC08tqwkhJj7UAD35jEbn4ZTv+cQFsDKg?=
 =?us-ascii?Q?Hn6MEU7vIEv2Hd7XOK0ImuFnBPk/zgUbl5SOeNojndioE1tTAZ9YZriQEpZG?=
 =?us-ascii?Q?r9aRwKo0BEZMaCcvMH4MtrQNU7YyUQEQfpJO1Z4sY9+QaaQ6Rp01N9QyDGUH?=
 =?us-ascii?Q?9EFnvM+wafr0uOhmP6/I4FAQKiEx1WIxPJNAhT8moDIfzk7mbOtA4lZoTvx8?=
 =?us-ascii?Q?VJN6sXU1H9gG8f6wZm15TqV4XgE3/9KKW+QPFG6Bwp6wAhm8FKMWGn+OW7YC?=
 =?us-ascii?Q?d+90JO7DhmTVxJmCpQBI/9mag27E3KiPDvij+t3SC6Zh0YhO+UONHV/1JEZO?=
 =?us-ascii?Q?8TGXl9PkvTY/Fuhe0ZJbJxR1fl4PU3n/OKp01Z4E+dwVTP0exrgWDe0lxD5R?=
 =?us-ascii?Q?oRTkwpp4ykkr+uOWQUYFGjmDBuQvlYVZkvgUDgReV5ht52KiZTzawAusAmAP?=
 =?us-ascii?Q?kaDLApGWeKnCpDIOwRx75S4X0IsaIQKqP7UNeDxdFHOGPlu+LIXPyij2o/Gn?=
 =?us-ascii?Q?pRXmRBvmbj0SpuXNxjPug8NAp6mJYWQQCOwSqktRPxWjwELDGtt+88Dxc7F8?=
 =?us-ascii?Q?MGA03xoTrlluAXX9gGjOFzGBP63kHyBlQDb455f0iwmkjg7wY6xKbyQDitbr?=
 =?us-ascii?Q?+O7bSJStMQvEHaEFIRHzvg9h4bbr9CwUy2/QCYsIYfCTDGkZLmcLAkNMPXuP?=
 =?us-ascii?Q?ZDn2Y/p82nY1Z7KW1F2XYs1DOuw5V4l3dEO+oXBPRF/JxfHwKHWQXxkSL0L8?=
 =?us-ascii?Q?jxRArU6xA/3kS+NNCMAaJzbQEzsCTjzqSZc80W6M8q32+H/a74ytE1gXQMP0?=
 =?us-ascii?Q?y1lLqRGRwFJcv7qv/fIkxdbfDxux5myykc1PGbYR+RVBCJlmz6LKnNBmgVVR?=
 =?us-ascii?Q?9iddmAOfzhtPiXUmd5D8NMHv20XoI3PP1On0emucYTKsnbWwcCEofoGI4u+A?=
 =?us-ascii?Q?OV/HcWwp7R7gibtghVuJO8AaLdwbd64=3D?=
X-Exchange-RoutingPolicyChecked: 
	kgaiCSjLaTQwZO26cPs6716jhok4ehKSYzZE/Oky9e02Gr5DwDAHx9UIEm/RcXuNrmQCcfanMNZoGya7w5EOnUWRZAGM88s66faMGhxd2YScQK6jjP3o5sH2vlCpjihoK6PWTmXkdlJP1tegF1JCCitSVdtAeUbEkcPS4ln297kwYoxZMlDaF5VTHxpMXU4fsFZi1xQeoHXoBZVgqEVEybqIJ/+D1JhpQRisJEPj9ddX2Ryf3AXuRRGsmnIjZG8EMprH6t1gbep3jp388euvbYgXt6cJTGL0OGwigqgroKe9j7inH8dZZR6zAvd4uevzDbXDXeAhU2sg+k/RYwkClA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aead64fd-6b4f-45fc-9d25-08deba5e138d
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 13:03:55.1579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5E2+7GPjaC6pKfwIROofHeL8sdPyYgU9uiT9ShDxomx5GvaWHcN0rQl7bxtLBBDXuEX+S4MmhN/ZImU/i4A7AJGwby+zcryfTkWc9ZONv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9506
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMyBTYWx0ZWRfX+bq4gc//7x2H
 /s13hiNUh7PC9Vz0R1qPiGpLuYyGlyzc1xPyPZy1b8CLU3XHZjoQPUjMn/Cu41obFuBGaxuWevt
 qLf0QISZH7T19sr3uZXEDwxGDKBQTobr76rZzntjsdmOMd90AUFTbA4owgreLo2gamF+baS3DWB
 AyAuPKPiiBPvnyPBIH23hLWQyw/r5BrTGpvQGBaKI63JNRVJDBu0M6omr8jbpQAI0Ei024cvWjN
 TTcdnz7K1+GXvnOOouSKJ19J5Sn3c0MHD1wYDvW66P33sStXQf0yQwWRLGaOlMxlIG+fVQpgF6N
 a9jrugUMRRKUHbwRBVGCWno/LxeX20B9OB5QToX8DryjxKEjoCpfGfbohLD02zSpnlKPBwQPKaS
 UDrbwKKvGyjeaUoCTCV8AniCHpegVa9nGqzkNGGnJ8Kq1a4NfsxoARpoe2T8yDVFYGYCKgArWE3
 7enAsr9UNoO9Up1lrvQ==
X-Authority-Analysis: v=2.4 cv=M5B97Sws c=1 sm=1 tr=0 ts=6a1448bc cx=c_pps
 a=BI8ydP9R2Zc1CK2A4JEEvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=8Ad4tvYqdmIA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=y2XUBAUY3-SBGGUOXQYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BjnIZAUJu77sOEXBeNdWmqg8e25Awzbs
X-Proofpoint-ORIG-GUID: BjnIZAUJu77sOEXBeNdWmqg8e25Awzbs
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
 <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 13:03:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9812

Bumping to version 1.35.5, which comprises the following commits:

    6636cbce3bb Release commit for Kubernetes v1.35.5
    b9ffe7c06a9 kubeadm: use dedicated ClusterRole for apiserver kubelet client
    7909267f8b4 kubeadm: skip LocalAPIEndpoint defaulting on worker join
    f79279632e9 kubeadm: use the localAPIEndpoint for all API calls in 'init'
    faa81128567 kube-proxy: don't do full periodic syncs on large cluster mode
    943d9419438 Delete remote endpoint if it has same ip as local endpoint in the system.
    d550d458d34 Delete remote endpoint if it has same ip as local endpoint in the system.
    6d314b2fd9a Add a (*Client) addEndpoint method
    feb7fa11123 Evaluate etcd cluster health using quorum
    1a7f0b3dec6 Escape path inside the container
    6953afbad16 scheduler: address recreated pod review feedback
    bf14155eb41 scheduler: skip requeueing recreated pods on scheduling failure
    55f12e8477a scheduler: fix inFlightPods leak when pod is recreated during scheduling failure
    31d47ca373f Update CHANGELOG/CHANGELOG-1.35.md for v1.35.4
    7b8c6cf0edd Release commit for Kubernetes v1.35.4
    1687aa8c94e Update github.com/moby/spdystream from v0.5.0 to v0.5.1
    e87f6b927bf update go.opentelemetry.io/otel to v1.41.0
    97ccbdf2ee8 Bump images and versions to go 1.25.9 and distroless iptables
    69dd59d5b4f podStartSLOduration excludes init container runtime and image pulling time, includes only stateless and immediately schedulable pods
    46ba1c3c279 Deflake TestPodSubresourceAuth by waiting for effective permissions before testing
    1d5e94efa21 podresources: filter out inactive pods in Get()
    91a1e8b2db6 e2e: node: podresources: fix expectations for Get() and terminated pods
    9d8bbea593e Fix device plugin admission failure after container restart
    d8a562b6476 Fix backport differences for 1.35 (remove WithOrigin and MarkAlpha)
    b6ee759d8ea Add slice and map union member support with tests
    3d39627cd98 Use IsZero instead of IsNil for union ratcheting check
    7b708cc7c64 Add DRA test for device attribute with no value set
    863ed56ac0e Add nil OldValue test coverage for union doc_tests
    9a39e5c49fa Fix union validation ratcheting when oldObj is nil
    b0ec348c24d KEP-961: demote maxUnavailable feature in statefulset to off by default
    570f471d7cb kubelet: fix sidecar restart after kubelet restart
    4c0429295c7 Update CHANGELOG/CHANGELOG-1.35.md for v1.35.3
    6c1cd99aef0 Release commit for Kubernetes v1.35.3
    93de120edff pkg/proxy/nftables: fix kube-proxy crash with newer nftables versions
    6b5673451a8 Update knftables to v0.0.21
    38378d5df7c Bugfix: calculate request latency properly in audit log filter

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/kubernetes/kubernetes_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 03243605..0d33925e 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -5,9 +5,9 @@ applications across multiple hosts, providing basic mechanisms for deployment, \
 maintenance, and scaling of applications. \
 "
 
-PV = "1.35.2+git"
-CVE_VERSION = "1.35.2"
-SRCREV_kubernetes = "b6f632ba56e937dad484d5ac99d5ff51e7073dfe"
+PV = "1.35.5+git"
+CVE_VERSION = "1.35.5"
+SRCREV_kubernetes = "6636cbce3bbef91ff61d36658757179426f9e1b2"
 SRCREV_kubernetes-release = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
 PE = "1"
 
@@ -19,7 +19,7 @@ SRC_URI:class-devupstream = "git://github.com/kubernetes/kubernetes.git;branch=r
                             "
 SRCREV_kubernetes:class-devupstream = "b6f632ba56e937dad484d5ac99d5ff51e7073dfe"
 SRCREV_kubernetes-release:class-devupstream = "21382abdbfa8e6a43fd417306fa649cb651cc06e"
-PV:class-devupstream = "1.35.2+git${SRCREV_kubernetes}"
+PV:class-devupstream = "1.35.5+git${SRCREV_kubernetes}"
 
 SRCREV_FORMAT ?= "kubernetes_release"
 
-- 
2.53.0



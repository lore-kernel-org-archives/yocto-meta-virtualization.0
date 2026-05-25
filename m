Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE09CD5BCF
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:26:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12478.1779701202769160816
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 02:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DNthtzU/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6TLLk1823333
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2JDjKlLIlGPArRJ+QyjCfa9Hb+Ndxpw/hJKxxRtHIaY=; b=DNthtzU/I1p0
	LX5opyCczlIeeqUGugJhK9r0BMWeeXBGWO0Z5TXrv+85KjrzwphKMRe59qA2i6P1
	kSUQRMTi07J2RiSSMmKMfdd9E31uz6XwsBo1Xs/K53zC8GxM/7p39lrd4ffYMZu+
	tnGcaN0sijaoNlBWmHa8TyoueGOQOh7OVpgLN3XktCOkT3JYVWWM2YJKQ1Ff+Oew
	HsLh8HRCFAc0cyaAtTfdwgqWr/a7yuA+vaHgRTcGQBehibcs7bTJkTnuKlcFf6JU
	ueQdwW/81ntNtSNlscFl1rPytbgB8RV5xCOQCMnWf85ry/O/LTQKDjop9Oo0Z05Y
	/gQda0T7Lg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f02n58-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvMfmj3Z7zLF+aadVJJ95/JrB2oKbtrrle9otgW/Ir1pyXV5/xrOw5q/d04ZtieqFGYldv7yRerHqbsSSYo3l0mVhZqKP4rwM+WON0/3WHZHaMCCIEtrIOjBdVxrxWfOFVOFOSmAXEbv1R+qxUKggeyMzr3Q8xnaTzDt5DcuzZErbcNM8i2S9AZyVt0IMJeVZ+R87lHU9USHYks6uW2t2bc28NQ3rm2qu3N02rxqyCR46R9roTXIIUQ/NY64Pcn6xBkuzIGJlCoZ+dBk95lxG9JFL05eVvW4ky0dQ00hoTNXlGOdVYZFaFmVjZlvPLZHi28jughJSunjYv0hzlgtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JDjKlLIlGPArRJ+QyjCfa9Hb+Ndxpw/hJKxxRtHIaY=;
 b=OOuBHfX0UXquP1rpbwpXmk56iQ1h2U7510Htgt3rx87PcQDQG22g6zMhm2SDOT1/mLUc9meqk7WvRwtovoKwb05Xqgh38AATI7+p/tnze5nDmtb5evUhIl7WD/Mfh59paoj6ioMh5iZqJU4Rqb4zYzhM38He8sqw2WCQu1PemQow+Vc9U2VNhb8UA6rNpvuZ5clZJe1sLwaZdzo08Le5xrZ9qiCQw+XdjELS14ahdrrHOOxdX6e9lp1Zu7Q346bnmLWKkaXgdZOZAvaNpKAe0YZTSDQHpONtk0OSAc+a3kwx3Nr0QAagtIx5xpj/3qoMHSPluwrRKUw5mAXAaB/1Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::32) by DS4PR11MB9532.namprd11.prod.outlook.com
 (2603:10b6:8:34b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 09:26:25 +0000
Received: from DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a]) by DS4PPF75D68BA1B.namprd11.prod.outlook.com
 ([fe80::881a:ac0:4717:712a%6]) with mapi id 15.21.0048.019; Mon, 25 May 2026
 09:26:25 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/4] kubernetes: upgrade to 1.35.5
Date: Mon, 25 May 2026 09:26:15 +0000
Message-ID: <20260525092615.742129-4-zhixiong.chi@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5dd6b8cf-8d58-4cee-d3b3-08deba3fb114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|22082099003|18002099003|56012099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	wlMi9+pX/Qhs5SCZ1PAyy2ofwVynRWKAX6O02cydiwgjuc1IaiBjXBJUv9elzCC0ru7782/Eb73HjLHLMTFZoBNbs/qO/WYTqvuDQLjmpBXJQOfUWJ97VbTtKxORS3JGA+JFStiBv5p7Ufh3KU3prrUAjJJw/pOpbxGeWwLh3m1PJiHcZVTfyuEZvJaN4p0us10wI+7sQQ+Hjgv4rFs96aT7OYpyz1pwPR3CtkhsQ64nzTJ0v1NkRaE9tNlDzeq5HdDnXUX6e070rdpdJ0z6Q6NpgF6Sgc/fVNDGCeGZbLUJqF8Q3ncUM/GjmSUXkKryMnuqLJzZ6sA/2O8EUNZEvCboZJNeoB6KxcufPDWKU4og5bR6i3lrvc/R3eyMxqlOh5nFD5O4cLkGJoh302RXrrQCuBpZbUSPvcn/rIQxPU48U8HLhZlDHAO904Rd+Ifk/qiLiwZTIrAybvPvOv6V9eIvnTXh24Jf8h6SCAIy8M5CKaU5JYhGiGqQu+b39zEJpyuZnNCcEb+eY4UM4EKWEedBJTLHLib8tr9+n8PvS2j0Ht1ssQ8lwqOUxTuIZEaFhscCd0rC+cZxEVH+9WsjMI1xmowsHbXNaIalKoFoY1PY1xdO5fhEA5kLeyUZMwCAAEGCZGs9F4xa8MtJKP+rc/Szx+538OHu+0xIsl1IGqb5bYzXR5aWyJWEdOFixEXYvLzMBt9Z1AQ46nJsdsaefg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2wf1IOGmmJWyh7M7TAELqdc1bJcpFPfjxn+zufC+emOGnzt1eJI0LW8ecJ8O?=
 =?us-ascii?Q?gIyGBQaZjNWaNsc1VmtbaNZSLrvixuTY6mAvg8TWg4yTYGyngK30/SqNVkrk?=
 =?us-ascii?Q?jxBYEknG9YAYAFNdRxRMrpgcJDnfQD+oBAbAC6zZiUM8yca644oJb7nTj1p2?=
 =?us-ascii?Q?pM2IreAsMmFwB2PEnKVtpbWyKNv8T8mzS82Jz6GMqgYeB3VZgbWAhtOyq85f?=
 =?us-ascii?Q?9gT2Vz63A/yhOcH1/ODRgDD4ranSwivtYD8VvaWMXbPpvubpMw2ucvl3Cxpd?=
 =?us-ascii?Q?RogaUvGTIZ0T+S+cdPNLSG0AbOF9cl3RTw52B+dPpXigmC/BlLJ+QhdGagA1?=
 =?us-ascii?Q?eAvC7q78msEAtx8bMaXUbv5CxQItc9NYjhVscd8J+A1uBcMb89ZPrjBnDcPs?=
 =?us-ascii?Q?IRxYHbzE2b8jJ8QZGYPfxuzIO01A8NZks39TiUsBHD5M3BFExkamRmoDzz+Z?=
 =?us-ascii?Q?3FK8/A2nNwe8dL5mVZpvQ2K9wbreqAwTGkGo3WofHjrvzxLByciiddEzWppa?=
 =?us-ascii?Q?BxFgj5jXztopSyyEyHYPZzN69+oaBxBsVh6thcTFYdLx0TTe35WvKej+ESMa?=
 =?us-ascii?Q?9WDrwcgGIV0uKJUtizRiVTMBh7e8Oxn8hbd0xZGByEteOXoq47rgC4TtFvlh?=
 =?us-ascii?Q?qOab/puUH37W+w8zF75Fiq41A36Zm5x0lYd2GXifWdHoOtF7A/e7Rh7QZyZy?=
 =?us-ascii?Q?bqBVxnYcxq4Irb1sufj8tvuyxABKhX9vtYNR83a6uJRNwjhG25tNsNRioGHC?=
 =?us-ascii?Q?eoZDJ/qcT9POVP7kBUtj1Xyh3j7VNr2TFuiKcXUsw+sWFgNSBVSRkvisNXd1?=
 =?us-ascii?Q?+XpzeQDAYz0ziR655CxppccX7cjq1KBHwESP9yTe4jv6xh3lXb3wRYxLU8cs?=
 =?us-ascii?Q?+rtdcJ6AbkONEGVXVeWIMuo4y5wWfGaWtDBRGtMWTHTLEu1R4FitdJ3tH/fW?=
 =?us-ascii?Q?9UtQ85XtOrJjy9cnTb+TA8lsJBw2Rn1bxf8Uxe6irfMPiuNgZZiuq0CxNEfN?=
 =?us-ascii?Q?irlkJuIWjOgTgFNWRLBDQWfT4MvTU/9j6FT3aJAk5d61uXbTJxpDjBUIa4FL?=
 =?us-ascii?Q?4tj7jU3kfENdSdUQeYpv3AWjctt3PI9mgNfafSh0/3454hAXM+/dMFSMA1Xx?=
 =?us-ascii?Q?nlAzZTwPhq1KF/IBaH07aECFniKyn8Xok9PjbrDevj0in9/h5okMH4EBL46I?=
 =?us-ascii?Q?xxYJLJZPgTdgoFZfau0PRcT6SAbmRp3/cWYCjvl+xbsQk1gsHWVYo+OgIklu?=
 =?us-ascii?Q?ttmFrCXPTK+aey9tq104baQ+QM13aW5pKT4Ipuzsd7+yKiSqkQ82VRLZh1Qh?=
 =?us-ascii?Q?SZKLlkPxVNfy003VSvcCREBjwhn5vbf0izqro5TmSuMqbAXPW/GEvjtjMJeD?=
 =?us-ascii?Q?ZfVRd7SiRNDfXH2913ZmnuZCWwKnf48Jtz3XO+RlfRRCihkOmkVrSKHMSlPe?=
 =?us-ascii?Q?MGX0DuMOXF1sbCLKOgZ0NhUjPYY/IPJcFTLbjZduan+U/7AZTlp0A4TgKjEi?=
 =?us-ascii?Q?CCDxpWDHvs6Tq383GbEy1j+GNy0VIePiAmkDyVQlYMvzCaxbaJ5rXnHE42Gc?=
 =?us-ascii?Q?Y5ZXRfdU1JxSC0rT+/871nxJ56RSJ6rhsMEVS6grL4mxVtLf+CYQhMP6WgCC?=
 =?us-ascii?Q?95jtRQIhVOs8EfucrEQPy85A2Tt1YhR2PhYeabxxLIj9NX0wV7WkFpW1G0mf?=
 =?us-ascii?Q?xtINp6Wl41dSgmr7JHxWaPDYIJjEXRTWyVwej5HlegVVp8ysQ7oQdfpiKIMY?=
 =?us-ascii?Q?hDkah2Bm5PH+V/ujMIa7YSnv6v9BZZ0=3D?=
X-Exchange-RoutingPolicyChecked: 
	bJcoE8camlS2oAt+AoUwkC2Ap5EZLmmwLz9DibmKlMvC2m7tB1G7X/IPLioaC2dqq10zwdsYrT0erRYjB1yMJaLej/QZvLn7Rj92ErsRWmg8fejLq36PZS1ZDMdgJwICMH5buMxt01Onh3LGO3nNldZ94L3eOUg0nipMXtw6te6A+tIFqPUGSXE2GQhdCCSUmmgfb7E7tuFRkoTkk4OYuejkJy8tlMrTH8hc9tQsX/GemrQlkgpJC6pXpB0jvgnNBG3XrEbdKjH3D/lHEL6Hgj8JZj7d5UQxKbUIvFaBYvM8Jx7sdByh6zJ4Z30fpOOh1Xe9D0bJ+f5R8J8kbPobxQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd6b8cf-8d58-4cee-d3b3-08deba3fb114
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:26:25.1056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJmaF8EqkqrAkJt9n/KA1QcEOrR/2+VTnKV0b1vai/2DxlsSux/Fejbv+HWmNjVYEj8+bOHHR5NHBLqoamQmJ/vwEjAXJyJl9iK0vINj74Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-Proofpoint-ORIG-GUID: _GTi7mIdSMd-laoGAZmnjbmVzJgUBR58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX98HSyX3bLsMW
 92Y4zHgGhvqaYCjrT5An/TlwGYTgQeMWWR8iEJxRqkxXvfvzTr6VZ2Q+CGohYAFht0/QYuV76uH
 HrRnzmhKeDhQdUKc5QeejG63tZsrYD1RFOnpALNsaQcXBBaawEEtnP7cyAGFgTMaSgh8vSwE6uV
 +mInvq0azJJNlceZjGnI7B/luJZOIQF4Xg4D2mah4On+y3/ogfchQWlnkOPm3d9ufy6shTLzkn/
 uxzb5YOK52vadZOOs6Pz7ubDLYzoVNMZmZnojTb9frLLjTm9YVMRy3Z0UQHzS+EnfPYE6gLFhhZ
 huHMuYpBO/yHw2xCy1UDkMyG00tJsMA9X6oWdxworEcvgZr6Bx36zh73YfR8kSAJGZKyhIz0Wk+
 39VpwsFoaeJqXUumyyKkPTdPpPqJvdv2dZFcVMce6sAgNs1QrPUZkE44h472WZi7R4xre90rHgO
 qyffTtyqWiR8qOjXrkg==
X-Proofpoint-GUID: _GTi7mIdSMd-laoGAZmnjbmVzJgUBR58
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a1415cb cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=y2XUBAUY3-SBGGUOXQYA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9806

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



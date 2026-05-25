Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA0CCD5BD2
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 09:26:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12477.1779701196225523632
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 25 May 2026 02:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H9YNf0EA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605e3e175=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6TLLj1823333
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=xflh8k0T12oFjHyVYEt1sDYE058T6OxmtAMLwmmKGgM=; b=H9YNf0EAvdKW
	jCt+Owc/kdI59imaBsIhqgTTuFqZgLwTX//pH1LLJFMIENvfUtVdpaFRARDtiEwy
	apMWm+zp3M+o1NYXho313lhdjjDtLjvJzLLtpPrU2MjJ5n4KthjiaNN7xJ4BJelr
	id6HvKCUrgPYWI68sediJyK6dFSi0lQNCpE7MOw1fFeLR+lBu1LafPNCkSNlCF1n
	LgrOlG5/jokmj2j6/eGKpZKsCXaPwYHx7MqN10/qSzlRIiFjlXUTPdEizPF6T34H
	Xr33YTC6ZTrHBTbtjBdki1k+f/Ih6Sr6mIb4EdAZOHD/DPWmSRokEzfqJceKVjxK
	g+/ByyJDzQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f02n58-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 25 May 2026 09:26:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/EmBXIw9911ZOE8jIgG4a6JhzmjIRpygJarhy3ywgBRajQvsdN0yPrg6i7/LzikOjB0TzlwpzgKnI+IdV7Jqe8Kk0NQvptqcZaaUyHsr84kmOqe0rrQflTIfXPWPgavmFFlTPgar5lT0Y7RkJGmp6sEXm6XiC+GXBounJYyiUfi10j2J0gpzNwJk3ebj4i9xVV4DdTwr7tYQvJ5z4gemFOObG70464NzbBUC4+afvNK5gVIvsK0Nh2mMDB/wmn6MA67h0MIIOLp6oDDmOGCACBiMnxzORWZNRDI47taoYtsCf9GmuXnOGlbuAwUUPdeK8fh6Rdxzeg8JAwMIdDInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xflh8k0T12oFjHyVYEt1sDYE058T6OxmtAMLwmmKGgM=;
 b=IigcAFSUVpNALT6tyBVkrB0/zpawzyi8gjmS1x+9AjocBxAlDrO0TAy16ShBWeNA3cfNX1FXgBuIYWRvWRgSIjHlMrr/8xb5gHgmd/BXOqGqgd4mSYHUM1vtbVxtXM+1KjvQgA5zkxKNLGx2WRGrHMAo0Qnau2iVRhIcQ6CkhhTegjnIXTNVV71gFjWUABIHqN02n+10s77ktagwdNWLXcDSa/qbxvqkmggtG/WBY+h9VSB716iAOg9x2c4Yr2gllJCab1d3/7wwHRLdUZnDRxeBBAJCT8RSPZunZelAwUsblRlXDbmksUbWN580wYL245udMB2AHM/RYM66VFfEKA==
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
Subject: [meta-virtualization][PATCH 3/4] cri-tools: upgrade to 1.36.0
Date: Mon, 25 May 2026 09:26:14 +0000
Message-ID: <20260525092615.742129-3-zhixiong.chi@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 43846e16-ce46-4c51-ed2f-08deba3fb0d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|22082099003|18002099003|56012099003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	xDdsaXXArPo8zvvKiqBJdw8+FjFAtPSCY3ypw7Ai6m2tN1NBvY7qNCljclq3cbIrIIs4eW6kNAIQbzNEe3SwjcWvXrePcwooftesFifEM3UU0atW5YtD0DYjBQWV90S3ltpBJsajFD3avk2ujtcO3V/aNtOd/WLVWotDXZIZ30FL5BidgImc1g+sfVMoHIo8Axlhvb70xJFz4cB8fkgsLMuYTCvdV6e09xHpvmpBqvT3IaNQ8yFelbfgLYjRm794DOLe7RKlbRye/q7qzK4uXCZZLrmeqwGyEJ7zGHFEiJ6TPhZAVaPrwnoOSH7IvKjoVMXwS/CusCwjmhaWv0/bJ6IK/fy6CmpScqySIIlASLi4lkE3shktXy7+i23qUqUe6rmkWj8AUKvoiFphdrhZNuX7kQCg1IzSw7F7kDs6dXsuWPrldQX1DlhGqiYHxfDOSJa4llfOQXi/48ct5Cz7nu+ONYOEhfPdvP1ISnI+d+8tTRaJqeTzvTLWuYf/2IOKJiYWBqVLChoBQXyYvuchVjmYEEYfdLJuBXLC5Ye8wsFJbOiR0ZZsb9cYMjW0AThidI8E+VVAHIa7Sxv0d/SP1QQUc708UDg5dcdTWtZCoH+qWod7WEtzt+a+tPdiw/gTrdy+HLDaUWunYB8EG8Qn9O7opOqTW2SrIjnWVhRpOdGavd7UAJ0sH4OkDG92lg2fwdnKDDPfjokket+9q3p0xA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF75D68BA1B.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(22082099003)(18002099003)(56012099003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WwDxGVmmHoO/hqSR0sX5D3/XnO6jJDyMF1tZCYZwXx38w/ZTS0eul8bwSdj7?=
 =?us-ascii?Q?Kfzy634x1PRjOKJvgbkwoLkM+H+/IX98W0vyRiYxUU1PPct+I3i4tYOjTMl0?=
 =?us-ascii?Q?grqsA12NSy/1XKwJJOBgPFb55RkHboWIC8neg+YnnodUBOOd7eDMmhUwE47d?=
 =?us-ascii?Q?rpRjNxd0Ys4DXc7NNzpO4RugcHLLriF9r0ist+vIGw1F6IYvBbrTm1X0u0vN?=
 =?us-ascii?Q?CHv/vbWqafsrjB+R4ctzrIOzD4eIM73yK6bx2dsxxzRuasEoNRfZ2l8UA/hA?=
 =?us-ascii?Q?Mbnhh0tIbUXTIQAEJRYXr4wuOjuevMdjqg2KpNORKC4ZN4WFGg7gZUNjCAqw?=
 =?us-ascii?Q?SU9NcZIVL8xnEjUMIauMoEFTFgpWoTxP8LknceEKGUdtHsAawf2fy67TKVA+?=
 =?us-ascii?Q?ZMmPxkBwHef3eo5XU7/php+w4ikb5d1w2L2NnkYaKa5OGCE9tQF+tvTV2Al4?=
 =?us-ascii?Q?kGUisHmUHF3LPIixz5ZxiHIokhrDBtZd56NijoGHlBNNsyNFcTReVnAjOt1J?=
 =?us-ascii?Q?vbF2cwizOyspJaSUnK7zVMehQz0tqGVNHmT8byCRBW0fZSH2OHKbrtZ7GfBp?=
 =?us-ascii?Q?OfU6Hd5vT9188f6tvh07vMvHwW7ENrSxwDbrbPbB9ZYnu7+Tqcwc/hb1vHGa?=
 =?us-ascii?Q?yfVc7m65T9Jx5iQFa2ME5rwF7is7uIRsX3SfcZpZI18bwh2ErckLvnD1q4CE?=
 =?us-ascii?Q?XUHKK8Jr6xFmPBUD42K5d+KQVFYrQ/AKrmw9jtpMrHpDWmGD1BvwltD+uw+L?=
 =?us-ascii?Q?Sl3Ex+4yNR7Sj/GupXgOyBmDbanPL8n48jPEIFopnu0zWEbVyZHLENCrMtVm?=
 =?us-ascii?Q?ChhNrKTxz3DgqDOa2jmQY/mt2C2UAI9DSxJtYYbqUaFydwO2GMOcvgtW8WqT?=
 =?us-ascii?Q?L/aq02+6JhS4bhFxl4bPvIdBQEk4+MUPiv4yDzQ+Bd0gzkMVng/aEsb345Nr?=
 =?us-ascii?Q?pgQwy4uBVOacXyhs5E+4GIzu/7nylwnPT1hUcLx4NaMj7bn/PJ0YdBZMyaWp?=
 =?us-ascii?Q?aUyQ7uLZrN4MjH7SBl79bj+E9aNqkj4NqUmeS/PSSmQaysHadEsQcc/qD2H2?=
 =?us-ascii?Q?A81cIRsqy1rKdBay1H5cw8v8V/1IPP1Kp1TynNzC/AYaAaoWr2UDmnBdxRUj?=
 =?us-ascii?Q?EPgfB3NShClCk6zcXxxdVu26vIZeVxN6m12Gl4wvRlLgk3SqBLB1CxIduQTp?=
 =?us-ascii?Q?9mtyqN74uMiitJ9zn9hDB4bWUVjgE8jFKZhZxEd87JCDxP3PIQVCTAONZlFk?=
 =?us-ascii?Q?SgZg3SFOsPjR5reohJeBozAk72ni9bKZ6lEnovlrepphezZipgOQXnHbjukm?=
 =?us-ascii?Q?aQvKV9KWOew+RK0w24nhorVgU1qoODdQgC+UviIpFZPavbvJ/XibBTnd8FEg?=
 =?us-ascii?Q?h6JgXQFPPhrbB19HTqALgvSDAz6lORd0i+2dPqx6jUUREyTEWQGrZthD9h/N?=
 =?us-ascii?Q?XKWnS1NJO1vjl3+iWxgbafZE23YSYJqPxiiQqs0E6vMCJAowHExhXjLieue0?=
 =?us-ascii?Q?PTGj2rX7CmD6dQIte4igT72o7o1K5tSSLw/B/+vN4qQjwjZcs2aITjLmRUPK?=
 =?us-ascii?Q?mzwF1AYPVMkgOB2FhQKTu4xq4EdnPHGQe/gjboMJcROwLgkUHLl0P22L/CII?=
 =?us-ascii?Q?XmAxrje5HUonRX0f9YNxO4hpy4Braqf64Y/7r7XjuU7j8Ug7XFYPtqJPBlPp?=
 =?us-ascii?Q?DKGxxHxmsDP4TclpMxZap+ZYjVjz40RfelJa4d7krrOcg48vYHOYYWw2B3A8?=
 =?us-ascii?Q?f7ANIboUlEO/WMNh+e2gf/uIbKD7W5M=3D?=
X-Exchange-RoutingPolicyChecked: 
	tHgXxQzkWL6+pTuBXro1CCHKhjGhfipbmp1mF1ueIA5XjR4M1Zp3pJn9wNaIIG9jFx59uQByBLusQcxg1pWBEN6DhcXigurGvRZRj3reaHdKpiq8LQKvOVHpprEU3iFcO0EoMGS1QFPsPCRLwndTwY4Wq9P8J6XbdvS4VjGurLosXCJ7RUD5h85wT9I0l0DOZCfvd7BW79NzzIm1LnbKuYvcF9O4AzuLGwr+T+N31SKN++x4asvh4//ESoAxb/2JrSZMlglfxtrOvT4W9r+SK5U3ofHTGv6pL4ez0zUMdhvN8CrPsmodDCRG4qkYv0GAr1u231G0PpKfzh6KZqoiKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43846e16-ce46-4c51-ed2f-08deba3fb0d9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF75D68BA1B.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:26:24.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h5BdSpiPnpfnkwLejxPxNXpGW9V7uy3l7k8laoah2fE89rB96OKdI9soi8RuFYnJrcPihOGHQ7EvuoWsf5Edm/TgbhgW1Rm7zbNr+stwbJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-Proofpoint-ORIG-GUID: Y0WE4Mz7XERZuJHPvxYkIlL0AtZNz9aG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NiBTYWx0ZWRfX+f52JbkeWxzF
 wS7igdmXTIwXRvHm4fSOEyNc+u4kE761Mqq7Er7usMT9a9qYb+xtg1QoN5M/9bEw70mgBRL0QUr
 LuAgwdEHYOBjGauL3z9GId/WgaY28b60TZDEuJoUvE/V0hGL/RIzeLND+JZ+cWngyNt5dNmXghl
 q6lNyIQqPuhoZz+m+6/Yq8hYnSKzi3LVOy2OWHmSIDUkOUT7Y/CAjCoielUBwBQZjXZH2FXu1jh
 Ak6poVPnjLxAJue1hACFMjavuV/Mx8BOt1LceOB9/tz2OBrGjp0IrzbdgQAeErEDNuIl2NsxzLd
 3XmDja/1u4g3l+S6E2V2so5AjOj9xt5CLtsQIjscDwDLVi6GqjrGYpMp9a5H/cKE2l9B+ve7GAT
 32ekSlU3cWSR9wHZc5eebgWUD1pG3EY5KE7CMYLcUtOFM30cO61r6tvmAsogAl9pe/VByycph2c
 mL1oxbrFL1vuW7rjuyA==
X-Proofpoint-GUID: Y0WE4Mz7XERZuJHPvxYkIlL0AtZNz9aG
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a1415cb cx=c_pps
 a=jCeAeT6ZWnoYcCLLvvbvuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=pM9yUfARAAAA:8
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=3JueAJEtnetfFf-77kkA:9
 a=YH-7kEGJnRg4CV3apUU-:22 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9805

Bumping to version 1.36.0, which comprises the following commits:

    82f28d67 bumpo to release version of 1.36
    a846c714 fix typo: intead -> instead
    3f28b1c4 Add SergeyKanzhelev and tallclair to sig-node-approvers
    58a1a780 Bump crate-ci/typos from 1.45.0 to 1.45.1
    31b19db9 Bump actions/cache from 5.0.4 to 5.0.5
    507358f9 Bump actions/upload-artifact from 7.0.0 to 7.0.1
    3f90c7cf Bump k8s.io dependencies to v0.36.0-rc.0
    27c856e8 more gitignore
    30434d06 bump go tp 1.26.2
    7d5c1228 Bump crate-ci/typos from 1.44.0 to 1.45.0
    aad688ce Bump google.golang.org/grpc from 1.79.3 to 1.80.0 in the gomod group
    af533d44 Bump actions/setup-go from 6.3.0 to 6.4.0
    ffa8e166 validate: add KubernetesPodUIDLabel to container attributes test
    bdffd30d validate: use subset checks for labels and annotations
    661c011e removed deprecated TODO
    746da572 Use k8s v0.36.0-beta.0
    c98d29d2 Remediate GHSA-6g7g-w4f8-9c9x (bummp jsonparser to 1.1.2)
    58323188 Remediate CVE-2026-33186 (bump grpc to 1.79.3)
    d2f54006 validate: add conformance tests for attribute preservation
    a8b6fcf6 Revert "Disable runc integration tests due to AppArmor issue"
    c633d342 adopt the latest cri client
    76ce604b Bump actions/cache from 5.0.3 to 5.0.4
    5077d436 feat: add prettier validation to Makefile and AGENTS.md
    43768b05 crictl: replace utilyaml with sigs.k8s.io/yaml
    3866e388 Add verify rule to Makefile
    cdd3d738 created a local copy of AggregateGoroutines
    14a98847 start using k8s.io/streaming

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-containers/cri-tools/cri-tools_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index b2706311..0805e7a2 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -16,7 +16,7 @@ What is not in scope for this project? \
     non-exist on the kube-apiserver. \
  "
 
-SRCREV_cri-tools = "16d5673873fda6d333f8411778a35f5778998680"
+SRCREV_cri-tools = "88d8ad9d40f82726fda53c2d271e6172b4c619c9"
 SRC_URI = "\
 	git://github.com/kubernetes-sigs/cri-tools.git;branch=master;name=cri-tools;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://0001-build-allow-environmental-CGO-settings-and-pass-dont.patch \
@@ -27,7 +27,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c2
 
 GO_IMPORT = "import"
 
-PV = "1.35.0+git"
+PV = "1.36.0+git"
 
 RPROVIDES:${PN} += "crictl"
 PACKAGES =+ "${PN}-critest"
-- 
2.53.0



Return-Path: <zhixiong.chi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A3BF3ED44
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 10:19:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.189319.1775902731799998616
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 11 Apr 2026 03:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O9251InO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=856181f2f5=zhixiong.chi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BA9d7I1491964
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Apr 2026 03:18:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+/SSTVp5vZFZf1EMoE81
	NvmydxNi/gKQ/iX3iuQsTv8=; b=O9251InO6CmQW4a3Zj4wkCQuwFFiUCr9vCqL
	n3gMn4mZFsShRwfvJF6utn+s3uEeByQeHBISPCS7Wjhbfh0L9i3dnwhKHqWicDGh
	X26enoTDZ46xWi+6xIHGWyK6kKoEAlAHqxT9g4THcQG1ny7PDJq17MuiulUYlHWp
	u0E0kyX0e1gr20ssOrMU4T6BBynvTulQKmifuULGhgCpDMBE7lt59D8x8fznuVjF
	dc7Ibj1wb9JoE7l56TX9mV3jj+ymUnpwaAu+rxhg7wIDwTpp/KLs1m0MyVWATnUR
	8ftwRnyXmP1H5cF3Fq/kB/zIFqXokkgWwK3KW/7HMS+2QRmX2A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dfhk2g2un-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Apr 2026 03:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHT4uGx5TAX5JfFt16Rx2oI5MwmaKRjQLe9qW2Gi/A/gd3uzp3VzJZgYdJs+pWOhU0JHHNWEhKpPltQwT+4uLSWwCoI6gTTBSoqEvSRWhlUqIyPEjIRXmQ1wIZO4rwRDSc5vWRnWJSsBeG/XDcvN43UgkQnE2ii/yDPjwJt31DlmF9xRRC5SjFBnc446fmUER3kNHgxSTnQwW0+0EgzmLgIQck2KWEsOWAD+tDC2FKsfbHHt5SJjaXLE0Np0VdT9uqD7A2/yLyhDexolGh5w22sCgVS5h025l9tsbLgTnAW1Wgc1qYfRJwlOQ5983JQhJLchmSbphYWGR6NxMcudYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/SSTVp5vZFZf1EMoE81NvmydxNi/gKQ/iX3iuQsTv8=;
 b=bjxLZJt5JdPSeGR9asWD9invAaLohPNn+fWgVGrjum5wHUYMcH0C1MsIieD/uMUx3GlfIGJWl09QUuZKGjKCCP2pFu/4NMewYZNlt5xOdtdm5ztL8oSA14ixBGu+fokipr5jB0/CAWEnMsvbBYSvpX1OtueNubkIME3OPUSE/DYoXd2fJb1+Ut4NkE1YSpp1lLok7ctrYOMm2VqHbh38NPiAM5szprcLGbHA8bHsnyilqFY1mZ+FKclnpiSryY+1muMbz1uToL3wk3WufBv/dlE+rGEq1iV2smgxJRDyGa69RWNpUu6s5kwlRTBGDXISjSKkkeyRzieefr8Xl3dPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0SPRMB0094.namprd11.prod.outlook.com (2603:10b6:8:1d3::10) by
 CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.42; Sat, 11 Apr 2026 10:18:49 +0000
Received: from DS0SPRMB0094.namprd11.prod.outlook.com
 ([fe80::ab67:3026:77b:255e]) by DS0SPRMB0094.namprd11.prod.outlook.com
 ([fe80::ab67:3026:77b:255e%3]) with mapi id 15.20.9769.004; Sat, 11 Apr 2026
 10:18:48 +0000
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/2] libvirt: Drop the deprecated workaround
Date: Sat, 11 Apr 2026 03:18:41 -0700
Message-ID: <20260411101842.3462555-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To DS0SPRMB0094.namprd11.prod.outlook.com
 (2603:10b6:8:1d3::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0SPRMB0094:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b1ca1de-e5a0-49cd-4f3d-08de97b3b8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7ek/+iXsmEil/WkXVZ7jmMLCZqq9gms5Xf4mkZ/FnOsIy8VBse/QR6ygQs6M5THKzEWhwN2VsQECPLRXrykoZUUAHgNKwymGBPEUOaIKFt5hfmYp2CMeF+8dMj6dPv23HuVRrdCOP0TmRHG6FljbRRDBAfFIY3Blt7PjI20aFCSTV0Ex7FB5qsODaIJMQybB1dxAVpTVgoYvRzk6sXIvrJ5mJDdSWUgHco18aWOzh7bJCogzqxK3tmD4QntVlsAQxFkyHib4cPY+YmF8VHPQttfsP+66ry/EFPMWFJ9z16kQtyKkBytwejxq0/bNf7oC86OC7OaRxq39UX40lQ7ao0pk+n5Bb8x21XjWqlLmcMRc2/JWSh2ble10BeuScNRVHMbT4IR70Kahu3PyBiV4N1qKqiapqk2bFW4qZI347v0qgFT8ieyFcv7mGvHyjmKvM2A5UB6GP4oyQAafHc3aMb1W78v81SXaO6oUGwESZ1xRo0BGHU67BxnQG/ffAnO64V6SAzCrXeA6vx826JnfvwDd3FqzNXlXL7uyq+vpdWvFjOprqUI3FZZHd5lDxVmRPZrgJzG5AlWc5jn5/dihFZPDGg+D3/LIymhp60XvAF8Zsag7ZwtMRjLJTcXCt6wl4KggTtjybNdLWXWNhDJIbGWf7hckeP7tVyIhJs1P7K0bYBS6mX9YUTKlh/s/qcHjqm91vDUS5WpDQ5XWWfj83ESQGTCUf9Y1BJ3t7YmNrDyABT+IYKhd6+EDjaS9a/Gcbcs1teZtNwqTGYA1fKk5zyYW80No8MLrwPGvWyEj+Kc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0094.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IUVX6keOfk7PWUv3m9Yc0kcrxNUzYvT7iq4lYfQ1x6CK1sqlRi5d/gTUXpCS?=
 =?us-ascii?Q?IbVnsNUAlugK6Tn2h5lYdhmlCy8OimxFh6f1chyVHcaFQn8ZxOZtbKmdwVKZ?=
 =?us-ascii?Q?ktWJXWsckuryk784LSE+kZtabuGWe/fcNWc+RTs7ZoyXGDooQl+kBxHPqkY5?=
 =?us-ascii?Q?uCxTj3UIqO+/tIRQFqTnKZbjRZ2ndTfGE6Gf2ygLdq9TBwOPI8PbaoMO4ZOD?=
 =?us-ascii?Q?wjaFuC1GoCqSlE7SvxYdI7fsa4c3isuQfWNvDX97ZYDtiNk3xLIDAouvSfOL?=
 =?us-ascii?Q?l901xFjAWzsNK9YSN/wjk0fzpBPwUwBqyDeMgCyLNrZqhgq57zlR6TrlicSJ?=
 =?us-ascii?Q?PrpgmCeSmorjimo2vUUamOMFf9PQM0VveSd6iAJ59Cf22olAIHKQC1HZKEcO?=
 =?us-ascii?Q?h4ef+WCfS25m1wPmVWmZm1Uluur/B/1y/pK4wLgf07Cgf0nSoTSA/t7lnQ7e?=
 =?us-ascii?Q?k/oqAVO8IN63AS44hq8bAZg7m5YQh/5VlwO1h6Y9TBNXoPxHai8zAeJNadKZ?=
 =?us-ascii?Q?/lGsXpGFwwPegud3a/3Ilf33W9G/wZRmnbG3qTPZ11A9AoMmQ0t5VnQieb79?=
 =?us-ascii?Q?oAxOd2fASlEj4wY6QAw5X2A6uPX4JpHvRVQA7IpIIlOBWOYPrzifIx4Sst0/?=
 =?us-ascii?Q?E7ukr1vWTbrcqTHWo56fF5cNQn7Qq3PK3McSTp9vBIBjWiO9n0Sw74YIXA/T?=
 =?us-ascii?Q?/aNozhctuO2GYl5ULQ2ooH60YzYagC9nEZdh84C+UJHtZRqLO+j9gZpT4WT/?=
 =?us-ascii?Q?kbt2lrN3PcDETC7iTtVClN03ENDyBMeOUgsM2/WCxOu2tmRIAAR0xkU91329?=
 =?us-ascii?Q?/Pd5Md6Nlzb/S8l7HXBY00MNrpMxEoKUQrRvN504SWLuUL6Jip5nLJxPecKu?=
 =?us-ascii?Q?R1aE5ECmxZktMICHRiOBTtxZ5ZEe9rP5ZJUBDtX1JqBTPjU2eZAjRDrVpo0J?=
 =?us-ascii?Q?duY+zDZOvnlG4hegTeBhkEdpybOSzZkrFd0KvDHFsg0M4AE/NNktYTwTRqk6?=
 =?us-ascii?Q?VjqBXeLr/iNNvHSzHg7aj0JNW261+Cf+faAfy45PC5DQwye4lNQxTycNWZwY?=
 =?us-ascii?Q?w9sSK+jocWXI5zhgoVIpN9jBmYHIhUgRLQbRjnu1155nDB7gIE8GJ3L0xMjo?=
 =?us-ascii?Q?ysHTZ86cduj7je0t4Lg64XrlINwqKhVQBXtqs+0y/sv7U20v38qgO6baMti1?=
 =?us-ascii?Q?L86/lm827DmLr8DE7Ry5rUkIqXzkHMZttH/o6mcrfRrBCr/DJ/PV82OrSxCU?=
 =?us-ascii?Q?ZzQvzY/HsoKkafnu77Cag3zl98bSpSUuW41mDKFPa92Db0Yw1d0N/pfavr4p?=
 =?us-ascii?Q?xvoLgDsW6RqLfaCZKM4v39y9SBRUxecFKo3b1SxqRQmGVmnTJ1YztqeYhhav?=
 =?us-ascii?Q?tKUjSOK28IPADNqljvupai4yeMpYnQLgy9xdUSqcvNSZHhLPNd+epuA4cPtf?=
 =?us-ascii?Q?yPKsYBaNcY61gku0J2XtvdxVVz6xJfMSXLtm/9LiZuMYApMhzWsWBt4w8hWc?=
 =?us-ascii?Q?hMTPMwCqI8McjQCJTzxxUMyFeYDUGhnKsdkW6qIwupAMdlwsSs0bAC503v1C?=
 =?us-ascii?Q?fk2rp9XkhlVZQvToNvBESNGMDAY5CgfdTavGgu+45EZKX5vUqsCFht1l+fKY?=
 =?us-ascii?Q?7hSzhQH2xr1WYNY7e6HcwWeAbrkfaSxkVHJLFOTLT35j8oPte5P5gVKARheS?=
 =?us-ascii?Q?/8oDEyTR8oGeNjzfpkmUpY61xOlTXcFN8pQTX/40J62QW+YVk3sWJt6yl5CU?=
 =?us-ascii?Q?K3pyel+N0q1+1J97vltzLRZjmrxNC2w=3D?=
X-Exchange-RoutingPolicyChecked: 
	LipzJLl0i0rBwCbnJgwbJeR6vkTHMYPLHO26en3yz1Az7uvig3KA1korYDwa6NwWuN8+dl65R2r2GOILTYcDh/zt+e7UtN6gxhVXGAY2VNOv2mA3+S5gPTaJveJ18qbYv7QQQ6DiEZAY6PK2EOIxODmBhndSmQjExJDi2ItJjwodYvrFdAcDfEfmlnie2rIjQb6NkgTqMWKXb7HI5SP0UVCC/Gjx9nsdRpux0KePOAnevuj0QTnWF24M0KZ5nBtZIcV4n3EVtlHoXMmzK8Dbxsi67zzOnr72Dv4EtxhW8rNUY34oReaLVyoHcSXafDxpviho8mB4zwC69q8UPF0Z7Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b1ca1de-e5a0-49cd-4f3d-08de97b3b8c8
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0094.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2026 10:18:48.9053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOYTZIEj/57RgA1vgpwGvvN44S0RNalbuYBVxoEi6aQlGm1v+ymzTjwvsin0H6qLDaE3DL0ehRCFwcADYauqGrmeHHP5CbfuLxk95Z8Ckog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-Proofpoint-GUID: THl2o5b4-qgfBPrx9WZhAFr0FmN13PVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDA4MyBTYWx0ZWRfXxcOLw1zEV0CS
 8Z52jkJh6l0rfLF8VXicTAi2aMb0J4i97Bu56QqfRH3G2p/dKSG8xcA9/QhA1bq1WaZ3/9qwDBv
 dMsl1W+kee8K04YAytmLqEHBpFCxafRqDYl6wxZy8CsxFToR1qP8GhNlL5dKFG9QdVDJ+8pgiE+
 ZZRiSAMuVCuzPpln65XKaIX0dV3WjHxUo7dV529cmWQcEuHckglDOKgYfzqarvIrQzbJ7u9+0yC
 uifjUS0JVn2BFOuvbkM5bSDMmMgovMWf1UhdxnoCUXJfHgcthUrh/oCVH1gBU5Oe62svs6b78Gt
 an9Yt/8BufQ91ILpfNYSp4GClUsT0mU7vGGZNAe8/eFN0RfQ/093Ab7y26TMfI2csF8OcTNvacu
 0ICzn1LjiZz4vBYhWpVRUFKZmrwkL0qCa5B01XIHHfUs/vs9ananDZOAE3oor9OHh0vnXUFNSYF
 MNteoSqw3jC2KbK93Fg==
X-Authority-Analysis: v=2.4 cv=A6Jc+aWG c=1 sm=1 tr=0 ts=69da200b cx=c_pps
 a=WlRzkYvQEyJpYq9ouSSplg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Af8U0KNYMA4Gz94ks4YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: THl2o5b4-qgfBPrx9WZhAFr0FmN13PVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604110083
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 11 Apr 2026 10:19:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9693

The workaround is not needed anymore as the systemd supporting.
The libvirtd.service Type has been changed from notify to notify-reload,
so the final Type will be 'forking-reload', that's invalid for systemd.
Here we delete it to avoid the following output information:
>/lib/systemd/system/libvirtd.service:29: Failed to parse Type=forking-reload, ignoring: Invalid argument

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 recipes-extended/libvirt/libvirt_git.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/libvirt/libvirt_git.bb
index 7552ed44..fbee9c5b 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -225,13 +225,6 @@ do_install:append() {
                 mv ${D}${prefix}/lib/systemd/system/* ${D}${systemd_system_unitdir}
                 rmdir ${D}${prefix}/lib/systemd/system ${D}${prefix}/lib/systemd
             fi
-
-	    # We can't use 'notify' when we don't support 'sd_notify' dbus capabilities.
-	    # Change default LIBVIRTD_ARGS to start libvirtd in the right mode.
-	    sed -i -e 's/Type=notify/Type=forking/' \
-	           -e '/Type=forking/a PIDFile=/run/libvirtd.pid' \
-	           -e 's/\(Environment=LIBVIRTD_ARGS="--timeout 120"\)/#\1\nEnvironment=LIBVIRTD_ARGS="--listen --daemon"/' \
-		   ${D}/${systemd_system_unitdir}/libvirtd.service
 	fi
 
 	# The /run/libvirt directories created by the Makefile are 
-- 
2.49.0



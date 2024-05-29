Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9015C27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:31:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9637.1716975117641086206
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 May 2024 02:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6879a5a475=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T4ErO6029707
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 02:31:57 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ybb90buj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 02:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwRIYSjXUSzG1LLH7hYkqYmKccFbi8ceo+x/Tfm9ilGYONOuYB3TYEWyKR5Hh6Ck+skPFVdWZM3GJFMpRAA5MrTLEMnMyU1pZWctAyHOO0deZzsuK4NRRKBDWA8Xq1he1n0f1jnevyYzRgbNL51Z7e8ueeLCq5c01gSBE9AzbB4EXbKnE/RF1ugzJ9MWsQBWSo4Or+vUJTQS/HFeD2KUX6nB0TVxC++/pQh3CBKQARyccPEZ2juR1kYYr3m3dDetpw7baJm6/dTF++UkJcGkxqmokgmIFwEy6fgg214qVbnPsmEbtfR7VGvZu1xNPjs0nnMKAfiEVLNBdiXZQ2rS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sa9J3lKuTecrMz0W9efLt8VX+fvZ6Zy2G9QNBlqhghA=;
 b=IOh8GEkP2qi541mjkzIrtLKMPUCvmeiXssNhp3JAKw39tliM7W8akeKABNxWpDg1TLa2iDq1h35/a6YwLDuT593Px6ZzzdSyoHOd1IPPA8R82fk/pwOGQ12jgONtXb33S+AelIOJS9SpF1mfs4UNr+8ZVMNR4a9Wp5LvM3PMNaFrhGqNzGlqEBnLSdTrZsCicOsvezGXT0I4aZrYb13N08/RvWx8r0jfFVGXIOrzl0rYEWPfyNPWgjr3fPNm14eX4CHJTTIr9T2//hPzK3jRZG/PnqE5f53IK+kpjKoVZY/dEPezMoBm8+f8Qbs2F0agYX2zMeWiPgVut+z+xe/9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Wed, 29 May
 2024 09:31:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 09:31:42 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 1/4] meta-virt: adjust for UNPACKDIR and GO_SRCURI_DESTSUFFIX
Date: Wed, 29 May 2024 02:31:27 -0700
Message-ID: <20240529093130.72277-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.45.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f195d04-8a58-42d0-337b-08dc7fc2260e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|1800799015|52116005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?95YfBw7PDVFGdaDsJfwGJLnxDQ26t1/JDcMQjvCIhA+OO0l+U1xrfVRjoTTx?=
 =?us-ascii?Q?cSf3HlUdtJK/CapFjEyDXruP19ak/1yuo31xEz1Do++moFlKqm9jZOctj00z?=
 =?us-ascii?Q?yWYPTBZfMCL/776BllZ/tg7CnlzE00T773WmopIi51g+XqZ3vUMGSye73mak?=
 =?us-ascii?Q?I0aBnI+tSyG5ZF7McpwoitXfgSw4OL/QQBDJmdd8xIcK5abt4uS5XfgxK5GP?=
 =?us-ascii?Q?qjZFIjqc0PXKCNRWacjJlPZsPxketYiGNkgjpBd4yJ2YVkW94iH+7qv72fy/?=
 =?us-ascii?Q?N4VYGvfSg/9AP64y1ecY8JYAfHnLet+EgQvKmoyLEUY2ubeY38lqP1Cl4xGo?=
 =?us-ascii?Q?ephX8PdhDuDt9bTpqgkIVn0L0EapRNmtPltCwx1vPRwzcOMeZfbA1aanzali?=
 =?us-ascii?Q?KGJfezbu7k7UyQUvHtvZJFSdNwFM+Tvf5Se13BRpgW4rWJZ9WD3zdm+XuFlI?=
 =?us-ascii?Q?JpGL1P/ytH/7ujSE53v+DdosXJhGIrDynYRRScEJJaSSdgkzLj6lWA0DEJpj?=
 =?us-ascii?Q?Zip+qRyjWiqwN97PGuHU6ktq+9cKw9WDoks+PpOsxbhRNR1aJOOSVyhtCUcK?=
 =?us-ascii?Q?5mIgFteF4lNUtwgrUQmvh9Cjm2UkCJjAW8b2+6zuWYAiMICIWpxflaXd6t9f?=
 =?us-ascii?Q?wb9EGFtH0yeJWhKTKZR1fKK3nO75KsoYrafOH5r0bgVodu/196bvslTPYXT0?=
 =?us-ascii?Q?LvDpupIpv0lQk7IfO5fdF9iNr74YycM7JzDnkwAAMd65dYca2g0gOf9skrYH?=
 =?us-ascii?Q?A/BObFPh5sefGBnvGg6h0+EhXnh/mfQ+m5ssCwNd5MxQgHkSOBTlR2Ei10hX?=
 =?us-ascii?Q?DueNcnV+MQkvMDvL18flJc3m92b+sk27tsqWHXeOko0Gdi26eyOrHG5PPz8K?=
 =?us-ascii?Q?FURcbhH8Fxy1y3EUi3ikvK8fpGUdTTFBDMT66kmR+c8bsAwfY7B+i9gVYlGJ?=
 =?us-ascii?Q?in/YV87fvGIcPfdSxAFTgSuJpQtqaOH1kZsNA0ibJrUCqYxb4kW4fQPEh5FE?=
 =?us-ascii?Q?mlKu/hVI38kkVJl3vCDnkIoaiEIHl6vwY/FnfiuABDv54kMoRSKI91Cbg0+h?=
 =?us-ascii?Q?ubxFie3LOl70OhVf9uDCzoVOstSe0veHHkCxSYRa3NmhNY/gYELQMu6LU1Qz?=
 =?us-ascii?Q?SOfFZ+HuiIyCY7f2PnAuGCLaHgZqoDBwdgVeQETO9Fw8FWcP6TjFqCjRk1Fd?=
 =?us-ascii?Q?z1QP/KdeZlAzfFLZjDRch9VeaohE9Y0mhj4SBpToNvltURr0XzdcAFsnpGUK?=
 =?us-ascii?Q?3SNZYx17LQ+PajIw1NnXpSJCTq8B7wnq3Z3h9qBwMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GTsD58ypsuSQqf82xsoJIqPKvKYN3iKgxiYcTmR5cOty8rIR9jNOG9E/3IN9?=
 =?us-ascii?Q?mzzNOawxLJd+YWcqC2AbuWVWhvfNF1773gB9QKhI5OkA93VdnkyK/iWpmEBl?=
 =?us-ascii?Q?L7bf7qNRyJd7+I9+dOEK8i9f/5NRz5woSbV7i+rhv+eilXcwmevNJSvgQJzQ?=
 =?us-ascii?Q?C37A+gITfNU00zgZUqpGppL1K8lAw8FTDCAZeEBa0WwdSLcreiehGinO0zQ0?=
 =?us-ascii?Q?jWypDJqew5X9dELS86mzdNLHZUVgSPCOxGg7UO4RnFT9HVjC7H2tpUMla4Yl?=
 =?us-ascii?Q?cckUB8TmkhtHVy8/7zoWOZ5TmowG58fC5LbvP4K2wG7MA1KrMz/WFZeMrfg3?=
 =?us-ascii?Q?roSYtgLNOS6fxPN12cPfqzMrTDEy0DTnrEm6sikgxyf27vR8NWxZaLPKEKhN?=
 =?us-ascii?Q?jaR0TEU6uVkmetzbLzln3Sw4ugsNZaGGz9QEIGHg+U0jmnZ9S47/Y5T1dryU?=
 =?us-ascii?Q?6V3njZQ2Q6bWUn/Rpg9af7iKlWtNsuKid9Hy5LMvrc7Kc5MG7GyhX04SV9/i?=
 =?us-ascii?Q?piwTZvQsJA5X0Jy7ZkwG2UD9TJiO7lRD1zpK2EtAtMhs1oQYJfLTW9bzVjFX?=
 =?us-ascii?Q?ddtjndg6IBFu+YAUfxzM1KsCaVj9qqujgpinL4SBc7Uvt70nuFDimoiaLDQV?=
 =?us-ascii?Q?w+Khpw8QThzAX4vKpSW4kzuMh+0eZuVlAD08o75w7fy3m872dAoLL/JYC2ou?=
 =?us-ascii?Q?i/zDquzcGAIEVrYtSUnLF1KYlyX7rlMzCdy/rlpDMs9TW5cUZXnSpvlXzy6v?=
 =?us-ascii?Q?hwBD9WkpizNtOWMdIJxBpeNyFx6DBgKy8zkZPD9bW0BfeTygizYwmSb9C49a?=
 =?us-ascii?Q?UIo/5BlPS2OInn1oAh9ham9eoY4a4cG77Sd5wUBWCWbP1TeVoY24XgZ0H2YA?=
 =?us-ascii?Q?uysh2XosmKtWoZeA/szWptDB35POYRzSGaepcj3Y6zdebjGflVvYhmONpyJA?=
 =?us-ascii?Q?wG7o6aT5PygT20a11L1ymSgEgeOK4qMnQtenNp87DM99Qp81HAc01dl/+Nvt?=
 =?us-ascii?Q?gjH0JpgfcOQnedhVb5TyyXLgnfuGXRZrtHgAe5dkiUg+UjZ1df++QAoNDkH2?=
 =?us-ascii?Q?VcFwWuKo/QZ6ZUU8ZNPpN1A4eWP7v22JzGHeUaVpzeePQOTMNvYvXnsPBAMz?=
 =?us-ascii?Q?0pyQw5zmtGsluRm/P6F54iuaTjdTWWllva1PLEOJVBwbnDM7Jt1/TcTbDSqC?=
 =?us-ascii?Q?rUhyeGjtALna5UCimnECrdXhdd82+K1J63o2bgh1e++Nk4oDYGB0jlzjr0O7?=
 =?us-ascii?Q?5dyPPex5ZOl4XA9iHCkSG5XxFc9DJgic95mvzhcCWmn/MW5Qt05CGH5RpY4V?=
 =?us-ascii?Q?+upK8F13emtaDHlObYfOvDqFHbazOLDj7Qgtaw8BV0lqXTJd03BtgPKBBsOx?=
 =?us-ascii?Q?Q+8FyWQKFMa4agcO51KSEu2juF8WrsESs57OfwKLyxkMFBBQtriQYvp7VgmG?=
 =?us-ascii?Q?xCZkgRG0P2HDYhPmOAgvDBcv4fE97e9nwNmQu3Thf0lmCgWtQytTR1UbMmqp?=
 =?us-ascii?Q?1L2Mu3CfcmKzVS/kE+nRtYDEz0eMJ85cbjjqiT7ntg/ry5jSx0bKrLxXVJ/O?=
 =?us-ascii?Q?vMjBIjqYZK1DQv8mBZj6oo3o0jcnifS+HuC2TDzQxWlDHZAqhtLV0egadKlN?=
 =?us-ascii?Q?kw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f195d04-8a58-42d0-337b-08dc7fc2260e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 09:31:42.1696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5sT8ijREdIhEs2A0n3DLfRHyj3BrjAfefhDdiL2fLLW75fqthZv5sZWG3jR2SFBqCb/Un2X47mv36jJXu29Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-Proofpoint-ORIG-GUID: IzouHhw3mhitbTI-OlfplY7u73uP-B_i
X-Proofpoint-GUID: IzouHhw3mhitbTI-OlfplY7u73uP-B_i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290063
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 May 2024 09:31:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8777

From: Chen Qi <Qi.Chen@windriver.com>

The patch is generated by the following commands:

  grep -rl WORKDIR * | xargs sed -i -e 's#${WORKDIR}/${BP}/src/import#${GO_SRCURI_DESTSUFFIX}#g'
  grep -rl WORKDIR * | xargs sed -i -e 's#${UNPACKDIR}#${UNPACKDIR}#g'
  grep -rEl 'inherit.* go( |$)' * | xargs sed -i -e '/destsuffix/!s/protocol=https/protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}/g'
  grep -rl destsuffix * | xargs sed -i -e 's#destsuffix=${S}/#destsuffix=${GO_SRCURI_DESTSUFFIX}/../../#g'
  grep -rl UNPACKDIR * | xargs sed -i -e 's#S = "${UNPACKDIR}#S = "${WORKDIR}#g'
  grep -rl GOPATH * | xargs sed -i -e '/GOPATH/ s#UNPACKDIR#WORKDIR#g'
  grep -rl '\${UNPACKDIR}/git' * | xargs sed -i -e 's#${UNPACKDIR}/git#${WORKDIR}/git#g'
  grep -rl 'toolchain.cmake' * | xargs sed -i -e 's#${UNPACKDIR}/toolchain.cmake#${WORKDIR}/toolchain.cmake#g'

What these commands do is:
1) use GO_SRCURI_DESTSUFFIX to adapt to latest oe-core change
2) avoid absolute path in destsuffix
   This will unnecessarily create ${S} diretory, causing a chaos when doing shutil.move.
   The unpack codes in base.bbclass remove ${S} in most cases and then does a move.
3) Use UNPACKDIR to replace WORKDIR.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb  |   4 +-
 recipes-containers/buildah/buildah_git.bb     |   2 +-
 .../cgroup-lite/cgroup-lite_1.15.bb           |   2 +-
 .../container-host-config.bb                  |   6 +-
 recipes-containers/cri-o/cri-o_git.bb         |   4 +-
 recipes-containers/cri-tools/cri-tools_git.bb |   2 +-
 .../docker-compose/docker-compose_git.bb      |   4 +-
 recipes-containers/docker-compose/src_uri.inc | 372 ++++----
 .../docker-distribution_git.bb                |   2 +-
 recipes-containers/docker/docker.inc          |   2 +-
 recipes-containers/k3s/k3s_git.bb             |  16 +-
 recipes-containers/k3s/src_uri.inc            | 860 +++++++++---------
 .../kubernetes/kubernetes_git.bb              |  10 +-
 recipes-containers/lxc/lxc_git.bb             |   4 +-
 recipes-containers/nerdctl/nerdctl_git.bb     |   4 +-
 recipes-containers/nerdctl/src_uri.inc        | 270 +++---
 .../podman-tui/podman-tui_git.bb              |   2 +-
 recipes-containers/podman/podman_git.bb       |   4 +-
 .../kata-containers/kata-agent_git.bb         |   2 +-
 .../kata-containers/kata-proxy_git.bb         |   2 +-
 .../kata-containers/kata-runtime_git.bb       |   2 +-
 recipes-core/kata-containers/kata-shim_git.bb |   2 +-
 recipes-core/runv/runv_git.bb                 |   2 +-
 recipes-core/runx/runx_git.bb                 |   8 +-
 .../helloworld-flask/helloworld-flask_0.1.bb  |  18 +-
 recipes-devtools/go/go-build_git.bb           |   2 +-
 recipes-devtools/go/go-md2man_git.bb          |   2 +-
 recipes-devtools/yq/yq_git.bb                 |   4 +-
 recipes-extended/ceph/ceph_18.2.2.bb          |   6 +-
 recipes-extended/diod/diod_1.0.24.bb          |   4 +-
 recipes-extended/images/xtf-image.bb          |   4 +-
 recipes-extended/libvirt/libvirt-python.inc   |   4 +-
 recipes-extended/libvirt/libvirt_10.0.0.bb    |  30 +-
 recipes-extended/nagios/nagios-core_4.4.6.bb  |   6 +-
 recipes-extended/nagios/nagios-nrpe_4.0.2.bb  |   4 +-
 recipes-extended/nagios/nagios-nsca_2.9.2.bb  |   4 +-
 .../uxen/uxen-guest-tools_4.1.8.bb            |   2 +-
 .../virt-viewer/virt-viewer_11.0.bb           |   2 +-
 recipes-extended/xen/xen.inc                  |   6 +-
 recipes-networking/cni/cni_git.bb             |   8 +-
 recipes-networking/cni/src_uri.inc            |  26 +-
 recipes-networking/netns/netns_git.bb         |   2 +-
 .../openvswitch/openvswitch.inc               |   8 +-
 scripts/oe-go-mod-autogen.py                  |  12 +-
 44 files changed, 871 insertions(+), 871 deletions(-)

diff --git a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
index 87619d01..f1d3189d 100644
--- a/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
+++ b/dynamic-layers/raspberrypi/recipes-bsp/xen-rpi-u-boot-scr/xen-rpi-u-boot-scr.bb
@@ -17,9 +17,9 @@ do_compile() {
         -e 's/@@KERNEL_BOOTCMD@@/${KERNEL_BOOTCMD}/' \
         -e 's/@@RPI_DOM0_MEM@@/${RPI_DOM0_MEM}/' \
         -e 's/@@RPI_DEBUG_XEN_ARGS@@/${RPI_DEBUG_XEN_ARGS}/' \
-        "${WORKDIR}/boot.cmd.xen.in" > "${WORKDIR}/boot.cmd"
+        "${UNPACKDIR}/boot.cmd.xen.in" > "${UNPACKDIR}/boot.cmd"
 
-    mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${WORKDIR}/boot.cmd" boot.scr
+    mkimage -A ${UBOOT_ARCH} -T script -C none -n "Boot script" -d "${UNPACKDIR}/boot.cmd" boot.scr
 }
 
 inherit kernel-arch deploy nopackages
diff --git a/recipes-containers/buildah/buildah_git.bb b/recipes-containers/buildah/buildah_git.bb
index 64ee4f7d..40950fa9 100644
--- a/recipes-containers/buildah/buildah_git.bb
+++ b/recipes-containers/buildah/buildah_git.bb
@@ -32,7 +32,7 @@ SRCREV_buildah = "dbeb097c6fbf4bfd643f096992da572a97a8ec12"
 SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 
 SRC_URI = " \
-    git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https \
+    git://github.com/containers/buildah;branch=release-1.34;name=buildah;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     "
 
 DEPENDS = "libdevmapper btrfs-tools gpgme"
diff --git a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
index 23ecfa4a..7d1ca23d 100644
--- a/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
+++ b/recipes-containers/cgroup-lite/cgroup-lite_1.15.bb
@@ -27,7 +27,7 @@ do_install() {
 	install -m 0755 ${S}/scripts/cgroups-umount ${D}/${base_bindir}
 
 	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
+	install -m 0755 ${UNPACKDIR}/cgroups-init ${D}${sysconfdir}/init.d/cgroups-init
 
 	install -d ${D}${systemd_unitdir}/system
 	ln -sf /dev/null ${D}${systemd_unitdir}/system/cgroups-init.service
diff --git a/recipes-containers/container-host-config/container-host-config.bb b/recipes-containers/container-host-config/container-host-config.bb
index 80abddf0..3d962ffc 100644
--- a/recipes-containers/container-host-config/container-host-config.bb
+++ b/recipes-containers/container-host-config/container-host-config.bb
@@ -14,9 +14,9 @@ SRC_URI = " \
 do_install() {
 	install -d ${D}/${sysconfdir}/containers
 
-	install ${WORKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
-	install ${WORKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
-	install ${WORKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
+	install ${UNPACKDIR}/storage.conf ${D}/${sysconfdir}/containers/storage.conf
+	install ${UNPACKDIR}/registries.conf ${D}/${sysconfdir}/containers/registries.conf
+	install ${UNPACKDIR}/policy.json ${D}/${sysconfdir}/containers/policy.json
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 4e17a7cd..0255aa0a 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -16,7 +16,7 @@ At a high level, we expect the scope of cri-o to be restricted to the following
 
 SRCREV_cri-o = "5aff11c7c1afdc785adafd7da3c3f2a6ac51b88d"
 SRC_URI = "\
-	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.30;name=cri-o;protocol=https \
+	git://github.com/kubernetes-sigs/cri-o.git;branch=release-1.30;name=cri-o;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://crio.conf \
 	"
 
@@ -83,7 +83,7 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system/
     install -d ${D}/usr/share/containers/oci/hooks.d
 
-    install ${WORKDIR}/crio.conf ${D}/${sysconfdir}/crio/crio.conf
+    install ${UNPACKDIR}/crio.conf ${D}/${sysconfdir}/crio/crio.conf
 
     # sample config files, they'll go in the ${PN}-config below
     install -d ${D}/${sysconfdir}/crio/config/
diff --git a/recipes-containers/cri-tools/cri-tools_git.bb b/recipes-containers/cri-tools/cri-tools_git.bb
index e0caf740..f9b60bbf 100644
--- a/recipes-containers/cri-tools/cri-tools_git.bb
+++ b/recipes-containers/cri-tools/cri-tools_git.bb
@@ -18,7 +18,7 @@ What is not in scope for this project? \
 
 SRCREV_cri-tools = "17b4dd65d660fec94d7a5a070e3e89ef640f1087"
 SRC_URI = "\
-	git://github.com/kubernetes-sigs/cri-tools.git;branch=master;name=cri-tools;protocol=https \
+	git://github.com/kubernetes-sigs/cri-tools.git;branch=master;name=cri-tools;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
         file://0001-build-allow-environmental-CGO-settings-and-pass-dont.patch \
 	"
 
diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index 07650126..316bf29d 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -11,7 +11,7 @@ DEPENDS = " \
 SRCREV_FORMAT="compose_survey"
 SRCREV_compose = "3371227794f5f3645f4f19829c60a741635ed329"
 
-SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https"
+SRC_URI = "git://github.com/docker/compose;name=compose;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 include src_uri.inc
 
@@ -55,7 +55,7 @@ do_compile() {
 	# our copied .go files are to be used for the build
 	ln -sf vendor.copy vendor
 	# inform go that we know what we are doing
-	cp ${WORKDIR}/modules.txt vendor/
+	cp ${UNPACKDIR}/modules.txt vendor/
 
 	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
 	GO_BUILDTAGS=""
diff --git a/recipes-containers/docker-compose/src_uri.inc b/recipes-containers/docker-compose/src_uri.inc
index 1978abc7..8327cb0e 100644
--- a/recipes-containers/docker-compose/src_uri.inc
+++ b/recipes-containers/docker-compose/src_uri.inc
@@ -1,930 +1,930 @@
 #       k8s.io/api v0.29.2
 # [1] git ls-remote https://github.com/kubernetes/api d47313059888ec984bf8432ed155fae5be935c31
 SRCREV_k8s.io-api="d47313059888ec984bf8432ed155fae5be935c31"
-SRC_URI += "git://github.com/kubernetes/api;name=k8s.io-api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/api"
+SRC_URI += "git://github.com/kubernetes/api;name=k8s.io-api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/api"
 
 #       k8s.io/utils v0.0.0-20230726121419-3b25d923346b
 # [1] git ls-remote https://github.com/kubernetes/utils 3b25d923346b3814e0898684c97390092f31a61e
 SRCREV_utils="3b25d923346b3814e0898684c97390092f31a61e"
-SRC_URI += "git://github.com/kubernetes/utils;name=utils;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/utils"
+SRC_URI += "git://github.com/kubernetes/utils;name=utils;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/utils"
 
 #       k8s.io/klog/v2 v2.110.1
 # [1] git ls-remote https://github.com/kubernetes/klog e3f75b8af2707d64b5dd4c440ae8384ed2f2c386
 SRCREV_klog-v2="e3f75b8af2707d64b5dd4c440ae8384ed2f2c386"
-SRC_URI += "git://github.com/kubernetes/klog;name=klog-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/klog/v2"
+SRC_URI += "git://github.com/kubernetes/klog;name=klog-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/klog/v2"
 
 #       gotest.tools/v3 v3.5.1
 # [1] git ls-remote https://github.com/gotestyourself/gotest.tools 81cea1abc596b025bf2573c7fdf97740512e4c6c
 SRCREV_v3="81cea1abc596b025bf2573c7fdf97740512e4c6c"
-SRC_URI += "git://github.com/gotestyourself/gotest.tools;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gotest.tools/v3"
+SRC_URI += "git://github.com/gotestyourself/gotest.tools;name=v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gotest.tools/v3"
 
 #       dario.cat/mergo v1.0.0
 # [1] git ls-remote https://github.com/imdario/mergo 131de815afc35a77c41ae99da6c8f4288b6cb513
 SRCREV_mergo="131de815afc35a77c41ae99da6c8f4288b6cb513"
-SRC_URI += "git://github.com/imdario/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/dario.cat/mergo"
+SRC_URI += "git://github.com/imdario/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/dario.cat/mergo"
 
 #       gopkg.in/inf.v0 v0.9.1
 # [1] git ls-remote https://github.com/go-inf/inf d2d2541c53f18d2a059457998ce2876cc8e67cbf
 SRCREV_inf.v0="d2d2541c53f18d2a059457998ce2876cc8e67cbf"
-SRC_URI += "git://github.com/go-inf/inf;name=inf.v0;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/inf.v0"
+SRC_URI += "git://github.com/go-inf/inf;name=inf.v0;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/inf.v0"
 
 #       go.uber.org/mock v0.4.0
 # [1] git ls-remote https://github.com/uber/mock 74a29c6e6c2cbb8ccee94db061c1604ff33fd188
 SRCREV_mock="74a29c6e6c2cbb8ccee94db061c1604ff33fd188"
-SRC_URI += "git://github.com/uber/mock;name=mock;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/mock"
+SRC_URI += "git://github.com/uber/mock;name=mock;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/mock"
 
 #       golang.org/x/exp v0.0.0-20240112132812-db7319d0e0e3
 # [1] git ls-remote https://go.googlesource.com/exp db7319d0e0e361ccef5c449b760df8e5f2d5087c
 SRCREV_exp="db7319d0e0e361ccef5c449b760df8e5f2d5087c"
-SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp"
+SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/exp"
 
 #       golang.org/x/sys v0.16.0
 # [1] git ls-remote https://go.googlesource.com/sys 0829ab15b6946f47c40012db2e0c04772730317d
 SRCREV_sys="0829ab15b6946f47c40012db2e0c04772730317d"
-SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys"
+SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sys"
 
 #       gopkg.in/yaml.v3 v3.0.1
 # [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f56608cd2c32c51f8194bf51
 SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3"
 
 #       golang.org/x/mod v0.14.0
 # [1] git ls-remote https://go.googlesource.com/mod 6e58e47c7bd6672665dc35cce7b1f325d2addd67
 SRCREV_mod="6e58e47c7bd6672665dc35cce7b1f325d2addd67"
-SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod"
+SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/mod"
 
 #       golang.org/x/net v0.20.0
 # [1] git ls-remote https://go.googlesource.com/net cb5b10f0bbc51089bf49030ce3bd43bbfee08c23
 SRCREV_net="cb5b10f0bbc51089bf49030ce3bd43bbfee08c23"
-SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net"
+SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/net"
 
 #       gopkg.in/yaml.v2 v2.4.0
 # [1] git ls-remote https://github.com/go-yaml/yaml 7649d4548cb53a614db133b2a8ac1f31859dda8c
 SRCREV_yaml.v2="7649d4548cb53a614db133b2a8ac1f31859dda8c"
-SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v2"
 
 #       k8s.io/apiserver v0.29.2
 # [1] git ls-remote https://github.com/kubernetes/apiserver 4c39f36a732cfb11f3fc75110c7301336b6b64e3
 SRCREV_apiserver="4c39f36a732cfb11f3fc75110c7301336b6b64e3"
-SRC_URI += "git://github.com/kubernetes/apiserver;name=apiserver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/apiserver"
+SRC_URI += "git://github.com/kubernetes/apiserver;name=apiserver;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/apiserver"
 
 #       k8s.io/client-go v0.29.2
 # [1] git ls-remote https://github.com/kubernetes/client-go 62c5e9e7b4bd09d2b43dcad1464376322398e994
 SRCREV_client-go="62c5e9e7b4bd09d2b43dcad1464376322398e994"
-SRC_URI += "git://github.com/kubernetes/client-go;name=client-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/client-go"
+SRC_URI += "git://github.com/kubernetes/client-go;name=client-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/client-go"
 
 #       sigs.k8s.io/json v0.0.0-20221116044647-bc3834ca7abd
 # [1] git ls-remote https://github.com/kubernetes-sigs/json bc3834ca7abd3a90f03ef00a27ad80cb892f9c21
 SRCREV_json="bc3834ca7abd3a90f03ef00a27ad80cb892f9c21"
-SRC_URI += "git://github.com/kubernetes-sigs/json;name=json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/json"
+SRC_URI += "git://github.com/kubernetes-sigs/json;name=json;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/json"
 
 #       sigs.k8s.io/yaml v1.3.0
 # [1] git ls-remote https://github.com/kubernetes-sigs/yaml 9535b3b1e2893fe44efb37c5c9f5665e245d786a
 SRCREV_yaml="9535b3b1e2893fe44efb37c5c9f5665e245d786a"
-SRC_URI += "git://github.com/kubernetes-sigs/yaml;name=yaml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/yaml"
+SRC_URI += "git://github.com/kubernetes-sigs/yaml;name=yaml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/yaml"
 
 #       golang.org/x/sync v0.6.0
 # [1] git ls-remote https://go.googlesource.com/sync 59c1ca1e4661ed4452be4069ceea3c233f4deec1
 SRCREV_sync="59c1ca1e4661ed4452be4069ceea3c233f4deec1"
-SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync"
+SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sync"
 
 #       golang.org/x/term v0.16.0
 # [1] git ls-remote https://go.googlesource.com/term ae941452f58ff9bf62f7e9dca3ea6ae3d214a68b
 SRCREV_x-term="ae941452f58ff9bf62f7e9dca3ea6ae3d214a68b"
-SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term"
+SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/term"
 
 #       golang.org/x/text v0.14.0
 # [1] git ls-remote https://go.googlesource.com/text 6c97a165dd661335ff7bce6104a008558123c353
 SRCREV_text="6c97a165dd661335ff7bce6104a008558123c353"
-SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text"
+SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/text"
 
 #       golang.org/x/time v0.3.0
 # [1] git ls-remote https://go.googlesource.com/time 2c09566ef13fb5556401ddff3c53c3dbc2a42dac
 SRCREV_time="2c09566ef13fb5556401ddff3c53c3dbc2a42dac"
-SRC_URI += "git://go.googlesource.com/time;name=time;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/time"
+SRC_URI += "git://go.googlesource.com/time;name=time;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/time"
 
 #       go.uber.org/goleak v1.3.0
 # [1] git ls-remote https://github.com/uber-go/goleak 31095c657c34bba405a8d480db27989aa5f60b9c
 SRCREV_goleak="31095c657c34bba405a8d480db27989aa5f60b9c"
-SRC_URI += "git://github.com/uber-go/goleak;name=goleak;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/goleak"
+SRC_URI += "git://github.com/uber-go/goleak;name=goleak;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/goleak"
 
 #       golang.org/x/tools v0.17.0
 # [1] git ls-remote https://go.googlesource.com/tools 0b1f1d4bc227cc2e610854f23e14696becb9e46c
 SRCREV_tools="0b1f1d4bc227cc2e610854f23e14696becb9e46c"
-SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
+SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/tools"
 
 #       golang.org/x/crypto v0.18.0
 # [1] git ls-remote https://go.googlesource.com/crypto dbb6ec16ecef7a66638d8514be54b13660551b0a
 SRCREV_crypto="dbb6ec16ecef7a66638d8514be54b13660551b0a"
-SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto"
+SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/crypto"
 
 #       golang.org/x/oauth2 v0.11.0
 # [1] git ls-remote https://go.googlesource.com/oauth2 2e4a4e2bfb69ca7609cb423438c55caa131431c1
 SRCREV_oauth2="2e4a4e2bfb69ca7609cb423438c55caa131431c1"
-SRC_URI += "git://go.googlesource.com/oauth2;name=oauth2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/oauth2"
+SRC_URI += "git://go.googlesource.com/oauth2;name=oauth2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/oauth2"
 
 #       k8s.io/apimachinery v0.29.2
 # [1] git ls-remote https://github.com/kubernetes/apimachinery dc7e034c86479d49be4b0eefad307621e10caa0e
 SRCREV_apimachinery="dc7e034c86479d49be4b0eefad307621e10caa0e"
-SRC_URI += "git://github.com/kubernetes/apimachinery;name=apimachinery;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/apimachinery"
+SRC_URI += "git://github.com/kubernetes/apimachinery;name=apimachinery;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/apimachinery"
 
 #       k8s.io/kube-openapi v0.0.0-20231010175941-2dd684a91f00
 # [1] git ls-remote https://github.com/kubernetes/kube-openapi 2dd684a91f00351087fe2f4ed5408d4d2f3775ab
 SRCREV_kube-openapi="2dd684a91f00351087fe2f4ed5408d4d2f3775ab"
-SRC_URI += "git://github.com/kubernetes/kube-openapi;name=kube-openapi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/kube-openapi"
+SRC_URI += "git://github.com/kubernetes/kube-openapi;name=kube-openapi;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/kube-openapi"
 
 #       github.com/moby/term v0.5.0
 # [1] git ls-remote https://github.com/moby/term 9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9
 SRCREV_term="9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9"
-SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/term"
+SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/term"
 
 #       github.com/docker/go v1.5.1-1.0.20160303222718-d30aec9fd63c
 # [1] git ls-remote https://github.com/docker/go d30aec9fd63c35133f8f79c3412ad91a3b08be06
 SRCREV_go="d30aec9fd63c35133f8f79c3412ad91a3b08be06"
-SRC_URI += "git://github.com/docker/go;name=go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go"
+SRC_URI += "git://github.com/docker/go;name=go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go"
 
 #       github.com/docker/cli v26.0.0+incompatible
 # [1] git ls-remote https://github.com/docker/cli 2ae903e86cab51f694c819721cdfdf5eec693720
 SRCREV_cli="2ae903e86cab51f694c819721cdfdf5eec693720"
-SRC_URI += "git://github.com/docker/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli"
+SRC_URI += "git://github.com/docker/cli;name=cli;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/cli"
 
 #       github.com/r3labs/sse v0.0.0-20210224172625-26fe804710bc
 # [1] git ls-remote https://github.com/r3labs/sse 26fe804710bc39ea7ea6636d36f27c438bd2c06f
 SRCREV_sse="26fe804710bc39ea7ea6636d36f27c438bd2c06f"
-SRC_URI += "git://github.com/r3labs/sse;name=sse;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/r3labs/sse"
+SRC_URI += "git://github.com/r3labs/sse;name=sse;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/r3labs/sse"
 
 #       github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b
 # [1] git ls-remote https://github.com/mgutz/ansi 9520e82c474b0a04dd04f8a40959027271bab992
 SRCREV_ansi="9520e82c474b0a04dd04f8a40959027271bab992"
-SRC_URI += "git://github.com/mgutz/ansi;name=ansi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mgutz/ansi"
+SRC_URI += "git://github.com/mgutz/ansi;name=ansi;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mgutz/ansi"
 
 #       github.com/pkg/errors v0.9.1
 # [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465
 SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
-SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
+SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pkg/errors"
 
 #       github.com/spf13/cobra v1.8.0
 # [1] git ls-remote https://github.com/spf13/cobra a0a6ae020bb3899ff0276067863e50523f897370
 SRCREV_cobra="a0a6ae020bb3899ff0276067863e50523f897370"
-SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra"
+SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/cobra"
 
 #       github.com/spf13/pflag v1.0.5
 # [1] git ls-remote https://github.com/spf13/pflag 2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
 SRCREV_pflag="2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
-SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag"
+SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/pflag"
 
 #       google.golang.org/grpc v1.59.0
 # [1] git ls-remote https://github.com/grpc/grpc-go 7765221f4bf6104973db7946d56936cf838cad46
 SRCREV_grpc="7765221f4bf6104973db7946d56936cf838cad46"
-SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc"
+SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/grpc"
 
 #       github.com/gofrs/flock v0.8.1
 # [1] git ls-remote https://github.com/gofrs/flock 6f010d1acea74a32f2f2066bfe324c08bbee30e3
 SRCREV_flock="6f010d1acea74a32f2f2066bfe324c08bbee30e3"
-SRC_URI += "git://github.com/gofrs/flock;name=flock;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs/flock"
+SRC_URI += "git://github.com/gofrs/flock;name=flock;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gofrs/flock"
 
 #       github.com/google/uuid v1.6.0
 # [1] git ls-remote https://github.com/google/uuid 0f11ee6918f41a04c201eceeadf612a377bc7fbc
 SRCREV_uuid="0f11ee6918f41a04c201eceeadf612a377bc7fbc"
-SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
+SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/uuid"
 
 #       github.com/gorilla/mux v1.8.1
 # [1] git ls-remote https://github.com/gorilla/mux b4617d0b9670ad14039b2739167fd35a60f557c5
 SRCREV_mux="b4617d0b9670ad14039b2739167fd35a60f557c5"
-SRC_URI += "git://github.com/gorilla/mux;name=mux;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/mux"
+SRC_URI += "git://github.com/gorilla/mux;name=mux;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gorilla/mux"
 
 #       github.com/moby/locker v1.0.1
 # [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9d1487c965f24d30742fe
 SRCREV_locker="281af2d563954745bea9d1487c965f24d30742fe"
-SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/locker"
+SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/locker"
 
 #       github.com/rivo/uniseg v0.2.0
 # [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c241e2dddd06a9bc9e53d
 SRCREV_uniseg="75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
-SRC_URI += "git://github.com/rivo/uniseg;name=uniseg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rivo/uniseg"
+SRC_URI += "git://github.com/rivo/uniseg;name=uniseg;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rivo/uniseg"
 
 #       github.com/buger/goterm v1.0.4
 # [1] git ls-remote https://github.com/buger/goterm a73545aae7d693f786ce4cc687460efca4845f31
 SRCREV_goterm="a73545aae7d693f786ce4cc687460efca4845f31"
-SRC_URI += "git://github.com/buger/goterm;name=goterm;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/buger/goterm"
+SRC_URI += "git://github.com/buger/goterm;name=goterm;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/buger/goterm"
 
 #       github.com/morikuni/aec v1.0.0
 # [1] git ls-remote https://github.com/morikuni/aec 39771216ff4c63d11f5e604076f9c45e8be1067b
 SRCREV_aec="39771216ff4c63d11f5e604076f9c45e8be1067b"
-SRC_URI += "git://github.com/morikuni/aec;name=aec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/morikuni/aec"
+SRC_URI += "git://github.com/morikuni/aec;name=aec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/morikuni/aec"
 
 #       github.com/otiai10/copy v1.14.0
 # [1] git ls-remote https://github.com/otiai10/copy fba066acb0eb6e25d510073787741c0a8b31bf1e
 SRCREV_copy="fba066acb0eb6e25d510073787741c0a8b31bf1e"
-SRC_URI += "git://github.com/otiai10/copy;name=copy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/otiai10/copy"
+SRC_URI += "git://github.com/otiai10/copy;name=copy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/otiai10/copy"
 
 #       github.com/beorn7/perks v1.0.1
 # [1] git ls-remote https://github.com/beorn7/perks 37c8de3658fcb183f997c4e13e8337516ab753e6
 SRCREV_perks="37c8de3658fcb183f997c4e13e8337516ab753e6"
-SRC_URI += "git://github.com/beorn7/perks;name=perks;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn7/perks"
+SRC_URI += "git://github.com/beorn7/perks;name=perks;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/beorn7/perks"
 
 #       github.com/go-logr/logr v1.3.0
 # [1] git ls-remote https://github.com/go-logr/logr 8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f
 SRCREV_logr="8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f"
-SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/logr"
+SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/logr"
 
 #       github.com/go-logr/stdr v1.2.2
 # [1] git ls-remote https://github.com/go-logr/stdr 521af2addfa7c81c8a65d0e85ed34bb6bb6dc262
 SRCREV_stdr="521af2addfa7c81c8a65d0e85ed34bb6bb6dc262"
-SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/stdr"
+SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/stdr"
 
 #       github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
 # [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e9468cdfd1efcd7d196cd1d
 SRCREV_shlex="e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
-SRC_URI += "git://github.com/google/shlex;name=shlex;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/shlex"
+SRC_URI += "git://github.com/google/shlex;name=shlex;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/shlex"
 
 #       github.com/miekg/pkcs11 v1.1.1
 # [1] git ls-remote https://github.com/miekg/pkcs11 f3481918a208bd212aa995a41f92d786eb418a7d
 SRCREV_pkcs11="f3481918a208bd212aa995a41f92d786eb418a7d"
-SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11"
+SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/miekg/pkcs11"
 
 #       github.com/docker/buildx v0.13.1
 # [1] git ls-remote https://github.com/docker/buildx 788433953af10f2a698f5c07611dddce2e08c7a0
 SRCREV_buildx="788433953af10f2a698f5c07611dddce2e08c7a0"
-SRC_URI += "git://github.com/docker/buildx;name=buildx;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/buildx"
+SRC_URI += "git://github.com/docker/buildx;name=buildx;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/buildx"
 
 #       github.com/docker/docker v26.0.0+incompatible
 # [1] git ls-remote https://github.com/moby/moby 8b79278316b532d396048bc8c2fa015a85d53a53
 SRCREV_docker="8b79278316b532d396048bc8c2fa015a85d53a53"
-SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker"
+SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker"
 
 #       github.com/google/go-cmp v0.6.0
 # [1] git ls-remote https://github.com/google/go-cmp c3ad8435e7bef96af35732bc0789e5a2278c6d5f
 SRCREV_go-cmp="c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
-SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp"
+SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/go-cmp"
 
 #       github.com/moby/buildkit v0.13.1
 # [1] git ls-remote https://github.com/moby/buildkit 2ae42e0c0c793d7d66b7a23424af6fd6c2f9c8f3
 SRCREV_buildkit="2ae42e0c0c793d7d66b7a23424af6fd6c2f9c8f3"
-SRC_URI += "git://github.com/moby/buildkit;name=buildkit;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/buildkit"
+SRC_URI += "git://github.com/moby/buildkit;name=buildkit;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/buildkit"
 
 #       go.opentelemetry.io/otel v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_otel="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel"
 
 #       github.com/aws/smithy-go v1.19.0
 # [1] git ls-remote https://github.com/aws/smithy-go f982aed889669e4bc6f1cd03f56697f1b27964a4
 SRCREV_smithy-go="f982aed889669e4bc6f1cd03f56697f1b27964a4"
-SRC_URI += "git://github.com/aws/smithy-go;name=smithy-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/smithy-go"
+SRC_URI += "git://github.com/aws/smithy-go;name=smithy-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/smithy-go"
 
 #       github.com/gogo/protobuf v1.3.2
 # [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc
 SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
-SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
+SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gogo/protobuf"
 
 #       github.com/google/gofuzz v1.2.0
 # [1] git ls-remote https://github.com/google/gofuzz 379e164120fbc98885a8f494b5aa41ba94f64c56
 SRCREV_gofuzz="379e164120fbc98885a8f494b5aa41ba94f64c56"
-SRC_URI += "git://github.com/google/gofuzz;name=gofuzz;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gofuzz"
+SRC_URI += "git://github.com/google/gofuzz;name=gofuzz;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/gofuzz"
 
 #       github.com/imdario/mergo v0.3.16
 # [1] git ls-remote https://github.com/darccio/mergo 14fe2b165b83359196f820886a2b24f2771729e9
 SRCREV_imdario-mergo="14fe2b165b83359196f820886a2b24f2771729e9"
-SRC_URI += "git://github.com/darccio/mergo;name=imdario-mergo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo"
+SRC_URI += "git://github.com/darccio/mergo;name=imdario-mergo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/imdario/mergo"
 
 #       github.com/moby/sys/user v0.1.0
 # [1] git ls-remote https://github.com/moby/sys c0711cde08c8fa33857a2c28721659267f49b5e2
 SRCREV_user="c0711cde08c8fa33857a2c28721659267f49b5e2"
-SRC_URI += "git://github.com/moby/sys;name=user;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/user"
+SRC_URI += "git://github.com/moby/sys;name=user;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/user"
 
 #       github.com/containerd/log v0.1.0
 # [1] git ls-remote https://github.com/containerd/log 0fc1e28871fdf2786e2cc51bbe4133db6547a199
 SRCREV_log="0fc1e28871fdf2786e2cc51bbe4133db6547a199"
-SRC_URI += "git://github.com/containerd/log;name=log;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/log"
+SRC_URI += "git://github.com/containerd/log;name=log;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/log"
 
 #       github.com/davecgh/go-spew v1.1.1
 # [1] git ls-remote https://github.com/davecgh/go-spew 8991bc29aa16c548c550c7ff78260e27b9ab7c73
 SRCREV_go-spew="8991bc29aa16c548c550c7ff78260e27b9ab7c73"
-SRC_URI += "git://github.com/davecgh/go-spew;name=go-spew;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davecgh/go-spew"
+SRC_URI += "git://github.com/davecgh/go-spew;name=go-spew;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/davecgh/go-spew"
 
 #       github.com/docker/go-units v0.5.0
 # [1] git ls-remote https://github.com/docker/go-units e682442797b36348f8e1f98defdbf32bac0b6c6f
 SRCREV_go-units="e682442797b36348f8e1f98defdbf32bac0b6c6f"
-SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-units"
+SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-units"
 
 #       github.com/mitchellh/go-ps v1.0.0
 # [1] git ls-remote https://github.com/mitchellh/go-ps 147ff83818ae939913b2e20b91ae3cd6c391771c
 SRCREV_go-ps="147ff83818ae939913b2e20b91ae3cd6c391771c"
-SRC_URI += "git://github.com/mitchellh/go-ps;name=go-ps;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-ps"
+SRC_URI += "git://github.com/mitchellh/go-ps;name=go-ps;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/go-ps"
 
 #       github.com/sirupsen/logrus v1.9.3
 # [1] git ls-remote https://github.com/sirupsen/logrus d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
 SRCREV_logrus="d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
-SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/logrus"
+SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sirupsen/logrus"
 
 #       github.com/go-openapi/swag v0.22.3
 # [1] git ls-remote https://github.com/go-openapi/swag 0579829e66fde26b27d401921afb73704c4d463d
 SRCREV_swag="0579829e66fde26b27d401921afb73704c4d463d"
-SRC_URI += "git://github.com/go-openapi/swag;name=swag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/swag"
+SRC_URI += "git://github.com/go-openapi/swag;name=swag;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-openapi/swag"
 
 #       github.com/gogo/googleapis v1.4.1
 # [1] git ls-remote https://github.com/gogo/googleapis 1f0e43f50bc0606e385ffae1bc80b5b231dcd042
 SRCREV_googleapis="1f0e43f50bc0606e385ffae1bc80b5b231dcd042"
-SRC_URI += "git://github.com/gogo/googleapis;name=googleapis;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/googleapis"
+SRC_URI += "git://github.com/gogo/googleapis;name=googleapis;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gogo/googleapis"
 
 #       github.com/golang/protobuf v1.5.3
 # [1] git ls-remote https://github.com/golang/protobuf 5d5e8c018a13017f9d5b8bf4fad64aaa42a87308
 SRCREV_golang-protobuf="5d5e8c018a13017f9d5b8bf4fad64aaa42a87308"
-SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
+SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/protobuf"
 
 #       github.com/mailru/easyjson v0.7.7
 # [1] git ls-remote https://github.com/mailru/easyjson c120ca7ced6051261161ce15e8f1542a4b2567fc
 SRCREV_easyjson="c120ca7ced6051261161ce15e8f1542a4b2567fc"
-SRC_URI += "git://github.com/mailru/easyjson;name=easyjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mailru/easyjson"
+SRC_URI += "git://github.com/mailru/easyjson;name=easyjson;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mailru/easyjson"
 
 #       github.com/mattn/go-isatty v0.0.17
 # [1] git ls-remote https://github.com/mattn/go-isatty ed75e619dc0f0489fd4062163a7d061eaa249b9c
 SRCREV_go-isatty="ed75e619dc0f0489fd4062163a7d061eaa249b9c"
-SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
+SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-isatty"
 
 #       github.com/moby/spdystream v0.2.0
 # [1] git ls-remote https://github.com/moby/spdystream dbc715126c0e3fa07721879c6d265b2b82c71e5b
 SRCREV_spdystream="dbc715126c0e3fa07721879c6d265b2b82c71e5b"
-SRC_URI += "git://github.com/moby/spdystream;name=spdystream;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/spdystream"
+SRC_URI += "git://github.com/moby/spdystream;name=spdystream;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/spdystream"
 
 #       github.com/moby/sys/signal v0.7.0
 # [1] git ls-remote https://github.com/moby/sys b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5
 SRCREV_signal="b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
-SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal"
+SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/signal"
 
 #       github.com/mxk/go-flowrate v0.0.0-20140419014527-cca7078d478f
 # [1] git ls-remote https://github.com/mxk/go-flowrate cca7078d478f8520f85629ad7c68962d31ed7682
 SRCREV_go-flowrate="cca7078d478f8520f85629ad7c68962d31ed7682"
-SRC_URI += "git://github.com/mxk/go-flowrate;name=go-flowrate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mxk/go-flowrate"
+SRC_URI += "git://github.com/mxk/go-flowrate;name=go-flowrate;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mxk/go-flowrate"
 
 #       google.golang.org/genproto v0.0.0-20231016165738-49dd2c1f3d0b
 # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846
 SRCREV_genproto="49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto"
 
 #       google.golang.org/protobuf v1.31.0
 # [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 68463f0e96c93bc19ef36ccd3adfe690bfdb568c
 SRCREV_google.golang.org-protobuf="68463f0e96c93bc19ef36ccd3adfe690bfdb568c"
-SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
+SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/protobuf"
 
 #       github.com/stretchr/testify v1.8.4
 # [1] git ls-remote https://github.com/stretchr/testify f97607b89807936ac4ff96748d766cf4b9711f78
 SRCREV_testify="f97607b89807936ac4ff96748d766cf4b9711f78"
-SRC_URI += "git://github.com/stretchr/testify;name=testify;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stretchr/testify"
+SRC_URI += "git://github.com/stretchr/testify;name=testify;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/stretchr/testify"
 
 #       github.com/containerd/ttrpc v1.2.2
 # [1] git ls-remote https://github.com/containerd/ttrpc ac26f8cbea1c440d451dd19a4a1b847fd073f3c3
 SRCREV_ttrpc="ac26f8cbea1c440d451dd19a4a1b847fd073f3c3"
-SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/ttrpc"
+SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/ttrpc"
 
 #       github.com/josharian/intern v1.0.0
 # [1] git ls-remote https://github.com/josharian/intern 8e6ff32b3e7c0b018c43953085fe2ac330fe9acd
 SRCREV_intern="8e6ff32b3e7c0b018c43953085fe2ac330fe9acd"
-SRC_URI += "git://github.com/josharian/intern;name=intern;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/josharian/intern"
+SRC_URI += "git://github.com/josharian/intern;name=intern;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/josharian/intern"
 
 #       github.com/json-iterator/go v1.1.12
 # [1] git ls-remote https://github.com/json-iterator/go 024077e996b048517130b21ea6bf12aa23055d3d
 SRCREV_json-iterator-go="024077e996b048517130b21ea6bf12aa23055d3d"
-SRC_URI += "git://github.com/json-iterator/go;name=json-iterator-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/json-iterator/go"
+SRC_URI += "git://github.com/json-iterator/go;name=json-iterator-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/json-iterator/go"
 
 #       github.com/moby/sys/symlink v0.2.0
 # [1] git ls-remote https://github.com/moby/sys 03b9f8d59a07f5206a2264105f4903a222aea964
 SRCREV_symlink="03b9f8d59a07f5206a2264105f4903a222aea964"
-SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/symlink"
+SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/symlink"
 
 #       github.com/serialx/hashring v0.0.0-20200727003509-22c0c7ab6b1b
 # [1] git ls-remote https://github.com/serialx/hashring 22c0c7ab6b1be4be7b950bae8b117767da7b18b6
 SRCREV_hashring="22c0c7ab6b1be4be7b950bae8b117767da7b18b6"
-SRC_URI += "git://github.com/serialx/hashring;name=hashring;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/serialx/hashring"
+SRC_URI += "git://github.com/serialx/hashring;name=hashring;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/serialx/hashring"
 
 #       github.com/tonistiigi/units v0.0.0-20180711220420-6950e57a87ea
 # [1] git ls-remote https://github.com/tonistiigi/units 6950e57a87eaf136bbe44ef2ec8e75b9e3569de2
 SRCREV_units="6950e57a87eaf136bbe44ef2ec8e75b9e3569de2"
-SRC_URI += "git://github.com/tonistiigi/units;name=units;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tonistiigi/units"
+SRC_URI += "git://github.com/tonistiigi/units;name=units;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tonistiigi/units"
 
 #       github.com/tonistiigi/vt100 v0.0.0-20230623042737-f9a4f7ef6531
 # [1] git ls-remote https://github.com/tonistiigi/vt100 f9a4f7ef65311848d4d4791c649a178c8e97386b
 SRCREV_vt100="f9a4f7ef65311848d4d4791c649a178c8e97386b"
-SRC_URI += "git://github.com/tonistiigi/vt100;name=vt100;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tonistiigi/vt100"
+SRC_URI += "git://github.com/tonistiigi/vt100;name=vt100;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tonistiigi/vt100"
 
 #       google.golang.org/appengine v1.6.7
 # [1] git ls-remote https://github.com/golang/appengine 5d1c1d03f8703c2e81478d9a30e9afa2d3e4bd8a
 SRCREV_appengine="5d1c1d03f8703c2e81478d9a30e9afa2d3e4bd8a"
-SRC_URI += "git://github.com/golang/appengine;name=appengine;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/appengine"
+SRC_URI += "git://github.com/golang/appengine;name=appengine;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/appengine"
 
 #       github.com/fsnotify/fsevents v0.1.1
 # [1] git ls-remote https://github.com/fsnotify/fsevents f721bd2b045774a566e8f7f5fa2a9985e04c875d
 SRCREV_fsevents="f721bd2b045774a566e8f7f5fa2a9985e04c875d"
-SRC_URI += "git://github.com/fsnotify/fsevents;name=fsevents;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fsnotify/fsevents"
+SRC_URI += "git://github.com/fsnotify/fsevents;name=fsevents;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fsnotify/fsevents"
 
 #       github.com/tilt-dev/fsnotify v1.4.8-0.20220602155310-fff9c274a375
 # [1] git ls-remote https://github.com/tilt-dev/fsnotify fff9c274a375301ae46812f257aa68393790c45b
 SRCREV_fsnotify="fff9c274a375301ae46812f257aa68393790c45b"
-SRC_URI += "git://github.com/tilt-dev/fsnotify;name=fsnotify;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tilt-dev/fsnotify"
+SRC_URI += "git://github.com/tilt-dev/fsnotify;name=fsnotify;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tilt-dev/fsnotify"
 
 #       go.opentelemetry.io/otel/sdk v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_sdk="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=sdk;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/sdk"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=sdk;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/sdk"
 
 #       github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
 # [1] git ls-remote https://github.com/Azure/go-ansiterm d185dfc1b5a126116ea5a19e148e29d16b4574c9
 SRCREV_go-ansiterm="d185dfc1b5a126116ea5a19e148e29d16b4574c9"
-SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-ansiterm"
+SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-ansiterm"
 
 #       github.com/Microsoft/hcsshim v0.11.4
 # [1] git ls-remote https://github.com/microsoft/hcsshim b16edf62c1723deb948632261b445d0228d973e0
 SRCREV_hcsshim="b16edf62c1723deb948632261b445d0228d973e0"
-SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/hcsshim"
+SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Microsoft/hcsshim"
 
 #       github.com/aws/aws-sdk-go-v2 v1.24.1
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39
 SRCREV_aws-sdk-go-v2="47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=aws-sdk-go-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=aws-sdk-go-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2"
 
 #       github.com/cespare/xxhash/v2 v2.2.0
 # [1] git ls-remote https://github.com/cespare/xxhash a76eb16a93c1e30527c073ca831d9048b4b935f6
 SRCREV_xxhash-v2="a76eb16a93c1e30527c073ca831d9048b4b935f6"
-SRC_URI += "git://github.com/cespare/xxhash;name=xxhash-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cespare/xxhash/v2"
+SRC_URI += "git://github.com/cespare/xxhash;name=xxhash-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cespare/xxhash/v2"
 
 #       github.com/docker/go-metrics v0.0.1
 # [1] git ls-remote https://github.com/docker/go-metrics b619b3592b65de4f087d9f16863a7e6ff905973c
 SRCREV_go-metrics="b619b3592b65de4f087d9f16863a7e6ff905973c"
-SRC_URI += "git://github.com/docker/go-metrics;name=go-metrics;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-metrics"
+SRC_URI += "git://github.com/docker/go-metrics;name=go-metrics;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-metrics"
 
 #       github.com/eiannone/keyboard v0.0.0-20220611211555-0d226195f203
 # [1] git ls-remote https://github.com/eiannone/keyboard 0d226195f2038e282bb90d2e24f7f29aa7c5b210
 SRCREV_keyboard="0d226195f2038e282bb90d2e24f7f29aa7c5b210"
-SRC_URI += "git://github.com/eiannone/keyboard;name=keyboard;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/eiannone/keyboard"
+SRC_URI += "git://github.com/eiannone/keyboard;name=keyboard;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/eiannone/keyboard"
 
 #       github.com/felixge/httpsnoop v1.0.4
 # [1] git ls-remote https://github.com/felixge/httpsnoop c5817c27ec125409c069052fdd171023c353501c
 SRCREV_httpsnoop="c5817c27ec125409c069052fdd171023c353501c"
-SRC_URI += "git://github.com/felixge/httpsnoop;name=httpsnoop;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/felixge/httpsnoop"
+SRC_URI += "git://github.com/felixge/httpsnoop;name=httpsnoop;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/felixge/httpsnoop"
 
 #       github.com/gorilla/websocket v1.5.0
 # [1] git ls-remote https://github.com/gorilla/websocket 9111bb834a68b893cebbbaed5060bdbc1d9ab7d2
 SRCREV_websocket="9111bb834a68b893cebbbaed5060bdbc1d9ab7d2"
-SRC_URI += "git://github.com/gorilla/websocket;name=websocket;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/websocket"
+SRC_URI += "git://github.com/gorilla/websocket;name=websocket;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gorilla/websocket"
 
 #       github.com/hashicorp/errwrap v1.1.0
 # [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0
 SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
-SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
+SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/errwrap"
 
 #       github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822
 # [1] git ls-remote https://github.com/munnerz/goautoneg a7dc8b61c822528f973a5e4e7b272055c6fdb43e
 SRCREV_goautoneg="a7dc8b61c822528f973a5e4e7b272055c6fdb43e"
-SRC_URI += "git://github.com/munnerz/goautoneg;name=goautoneg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/munnerz/goautoneg"
+SRC_URI += "git://github.com/munnerz/goautoneg;name=goautoneg;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/munnerz/goautoneg"
 
 #       github.com/pelletier/go-toml v1.9.5
 # [1] git ls-remote https://github.com/pelletier/go-toml fed1464066413075eac02cd4dc368b5221845541
 SRCREV_go-toml="fed1464066413075eac02cd4dc368b5221845541"
-SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml"
+SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pelletier/go-toml"
 
 #       github.com/prometheus/common v0.44.0
 # [1] git ls-remote https://github.com/prometheus/common 94bf9828e56d9670579b28a9f78237d3cd8d0395
 SRCREV_common="94bf9828e56d9670579b28a9f78237d3cd8d0395"
-SRC_URI += "git://github.com/prometheus/common;name=common;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/common"
+SRC_URI += "git://github.com/prometheus/common;name=common;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/common"
 
 #       github.com/prometheus/procfs v0.12.0
 # [1] git ls-remote https://github.com/prometheus/procfs ff0ad85f7e8bcd5c677d99143f14a2a3aab533aa
 SRCREV_procfs="ff0ad85f7e8bcd5c677d99143f14a2a3aab533aa"
-SRC_URI += "git://github.com/prometheus/procfs;name=procfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/procfs"
+SRC_URI += "git://github.com/prometheus/procfs;name=procfs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/procfs"
 
 #       github.com/tonistiigi/fsutil v0.0.0-20240301111122-7525a1af2bb5
 # [1] git ls-remote https://github.com/tonistiigi/fsutil 7525a1af2bb545e89dc9bced785bff7a3b7f08c2
 SRCREV_fsutil="7525a1af2bb545e89dc9bced785bff7a3b7f08c2"
-SRC_URI += "git://github.com/tonistiigi/fsutil;name=fsutil;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tonistiigi/fsutil"
+SRC_URI += "git://github.com/tonistiigi/fsutil;name=fsutil;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tonistiigi/fsutil"
 
 #       gopkg.in/cenkalti/backoff.v1 v1.1.0
 # [1] git ls-remote https://github.com/cenkalti/backoff 61153c768f31ee5f130071d08fc82b85208528de
 SRCREV_backoff.v1="61153c768f31ee5f130071d08fc82b85208528de"
-SRC_URI += "git://github.com/cenkalti/backoff;name=backoff.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/cenkalti/backoff.v1"
+SRC_URI += "git://github.com/cenkalti/backoff;name=backoff.v1;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/cenkalti/backoff.v1"
 
 #       github.com/Microsoft/go-winio v0.6.1
 # [1] git ls-remote https://github.com/microsoft/go-winio 070c828abb873da9e71c7247740253b50f7cf049
 SRCREV_go-winio="070c828abb873da9e71c7247740253b50f7cf049"
-SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/go-winio"
+SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Microsoft/go-winio"
 
 #       github.com/acarl005/stripansi v0.0.0-20180116102854-5a71ef0e047d
 # [1] git ls-remote https://github.com/acarl005/stripansi 5a71ef0e047df0427e87a79f27009029921f1f9b
 SRCREV_stripansi="5a71ef0e047df0427e87a79f27009029921f1f9b"
-SRC_URI += "git://github.com/acarl005/stripansi;name=stripansi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/acarl005/stripansi"
+SRC_URI += "git://github.com/acarl005/stripansi;name=stripansi;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/acarl005/stripansi"
 
 #       github.com/containerd/console v1.0.4
 # [1] git ls-remote https://github.com/containerd/console 8f6c4e4faef5a326d2cd907097d04c0239ee5e2f
 SRCREV_console="8f6c4e4faef5a326d2cd907097d04c0239ee5e2f"
-SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
+SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/console"
 
 #       github.com/fvbommel/sortorder v1.0.2
 # [1] git ls-remote https://github.com/fvbommel/sortorder 26fad50c6b32a3064c09ed089865c16f2f3615f6
 SRCREV_sortorder="26fad50c6b32a3064c09ed089865c16f2f3615f6"
-SRC_URI += "git://github.com/fvbommel/sortorder;name=sortorder;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fvbommel/sortorder"
+SRC_URI += "git://github.com/fvbommel/sortorder;name=sortorder;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fvbommel/sortorder"
 
 #       github.com/klauspost/compress v1.17.4
 # [1] git ls-remote https://github.com/klauspost/compress 98ff542abe3108aa760c1558f80d393be0136539
 SRCREV_compress="98ff542abe3108aa760c1558f80d393be0136539"
-SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/compress"
+SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/klauspost/compress"
 
 #       github.com/mattn/go-colorable v0.1.13
 # [1] git ls-remote https://github.com/mattn/go-colorable 11a925cff3d38c293ddc8c05a16b504e3e2c63be
 SRCREV_go-colorable="11a925cff3d38c293ddc8c05a16b504e3e2c63be"
-SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-colorable"
+SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-colorable"
 
 #       github.com/mattn/go-runewidth v0.0.15
 # [1] git ls-remote https://github.com/mattn/go-runewidth 44b7c5b4d67df8ca22917b6800c158a6d3be3560
 SRCREV_go-runewidth="44b7c5b4d67df8ca22917b6800c158a6d3be3560"
-SRC_URI += "git://github.com/mattn/go-runewidth;name=go-runewidth;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-runewidth"
+SRC_URI += "git://github.com/mattn/go-runewidth;name=go-runewidth;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-runewidth"
 
 #       github.com/moby/sys/mountinfo v0.7.1
 # [1] git ls-remote https://github.com/moby/sys 4950d7687cf6c9b138dc0e18c2c7351e1f6ed497
 SRCREV_mountinfo="4950d7687cf6c9b138dc0e18c2c7351e1f6ed497"
-SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mountinfo"
+SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/mountinfo"
 
 #       github.com/modern-go/reflect2 v1.0.2
 # [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc5231aea69b8861c540102b087070
 SRCREV_reflect2="2b33151c9bbc5231aea69b8861c540102b087070"
-SRC_URI += "git://github.com/modern-go/reflect2;name=reflect2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/reflect2"
+SRC_URI += "git://github.com/modern-go/reflect2;name=reflect2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/modern-go/reflect2"
 
 #       github.com/pmezard/go-difflib v1.0.0
 # [1] git ls-remote https://github.com/pmezard/go-difflib 792786c7400a136282c1664665ae0a8db921c6c2
 SRCREV_go-difflib="792786c7400a136282c1664665ae0a8db921c6c2"
-SRC_URI += "git://github.com/pmezard/go-difflib;name=go-difflib;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pmezard/go-difflib"
+SRC_URI += "git://github.com/pmezard/go-difflib;name=go-difflib;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pmezard/go-difflib"
 
 #       github.com/jonboulle/clockwork v0.4.0
 # [1] git ls-remote https://github.com/jonboulle/clockwork 606c48b92358fcca153952b56fb0d14d6845f84a
 SRCREV_clockwork="606c48b92358fcca153952b56fb0d14d6845f84a"
-SRC_URI += "git://github.com/jonboulle/clockwork;name=clockwork;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jonboulle/clockwork"
+SRC_URI += "git://github.com/jonboulle/clockwork;name=clockwork;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jonboulle/clockwork"
 
 #       github.com/mattn/go-shellwords v1.0.12
 # [1] git ls-remote https://github.com/mattn/go-shellwords 973b9d5391598d4ee601db46fa32f6e186a356ac
 SRCREV_go-shellwords="973b9d5391598d4ee601db46fa32f6e186a356ac"
-SRC_URI += "git://github.com/mattn/go-shellwords;name=go-shellwords;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-shellwords"
+SRC_URI += "git://github.com/mattn/go-shellwords;name=go-shellwords;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-shellwords"
 
 #       github.com/moby/patternmatcher v0.6.0
 # [1] git ls-remote https://github.com/moby/patternmatcher 347bb8d8d557f90d1b75cd8bca3c0177f380a979
 SRCREV_patternmatcher="347bb8d8d557f90d1b75cd8bca3c0177f380a979"
-SRC_URI += "git://github.com/moby/patternmatcher;name=patternmatcher;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/patternmatcher"
+SRC_URI += "git://github.com/moby/patternmatcher;name=patternmatcher;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/patternmatcher"
 
 #       go.opentelemetry.io/otel/trace v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_trace="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/trace"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/trace"
 
 #       github.com/cenkalti/backoff/v4 v4.2.1
 # [1] git ls-remote https://github.com/cenkalti/backoff a04a6fe64ffb0e3fd0816460529d300be5f252df
 SRCREV_v4="a04a6fe64ffb0e3fd0816460529d300be5f252df"
-SRC_URI += "git://github.com/cenkalti/backoff;name=v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cenkalti/backoff/v4"
+SRC_URI += "git://github.com/cenkalti/backoff;name=v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cenkalti/backoff/v4"
 
 #       github.com/docker/distribution v2.8.3+incompatible
 # [1] git ls-remote https://github.com/distribution/distribution 4772604ae973031ab32dd9805a4bccf61d94909f
 SRCREV_distribution="4772604ae973031ab32dd9805a4bccf61d94909f"
-SRC_URI += "git://github.com/distribution/distribution;name=distribution;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/distribution"
+SRC_URI += "git://github.com/distribution/distribution;name=distribution;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/distribution"
 
 #       github.com/moby/sys/sequential v0.5.0
 # [1] git ls-remote https://github.com/moby/sys b22ba8a69b306f0b4adbbe2a529457e6283ed9f7
 SRCREV_sequential="b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
-SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequential"
+SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/sequential"
 
 #       github.com/shibumi/go-pathspec v1.3.0
 # [1] git ls-remote https://github.com/shibumi/go-pathspec 30eddf187f62305a5b34f662049d077211abaacd
 SRCREV_go-pathspec="30eddf187f62305a5b34f662049d077211abaacd"
-SRC_URI += "git://github.com/shibumi/go-pathspec;name=go-pathspec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/shibumi/go-pathspec"
+SRC_URI += "git://github.com/shibumi/go-pathspec;name=go-pathspec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/shibumi/go-pathspec"
 
 #       go.opentelemetry.io/proto/otlp v1.0.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-proto-go 97744b2e4a0fa6787b96b9c3c740daefca754333
 SRCREV_otlp="97744b2e4a0fa6787b96b9c3c740daefca754333"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-proto-go;name=otlp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/proto/otlp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-proto-go;name=otlp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/proto/otlp"
 
 #       github.com/docker/cli-docs-tool v0.7.0
 # [1] git ls-remote https://github.com/docker/cli-docs-tool 3149c912295595f6fc3bd7d3ee9283d97a4aedf6
 SRCREV_cli-docs-tool="3149c912295595f6fc3bd7d3ee9283d97a4aedf6"
-SRC_URI += "git://github.com/docker/cli-docs-tool;name=cli-docs-tool;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli-docs-tool"
+SRC_URI += "git://github.com/docker/cli-docs-tool;name=cli-docs-tool;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/cli-docs-tool"
 
 #       github.com/hashicorp/go-version v1.6.0
 # [1] git ls-remote https://github.com/hashicorp/go-version 78d058c5618891f74d604bd15356fca690b64d8a
 SRCREV_go-version="78d058c5618891f74d604bd15356fca690b64d8a"
-SRC_URI += "git://github.com/hashicorp/go-version;name=go-version;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-version"
+SRC_URI += "git://github.com/hashicorp/go-version;name=go-version;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-version"
 
 #       github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
 # [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
 SRCREV_concurrent="bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
-SRC_URI += "git://github.com/modern-go/concurrent;name=concurrent;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/concurrent"
+SRC_URI += "git://github.com/modern-go/concurrent;name=concurrent;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/modern-go/concurrent"
 
 #       github.com/xeipuuv/gojsonschema v1.2.0
 # [1] git ls-remote https://github.com/xeipuuv/gojsonschema 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
 SRCREV_gojsonschema="82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
-SRC_URI += "git://github.com/xeipuuv/gojsonschema;name=gojsonschema;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonschema"
+SRC_URI += "git://github.com/xeipuuv/gojsonschema;name=gojsonschema;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xeipuuv/gojsonschema"
 
 #       go.opentelemetry.io/otel/metric v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_metric="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=metric;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/metric"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=metric;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/metric"
 
 #       github.com/AlecAivazis/survey/v2 v2.3.7
 # [1] git ls-remote https://github.com/AlecAivazis/survey fa37277e6394c29db7bcc94062cb30cd7785a126
 SRCREV_v2="fa37277e6394c29db7bcc94062cb30cd7785a126"
-SRC_URI += "git://github.com/AlecAivazis/survey;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AlecAivazis/survey/v2"
+SRC_URI += "git://github.com/AlecAivazis/survey;name=v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/AlecAivazis/survey/v2"
 
 #       github.com/containerd/containerd v1.7.13
 # [1] git ls-remote https://github.com/containerd/containerd 7c3aca7a610df76212171d200ca3811ff6096eb8
 SRCREV_containerd="7c3aca7a610df76212171d200ca3811ff6096eb8"
-SRC_URI += "git://github.com/containerd/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/containerd"
+SRC_URI += "git://github.com/containerd/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/containerd"
 
 #       github.com/docker/go-connections v0.5.0
 # [1] git ls-remote https://github.com/docker/go-connections fa09c952e3eadbffaf8afc5b8a1667158ba38ace
 SRCREV_go-connections="fa09c952e3eadbffaf8afc5b8a1667158ba38ace"
-SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-connections"
+SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-connections"
 
 #       github.com/Masterminds/semver/v3 v3.2.1
 # [1] git ls-remote https://github.com/Masterminds/semver e06051f8fcc4c8b4a4990c337b9862a2448722e5
 SRCREV_semver-v3="e06051f8fcc4c8b4a4990c337b9862a2448722e5"
-SRC_URI += "git://github.com/Masterminds/semver;name=semver-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Masterminds/semver/v3"
+SRC_URI += "git://github.com/Masterminds/semver;name=semver-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/semver/v3"
 
 #       github.com/containerd/continuity v0.4.3
 # [1] git ls-remote https://github.com/containerd/continuity 1743d9104d944131cdedaba33a59d2f9bd80a6f2
 SRCREV_continuity="1743d9104d944131cdedaba33a59d2f9bd80a6f2"
-SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/continuity"
+SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/continuity"
 
 #       github.com/containerd/typeurl/v2 v2.1.1
 # [1] git ls-remote https://github.com/containerd/typeurl 7ef6316b771f959cbb208b229e3423a466947df3
 SRCREV_typeurl-v2="7ef6316b771f959cbb208b229e3423a466947df3"
-SRC_URI += "git://github.com/containerd/typeurl;name=typeurl-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl/v2"
+SRC_URI += "git://github.com/containerd/typeurl;name=typeurl-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/typeurl/v2"
 
 #       github.com/google/gnostic-models v0.6.8
 # [1] git ls-remote https://github.com/google/gnostic-models 577692584cdf09674595bba0c182d0e8a44655d3
 SRCREV_gnostic-models="577692584cdf09674595bba0c182d0e8a44655d3"
-SRC_URI += "git://github.com/google/gnostic-models;name=gnostic-models;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gnostic-models"
+SRC_URI += "git://github.com/google/gnostic-models;name=gnostic-models;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/gnostic-models"
 
 #       github.com/mitchellh/reflectwalk v1.0.2
 # [1] git ls-remote https://github.com/mitchellh/reflectwalk e0c24fdb021963cd2c4013097a0b993a7c4e344f
 SRCREV_reflectwalk="e0c24fdb021963cd2c4013097a0b993a7c4e344f"
-SRC_URI += "git://github.com/mitchellh/reflectwalk;name=reflectwalk;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/reflectwalk"
+SRC_URI += "git://github.com/mitchellh/reflectwalk;name=reflectwalk;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/reflectwalk"
 
 #       github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb
 # [1] git ls-remote https://github.com/xeipuuv/gojsonpointer 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
 SRCREV_gojsonpointer="02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
-SRC_URI += "git://github.com/xeipuuv/gojsonpointer;name=gojsonpointer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonpointer"
+SRC_URI += "git://github.com/xeipuuv/gojsonpointer;name=gojsonpointer;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xeipuuv/gojsonpointer"
 
 #       github.com/distribution/reference v0.5.0
 # [1] git ls-remote https://github.com/distribution/reference 49c28499d219290c3226822e9cfcd4ede6d75379
 SRCREV_reference="49c28499d219290c3226822e9cfcd4ede6d75379"
-SRC_URI += "git://github.com/distribution/reference;name=reference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/distribution/reference"
+SRC_URI += "git://github.com/distribution/reference;name=reference;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/distribution/reference"
 
 #       github.com/mitchellh/mapstructure v1.5.0
 # [1] git ls-remote https://github.com/mitchellh/mapstructure ab69d8d93410fce4361f4912bb1ff88110a81311
 SRCREV_mapstructure="ab69d8d93410fce4361f4912bb1ff88110a81311"
-SRC_URI += "git://github.com/mitchellh/mapstructure;name=mapstructure;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/mapstructure"
+SRC_URI += "git://github.com/mitchellh/mapstructure;name=mapstructure;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/mapstructure"
 
 #       github.com/skratchdot/open-golang v0.0.0-20200116055534-eef842397966
 # [1] git ls-remote https://github.com/skratchdot/open-golang eef8423979666925a58eb77f9db583e54320d5a4
 SRCREV_open-golang="eef8423979666925a58eb77f9db583e54320d5a4"
-SRC_URI += "git://github.com/skratchdot/open-golang;name=open-golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/skratchdot/open-golang"
+SRC_URI += "git://github.com/skratchdot/open-golang;name=open-golang;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/skratchdot/open-golang"
 
 #       github.com/emicklei/go-restful/v3 v3.11.0
 # [1] git ls-remote https://github.com/emicklei/go-restful 30bec7807481e62e1e1e59ad57e7f22054806966
 SRCREV_go-restful-v3="30bec7807481e62e1e1e59ad57e7f22054806966"
-SRC_URI += "git://github.com/emicklei/go-restful;name=go-restful-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/emicklei/go-restful/v3"
+SRC_URI += "git://github.com/emicklei/go-restful;name=go-restful-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/emicklei/go-restful/v3"
 
 #       github.com/go-openapi/jsonpointer v0.19.6
 # [1] git ls-remote https://github.com/go-openapi/jsonpointer 5df0d69a6be189afff354877d332f9ede32afe12
 SRCREV_jsonpointer="5df0d69a6be189afff354877d332f9ede32afe12"
-SRC_URI += "git://github.com/go-openapi/jsonpointer;name=jsonpointer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/jsonpointer"
+SRC_URI += "git://github.com/go-openapi/jsonpointer;name=jsonpointer;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-openapi/jsonpointer"
 
 #       github.com/hashicorp/go-cleanhttp v0.5.2
 # [1] git ls-remote https://github.com/hashicorp/go-cleanhttp 6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2
 SRCREV_go-cleanhttp="6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2"
-SRC_URI += "git://github.com/hashicorp/go-cleanhttp;name=go-cleanhttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-cleanhttp"
+SRC_URI += "git://github.com/hashicorp/go-cleanhttp;name=go-cleanhttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-cleanhttp"
 
 #       github.com/in-toto/in-toto-golang v0.5.0
 # [1] git ls-remote https://github.com/in-toto/in-toto-golang ec599036d27ebaca3e8c03559d3f8fd5fe429dfe
 SRCREV_in-toto-golang="ec599036d27ebaca3e8c03559d3f8fd5fe429dfe"
-SRC_URI += "git://github.com/in-toto/in-toto-golang;name=in-toto-golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/in-toto/in-toto-golang"
+SRC_URI += "git://github.com/in-toto/in-toto-golang;name=in-toto-golang;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/in-toto/in-toto-golang"
 
 #       github.com/kballard/go-shellquote v0.0.0-20180428030007-95032a82bc51
 # [1] git ls-remote https://github.com/kballard/go-shellquote 95032a82bc518f77982ea72343cc1ade730072f0
 SRCREV_go-shellquote="95032a82bc518f77982ea72343cc1ade730072f0"
-SRC_URI += "git://github.com/kballard/go-shellquote;name=go-shellquote;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kballard/go-shellquote"
+SRC_URI += "git://github.com/kballard/go-shellquote;name=go-shellquote;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/kballard/go-shellquote"
 
 #       github.com/moby/docker-image-spec v1.3.1
 # [1] git ls-remote https://github.com/moby/docker-image-spec f1d00ebd2d6d6805170d5543dbca4b850f35f9af
 SRCREV_docker-image-spec="f1d00ebd2d6d6805170d5543dbca4b850f35f9af"
-SRC_URI += "git://github.com/moby/docker-image-spec;name=docker-image-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/docker-image-spec"
+SRC_URI += "git://github.com/moby/docker-image-spec;name=docker-image-spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/docker-image-spec"
 
 #       github.com/hashicorp/go-multierror v1.1.1
 # [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0
 SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
-SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
+SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-multierror"
 
 #       github.com/mitchellh/copystructure v1.2.0
 # [1] git ls-remote https://github.com/mitchellh/copystructure d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84
 SRCREV_copystructure="d4ce1f938f7a7ea2a40bff4544b56be9c00b5e84"
-SRC_URI += "git://github.com/mitchellh/copystructure;name=copystructure;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/copystructure"
+SRC_URI += "git://github.com/mitchellh/copystructure;name=copystructure;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/copystructure"
 
 #       github.com/prometheus/client_model v0.5.0
 # [1] git ls-remote https://github.com/prometheus/client_model 1c92cadf7d8fa1726bae12e6025cca9b86d2ba5f
 SRCREV_client_model="1c92cadf7d8fa1726bae12e6025cca9b86d2ba5f"
-SRC_URI += "git://github.com/prometheus/client_model;name=client_model;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_model"
+SRC_URI += "git://github.com/prometheus/client_model;name=client_model;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/client_model"
 
 #       github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415
 # [1] git ls-remote https://github.com/xeipuuv/gojsonreference bd5ef7bd5415a7ac448318e64f11a24cd21e594b
 SRCREV_gojsonreference="bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
-SRC_URI += "git://github.com/xeipuuv/gojsonreference;name=gojsonreference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonreference"
+SRC_URI += "git://github.com/xeipuuv/gojsonreference;name=gojsonreference;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xeipuuv/gojsonreference"
 
 #       github.com/opencontainers/go-digest v1.0.0
 # [1] git ls-remote https://github.com/opencontainers/go-digest ea51bea511f75cfa3ef6098cc253c5c3609b037a
 SRCREV_go-digest="ea51bea511f75cfa3ef6098cc253c5c3609b037a"
-SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/go-digest"
+SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/go-digest"
 
 #       github.com/aws/aws-sdk-go-v2/config v1.26.6
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 857d5277b41f290ab7ba0e0f6f96f940045f69b7
 SRCREV_config="857d5277b41f290ab7ba0e0f6f96f940045f69b7"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=config;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/config"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=config;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/config"
 
 #       github.com/go-openapi/jsonreference v0.20.2
 # [1] git ls-remote https://github.com/go-openapi/jsonreference 1f158e563669961b8e54817e3ea57978d439ffff
 SRCREV_jsonreference="1f158e563669961b8e54817e3ea57978d439ffff"
-SRC_URI += "git://github.com/go-openapi/jsonreference;name=jsonreference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/jsonreference"
+SRC_URI += "git://github.com/go-openapi/jsonreference;name=jsonreference;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-openapi/jsonreference"
 
 #       github.com/prometheus/client_golang v1.17.0
 # [1] git ls-remote https://github.com/prometheus/client_golang fa1408ee351f6aba15c6d0207f7a0021eb3af406
 SRCREV_client_golang="fa1408ee351f6aba15c6d0207f7a0021eb3af406"
-SRC_URI += "git://github.com/prometheus/client_golang;name=client_golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_golang"
+SRC_URI += "git://github.com/prometheus/client_golang;name=client_golang;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/client_golang"
 
 #       go.opentelemetry.io/otel/sdk/metric v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_sdk-metric="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=sdk-metric;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/sdk/metric"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=sdk-metric;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/sdk/metric"
 
 #       github.com/opencontainers/image-spec v1.1.0-rc6
 # [1] git ls-remote https://github.com/opencontainers/image-spec 6c2b5fafa0731a97aad0c2a68bac238d6c98c690
 SRCREV_image-spec="6c2b5fafa0731a97aad0c2a68bac238d6c98c690"
-SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image-spec"
+SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/image-spec"
 
 #       github.com/theupdateframework/notary v0.7.0
 # [1] git ls-remote https://github.com/notaryproject/notary b0b6bfdd4933081e8d5ae026b24e8337311dd598
 SRCREV_notary="b0b6bfdd4933081e8d5ae026b24e8337311dd598"
-SRC_URI += "git://github.com/notaryproject/notary;name=notary;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/theupdateframework/notary"
+SRC_URI += "git://github.com/notaryproject/notary;name=notary;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/theupdateframework/notary"
 
 #       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa24
 # [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers ced1acdcaa24dc39c01b039fc37576c395f506cf
 SRCREV_go-fuzz-headers="ced1acdcaa24dc39c01b039fc37576c395f506cf"
-SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
+SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
 
 #       github.com/inconshreveable/mousetrap v1.1.0
 # [1] git ls-remote https://github.com/inconshreveable/mousetrap 4e8053ee7ef85a6bd26368364a6d27f1641c1d21
 SRCREV_mousetrap="4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
-SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
+SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/inconshreveable/mousetrap"
 
 #       sigs.k8s.io/structured-merge-diff/v4 v4.4.1
 # [1] git ls-remote https://github.com/kubernetes-sigs/structured-merge-diff cf09e71f4508bfc416135048e392a8a4990bf4e3
 SRCREV_structured-merge-diff-v4="cf09e71f4508bfc416135048e392a8a4990bf4e3"
-SRC_URI += "git://github.com/kubernetes-sigs/structured-merge-diff;name=structured-merge-diff-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4"
+SRC_URI += "git://github.com/kubernetes-sigs/structured-merge-diff;name=structured-merge-diff-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4"
 
 #       github.com/compose-spec/compose-go/v2 v2.0.2
 # [1] git ls-remote https://github.com/compose-spec/compose-go d0722c0e5564b4970f6634592638c0577ef8e028
 SRCREV_compose-go-v2="d0722c0e5564b4970f6634592638c0577ef8e028"
-SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go/v2"
+SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/compose-spec/compose-go/v2"
 
 #       tags.cncf.io/container-device-interface v0.6.2
 # [1] git ls-remote https://github.com/cncf-tags/container-device-interface fb50bf8fc8b2c3c8fda6d23ab7e044774dcca678
 SRCREV_container-device-interface="fb50bf8fc8b2c3c8fda6d23ab7e044774dcca678"
-SRC_URI += "git://github.com/cncf-tags/container-device-interface;name=container-device-interface;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/tags.cncf.io/container-device-interface"
+SRC_URI += "git://github.com/cncf-tags/container-device-interface;name=container-device-interface;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/tags.cncf.io/container-device-interface"
 
 #       github.com/aws/aws-sdk-go-v2/credentials v1.16.16
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 a75d7694eb2709212655ee25e811d72a1188a68b
 SRCREV_credentials="a75d7694eb2709212655ee25e811d72a1188a68b"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=credentials;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/credentials"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=credentials;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/credentials"
 
 #       github.com/aws/aws-sdk-go-v2/service/sso v1.18.7
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 a75d7694eb2709212655ee25e811d72a1188a68b
 SRCREV_sso="a75d7694eb2709212655ee25e811d72a1188a68b"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=sso;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/sso"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=sso;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/sso"
 
 #       github.com/aws/aws-sdk-go-v2/service/sts v1.26.7
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39
 SRCREV_sts="47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=sts;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/sts"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=sts;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/sts"
 
 #       github.com/aws/aws-sdk-go-v2/internal/ini v1.7.3
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 857d5277b41f290ab7ba0e0f6f96f940045f69b7
 SRCREV_ini="857d5277b41f290ab7ba0e0f6f96f940045f69b7"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=ini;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/internal/ini"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=ini;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/internal/ini"
 
 #       github.com/grpc-ecosystem/grpc-gateway/v2 v2.16.0
 # [1] git ls-remote https://github.com/grpc-ecosystem/grpc-gateway 09e3965a330155f7db8482269d7d91b9bceb7641
 SRCREV_grpc-gateway-v2="09e3965a330155f7db8482269d7d91b9bceb7641"
-SRC_URI += "git://github.com/grpc-ecosystem/grpc-gateway;name=grpc-gateway-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
+SRC_URI += "git://github.com/grpc-ecosystem/grpc-gateway;name=grpc-gateway-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
 
 #       google.golang.org/genproto/googleapis/api v0.0.0-20231016165738-49dd2c1f3d0b
 # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846
 SRCREV_api="49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/api"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto/googleapis/api"
 
 #       google.golang.org/genproto/googleapis/rpc v0.0.0-20231016165738-49dd2c1f3d0b
 # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846
 SRCREV_rpc="49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=rpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/rpc"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=rpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto/googleapis/rpc"
 
 #       github.com/docker/docker-credential-helpers v0.8.0
 # [1] git ls-remote https://github.com/docker/docker-credential-helpers 8396edb35f8d7229e75482e9d82c7729fa7001b7
 SRCREV_docker-credential-helpers="8396edb35f8d7229e75482e9d82c7729fa7001b7"
-SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker-credential-helpers"
+SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker-credential-helpers"
 
 #       github.com/aws/aws-sdk-go-v2/service/ssooidc v1.21.7
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 f53c9bcd7ccef6fd9f13f77512e78e3a7aa3cc01
 SRCREV_ssooidc="f53c9bcd7ccef6fd9f13f77512e78e3a7aa3cc01"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=ssooidc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/ssooidc"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=ssooidc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/ssooidc"
 
 #       github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
 # [1] git ls-remote https://github.com/grpc-ecosystem/go-grpc-middleware df0f91b29bbbdfc3a686a7a8edbe2b9de2072fdd
 SRCREV_go-grpc-middleware="df0f91b29bbbdfc3a686a7a8edbe2b9de2072fdd"
-SRC_URI += "git://github.com/grpc-ecosystem/go-grpc-middleware;name=go-grpc-middleware;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/go-grpc-middleware"
+SRC_URI += "git://github.com/grpc-ecosystem/go-grpc-middleware;name=go-grpc-middleware;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/go-grpc-middleware"
 
 #       github.com/aws/aws-sdk-go-v2/feature/ec2/imds v1.14.11
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39
 SRCREV_imds="47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=imds;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/feature/ec2/imds"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=imds;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/feature/ec2/imds"
 
 #       go.opentelemetry.io/otel/exporters/prometheus v0.42.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_prometheus="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=prometheus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/prometheus"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=prometheus;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/prometheus"
 
 #       github.com/matttproud/golang_protobuf_extensions v1.0.4
 # [1] git ls-remote https://github.com/matttproud/golang_protobuf_extensions c182affec369e30f25d3eb8cd8a478dee585ae7d
 SRCREV_golang_protobuf_extensions="c182affec369e30f25d3eb8cd8a478dee585ae7d"
-SRC_URI += "git://github.com/matttproud/golang_protobuf_extensions;name=golang_protobuf_extensions;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobuf_extensions"
+SRC_URI += "git://github.com/matttproud/golang_protobuf_extensions;name=golang_protobuf_extensions;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/matttproud/golang_protobuf_extensions"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_otlptrace="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptrace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptrace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace"
 
 #       github.com/secure-systems-lab/go-securesystemslib v0.4.0
 # [1] git ls-remote https://github.com/secure-systems-lab/go-securesystemslib abcd7c95c952df38eb237fab3764ef1b8d2b15c9
 SRCREV_go-securesystemslib="abcd7c95c952df38eb237fab3764ef1b8d2b15c9"
-SRC_URI += "git://github.com/secure-systems-lab/go-securesystemslib;name=go-securesystemslib;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/secure-systems-lab/go-securesystemslib"
+SRC_URI += "git://github.com/secure-systems-lab/go-securesystemslib;name=go-securesystemslib;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/secure-systems-lab/go-securesystemslib"
 
 #       github.com/aws/aws-sdk-go-v2/internal/endpoints/v2 v2.5.10
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39
 SRCREV_endpoints-v2="47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=endpoints-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=endpoints-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/internal/endpoints/v2"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlpmetric v0.42.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_otlpmetric="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlpmetric;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlpmetric;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric"
 
 #       github.com/aws/aws-sdk-go-v2/internal/configsources v1.2.10
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39
 SRCREV_configsources="47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=configsources;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/internal/configsources"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=configsources;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/internal/configsources"
 
 #       github.com/aws/aws-sdk-go-v2/service/internal/presigned-url v1.10.10
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39
 SRCREV_presigned-url="47dd1b1bcbde244357a82ef00fa6a61a9bfb9b39"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=presigned-url;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=presigned-url;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/internal/presigned-url"
 
 #       go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.46.1
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib ba19074a6785b2b65c86a52c0649cf040319fa96
 SRCREV_otelhttp="ba19074a6785b2b65c86a52c0649cf040319fa96"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
 
 #       github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding v1.10.4
 # [1] git ls-remote https://github.com/aws/aws-sdk-go-v2 0d643a8f0a8ad09075f41a60acba6a208cb36c58
 SRCREV_accept-encoding="0d643a8f0a8ad09075f41a60acba6a208cb36c58"
-SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=accept-encoding;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding"
+SRC_URI += "git://github.com/aws/aws-sdk-go-v2;name=accept-encoding;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/aws/aws-sdk-go-v2/service/internal/accept-encoding"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_otlptracegrpc="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptracegrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptracegrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.21.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 98b32a6c3a87fbee5d34c063b9096f416b250897
 SRCREV_otlptracehttp="98b32a6c3a87fbee5d34c063b9096f416b250897"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptracehttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptracehttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc v0.42.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_otlpmetricgrpc="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlpmetricgrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlpmetricgrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp v0.42.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_otlpmetrichttp="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlpmetrichttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlpmetrichttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp"
 
 #       go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.46.1
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib ba19074a6785b2b65c86a52c0649cf040319fa96
 SRCREV_otelgrpc="ba19074a6785b2b65c86a52c0649cf040319fa96"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelgrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelgrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
 
 #       go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace v0.46.1
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib ba19074a6785b2b65c86a52c0649cf040319fa96
 SRCREV_otelhttptrace="ba19074a6785b2b65c86a52c0649cf040319fa96"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttptrace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttptrace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace"
 
diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
index dbca0d55..3ed91f12 100644
--- a/recipes-containers/docker-distribution/docker-distribution_git.bb
+++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
@@ -48,7 +48,7 @@ do_install() {
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 	    install -d ${D}${systemd_unitdir}/system
-	    install -m 644 ${WORKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system
+	    install -m 644 ${UNPACKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system
 	fi
 
 	install -d ${D}/${sysconfdir}/docker-distribution/registry/
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
index 48f7d3ec..25c6b1e5 100644
--- a/recipes-containers/docker/docker.inc
+++ b/recipes-containers/docker/docker.inc
@@ -110,7 +110,7 @@ do_install() {
 		rm -f ${D}/${systemd_unitdir}/system/docker.service.rpm
 	else
 		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
+		install -m 0755 ${UNPACKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
 	fi
 	# TLS key that docker creates at run-time if not found is what resides here
 	if ${@bb.utils.contains('PACKAGECONFIG','transient-config','true','false',d)}; then
diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
index b88b8349..ab3f4366 100644
--- a/recipes-containers/k3s/k3s_git.bb
+++ b/recipes-containers/k3s/k3s_git.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://k3s.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${S}/src/import/LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.28;name=k3s;protocol=https \
+SRC_URI = "git://github.com/rancher/k3s.git;branch=release-1.28;name=k3s;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
            file://k3s.service \
            file://k3s-agent.service \
            file://k3s-agent \
@@ -23,7 +23,7 @@ PV = "v1.28.7+k3s1+git${SRCREV_k3s}"
 
 include src_uri.inc
 
-CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conf"
+CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conf"
 
 inherit go
 inherit goarch
@@ -74,7 +74,7 @@ do_compile() {
 	#
 	#         vendor/github.com/containerd/containerd/snapshots/btrfs/plugin/*.go
 
-        cp ${WORKDIR}/modules.txt vendor/
+        cp ${UNPACKDIR}/modules.txt vendor/
 
         VERSION_GOLANG="$(go version | cut -d" " -f3)"
         ${GO} build -trimpath -tags "$TAGS" -ldflags "-X github.com/k3s-io/k3s/pkg/version.UpstreamGolang=$VERSION_GOLANG  ${GO_BUILD_LDFLAGS} -w -s" -o ./dist/artifacts/k3s ./cmd/server/main.go
@@ -92,14 +92,14 @@ do_install() {
         # We want to use the containerd provided ctr
         # ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/ctr"
         ln -sr "${D}/${BIN_PREFIX}/bin/k3s" "${D}${BIN_PREFIX}/bin/kubectl"
-        install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
-        install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
+        install -m 755 "${UNPACKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
+        install -m 755 "${UNPACKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
 
         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-                install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
-                install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
+                install -D -m 0644 "${UNPACKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
+                install -D -m 0644 "${UNPACKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
                 sed -i "s#\(Exec\)\(.*\)=\(.*\)\(k3s\)#\1\2=${BIN_PREFIX}/bin/\4#g" "${D}${systemd_system_unitdir}/k3s.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
-                install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
+                install -m 755 "${UNPACKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
         fi
 
 	mkdir -p ${D}${datadir}/k3s/
diff --git a/recipes-containers/k3s/src_uri.inc b/recipes-containers/k3s/src_uri.inc
index b90441e1..466fe036 100644
--- a/recipes-containers/k3s/src_uri.inc
+++ b/recipes-containers/k3s/src_uri.inc
@@ -1,2150 +1,2150 @@
 #       k8s.io/utils v0.0.0-20230726121419-3b25d923346b
 # [1] git ls-remote https://github.com/kubernetes/utils 3b25d923346b3814e0898684c97390092f31a61e
 SRCREV_utils="3b25d923346b3814e0898684c97390092f31a61e"
-SRC_URI += "git://github.com/kubernetes/utils;name=utils;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/utils"
+SRC_URI += "git://github.com/kubernetes/utils;name=utils;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/utils"
 
 #       k8s.io/gengo v0.0.0-20230829151522-9cce18d56c01
 # [1] git ls-remote https://github.com/kubernetes/gengo 9cce18d56c01fab1d8ed72411ad6ef7005fc33a4
 SRCREV_gengo="9cce18d56c01fab1d8ed72411ad6ef7005fc33a4"
-SRC_URI += "git://github.com/kubernetes/gengo;name=gengo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/gengo"
+SRC_URI += "git://github.com/kubernetes/gengo;name=gengo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/gengo"
 
 #       go.uber.org/fx v1.20.0
 # [1] git ls-remote https://github.com/uber-go/fx 1320bc693745e5e7c08c29843de3d7915cac826c
 SRCREV_fx="1320bc693745e5e7c08c29843de3d7915cac826c"
-SRC_URI += "git://github.com/uber-go/fx;name=fx;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/fx"
+SRC_URI += "git://github.com/uber-go/fx;name=fx;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/fx"
 
 #       go.uber.org/zap v1.26.0
 # [1] git ls-remote https://github.com/uber-go/zap 96038b71a7d96b8c14fedb3aeddcb3d0d7605b2d
 SRCREV_zap="96038b71a7d96b8c14fedb3aeddcb3d0d7605b2d"
-SRC_URI += "git://github.com/uber-go/zap;name=zap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/zap"
+SRC_URI += "git://github.com/uber-go/zap;name=zap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/zap"
 
 #       go.uber.org/dig v1.17.0
 # [1] git ls-remote https://github.com/uber-go/dig a8b6f0db4f27681ad7233eed1bda9d5c69881f5b
 SRCREV_dig="a8b6f0db4f27681ad7233eed1bda9d5c69881f5b"
-SRC_URI += "git://github.com/uber-go/dig;name=dig;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/dig"
+SRC_URI += "git://github.com/uber-go/dig;name=dig;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/dig"
 
 #       go.starlark.net v0.0.0-20230525235612-a134d8f9ddca
 # [1] git ls-remote https://github.com/google/starlark-go a134d8f9ddca7469c736775b67544671f0a135ad
 SRCREV_go.starlark.net="a134d8f9ddca7469c736775b67544671f0a135ad"
-SRC_URI += "git://github.com/google/starlark-go;name=go.starlark.net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.starlark.net"
+SRC_URI += "git://github.com/google/starlark-go;name=go.starlark.net;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.starlark.net"
 
 #       gopkg.in/inf.v0 v0.9.1
 # [1] git ls-remote https://github.com/go-inf/inf d2d2541c53f18d2a059457998ce2876cc8e67cbf
 SRCREV_inf.v0="d2d2541c53f18d2a059457998ce2876cc8e67cbf"
-SRC_URI += "git://github.com/go-inf/inf;name=inf.v0;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/inf.v0"
+SRC_URI += "git://github.com/go-inf/inf;name=inf.v0;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/inf.v0"
 
 #       gopkg.in/ini.v1 v1.67.0
 # [1] git ls-remote https://github.com/go-ini/ini b2f570e5b5b844226bbefe6fb521d891f529a951
 SRCREV_ini.v1="b2f570e5b5b844226bbefe6fb521d891f529a951"
-SRC_URI += "git://github.com/go-ini/ini;name=ini.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1"
+SRC_URI += "git://github.com/go-ini/ini;name=ini.v1;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/ini.v1"
 
 #       golang.org/x/net v0.17.0
 # [1] git ls-remote https://go.googlesource.com/net b225e7ca6dde1ef5a5ae5ce922861bda011cfabd
 SRCREV_net="b225e7ca6dde1ef5a5ae5ce922861bda011cfabd"
-SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net"
+SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/net"
 
 #       golang.org/x/sys v0.13.0
 # [1] git ls-remote https://go.googlesource.com/sys 2964e1e4b1dbd55a8ac69a4c9e3004a8038515b6
 SRCREV_sys="2964e1e4b1dbd55a8ac69a4c9e3004a8038515b6"
-SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys"
+SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sys"
 
 #       gopkg.in/yaml.v2 v2.4.0
 # [1] git ls-remote https://github.com/go-yaml/yaml 7649d4548cb53a614db133b2a8ac1f31859dda8c
 SRCREV_yaml.v2="7649d4548cb53a614db133b2a8ac1f31859dda8c"
-SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v2"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v2"
 
 #       inet.af/tcpproxy v0.0.0-20200125044825-b6bb9b5b8252
 # [1] git ls-remote https://github.com/inetaf/tcpproxy b6bb9b5b82524122bcf27291ede32d1517a14ab8
 SRCREV_tcpproxy="b6bb9b5b82524122bcf27291ede32d1517a14ab8"
-SRC_URI += "git://github.com/inetaf/tcpproxy;name=tcpproxy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/inet.af/tcpproxy"
+SRC_URI += "git://github.com/inetaf/tcpproxy;name=tcpproxy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/inet.af/tcpproxy"
 
 #       sigs.k8s.io/yaml v1.4.0
 # [1] git ls-remote https://github.com/kubernetes-sigs/yaml c3772b51db126345efe2dfe4ff8dac83b8141684
 SRCREV_yaml="c3772b51db126345efe2dfe4ff8dac83b8141684"
-SRC_URI += "git://github.com/kubernetes-sigs/yaml;name=yaml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/yaml"
+SRC_URI += "git://github.com/kubernetes-sigs/yaml;name=yaml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/yaml"
 
 #       go.etcd.io/bbolt v1.3.8
 # [1] git ls-remote https://github.com/etcd-io/bbolt 42a914d8be1995a845e12dedbbbc77b7a450f9c7
 SRCREV_bbolt="42a914d8be1995a845e12dedbbbc77b7a450f9c7"
-SRC_URI += "git://github.com/etcd-io/bbolt;name=bbolt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.etcd.io/bbolt"
+SRC_URI += "git://github.com/etcd-io/bbolt;name=bbolt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.etcd.io/bbolt"
 
 #       go.opencensus.io v0.24.0
 # [1] git ls-remote https://github.com/census-instrumentation/opencensus-go b1a01ee95db0e690d91d7193d037447816fae4c5
 SRCREV_go.opencensus.io="b1a01ee95db0e690d91d7193d037447816fae4c5"
-SRC_URI += "git://github.com/census-instrumentation/opencensus-go;name=go.opencensus.io;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opencensus.io"
+SRC_URI += "git://github.com/census-instrumentation/opencensus-go;name=go.opencensus.io;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opencensus.io"
 
 #       golang.org/x/exp v0.0.0-20231006140011-7918f672742d
 # [1] git ls-remote https://go.googlesource.com/exp 7918f672742dd40ff5cf8d3c316a9315410c2d3c
 SRCREV_exp="7918f672742dd40ff5cf8d3c316a9315410c2d3c"
-SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp"
+SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/exp"
 
 #       golang.org/x/mod v0.14.0
 # [1] git ls-remote https://go.googlesource.com/mod 6e58e47c7bd6672665dc35cce7b1f325d2addd67
 SRCREV_mod="6e58e47c7bd6672665dc35cce7b1f325d2addd67"
-SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod"
+SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/mod"
 
 #       gopkg.in/gcfg.v1 v1.2.3
 # [1] git ls-remote https://github.com/go-gcfg/gcfg 61b2c08bc8f6068f7c5ca684372f9a6cb1c45ebe
 SRCREV_gcfg.v1="61b2c08bc8f6068f7c5ca684372f9a6cb1c45ebe"
-SRC_URI += "git://github.com/go-gcfg/gcfg;name=gcfg.v1;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/gcfg.v1"
+SRC_URI += "git://github.com/go-gcfg/gcfg;name=gcfg.v1;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/gcfg.v1"
 
 #       gopkg.in/yaml.v3 v3.0.1
 # [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f56608cd2c32c51f8194bf51
 SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3"
 
 #       sigs.k8s.io/json v0.0.0-20221116044647-bc3834ca7abd
 # [1] git ls-remote https://github.com/kubernetes-sigs/json bc3834ca7abd3a90f03ef00a27ad80cb892f9c21
 SRCREV_json="bc3834ca7abd3a90f03ef00a27ad80cb892f9c21"
-SRC_URI += "git://github.com/kubernetes-sigs/json;name=json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/json"
+SRC_URI += "git://github.com/kubernetes-sigs/json;name=json;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/json"
 
 #       github.com/lib/pq v1.10.2
 # [1] git ls-remote https://github.com/lib/pq 2da6713d67f03911a05b1b6559adc85927fe076e
 SRCREV_pq="2da6713d67f03911a05b1b6559adc85927fe076e"
-SRC_URI += "git://github.com/lib/pq;name=pq;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lib/pq"
+SRC_URI += "git://github.com/lib/pq;name=pq;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/lib/pq"
 
 #       golang.org/x/sync v0.6.0
 # [1] git ls-remote https://go.googlesource.com/sync 59c1ca1e4661ed4452be4069ceea3c233f4deec1
 SRCREV_sync="59c1ca1e4661ed4452be4069ceea3c233f4deec1"
-SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync"
+SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sync"
 
 #       golang.org/x/arch v0.3.0
 # [1] git ls-remote https://go.googlesource.com/arch 40c19ba4a7c5ffc92baaef5977ffc2b82dfb0e47
 SRCREV_arch="40c19ba4a7c5ffc92baaef5977ffc2b82dfb0e47"
-SRC_URI += "git://go.googlesource.com/arch;name=arch;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/arch"
+SRC_URI += "git://go.googlesource.com/arch;name=arch;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/arch"
 
 #       github.com/rs/xid v1.5.0
 # [1] git ls-remote https://github.com/rs/xid 47a0ac1e0b750ee1f43718be223bb07601c66a1f
 SRCREV_xid="47a0ac1e0b750ee1f43718be223bb07601c66a1f"
-SRC_URI += "git://github.com/rs/xid;name=xid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/xid"
+SRC_URI += "git://github.com/rs/xid;name=xid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rs/xid"
 
 #       golang.org/x/term v0.15.0
 # [1] git ls-remote https://go.googlesource.com/term ee66497fa39f03ba841b568a7b4f4ee4e4546f74
 SRCREV_x-term="ee66497fa39f03ba841b568a7b4f4ee4e4546f74"
-SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term"
+SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/term"
 
 #       golang.org/x/text v0.14.0
 # [1] git ls-remote https://go.googlesource.com/text 6c97a165dd661335ff7bce6104a008558123c353
 SRCREV_text="6c97a165dd661335ff7bce6104a008558123c353"
-SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text"
+SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/text"
 
 #       golang.org/x/time v0.5.0
 # [1] git ls-remote https://go.googlesource.com/time 883aed519795b30de35e6bc28ec8f681494afa87
 SRCREV_time="883aed519795b30de35e6bc28ec8f681494afa87"
-SRC_URI += "git://go.googlesource.com/time;name=time;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/time"
+SRC_URI += "git://go.googlesource.com/time;name=time;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/time"
 
 #       gonum.org/v1/gonum v0.13.0
 # [1] git ls-remote https://github.com/gonum/gonum 91a06ac64c4b32c929427846d4d1d3b8202ad7b1
 SRCREV_gonum="91a06ac64c4b32c929427846d4d1d3b8202ad7b1"
-SRC_URI += "git://github.com/gonum/gonum;name=gonum;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gonum.org/v1/gonum"
+SRC_URI += "git://github.com/gonum/gonum;name=gonum;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gonum.org/v1/gonum"
 
 #       golang.org/x/tools v0.16.1
 # [1] git ls-remote https://go.googlesource.com/tools 2acb2e697b49f179be93652febb89d384f0f09c9
 SRCREV_tools="2acb2e697b49f179be93652febb89d384f0f09c9"
-SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
+SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/tools"
 
 #       golang.org/x/crypto v0.14.0
 # [1] git ls-remote https://go.googlesource.com/crypto e3cc52e598e302f8c613a645bb7231264d8ec995
 SRCREV_crypto="e3cc52e598e302f8c613a645bb7231264d8ec995"
-SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto"
+SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/crypto"
 
 #       golang.org/x/oauth2 v0.15.0
 # [1] git ls-remote https://go.googlesource.com/oauth2 6e9ec9323da7adcd2cc6e62e4deb9fae4c309a1a
 SRCREV_oauth2="6e9ec9323da7adcd2cc6e62e4deb9fae4c309a1a"
-SRC_URI += "git://go.googlesource.com/oauth2;name=oauth2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/oauth2"
+SRC_URI += "git://go.googlesource.com/oauth2;name=oauth2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/oauth2"
 
 #       k8s.io/kube-openapi v0.0.0-20230717233707-2695361300d9
 # [1] git ls-remote https://github.com/kubernetes/kube-openapi 2695361300d9d6b66602baa8cf366b7212cc9836
 SRCREV_kube-openapi="2695361300d9d6b66602baa8cf366b7212cc9836"
-SRC_URI += "git://github.com/kubernetes/kube-openapi;name=kube-openapi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/k8s.io/kube-openapi"
+SRC_URI += "git://github.com/kubernetes/kube-openapi;name=kube-openapi;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/k8s.io/kube-openapi"
 
 #       github.com/ipfs/boxo v0.10.0
 # [1] git ls-remote https://github.com/ipfs/boxo 6f82d77995476b0d85722539230a50a321706ead
 SRCREV_boxo="6f82d77995476b0d85722539230a50a321706ead"
-SRC_URI += "git://github.com/ipfs/boxo;name=boxo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/boxo"
+SRC_URI += "git://github.com/ipfs/boxo;name=boxo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/boxo"
 
 #       github.com/miekg/dns v1.1.55
 # [1] git ls-remote https://github.com/miekg/dns 48f38ebef989eedc6b57f1869ae849ccc8f5fe29
 SRCREV_dns="48f38ebef989eedc6b57f1869ae849ccc8f5fe29"
-SRC_URI += "git://github.com/miekg/dns;name=dns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/dns"
+SRC_URI += "git://github.com/miekg/dns;name=dns;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/miekg/dns"
 
 #       github.com/moby/ipvs v1.1.0
 # [1] git ls-remote https://github.com/moby/ipvs fe22ac585b3e22a969cbde61addd99ecd93ab22c
 SRCREV_ipvs="fe22ac585b3e22a969cbde61addd99ecd93ab22c"
-SRC_URI += "git://github.com/moby/ipvs;name=ipvs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/ipvs"
+SRC_URI += "git://github.com/moby/ipvs;name=ipvs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/ipvs"
 
 #       github.com/moby/term v0.0.0-20221205130635-1aeaba878587
 # [1] git ls-remote https://github.com/moby/term 1aeaba8785877a66f57739be9fccb6f5cfab429e
 SRCREV_term="1aeaba8785877a66f57739be9fccb6f5cfab429e"
-SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/term"
+SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/term"
 
 #       go.mozilla.org/pkcs7 v0.0.0-20200128120323-432b2356ecb1
 # [1] git ls-remote https://github.com/mozilla-services/pkcs7 432b2356ecb18209c1cec25680b8a23632794f21
 SRCREV_pkcs7="432b2356ecb18209c1cec25680b8a23632794f21"
-SRC_URI += "git://github.com/mozilla-services/pkcs7;name=pkcs7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.mozilla.org/pkcs7"
+SRC_URI += "git://github.com/mozilla-services/pkcs7;name=pkcs7;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.mozilla.org/pkcs7"
 
 #       go.uber.org/multierr v1.11.0
 # [1] git ls-remote https://github.com/uber-go/multierr de75ae527b39a27afcb50a84427ec7b84021d5f4
 SRCREV_multierr="de75ae527b39a27afcb50a84427ec7b84021d5f4"
-SRC_URI += "git://github.com/uber-go/multierr;name=multierr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/multierr"
+SRC_URI += "git://github.com/uber-go/multierr;name=multierr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/multierr"
 
 #       gopkg.in/warnings.v0 v0.1.2
 # [1] git ls-remote https://github.com/go-warnings/warnings ec4a0fea49c7b46c2aeb0b51aac55779c607e52b
 SRCREV_warnings.v0="ec4a0fea49c7b46c2aeb0b51aac55779c607e52b"
-SRC_URI += "git://github.com/go-warnings/warnings;name=warnings.v0;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/warnings.v0"
+SRC_URI += "git://github.com/go-warnings/warnings;name=warnings.v0;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/warnings.v0"
 
 #       github.com/pkg/errors v0.9.1
 # [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465
 SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
-SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
+SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pkg/errors"
 
 #       github.com/urfave/cli v1.22.14
 # [1] git ls-remote https://github.com/urfave/cli f5ca62f301d773bdc9c800aa0e24aec82ad01a1d
 SRCREV_cli="f5ca62f301d773bdc9c800aa0e24aec82ad01a1d"
-SRC_URI += "git://github.com/urfave/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/urfave/cli"
+SRC_URI += "git://github.com/urfave/cli;name=cli;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/urfave/cli"
 
 #       github.com/docker/cli v24.0.5+incompatible
 # [1] git ls-remote https://github.com/docker/cli ced099660009713e0e845eeb754e6050dbaa45d0
 SRCREV_docker-cli="ced099660009713e0e845eeb754e6050dbaa45d0"
-SRC_URI += "git://github.com/docker/cli;name=docker-cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli"
+SRC_URI += "git://github.com/docker/cli;name=docker-cli;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/cli"
 
 #       github.com/gofrs/uuid v4.4.0+incompatible
 # [1] git ls-remote https://github.com/gofrs/uuid 8345c9a6e83034ec02edb1887c08c6c7fbfdd9ee
 SRCREV_gofrs-uuid="8345c9a6e83034ec02edb1887c08c6c7fbfdd9ee"
-SRC_URI += "git://github.com/gofrs/uuid;name=gofrs-uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs/uuid"
+SRC_URI += "git://github.com/gofrs/uuid;name=gofrs-uuid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gofrs/uuid"
 
 #       google.golang.org/api v0.152.0
 # [1] git ls-remote https://github.com/googleapis/google-api-go-client c18c15e47e02cc3fa5d9e68b88313952381d31ae
 SRCREV_google.golang.org-api="c18c15e47e02cc3fa5d9e68b88313952381d31ae"
-SRC_URI += "git://github.com/googleapis/google-api-go-client;name=google.golang.org-api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/api"
+SRC_URI += "git://github.com/googleapis/google-api-go-client;name=google.golang.org-api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/api"
 
 #       github.com/golang/mock v1.6.0
 # [1] git ls-remote https://github.com/golang/mock aba2ff9a6844d5e3289e8472d3217d5b3090f083
 SRCREV_mock="aba2ff9a6844d5e3289e8472d3217d5b3090f083"
-SRC_URI += "git://github.com/golang/mock;name=mock;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/mock"
+SRC_URI += "git://github.com/golang/mock;name=mock;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/mock"
 
 #       github.com/google/uuid v1.4.0
 # [1] git ls-remote https://github.com/google/uuid 8de8764e294f072b7a2f1a209e88fdcdb1ebc875
 SRCREV_uuid="8de8764e294f072b7a2f1a209e88fdcdb1ebc875"
-SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
+SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/uuid"
 
 #       github.com/gorilla/mux v1.8.1
 # [1] git ls-remote https://github.com/gorilla/mux b4617d0b9670ad14039b2739167fd35a60f557c5
 SRCREV_mux="b4617d0b9670ad14039b2739167fd35a60f557c5"
-SRC_URI += "git://github.com/gorilla/mux;name=mux;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/mux"
+SRC_URI += "git://github.com/gorilla/mux;name=mux;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gorilla/mux"
 
 #       github.com/k3s-io/kine v0.11.4
 # [1] git ls-remote https://github.com/k3s-io/kine 37736729c40f1e7ad18521d1eb5c2a13e314ebde
 SRCREV_kine="37736729c40f1e7ad18521d1eb5c2a13e314ebde"
-SRC_URI += "git://github.com/k3s-io/kine;name=kine;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kine"
+SRC_URI += "git://github.com/k3s-io/kine;name=kine;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kine"
 
 #       github.com/onsi/gomega v1.27.10
 # [1] git ls-remote https://github.com/onsi/gomega 9cbf7b0019d4d489d668583b0d7a6ac889ee2bc8
 SRCREV_gomega="9cbf7b0019d4d489d668583b0d7a6ac889ee2bc8"
-SRC_URI += "git://github.com/onsi/gomega;name=gomega;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/onsi/gomega"
+SRC_URI += "git://github.com/onsi/gomega;name=gomega;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/onsi/gomega"
 
 #       github.com/k3s-io/runc v1.1.12-k3s1
 # [1] git ls-remote https://github.com/k3s-io/runc 7d07dac287da807a624adba7ea7ccc1b3f28c614
 SRCREV_runc="7d07dac287da807a624adba7ea7ccc1b3f28c614"
-SRC_URI += "git://github.com/k3s-io/runc;name=runc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/runc"
+SRC_URI += "git://github.com/k3s-io/runc;name=runc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/runc"
 
 #       github.com/spf13/pflag v1.0.5
 # [1] git ls-remote https://github.com/spf13/pflag 2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
 SRCREV_pflag="2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
-SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag"
+SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/pflag"
 
 #       google.golang.org/grpc v1.58.3
 # [1] git ls-remote https://github.com/grpc/grpc-go bf05b9558c16677e362d231120f8213eb276d406
 SRCREV_grpc="bf05b9558c16677e362d231120f8213eb276d406"
-SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc"
+SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/grpc"
 
 #       github.com/flynn/noise v1.0.0
 # [1] git ls-remote https://github.com/flynn/noise 2499bf1bad239a8316c32932a993642350b3afdb
 SRCREV_noise="2499bf1bad239a8316c32932a993642350b3afdb"
-SRC_URI += "git://github.com/flynn/noise;name=noise;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/flynn/noise"
+SRC_URI += "git://github.com/flynn/noise;name=noise;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/flynn/noise"
 
 #       github.com/huin/goupnp v1.2.0
 # [1] git ls-remote https://github.com/huin/goupnp 8ca2329ddbfe051b906efe0883e7a66ac296bc0a
 SRCREV_goupnp="8ca2329ddbfe051b906efe0883e7a66ac296bc0a"
-SRC_URI += "git://github.com/huin/goupnp;name=goupnp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/huin/goupnp"
+SRC_URI += "git://github.com/huin/goupnp;name=goupnp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/huin/goupnp"
 
 #       github.com/ipfs/go-cid v0.4.1
 # [1] git ls-remote https://github.com/ipfs/go-cid d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7
 SRCREV_go-cid="d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7"
-SRC_URI += "git://github.com/ipfs/go-cid;name=go-cid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-cid"
+SRC_URI += "git://github.com/ipfs/go-cid;name=go-cid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/go-cid"
 
 #       github.com/ipfs/go-log v1.0.5
 # [1] git ls-remote https://github.com/ipfs/go-log c39ee80c0915c5cca41dc1311e848c2fd7fa4101
 SRCREV_go-log="c39ee80c0915c5cca41dc1311e848c2fd7fa4101"
-SRC_URI += "git://github.com/ipfs/go-log;name=go-log;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-log"
+SRC_URI += "git://github.com/ipfs/go-log;name=go-log;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/go-log"
 
 #       github.com/spf13/afero v1.11.0
 # [1] git ls-remote https://github.com/spf13/afero 5c4385aa20510dba5ca4db12c02b0c9211d82892
 SRCREV_afero="5c4385aa20510dba5ca4db12c02b0c9211d82892"
-SRC_URI += "git://github.com/spf13/afero;name=afero;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/afero"
+SRC_URI += "git://github.com/spf13/afero;name=afero;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/afero"
 
 #       github.com/cilium/ebpf v0.9.1
 # [1] git ls-remote https://github.com/cilium/ebpf d560e4479b395c4523851a4571b04ba0b3846cd1
 SRCREV_ebpf="d560e4479b395c4523851a4571b04ba0b3846cd1"
-SRC_URI += "git://github.com/cilium/ebpf;name=ebpf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cilium/ebpf"
+SRC_URI += "git://github.com/cilium/ebpf;name=ebpf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cilium/ebpf"
 
 #       github.com/ghodss/yaml v1.0.0
 # [1] git ls-remote https://github.com/ghodss/yaml 0ca9ea5df5451ffdf184b4428c902747c2c11cd7
 SRCREV_ghodss-yaml="0ca9ea5df5451ffdf184b4428c902747c2c11cd7"
-SRC_URI += "git://github.com/ghodss/yaml;name=ghodss-yaml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ghodss/yaml"
+SRC_URI += "git://github.com/ghodss/yaml;name=ghodss-yaml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ghodss/yaml"
 
 #       github.com/gofrs/flock v0.8.1
 # [1] git ls-remote https://github.com/gofrs/flock 6f010d1acea74a32f2f2066bfe324c08bbee30e3
 SRCREV_flock="6f010d1acea74a32f2f2066bfe324c08bbee30e3"
-SRC_URI += "git://github.com/gofrs/flock;name=flock;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gofrs/flock"
+SRC_URI += "git://github.com/gofrs/flock;name=flock;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gofrs/flock"
 
 #       github.com/moby/locker v1.0.1
 # [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9d1487c965f24d30742fe
 SRCREV_locker="281af2d563954745bea9d1487c965f24d30742fe"
-SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/locker"
+SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/locker"
 
 #       github.com/pierrec/lz4 v2.6.0+incompatible
 # [1] git ls-remote https://github.com/pierrec/lz4 0e583d326e0ec6b9c1ad223188dc709af385408e
 SRCREV_lz4="0e583d326e0ec6b9c1ad223188dc709af385408e"
-SRC_URI += "git://github.com/pierrec/lz4;name=lz4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pierrec/lz4"
+SRC_URI += "git://github.com/pierrec/lz4;name=lz4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pierrec/lz4"
 
 #       github.com/spf13/cobra v1.8.0
 # [1] git ls-remote https://github.com/spf13/cobra a0a6ae020bb3899ff0276067863e50523f897370
 SRCREV_cobra="a0a6ae020bb3899ff0276067863e50523f897370"
-SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra"
+SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/cobra"
 
 #       github.com/go-logr/logr v1.4.1
 # [1] git ls-remote https://github.com/go-logr/logr dcdc3f2cd12e8a5c4e2a6712d6958c90e2e5bd98
 SRCREV_logr="dcdc3f2cd12e8a5c4e2a6712d6958c90e2e5bd98"
-SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/logr"
+SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/logr"
 
 #       github.com/go-logr/stdr v1.2.3-0.20220714215716-96bad1d688c5
 # [1] git ls-remote https://github.com/go-logr/stdr 96bad1d688c524409b0da98c82fb7d3d51e60639
 SRCREV_stdr="96bad1d688c524409b0da98c82fb7d3d51e60639"
-SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/stdr"
+SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/stdr"
 
 #       github.com/go-test/deep v1.0.7
 # [1] git ls-remote https://github.com/go-test/deep c733f5ed5136b7437e29ac91bb97c653af3694b5
 SRCREV_deep="c733f5ed5136b7437e29ac91bb97c653af3694b5"
-SRC_URI += "git://github.com/go-test/deep;name=deep;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-test/deep"
+SRC_URI += "git://github.com/go-test/deep;name=deep;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-test/deep"
 
 #       github.com/otiai10/copy v1.7.0
 # [1] git ls-remote https://github.com/otiai10/copy 323db161ae97db91e6e13dbcda403fdb29c3fff8
 SRCREV_copy="323db161ae97db91e6e13dbcda403fdb29c3fff8"
-SRC_URI += "git://github.com/otiai10/copy;name=copy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/otiai10/copy"
+SRC_URI += "git://github.com/otiai10/copy;name=copy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/otiai10/copy"
 
 #       lukechampine.com/blake3 v1.2.1
 # [1] git ls-remote https://github.com/lukechampine/blake3 6e4325968f64ca24b1bbc8fbf08ea320d17ebfa0
 SRCREV_blake3="6e4325968f64ca24b1bbc8fbf08ea320d17ebfa0"
-SRC_URI += "git://github.com/lukechampine/blake3;name=blake3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/lukechampine.com/blake3"
+SRC_URI += "git://github.com/lukechampine/blake3;name=blake3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/lukechampine.com/blake3"
 
 #       github.com/Rican7/retry v0.1.0
 # [1] git ls-remote https://github.com/Rican7/retry 28d17f812805614e76f170aa3c8698155ea8e019
 SRCREV_retry="28d17f812805614e76f170aa3c8698155ea8e019"
-SRC_URI += "git://github.com/Rican7/retry;name=retry;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Rican7/retry"
+SRC_URI += "git://github.com/Rican7/retry;name=retry;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Rican7/retry"
 
 #       github.com/beorn7/perks v1.0.1
 # [1] git ls-remote https://github.com/beorn7/perks 37c8de3658fcb183f997c4e13e8337516ab753e6
 SRCREV_perks="37c8de3658fcb183f997c4e13e8337516ab753e6"
-SRC_URI += "git://github.com/beorn7/perks;name=perks;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/beorn7/perks"
+SRC_URI += "git://github.com/beorn7/perks;name=perks;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/beorn7/perks"
 
 #       github.com/blang/semver v3.5.1+incompatible
 # [1] git ls-remote https://github.com/blang/semver 2ee87856327ba09384cabd113bc6b5d174e9ec0f
 SRCREV_semver="2ee87856327ba09384cabd113bc6b5d174e9ec0f"
-SRC_URI += "git://github.com/blang/semver;name=semver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/blang/semver"
+SRC_URI += "git://github.com/blang/semver;name=semver;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/blang/semver"
 
 #       github.com/google/btree v1.1.2
 # [1] git ls-remote https://github.com/google/btree 8e29150ba321eef204059de2ab494f179b6cff2c
 SRCREV_btree="8e29150ba321eef204059de2ab494f179b6cff2c"
-SRC_URI += "git://github.com/google/btree;name=btree;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/btree"
+SRC_URI += "git://github.com/google/btree;name=btree;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/btree"
 
 #       github.com/google/pprof v0.0.0-20230821062121-407c9e7a662f
 # [1] git ls-remote https://github.com/google/pprof 407c9e7a662f39c592c77f0db959db282b687a32
 SRCREV_pprof="407c9e7a662f39c592c77f0db959db282b687a32"
-SRC_URI += "git://github.com/google/pprof;name=pprof;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/pprof"
+SRC_URI += "git://github.com/google/pprof;name=pprof;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/pprof"
 
 #       github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
 # [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e9468cdfd1efcd7d196cd1d
 SRCREV_shlex="e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
-SRC_URI += "git://github.com/google/shlex;name=shlex;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/shlex"
+SRC_URI += "git://github.com/google/shlex;name=shlex;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/shlex"
 
 #       github.com/jackc/pgx/v5 v5.4.2
 # [1] git ls-remote https://github.com/jackc/pgx 038fc448c1cc91b9372a6a0d151789f41536f033
 SRCREV_pgx-v5="038fc448c1cc91b9372a6a0d151789f41536f033"
-SRC_URI += "git://github.com/jackc/pgx;name=pgx-v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jackc/pgx/v5"
+SRC_URI += "git://github.com/jackc/pgx;name=pgx-v5;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jackc/pgx/v5"
 
 #       github.com/miekg/pkcs11 v1.1.1
 # [1] git ls-remote https://github.com/miekg/pkcs11 f3481918a208bd212aa995a41f92d786eb418a7d
 SRCREV_pkcs11="f3481918a208bd212aa995a41f92d786eb418a7d"
-SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11"
+SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/miekg/pkcs11"
 
 #       github.com/morikuni/aec v1.0.0
 # [1] git ls-remote https://github.com/morikuni/aec 39771216ff4c63d11f5e604076f9c45e8be1067b
 SRCREV_aec="39771216ff4c63d11f5e604076f9c45e8be1067b"
-SRC_URI += "git://github.com/morikuni/aec;name=aec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/morikuni/aec"
+SRC_URI += "git://github.com/morikuni/aec;name=aec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/morikuni/aec"
 
 #       github.com/nats-io/nuid v1.0.1
 # [1] git ls-remote https://github.com/nats-io/nuid 4b96681fa6d28dd0ab5fe79bac63b3a493d9ee94
 SRCREV_nuid="4b96681fa6d28dd0ab5fe79bac63b3a493d9ee94"
-SRC_URI += "git://github.com/nats-io/nuid;name=nuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/nats-io/nuid"
+SRC_URI += "git://github.com/nats-io/nuid;name=nuid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/nats-io/nuid"
 
 #       github.com/docker/docker v24.0.0-rc.2.0.20230801142700-69c9adb7d386+incompatible
 # [1] git ls-remote https://github.com/moby/moby 69c9adb7d3868cb0560b1ffcef798015c5a70510
 SRCREV_docker="69c9adb7d3868cb0560b1ffcef798015c5a70510"
-SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker"
+SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker"
 
 #       github.com/rancher/lasso v0.0.0-20230830164424-d684fdeb6f29
 # [1] git ls-remote https://github.com/rancher/lasso d684fdeb6f29e221289c6f59fdc390b6adbaaccf
 SRCREV_lasso="d684fdeb6f29e221289c6f59fdc390b6adbaaccf"
-SRC_URI += "git://github.com/rancher/lasso;name=lasso;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rancher/lasso"
+SRC_URI += "git://github.com/rancher/lasso;name=lasso;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rancher/lasso"
 
 #       github.com/k3s-io/spegel v0.0.17-0.20240109004735-9466a5529330
 # [1] git ls-remote https://github.com/k3s-io/spegel 9466a55293301075a2d1613a3744c6bf45342e8b
 SRCREV_spegel="9466a55293301075a2d1613a3744c6bf45342e8b"
-SRC_URI += "git://github.com/k3s-io/spegel;name=spegel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/spegel"
+SRC_URI += "git://github.com/k3s-io/spegel;name=spegel;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/spegel"
 
 #       github.com/gin-gonic/gin v1.9.1
 # [1] git ls-remote https://github.com/gin-gonic/gin 4ea0e648e38a63d6caff14100f5eab5c50912bcd
 SRCREV_gin="4ea0e648e38a63d6caff14100f5eab5c50912bcd"
-SRC_URI += "git://github.com/gin-gonic/gin;name=gin;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gin-gonic/gin"
+SRC_URI += "git://github.com/gin-gonic/gin;name=gin;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gin-gonic/gin"
 
 #       github.com/goccy/go-json v0.10.2
 # [1] git ls-remote https://github.com/goccy/go-json 8e8cdeacf2f2faef082f32848138f0f9af7cfb66
 SRCREV_go-json="8e8cdeacf2f2faef082f32848138f0f9af7cfb66"
-SRC_URI += "git://github.com/goccy/go-json;name=go-json;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/goccy/go-json"
+SRC_URI += "git://github.com/goccy/go-json;name=go-json;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/goccy/go-json"
 
 #       github.com/golang/snappy v0.0.4
 # [1] git ls-remote https://github.com/golang/snappy 544b4180ac705b7605231d4a4550a1acb22a19fe
 SRCREV_snappy="544b4180ac705b7605231d4a4550a1acb22a19fe"
-SRC_URI += "git://github.com/golang/snappy;name=snappy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/snappy"
+SRC_URI += "git://github.com/golang/snappy;name=snappy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/snappy"
 
 #       github.com/koron/go-ssdp v0.0.4
 # [1] git ls-remote https://github.com/koron/go-ssdp 615e2904c24d115f20139e60b9ab5916b1dfd55d
 SRCREV_go-ssdp="615e2904c24d115f20139e60b9ab5916b1dfd55d"
-SRC_URI += "git://github.com/koron/go-ssdp;name=go-ssdp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/koron/go-ssdp"
+SRC_URI += "git://github.com/koron/go-ssdp;name=go-ssdp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/koron/go-ssdp"
 
 #       github.com/libp2p/go-nat v0.2.0
 # [1] git ls-remote https://github.com/libp2p/go-nat 14ce74b6949ca4d3f4889568e20840bdf0b05009
 SRCREV_go-nat="14ce74b6949ca4d3f4889568e20840bdf0b05009"
-SRC_URI += "git://github.com/libp2p/go-nat;name=go-nat;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-nat"
+SRC_URI += "git://github.com/libp2p/go-nat;name=go-nat;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-nat"
 
 #       github.com/mikioh/tcpopt v0.0.0-20190314235656-172688c1accc
 # [1] git ls-remote https://github.com/mikioh/tcpopt 172688c1accceb1c8699343c22838f55e4b662ca
 SRCREV_tcpopt="172688c1accceb1c8699343c22838f55e4b662ca"
-SRC_URI += "git://github.com/mikioh/tcpopt;name=tcpopt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mikioh/tcpopt"
+SRC_URI += "git://github.com/mikioh/tcpopt;name=tcpopt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mikioh/tcpopt"
 
 #       github.com/pbnjay/memory v0.0.0-20210728143218-7b4eea64cf58
 # [1] git ls-remote https://github.com/pbnjay/memory 7b4eea64cf580186c0eceb10dc94ba3a098af46c
 SRCREV_memory="7b4eea64cf580186c0eceb10dc94ba3a098af46c"
-SRC_URI += "git://github.com/pbnjay/memory;name=memory;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pbnjay/memory"
+SRC_URI += "git://github.com/pbnjay/memory;name=memory;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pbnjay/memory"
 
 #       github.com/quic-go/qpack v0.4.0
 # [1] git ls-remote https://github.com/quic-go/qpack 3e7287cc7ce655141583b8511fbe09800d4ba896
 SRCREV_qpack="3e7287cc7ce655141583b8511fbe09800d4ba896"
-SRC_URI += "git://github.com/quic-go/qpack;name=qpack;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/quic-go/qpack"
+SRC_URI += "git://github.com/quic-go/qpack;name=qpack;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/quic-go/qpack"
 
 #       github.com/armon/circbuf v0.0.0-20150827004946-bbbad097214e
 # [1] git ls-remote https://github.com/armon/circbuf bbbad097214e2918d8543d5201d12bfd7bca254d
 SRCREV_circbuf="bbbad097214e2918d8543d5201d12bfd7bca254d"
-SRC_URI += "git://github.com/armon/circbuf;name=circbuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/armon/circbuf"
+SRC_URI += "git://github.com/armon/circbuf;name=circbuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/armon/circbuf"
 
 #       github.com/gogo/protobuf v1.3.2
 # [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc
 SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
-SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
+SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gogo/protobuf"
 
 #       github.com/google/cel-go v0.16.1
 # [1] git ls-remote https://github.com/google/cel-go 59a1b5d69d8d826a02e8e3d7911121ea60cba987
 SRCREV_cel-go="59a1b5d69d8d826a02e8e3d7911121ea60cba987"
-SRC_URI += "git://github.com/google/cel-go;name=cel-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/cel-go"
+SRC_URI += "git://github.com/google/cel-go;name=cel-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/cel-go"
 
 #       github.com/google/go-cmp v0.6.0
 # [1] git ls-remote https://github.com/google/go-cmp c3ad8435e7bef96af35732bc0789e5a2278c6d5f
 SRCREV_go-cmp="c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
-SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp"
+SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/go-cmp"
 
 #       github.com/google/gofuzz v1.2.0
 # [1] git ls-remote https://github.com/google/gofuzz 379e164120fbc98885a8f494b5aa41ba94f64c56
 SRCREV_gofuzz="379e164120fbc98885a8f494b5aa41ba94f64c56"
-SRC_URI += "git://github.com/google/gofuzz;name=gofuzz;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gofuzz"
+SRC_URI += "git://github.com/google/gofuzz;name=gofuzz;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/gofuzz"
 
 #       github.com/google/s2a-go v0.1.7
 # [1] git ls-remote https://github.com/google/s2a-go 141996cc2c0b07d53f1970aa1b2e8e5dde4a7a52
 SRCREV_s2a-go="141996cc2c0b07d53f1970aa1b2e8e5dde4a7a52"
-SRC_URI += "git://github.com/google/s2a-go;name=s2a-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/s2a-go"
+SRC_URI += "git://github.com/google/s2a-go;name=s2a-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/s2a-go"
 
 #       github.com/imdario/mergo v0.3.16
 # [1] git ls-remote https://github.com/darccio/mergo 14fe2b165b83359196f820886a2b24f2771729e9
 SRCREV_mergo="14fe2b165b83359196f820886a2b24f2771729e9"
-SRC_URI += "git://github.com/darccio/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo"
+SRC_URI += "git://github.com/darccio/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/imdario/mergo"
 
 #       github.com/nats-io/nkeys v0.4.6
 # [1] git ls-remote https://github.com/nats-io/nkeys 62e5d8c7c4af84283b6535bcbf1300ab25b45e2d
 SRCREV_nkeys="62e5d8c7c4af84283b6535bcbf1300ab25b45e2d"
-SRC_URI += "git://github.com/nats-io/nkeys;name=nkeys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/nats-io/nkeys"
+SRC_URI += "git://github.com/nats-io/nkeys;name=nkeys;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/nats-io/nkeys"
 
 #       github.com/soheilhy/cmux v0.1.5
 # [1] git ls-remote https://github.com/soheilhy/cmux 5ec6847320e53b5fee0ab9a4757b56625a946c85
 SRCREV_cmux="5ec6847320e53b5fee0ab9a4757b56625a946c85"
-SRC_URI += "git://github.com/soheilhy/cmux;name=cmux;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/soheilhy/cmux"
+SRC_URI += "git://github.com/soheilhy/cmux;name=cmux;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/soheilhy/cmux"
 
 #       github.com/tidwall/btree v1.6.0
 # [1] git ls-remote https://github.com/tidwall/btree c538c0ce1d47ebada0c423fd430978ba274d7d68
 SRCREV_tidwall-btree="c538c0ce1d47ebada0c423fd430978ba274d7d68"
-SRC_URI += "git://github.com/tidwall/btree;name=tidwall-btree;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/btree"
+SRC_URI += "git://github.com/tidwall/btree;name=tidwall-btree;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tidwall/btree"
 
 #       github.com/urfave/cli/v2 v2.23.5
 # [1] git ls-remote https://github.com/urfave/cli 600ef6e4dd5db1819a8eb0b453487bf1c0e59099
 SRCREV_cli-v2="600ef6e4dd5db1819a8eb0b453487bf1c0e59099"
-SRC_URI += "git://github.com/urfave/cli;name=cli-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/urfave/cli/v2"
+SRC_URI += "git://github.com/urfave/cli;name=cli-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/urfave/cli/v2"
 
 #       go.opentelemetry.io/otel v1.13.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go f2fd476f433128c2494476950ce11600a51bbe35
 SRCREV_otel="f2fd476f433128c2494476950ce11600a51bbe35"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel"
 
 #       github.com/containerd/zfs v1.1.0
 # [1] git ls-remote https://github.com/containerd/zfs 26134297cde4138b412644d6819c20b105472991
 SRCREV_zfs="26134297cde4138b412644d6819c20b105472991"
-SRC_URI += "git://github.com/containerd/zfs;name=zfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/zfs"
+SRC_URI += "git://github.com/containerd/zfs;name=zfs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/zfs"
 
 #       github.com/ipfs/go-log/v2 v2.5.1
 # [1] git ls-remote https://github.com/ipfs/go-log 8625e3ec81bdeb96627de192e6fe21eab5896603
 SRCREV_go-log-v2="8625e3ec81bdeb96627de192e6fe21eab5896603"
-SRC_URI += "git://github.com/ipfs/go-log;name=go-log-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-log/v2"
+SRC_URI += "git://github.com/ipfs/go-log;name=go-log-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/go-log/v2"
 
 #       github.com/onsi/ginkgo/v2 v2.11.0
 # [1] git ls-remote https://github.com/onsi/ginkgo 5c32b2a6408b866b04774abad81eca2274f4fb5b
 SRCREV_ginkgo-v2="5c32b2a6408b866b04774abad81eca2274f4fb5b"
-SRC_URI += "git://github.com/onsi/ginkgo;name=ginkgo-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/onsi/ginkgo/v2"
+SRC_URI += "git://github.com/onsi/ginkgo;name=ginkgo-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/onsi/ginkgo/v2"
 
 #       github.com/robfig/cron/v3 v3.0.1
 # [1] git ls-remote https://github.com/robfig/cron ccba498c397bb90a9c84945bbb0f7af2d72b6309
 SRCREV_cron-v3="ccba498c397bb90a9c84945bbb0f7af2d72b6309"
-SRC_URI += "git://github.com/robfig/cron;name=cron-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/robfig/cron/v3"
+SRC_URI += "git://github.com/robfig/cron;name=cron-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/robfig/cron/v3"
 
 #       github.com/k3s-io/klog/v2 v2.100.1-k3s1
 # [1] git ls-remote https://github.com/k3s-io/klog 977d5aa511a87a6cfa1d251772bcd5344c8d1280
 SRCREV_klog-v2="977d5aa511a87a6cfa1d251772bcd5344c8d1280"
-SRC_URI += "git://github.com/k3s-io/klog;name=klog-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/klog/v2"
+SRC_URI += "git://github.com/k3s-io/klog;name=klog-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/klog/v2"
 
 #       github.com/leodido/go-urn v1.2.4
 # [1] git ls-remote https://github.com/leodido/go-urn 87e1d5ed73ec8689aa799a976831dcf6c81c8c98
 SRCREV_go-urn="87e1d5ed73ec8689aa799a976831dcf6c81c8c98"
-SRC_URI += "git://github.com/leodido/go-urn;name=go-urn;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/leodido/go-urn"
+SRC_URI += "git://github.com/leodido/go-urn;name=go-urn;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/leodido/go-urn"
 
 #       github.com/mikioh/tcpinfo v0.0.0-20190314235526-30a79bb1804b
 # [1] git ls-remote https://github.com/mikioh/tcpinfo 30a79bb1804bc47fa7fe29928c9109f368792a9e
 SRCREV_tcpinfo="30a79bb1804bc47fa7fe29928c9109f368792a9e"
-SRC_URI += "git://github.com/mikioh/tcpinfo;name=tcpinfo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mikioh/tcpinfo"
+SRC_URI += "git://github.com/mikioh/tcpinfo;name=tcpinfo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mikioh/tcpinfo"
 
 #       github.com/mr-tron/base58 v1.2.0
 # [1] git ls-remote https://github.com/mr-tron/base58 cd0e5141f51dfcadb8311fd8e495eb11126a8010
 SRCREV_base58="cd0e5141f51dfcadb8311fd8e495eb11126a8010"
-SRC_URI += "git://github.com/mr-tron/base58;name=base58;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mr-tron/base58"
+SRC_URI += "git://github.com/mr-tron/base58;name=base58;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mr-tron/base58"
 
 #       github.com/polydawn/refmt v0.89.0
 # [1] git ls-remote https://github.com/polydawn/refmt ad1efcb83999082a4ec5ac34b9d5c08bc388faf3
 SRCREV_refmt="ad1efcb83999082a4ec5ac34b9d5c08bc388faf3"
-SRC_URI += "git://github.com/polydawn/refmt;name=refmt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/polydawn/refmt"
+SRC_URI += "git://github.com/polydawn/refmt;name=refmt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/polydawn/refmt"
 
 #       github.com/containerd/log v0.1.0
 # [1] git ls-remote https://github.com/containerd/log 0fc1e28871fdf2786e2cc51bbe4133db6547a199
 SRCREV_log="0fc1e28871fdf2786e2cc51bbe4133db6547a199"
-SRC_URI += "git://github.com/containerd/log;name=log;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/log"
+SRC_URI += "git://github.com/containerd/log;name=log;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/log"
 
 #       github.com/containerd/nri v0.4.0
 # [1] git ls-remote https://github.com/containerd/nri e2d9a1b06b9d0916b0074340990df0fbe3388dd1
 SRCREV_nri="e2d9a1b06b9d0916b0074340990df0fbe3388dd1"
-SRC_URI += "git://github.com/containerd/nri;name=nri;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/nri"
+SRC_URI += "git://github.com/containerd/nri;name=nri;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/nri"
 
 #       github.com/coreos/go-oidc v2.2.1+incompatible
 # [1] git ls-remote https://github.com/coreos/go-oidc 8d771559cf6e5111c9b9159810d0e4538e7cdc82
 SRCREV_go-oidc="8d771559cf6e5111c9b9159810d0e4538e7cdc82"
-SRC_URI += "git://github.com/coreos/go-oidc;name=go-oidc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-oidc"
+SRC_URI += "git://github.com/coreos/go-oidc;name=go-oidc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-oidc"
 
 #       github.com/godbus/dbus/v5 v5.1.0
 # [1] git ls-remote https://github.com/godbus/dbus e523abc905595cf17fb0001a7d77eaaddfaa216d
 SRCREV_dbus-v5="e523abc905595cf17fb0001a7d77eaaddfaa216d"
-SRC_URI += "git://github.com/godbus/dbus;name=dbus-v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/godbus/dbus/v5"
+SRC_URI += "git://github.com/godbus/dbus;name=dbus-v5;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/godbus/dbus/v5"
 
 #       github.com/minio/md5-simd v1.1.2
 # [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ceebbd50fe5c1d61b0c80c608df
 SRCREV_md5-simd="776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
-SRC_URI += "git://github.com/minio/md5-simd;name=md5-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/md5-simd"
+SRC_URI += "git://github.com/minio/md5-simd;name=md5-simd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/minio/md5-simd"
 
 #       github.com/mohae/deepcopy v0.0.0-20170929034955-c48cc78d4826
 # [1] git ls-remote https://github.com/mohae/deepcopy c48cc78d482608239f6c4c92a4abd87eb8761c90
 SRCREV_deepcopy="c48cc78d482608239f6c4c92a4abd87eb8761c90"
-SRC_URI += "git://github.com/mohae/deepcopy;name=deepcopy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mohae/deepcopy"
+SRC_URI += "git://github.com/mohae/deepcopy;name=deepcopy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mohae/deepcopy"
 
 #       github.com/nats-io/jsm.go v0.0.31-0.20220317133147-fe318f464eee
 # [1] git ls-remote https://github.com/nats-io/jsm.go fe318f464eee9ceef6120ea851e5cf94a0497ac6
 SRCREV_jsm.go="fe318f464eee9ceef6120ea851e5cf94a0497ac6"
-SRC_URI += "git://github.com/nats-io/jsm.go;name=jsm.go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/nats-io/jsm.go"
+SRC_URI += "git://github.com/nats-io/jsm.go;name=jsm.go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/nats-io/jsm.go"
 
 #       github.com/nats-io/jwt/v2 v2.5.3
 # [1] git ls-remote https://github.com/nats-io/jwt 457367366f2ff72a3fefeed38b56a1da281476fb
 SRCREV_jwt-v2="457367366f2ff72a3fefeed38b56a1da281476fb"
-SRC_URI += "git://github.com/nats-io/jwt;name=jwt-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/nats-io/jwt/v2"
+SRC_URI += "git://github.com/nats-io/jwt;name=jwt-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/nats-io/jwt/v2"
 
 #       github.com/rubiojr/go-vhd v0.0.0-20200706105327-02e210299021
 # [1] git ls-remote https://github.com/rubiojr/go-vhd 02e2102990218160c1cb608a3e9679312a3b8425
 SRCREV_go-vhd="02e2102990218160c1cb608a3e9679312a3b8425"
-SRC_URI += "git://github.com/rubiojr/go-vhd;name=go-vhd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rubiojr/go-vhd"
+SRC_URI += "git://github.com/rubiojr/go-vhd;name=go-vhd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rubiojr/go-vhd"
 
 #       github.com/vmware/govmomi v0.30.6
 # [1] git ls-remote https://github.com/vmware/govmomi 55614148d1fe0df8ac8e04174ffd2344e374adb8
 SRCREV_govmomi="55614148d1fe0df8ac8e04174ffd2344e374adb8"
-SRC_URI += "git://github.com/vmware/govmomi;name=govmomi;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vmware/govmomi"
+SRC_URI += "git://github.com/vmware/govmomi;name=govmomi;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vmware/govmomi"
 
 #       github.com/xlab/treeprint v1.2.0
 # [1] git ls-remote https://github.com/xlab/treeprint 044005a3b405f660f109e066d9f589755835c2ea
 SRCREV_treeprint="044005a3b405f660f109e066d9f589755835c2ea"
-SRC_URI += "git://github.com/xlab/treeprint;name=treeprint;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xlab/treeprint"
+SRC_URI += "git://github.com/xlab/treeprint;name=treeprint;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xlab/treeprint"
 
 #       github.com/xrash/smetrics v0.0.0-20201216005158-039620a65673
 # [1] git ls-remote https://github.com/xrash/smetrics 039620a656736e6ad994090895784a7af15e0b80
 SRCREV_smetrics="039620a656736e6ad994090895784a7af15e0b80"
-SRC_URI += "git://github.com/xrash/smetrics;name=smetrics;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xrash/smetrics"
+SRC_URI += "git://github.com/xrash/smetrics;name=smetrics;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xrash/smetrics"
 
 #       sigs.k8s.io/kustomize/api v0.13.5-0.20230601165947-6ce0bf390ce3
 # [1] git ls-remote https://github.com/kubernetes-sigs/kustomize 6ce0bf390ce3dae580947a2b739da3306c675eef
 SRCREV_kustomize-api="6ce0bf390ce3dae580947a2b739da3306c675eef"
-SRC_URI += "git://github.com/kubernetes-sigs/kustomize;name=kustomize-api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/kustomize/api"
+SRC_URI += "git://github.com/kubernetes-sigs/kustomize;name=kustomize-api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/kustomize/api"
 
 #       github.com/blang/semver/v4 v4.0.0
 # [1] git ls-remote https://github.com/blang/semver af3461a9cbcf1f3f5889d21b83f5ef63880c33a8
 SRCREV_v4="af3461a9cbcf1f3f5889d21b83f5ef63880c33a8"
-SRC_URI += "git://github.com/blang/semver;name=v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/blang/semver/v4"
+SRC_URI += "git://github.com/blang/semver;name=v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/blang/semver/v4"
 
 #       github.com/containerd/aufs v1.0.0
 # [1] git ls-remote https://github.com/containerd/aufs fb0192dcb2c0bbfce3bd8756fc88026870c0354d
 SRCREV_aufs="fb0192dcb2c0bbfce3bd8756fc88026870c0354d"
-SRC_URI += "git://github.com/containerd/aufs;name=aufs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/aufs"
+SRC_URI += "git://github.com/containerd/aufs;name=aufs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/aufs"
 
 #       github.com/google/cadvisor v0.47.3
 # [1] git ls-remote https://github.com/google/cadvisor c5730c5a72b527a724e7333d0e2f5b9a3ce5cf4d
 SRCREV_cadvisor="c5730c5a72b527a724e7333d0e2f5b9a3ce5cf4d"
-SRC_URI += "git://github.com/google/cadvisor;name=cadvisor;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/cadvisor"
+SRC_URI += "git://github.com/google/cadvisor;name=cadvisor;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/cadvisor"
 
 #       github.com/rancher/wharfie v0.6.4
 # [1] git ls-remote https://github.com/rancher/wharfie afa72eb3bb2e8fc03366c87f4a51b6894ea65b2e
 SRCREV_wharfie="afa72eb3bb2e8fc03366c87f4a51b6894ea65b2e"
-SRC_URI += "git://github.com/rancher/wharfie;name=wharfie;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rancher/wharfie"
+SRC_URI += "git://github.com/rancher/wharfie;name=wharfie;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rancher/wharfie"
 
 #       github.com/sirupsen/logrus v1.9.3
 # [1] git ls-remote https://github.com/sirupsen/logrus d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
 SRCREV_logrus="d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
-SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/logrus"
+SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sirupsen/logrus"
 
 #       github.com/bytedance/sonic v1.9.1
 # [1] git ls-remote https://github.com/bytedance/sonic d7db21691cb8c0380c14a41037c4ce67087260c5
 SRCREV_sonic="d7db21691cb8c0380c14a41037c4ce67087260c5"
-SRC_URI += "git://github.com/bytedance/sonic;name=sonic;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/bytedance/sonic"
+SRC_URI += "git://github.com/bytedance/sonic;name=sonic;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/bytedance/sonic"
 
 #       github.com/elastic/gosigar v0.14.2
 # [1] git ls-remote https://github.com/elastic/gosigar 9d6c92629470099edd40ead9a3d8cf1b38020ec6
 SRCREV_gosigar="9d6c92629470099edd40ead9a3d8cf1b38020ec6"
-SRC_URI += "git://github.com/elastic/gosigar;name=gosigar;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/elastic/gosigar"
+SRC_URI += "git://github.com/elastic/gosigar;name=gosigar;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/elastic/gosigar"
 
 #       github.com/gin-contrib/sse v0.1.0
 # [1] git ls-remote https://github.com/gin-contrib/sse 54d8467d122d380a14768b6b4e5cd7ca4755938f
 SRCREV_sse="54d8467d122d380a14768b6b4e5cd7ca4755938f"
-SRC_URI += "git://github.com/gin-contrib/sse;name=sse;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gin-contrib/sse"
+SRC_URI += "git://github.com/gin-contrib/sse;name=sse;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gin-contrib/sse"
 
 #       github.com/google/gopacket v1.1.19
 # [1] git ls-remote https://github.com/google/gopacket a9779d139771f6a06fc983b18e0efd23ca30222f
 SRCREV_gopacket="a9779d139771f6a06fc983b18e0efd23ca30222f"
-SRC_URI += "git://github.com/google/gopacket;name=gopacket;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gopacket"
+SRC_URI += "git://github.com/google/gopacket;name=gopacket;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/gopacket"
 
 #       github.com/libp2p/go-msgio v0.3.0
 # [1] git ls-remote https://github.com/libp2p/go-msgio 12f8f7a72c7dbbb246151e4c98b5a6d59e27e0c6
 SRCREV_go-msgio="12f8f7a72c7dbbb246151e4c98b5a6d59e27e0c6"
-SRC_URI += "git://github.com/libp2p/go-msgio;name=go-msgio;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-msgio"
+SRC_URI += "git://github.com/libp2p/go-msgio;name=go-msgio;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-msgio"
 
 #       github.com/mattn/go-isatty v0.0.19
 # [1] git ls-remote https://github.com/mattn/go-isatty c067b4f3df49dfc0f376d884e16cfd784ea1874b
 SRCREV_go-isatty="c067b4f3df49dfc0f376d884e16cfd784ea1874b"
-SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
+SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-isatty"
 
 #       github.com/quic-go/quic-go v0.38.2
 # [1] git ls-remote https://github.com/quic-go/quic-go 9aaefe19fc3dc8c8917cc87e6128bb56d9e9e6cc
 SRCREV_quic-go="9aaefe19fc3dc8c8917cc87e6128bb56d9e9e6cc"
-SRC_URI += "git://github.com/quic-go/quic-go;name=quic-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/quic-go/quic-go"
+SRC_URI += "git://github.com/quic-go/quic-go;name=quic-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/quic-go/quic-go"
 
 #       github.com/ugorji/go/codec v1.2.11
 # [1] git ls-remote https://github.com/ugorji/go 29258c4dfb14a196b559b89bbee11927b830537e
 SRCREV_codec="29258c4dfb14a196b559b89bbee11927b830537e"
-SRC_URI += "git://github.com/ugorji/go;name=codec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ugorji/go/codec"
+SRC_URI += "git://github.com/ugorji/go;name=codec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ugorji/go/codec"
 
 #       github.com/xenitab/pkg/gin v0.0.9
 # [1] git ls-remote https://github.com/xenitab/pkg 9331fe68723313fdd444403a41999761a294c50f
 SRCREV_pkg-gin="9331fe68723313fdd444403a41999761a294c50f"
-SRC_URI += "git://github.com/xenitab/pkg;name=pkg-gin;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xenitab/pkg/gin"
+SRC_URI += "git://github.com/xenitab/pkg;name=pkg-gin;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xenitab/pkg/gin"
 
 #       github.com/containerd/fifo v1.1.0
 # [1] git ls-remote https://github.com/containerd/fifo 151b205263c29d471e0d55c787d2ce9f5343fd46
 SRCREV_fifo="151b205263c29d471e0d55c787d2ce9f5343fd46"
-SRC_URI += "git://github.com/containerd/fifo;name=fifo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/fifo"
+SRC_URI += "git://github.com/containerd/fifo;name=fifo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/fifo"
 
 #       github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc
 # [1] git ls-remote https://github.com/davecgh/go-spew d8f796af33cc11cb798c1aaeb27a4ebc5099927d
 SRCREV_go-spew="d8f796af33cc11cb798c1aaeb27a4ebc5099927d"
-SRC_URI += "git://github.com/davecgh/go-spew;name=go-spew;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davecgh/go-spew"
+SRC_URI += "git://github.com/davecgh/go-spew;name=go-spew;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/davecgh/go-spew"
 
 #       github.com/docker/go-units v0.5.0
 # [1] git ls-remote https://github.com/docker/go-units e682442797b36348f8e1f98defdbf32bac0b6c6f
 SRCREV_go-units="e682442797b36348f8e1f98defdbf32bac0b6c6f"
-SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-units"
+SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-units"
 
 #       github.com/fatih/camelcase v1.0.0
 # [1] git ls-remote https://github.com/fatih/camelcase 44e46d280b43ec1531bb25252440e34f1b800b65
 SRCREV_camelcase="44e46d280b43ec1531bb25252440e34f1b800b65"
-SRC_URI += "git://github.com/fatih/camelcase;name=camelcase;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/camelcase"
+SRC_URI += "git://github.com/fatih/camelcase;name=camelcase;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fatih/camelcase"
 
 #       github.com/go-openapi/swag v0.22.4
 # [1] git ls-remote https://github.com/go-openapi/swag f28dd7aae5534e2e3681204c90019f1dda8a7393
 SRCREV_swag="f28dd7aae5534e2e3681204c90019f1dda8a7393"
-SRC_URI += "git://github.com/go-openapi/swag;name=swag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/swag"
+SRC_URI += "git://github.com/go-openapi/swag;name=swag;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-openapi/swag"
 
 #       github.com/golang/protobuf v1.5.3
 # [1] git ls-remote https://github.com/golang/protobuf 5d5e8c018a13017f9d5b8bf4fad64aaa42a87308
 SRCREV_golang-protobuf="5d5e8c018a13017f9d5b8bf4fad64aaa42a87308"
-SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
+SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/protobuf"
 
 #       github.com/intel/goresctrl v0.3.0
 # [1] git ls-remote https://github.com/intel/goresctrl c40cbba82c8e94fe89926174efc817586bb3950a
 SRCREV_goresctrl="c40cbba82c8e94fe89926174efc817586bb3950a"
-SRC_URI += "git://github.com/intel/goresctrl;name=goresctrl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/intel/goresctrl"
+SRC_URI += "git://github.com/intel/goresctrl;name=goresctrl;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/intel/goresctrl"
 
 #       github.com/jackc/pgerrcode v0.0.0-20220416144525-469b46aa5efa
 # [1] git ls-remote https://github.com/jackc/pgerrcode 469b46aa5efae8a229646096c4d7026bf9ff89fe
 SRCREV_pgerrcode="469b46aa5efae8a229646096c4d7026bf9ff89fe"
-SRC_URI += "git://github.com/jackc/pgerrcode;name=pgerrcode;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jackc/pgerrcode"
+SRC_URI += "git://github.com/jackc/pgerrcode;name=pgerrcode;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jackc/pgerrcode"
 
 #       github.com/mailru/easyjson v0.7.7
 # [1] git ls-remote https://github.com/mailru/easyjson c120ca7ced6051261161ce15e8f1542a4b2567fc
 SRCREV_easyjson="c120ca7ced6051261161ce15e8f1542a4b2567fc"
-SRC_URI += "git://github.com/mailru/easyjson;name=easyjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mailru/easyjson"
+SRC_URI += "git://github.com/mailru/easyjson;name=easyjson;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mailru/easyjson"
 
 #       github.com/mdlayher/socket v0.4.1
 # [1] git ls-remote https://github.com/mdlayher/socket 024cdfb30ba417ac6f1b27bb5189a8099787dcf7
 SRCREV_socket="024cdfb30ba417ac6f1b27bb5189a8099787dcf7"
-SRC_URI += "git://github.com/mdlayher/socket;name=socket;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mdlayher/socket"
+SRC_URI += "git://github.com/mdlayher/socket;name=socket;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mdlayher/socket"
 
 #       github.com/moby/spdystream v0.2.0
 # [1] git ls-remote https://github.com/moby/spdystream dbc715126c0e3fa07721879c6d265b2b82c71e5b
 SRCREV_spdystream="dbc715126c0e3fa07721879c6d265b2b82c71e5b"
-SRC_URI += "git://github.com/moby/spdystream;name=spdystream;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/spdystream"
+SRC_URI += "git://github.com/moby/spdystream;name=spdystream;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/spdystream"
 
 #       github.com/moby/sys/signal v0.7.0
 # [1] git ls-remote https://github.com/moby/sys b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5
 SRCREV_signal="b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
-SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal"
+SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/signal"
 
 #       github.com/mxk/go-flowrate v0.0.0-20140419014527-cca7078d478f
 # [1] git ls-remote https://github.com/mxk/go-flowrate cca7078d478f8520f85629ad7c68962d31ed7682
 SRCREV_go-flowrate="cca7078d478f8520f85629ad7c68962d31ed7682"
-SRC_URI += "git://github.com/mxk/go-flowrate;name=go-flowrate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mxk/go-flowrate"
+SRC_URI += "git://github.com/mxk/go-flowrate;name=go-flowrate;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mxk/go-flowrate"
 
 #       github.com/nats-io/nats.go v1.31.0
 # [1] git ls-remote https://github.com/nats-io/nats.go 8712190da1d17ab0c4719bffa7c0174214c56e6c
 SRCREV_nats.go="8712190da1d17ab0c4719bffa7c0174214c56e6c"
-SRC_URI += "git://github.com/nats-io/nats.go;name=nats.go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/nats-io/nats.go"
+SRC_URI += "git://github.com/nats-io/nats.go;name=nats.go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/nats-io/nats.go"
 
 #       github.com/xiang90/probing v0.0.0-20221125231312-a49e3df8f510
 # [1] git ls-remote https://github.com/xiang90/probing a49e3df8f510ee8b42e68345ca4636dbb161bd0a
 SRCREV_probing="a49e3df8f510ee8b42e68345ca4636dbb161bd0a"
-SRC_URI += "git://github.com/xiang90/probing;name=probing;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xiang90/probing"
+SRC_URI += "git://github.com/xiang90/probing;name=probing;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xiang90/probing"
 
 #       golang.zx2c4.com/wireguard v0.0.0-20230325221338-052af4a8072b
 # [1] git ls-remote https://git.zx2c4.com/wireguard-go 052af4a8072bbbd3bfe7edf46fe3c1b350f71f08
 SRCREV_wireguard="052af4a8072bbbd3bfe7edf46fe3c1b350f71f08"
-SRC_URI += "git://git.zx2c4.com/wireguard-go;name=wireguard;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.zx2c4.com/wireguard"
+SRC_URI += "git://git.zx2c4.com/wireguard-go;name=wireguard;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.zx2c4.com/wireguard"
 
 #       google.golang.org/genproto v0.0.0-20230525234035-dd9d682886f9
 # [1] git ls-remote https://github.com/googleapis/go-genproto dd9d682886f99d242574cd3eaea438ce7ea66399
 SRCREV_genproto="dd9d682886f99d242574cd3eaea438ce7ea66399"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto"
 
 #       google.golang.org/protobuf v1.31.0
 # [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 68463f0e96c93bc19ef36ccd3adfe690bfdb568c
 SRCREV_google.golang.org-protobuf="68463f0e96c93bc19ef36ccd3adfe690bfdb568c"
-SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
+SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/protobuf"
 
 #       gopkg.in/square/go-jose.v2 v2.6.0
 # [1] git ls-remote https://github.com/square/go-jose a10ff54e00bc6e833bf549e04ae976f0fe8ea2fd
 SRCREV_go-jose.v2="a10ff54e00bc6e833bf549e04ae976f0fe8ea2fd"
-SRC_URI += "git://github.com/square/go-jose;name=go-jose.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/square/go-jose.v2"
+SRC_URI += "git://github.com/square/go-jose;name=go-jose.v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/square/go-jose.v2"
 
 #       github.com/json-iterator/go v1.1.12
 # [1] git ls-remote https://github.com/json-iterator/go 024077e996b048517130b21ea6bf12aa23055d3d
 SRCREV_go="024077e996b048517130b21ea6bf12aa23055d3d"
-SRC_URI += "git://github.com/json-iterator/go;name=go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/json-iterator/go"
+SRC_URI += "git://github.com/json-iterator/go;name=go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/json-iterator/go"
 
 #       github.com/k3s-io/cri-tools v1.26.0-rc.0-k3s1
 # [1] git ls-remote https://github.com/k3s-io/cri-tools 029d9bbf8bfb43c46a80b013cb6bf163739df0c8
 SRCREV_cri-tools="029d9bbf8bfb43c46a80b013cb6bf163739df0c8"
-SRC_URI += "git://github.com/k3s-io/cri-tools;name=cri-tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/cri-tools"
+SRC_URI += "git://github.com/k3s-io/cri-tools;name=cri-tools;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/cri-tools"
 
 #       github.com/libp2p/go-libp2p v0.30.0
 # [1] git ls-remote https://github.com/libp2p/go-libp2p 37319a699f336e3e062c7894f44d47db3fea4dc2
 SRCREV_go-libp2p="37319a699f336e3e062c7894f44d47db3fea4dc2"
-SRC_URI += "git://github.com/libp2p/go-libp2p;name=go-libp2p;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-libp2p"
+SRC_URI += "git://github.com/libp2p/go-libp2p;name=go-libp2p;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-libp2p"
 
 #       github.com/mattn/go-sqlite3 v1.14.19
 # [1] git ls-remote https://github.com/mattn/go-sqlite3 00b02e0ba98effd5f157d39216e244af8a807f9b
 SRCREV_go-sqlite3="00b02e0ba98effd5f157d39216e244af8a807f9b"
-SRC_URI += "git://github.com/mattn/go-sqlite3;name=go-sqlite3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-sqlite3"
+SRC_URI += "git://github.com/mattn/go-sqlite3;name=go-sqlite3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-sqlite3"
 
 #       github.com/rancher/wrangler v1.1.1-0.20230818201331-3604a6be798d
 # [1] git ls-remote https://github.com/rancher/wrangler 3604a6be798d0e52e1d935d61d57b4ecbd5dfb2a
 SRCREV_wrangler="3604a6be798d0e52e1d935d61d57b4ecbd5dfb2a"
-SRC_URI += "git://github.com/rancher/wrangler;name=wrangler;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rancher/wrangler"
+SRC_URI += "git://github.com/rancher/wrangler;name=wrangler;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rancher/wrangler"
 
 #       github.com/stretchr/testify v1.8.4
 # [1] git ls-remote https://github.com/stretchr/testify f97607b89807936ac4ff96748d766cf4b9711f78
 SRCREV_testify="f97607b89807936ac4ff96748d766cf4b9711f78"
-SRC_URI += "git://github.com/stretchr/testify;name=testify;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stretchr/testify"
+SRC_URI += "git://github.com/stretchr/testify;name=testify;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/stretchr/testify"
 
 #       github.com/jbenet/goprocess v0.1.4
 # [1] git ls-remote https://github.com/jbenet/goprocess 23d20c20149e1f362afda26f4500cb9d6393f0ad
 SRCREV_goprocess="23d20c20149e1f362afda26f4500cb9d6393f0ad"
-SRC_URI += "git://github.com/jbenet/goprocess;name=goprocess;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jbenet/goprocess"
+SRC_URI += "git://github.com/jbenet/goprocess;name=goprocess;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jbenet/goprocess"
 
 #       github.com/syndtr/goleveldb v1.0.0
 # [1] git ls-remote https://github.com/syndtr/goleveldb 9d007e481048296f09f59bd19bb7ae584563cd95
 SRCREV_goleveldb="9d007e481048296f09f59bd19bb7ae584563cd95"
-SRC_URI += "git://github.com/syndtr/goleveldb;name=goleveldb;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/syndtr/goleveldb"
+SRC_URI += "git://github.com/syndtr/goleveldb;name=goleveldb;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/syndtr/goleveldb"
 
 #       cloud.google.com/go/compute v1.23.3
 # [1] git ls-remote https://github.com/googleapis/google-cloud-go 2ba47cb7adfef32617eb11888331ccc2d2a0f84d
 SRCREV_compute="2ba47cb7adfef32617eb11888331ccc2d2a0f84d"
-SRC_URI += "git://github.com/googleapis/google-cloud-go;name=compute;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/cloud.google.com/go/compute"
+SRC_URI += "git://github.com/googleapis/google-cloud-go;name=compute;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/cloud.google.com/go/compute"
 
 #       github.com/containerd/ttrpc v1.2.2
 # [1] git ls-remote https://github.com/containerd/ttrpc ac26f8cbea1c440d451dd19a4a1b847fd073f3c3
 SRCREV_ttrpc="ac26f8cbea1c440d451dd19a4a1b847fd073f3c3"
-SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/ttrpc"
+SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/ttrpc"
 
 #       github.com/coreos/go-semver v0.3.1
 # [1] git ls-remote https://github.com/coreos/go-semver c16f28124668daf02b2a32a431dec2f183977ffc
 SRCREV_go-semver="c16f28124668daf02b2a32a431dec2f183977ffc"
-SRC_URI += "git://github.com/coreos/go-semver;name=go-semver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-semver"
+SRC_URI += "git://github.com/coreos/go-semver;name=go-semver;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-semver"
 
 #       github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c
 # [1] git ls-remote https://github.com/docker/go-events e31b211e4f1cd09aa76fe4ac244571fab96ae47f
 SRCREV_go-events="e31b211e4f1cd09aa76fe4ac244571fab96ae47f"
-SRC_URI += "git://github.com/docker/go-events;name=go-events;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-events"
+SRC_URI += "git://github.com/docker/go-events;name=go-events;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-events"
 
 #       github.com/go-errors/errors v1.4.2
 # [1] git ls-remote https://github.com/go-errors/errors 33d496f939bc762321a636d4035e15c302eb0b00
 SRCREV_go-errors-errors="33d496f939bc762321a636d4035e15c302eb0b00"
-SRC_URI += "git://github.com/go-errors/errors;name=go-errors-errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-errors/errors"
+SRC_URI += "git://github.com/go-errors/errors;name=go-errors-errors;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-errors/errors"
 
 #       github.com/jackc/pgpassfile v1.0.0
 # [1] git ls-remote https://github.com/jackc/pgpassfile 99d8e8e28945ffceaf75b0299fcb2bb656b8a683
 SRCREV_pgpassfile="99d8e8e28945ffceaf75b0299fcb2bb656b8a683"
-SRC_URI += "git://github.com/jackc/pgpassfile;name=pgpassfile;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jackc/pgpassfile"
+SRC_URI += "git://github.com/jackc/pgpassfile;name=pgpassfile;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jackc/pgpassfile"
 
 #       github.com/josharian/intern v1.0.0
 # [1] git ls-remote https://github.com/josharian/intern 8e6ff32b3e7c0b018c43953085fe2ac330fe9acd
 SRCREV_intern="8e6ff32b3e7c0b018c43953085fe2ac330fe9acd"
-SRC_URI += "git://github.com/josharian/intern;name=intern;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/josharian/intern"
+SRC_URI += "git://github.com/josharian/intern;name=intern;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/josharian/intern"
 
 #       github.com/josharian/native v1.1.0
 # [1] git ls-remote https://github.com/josharian/native c1e37c09b531b14ae12a501eb6fd529b31cecdaa
 SRCREV_native="c1e37c09b531b14ae12a501eb6fd529b31cecdaa"
-SRC_URI += "git://github.com/josharian/native;name=native;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/josharian/native"
+SRC_URI += "git://github.com/josharian/native;name=native;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/josharian/native"
 
 #       github.com/lithammer/dedent v1.1.0
 # [1] git ls-remote https://github.com/lithammer/dedent 8478954c3bc893cf36c5ee7c822266b993a3b3ee
 SRCREV_dedent="8478954c3bc893cf36c5ee7c822266b993a3b3ee"
-SRC_URI += "git://github.com/lithammer/dedent;name=dedent;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/lithammer/dedent"
+SRC_URI += "git://github.com/lithammer/dedent;name=dedent;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/lithammer/dedent"
 
 #       github.com/mdlayher/netlink v1.7.2
 # [1] git ls-remote https://github.com/mdlayher/netlink 657f7da1d9bd78d246ae610e0b5efc63a6a5f9e4
 SRCREV_mdlayher-netlink="657f7da1d9bd78d246ae610e0b5efc63a6a5f9e4"
-SRC_URI += "git://github.com/mdlayher/netlink;name=mdlayher-netlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mdlayher/netlink"
+SRC_URI += "git://github.com/mdlayher/netlink;name=mdlayher-netlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mdlayher/netlink"
 
 #       github.com/mistifyio/go-zfs v2.1.2-0.20190413222219-f784269be439+incompatible
 # [1] git ls-remote https://github.com/mistifyio/go-zfs f784269be439d704d3dfa1906f45dd848fed2beb
 SRCREV_go-zfs="f784269be439d704d3dfa1906f45dd848fed2beb"
-SRC_URI += "git://github.com/mistifyio/go-zfs;name=go-zfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mistifyio/go-zfs"
+SRC_URI += "git://github.com/mistifyio/go-zfs;name=go-zfs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mistifyio/go-zfs"
 
 #       github.com/moby/sys/symlink v0.2.0
 # [1] git ls-remote https://github.com/moby/sys 03b9f8d59a07f5206a2264105f4903a222aea964
 SRCREV_symlink="03b9f8d59a07f5206a2264105f4903a222aea964"
-SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/symlink"
+SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/symlink"
 
 #       github.com/vbatts/tar-split v0.11.5
 # [1] git ls-remote https://github.com/vbatts/tar-split 5ef0dd8243164ebacd755916a89d8085a5b6bb7f
 SRCREV_tar-split="5ef0dd8243164ebacd755916a89d8085a5b6bb7f"
-SRC_URI += "git://github.com/vbatts/tar-split;name=tar-split;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vbatts/tar-split"
+SRC_URI += "git://github.com/vbatts/tar-split;name=tar-split;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vbatts/tar-split"
 
 #       google.golang.org/appengine v1.6.8
 # [1] git ls-remote https://github.com/golang/appengine aa58fcd18e4ab7ac816760ee266fa30a0907ab9e
 SRCREV_appengine="aa58fcd18e4ab7ac816760ee266fa30a0907ab9e"
-SRC_URI += "git://github.com/golang/appengine;name=appengine;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/appengine"
+SRC_URI += "git://github.com/golang/appengine;name=appengine;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/appengine"
 
 #       sigs.k8s.io/kustomize/kyaml v0.14.3-0.20230601165947-6ce0bf390ce3
 # [1] git ls-remote https://github.com/kubernetes-sigs/kustomize 6ce0bf390ce3dae580947a2b739da3306c675eef
 SRCREV_kyaml="6ce0bf390ce3dae580947a2b739da3306c675eef"
-SRC_URI += "git://github.com/kubernetes-sigs/kustomize;name=kyaml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/kustomize/kyaml"
+SRC_URI += "git://github.com/kubernetes-sigs/kustomize;name=kyaml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/kustomize/kyaml"
 
 #       github.com/Microsoft/hcsshim v0.11.0
 # [1] git ls-remote https://github.com/microsoft/hcsshim 750e11bf07440fd1581413bdc1fc7731fa2d6d64
 SRCREV_hcsshim="750e11bf07440fd1581413bdc1fc7731fa2d6d64"
-SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/hcsshim"
+SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Microsoft/hcsshim"
 
 #       github.com/k3s-io/containerd v1.7.11-k3s2
 # [1] git ls-remote https://github.com/k3s-io/containerd 64c566767b99d0bacf26fb6e2355775c413331c9
 SRCREV_containerd="64c566767b99d0bacf26fb6e2355775c413331c9"
-SRC_URI += "git://github.com/k3s-io/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/containerd"
+SRC_URI += "git://github.com/k3s-io/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/containerd"
 
 #       github.com/coreos/go-systemd v0.0.0-20190321100706-95778dfbb74e
 # [1] git ls-remote https://github.com/coreos/go-systemd 95778dfbb74eb7e4dbaf43bf7d71809650ef8076
 SRCREV_go-systemd="95778dfbb74eb7e4dbaf43bf7d71809650ef8076"
-SRC_URI += "git://github.com/coreos/go-systemd;name=go-systemd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd"
+SRC_URI += "git://github.com/coreos/go-systemd;name=go-systemd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-systemd"
 
 #       github.com/gorilla/websocket v1.5.0
 # [1] git ls-remote https://github.com/gorilla/websocket 9111bb834a68b893cebbbaed5060bdbc1d9ab7d2
 SRCREV_websocket="9111bb834a68b893cebbbaed5060bdbc1d9ab7d2"
-SRC_URI += "git://github.com/gorilla/websocket;name=websocket;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gorilla/websocket"
+SRC_URI += "git://github.com/gorilla/websocket;name=websocket;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gorilla/websocket"
 
 #       github.com/minio/minio-go/v7 v7.0.33
 # [1] git ls-remote https://github.com/minio/minio-go a80fee3343f12028079ae831a04b9583ba09c695
 SRCREV_v7="a80fee3343f12028079ae831a04b9583ba09c695"
-SRC_URI += "git://github.com/minio/minio-go;name=v7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/minio-go/v7"
+SRC_URI += "git://github.com/minio/minio-go;name=v7;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/minio/minio-go/v7"
 
 #       github.com/yl2chen/cidranger v1.0.2
 # [1] git ls-remote https://github.com/yl2chen/cidranger 7ff5a0e84593dad6fbd50551343618d7956b3c71
 SRCREV_cidranger="7ff5a0e84593dad6fbd50551343618d7956b3c71"
-SRC_URI += "git://github.com/yl2chen/cidranger;name=cidranger;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yl2chen/cidranger"
+SRC_URI += "git://github.com/yl2chen/cidranger;name=cidranger;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/yl2chen/cidranger"
 
 #       github.com/k3s-io/kubernetes v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kubernetes="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kubernetes;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kubernetes;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes"
 
 #       github.com/benbjohnson/clock v1.3.5
 # [1] git ls-remote https://github.com/benbjohnson/clock 96c602caabb567343046c08a8fca8560b4f00bb4
 SRCREV_clock="96c602caabb567343046c08a8fca8560b4f00bb4"
-SRC_URI += "git://github.com/benbjohnson/clock;name=clock;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/benbjohnson/clock"
+SRC_URI += "git://github.com/benbjohnson/clock;name=clock;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/benbjohnson/clock"
 
 #       github.com/francoispqt/gojay v1.2.13
 # [1] git ls-remote https://github.com/francoispqt/gojay 1398296d938f9fae26750ddc2fe356b6d897f799
 SRCREV_gojay="1398296d938f9fae26750ddc2fe356b6d897f799"
-SRC_URI += "git://github.com/francoispqt/gojay;name=gojay;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/francoispqt/gojay"
+SRC_URI += "git://github.com/francoispqt/gojay;name=gojay;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/francoispqt/gojay"
 
 #       github.com/ipfs/go-datastore v0.6.0
 # [1] git ls-remote https://github.com/ipfs/go-datastore 1de47089f5c72b61d91b5cd9043e49fe95771ac0
 SRCREV_go-datastore="1de47089f5c72b61d91b5cd9043e49fe95771ac0"
-SRC_URI += "git://github.com/ipfs/go-datastore;name=go-datastore;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-datastore"
+SRC_URI += "git://github.com/ipfs/go-datastore;name=go-datastore;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/go-datastore"
 
 #       github.com/raulk/go-watchdog v1.3.0
 # [1] git ls-remote https://github.com/raulk/go-watchdog 9c5e371109037bec1852ea63c9512a94307bfea0
 SRCREV_go-watchdog="9c5e371109037bec1852ea63c9512a94307bfea0"
-SRC_URI += "git://github.com/raulk/go-watchdog;name=go-watchdog;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/raulk/go-watchdog"
+SRC_URI += "git://github.com/raulk/go-watchdog;name=go-watchdog;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/raulk/go-watchdog"
 
 #       github.com/spaolacci/murmur3 v1.1.0
 # [1] git ls-remote https://github.com/spaolacci/murmur3 f09979ecbc725b9e6d41a297405f65e7e8804acc
 SRCREV_murmur3="f09979ecbc725b9e6d41a297405f65e7e8804acc"
-SRC_URI += "git://github.com/spaolacci/murmur3;name=murmur3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spaolacci/murmur3"
+SRC_URI += "git://github.com/spaolacci/murmur3;name=murmur3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spaolacci/murmur3"
 
 #       github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
 # [1] git ls-remote https://github.com/Azure/go-ansiterm d185dfc1b5a126116ea5a19e148e29d16b4574c9
 SRCREV_go-ansiterm="d185dfc1b5a126116ea5a19e148e29d16b4574c9"
-SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-ansiterm"
+SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-ansiterm"
 
 #       github.com/Azure/go-autorest v14.2.0+incompatible
 # [1] git ls-remote https://github.com/Azure/go-autorest e7b391b759b050d6719cc6fd8bb87b6dc038bca6
 SRCREV_go-autorest="e7b391b759b050d6719cc6fd8bb87b6dc038bca6"
-SRC_URI += "git://github.com/Azure/go-autorest;name=go-autorest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest"
+SRC_URI += "git://github.com/Azure/go-autorest;name=go-autorest;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest"
 
 #       github.com/avast/retry-go/v4 v4.3.2
 # [1] git ls-remote https://github.com/avast/retry-go c65eeae03ec06cb591b05d092457de9f691bb359
 SRCREV_retry-go-v4="c65eeae03ec06cb591b05d092457de9f691bb359"
-SRC_URI += "git://github.com/avast/retry-go;name=retry-go-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/avast/retry-go/v4"
+SRC_URI += "git://github.com/avast/retry-go;name=retry-go-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/avast/retry-go/v4"
 
 #       github.com/cespare/xxhash/v2 v2.2.0
 # [1] git ls-remote https://github.com/cespare/xxhash a76eb16a93c1e30527c073ca831d9048b4b935f6
 SRCREV_xxhash-v2="a76eb16a93c1e30527c073ca831d9048b4b935f6"
-SRC_URI += "git://github.com/cespare/xxhash;name=xxhash-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cespare/xxhash/v2"
+SRC_URI += "git://github.com/cespare/xxhash;name=xxhash-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cespare/xxhash/v2"
 
 #       github.com/containerd/go-cni v1.1.9
 # [1] git ls-remote https://github.com/containerd/go-cni 6603d5bd8941d7f2026bb5627f6aa4ff434f859a
 SRCREV_go-cni="6603d5bd8941d7f2026bb5627f6aa4ff434f859a"
-SRC_URI += "git://github.com/containerd/go-cni;name=go-cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/go-cni"
+SRC_URI += "git://github.com/containerd/go-cni;name=go-cni;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/go-cni"
 
 #       github.com/docker/go-metrics v0.0.1
 # [1] git ls-remote https://github.com/docker/go-metrics b619b3592b65de4f087d9f16863a7e6ff905973c
 SRCREV_go-metrics="b619b3592b65de4f087d9f16863a7e6ff905973c"
-SRC_URI += "git://github.com/docker/go-metrics;name=go-metrics;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-metrics"
+SRC_URI += "git://github.com/docker/go-metrics;name=go-metrics;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-metrics"
 
 #       github.com/felixge/httpsnoop v1.0.4
 # [1] git ls-remote https://github.com/felixge/httpsnoop c5817c27ec125409c069052fdd171023c353501c
 SRCREV_httpsnoop="c5817c27ec125409c069052fdd171023c353501c"
-SRC_URI += "git://github.com/felixge/httpsnoop;name=httpsnoop;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/felixge/httpsnoop"
+SRC_URI += "git://github.com/felixge/httpsnoop;name=httpsnoop;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/felixge/httpsnoop"
 
 #       github.com/fsnotify/fsnotify v1.7.0
 # [1] git ls-remote https://github.com/fsnotify/fsnotify cfc9c4f277ea6ec18de92444b31983b183deb4fb
 SRCREV_fsnotify="cfc9c4f277ea6ec18de92444b31983b183deb4fb"
-SRC_URI += "git://github.com/fsnotify/fsnotify;name=fsnotify;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fsnotify/fsnotify"
+SRC_URI += "git://github.com/fsnotify/fsnotify;name=fsnotify;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fsnotify/fsnotify"
 
 #       github.com/golang-jwt/jwt/v4 v4.5.0
 # [1] git ls-remote https://github.com/golang-jwt/jwt 9358574a7a1a2c8d644f22b6e8de627ba85c58d0
 SRCREV_jwt-v4="9358574a7a1a2c8d644f22b6e8de627ba85c58d0"
-SRC_URI += "git://github.com/golang-jwt/jwt;name=jwt-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang-jwt/jwt/v4"
+SRC_URI += "git://github.com/golang-jwt/jwt;name=jwt-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang-jwt/jwt/v4"
 
 #       github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da
 # [1] git ls-remote https://github.com/golang/groupcache 41bb18bfe9da5321badc438f91158cd790a33aa3
 SRCREV_groupcache="41bb18bfe9da5321badc438f91158cd790a33aa3"
-SRC_URI += "git://github.com/golang/groupcache;name=groupcache;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/groupcache"
+SRC_URI += "git://github.com/golang/groupcache;name=groupcache;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/groupcache"
 
 #       github.com/hanwen/go-fuse/v2 v2.3.0
 # [1] git ls-remote https://github.com/hanwen/go-fuse d537a5a8d65c6552bc3844571f1d8ec76bcac5e4
 SRCREV_go-fuse-v2="d537a5a8d65c6552bc3844571f1d8ec76bcac5e4"
-SRC_URI += "git://github.com/hanwen/go-fuse;name=go-fuse-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hanwen/go-fuse/v2"
+SRC_URI += "git://github.com/hanwen/go-fuse;name=go-fuse-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hanwen/go-fuse/v2"
 
 #       github.com/hashicorp/errwrap v1.1.0
 # [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0
 SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
-SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
+SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/errwrap"
 
 #       github.com/karrick/godirwalk v1.17.0
 # [1] git ls-remote https://github.com/karrick/godirwalk 9a7752c108e7ea76255201b9f47bd4d4d2df868e
 SRCREV_godirwalk="9a7752c108e7ea76255201b9f47bd4d4d2df868e"
-SRC_URI += "git://github.com/karrick/godirwalk;name=godirwalk;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/karrick/godirwalk"
+SRC_URI += "git://github.com/karrick/godirwalk;name=godirwalk;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/karrick/godirwalk"
 
 #       github.com/liggitt/tabwriter v0.0.0-20181228230101-89fcab3d43de
 # [1] git ls-remote https://github.com/liggitt/tabwriter 89fcab3d43de07060e4fd4c1547430ed57e87f24
 SRCREV_tabwriter="89fcab3d43de07060e4fd4c1547430ed57e87f24"
-SRC_URI += "git://github.com/liggitt/tabwriter;name=tabwriter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/liggitt/tabwriter"
+SRC_URI += "git://github.com/liggitt/tabwriter;name=tabwriter;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/liggitt/tabwriter"
 
 #       github.com/minio/highwayhash v1.0.2
 # [1] git ls-remote https://github.com/minio/highwayhash 08ce0b4fa7932a018438133f1b632e1c674d4107
 SRCREV_highwayhash="08ce0b4fa7932a018438133f1b632e1c674d4107"
-SRC_URI += "git://github.com/minio/highwayhash;name=highwayhash;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/highwayhash"
+SRC_URI += "git://github.com/minio/highwayhash;name=highwayhash;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/minio/highwayhash"
 
 #       github.com/minio/sha256-simd v1.0.1
 # [1] git ls-remote https://github.com/minio/sha256-simd 6096f891a77bfe490cbea7a424c821b5fdb92849
 SRCREV_sha256-simd="6096f891a77bfe490cbea7a424c821b5fdb92849"
-SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/sha256-simd"
+SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/minio/sha256-simd"
 
 #       github.com/mrunalp/fileutils v0.5.1
 # [1] git ls-remote https://github.com/mrunalp/fileutils 7363e975f9cfb558be601bece0df81714c3c9084
 SRCREV_fileutils="7363e975f9cfb558be601bece0df81714c3c9084"
-SRC_URI += "git://github.com/mrunalp/fileutils;name=fileutils;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mrunalp/fileutils"
+SRC_URI += "git://github.com/mrunalp/fileutils;name=fileutils;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mrunalp/fileutils"
 
 #       github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822
 # [1] git ls-remote https://github.com/munnerz/goautoneg a7dc8b61c822528f973a5e4e7b272055c6fdb43e
 SRCREV_goautoneg="a7dc8b61c822528f973a5e4e7b272055c6fdb43e"
-SRC_URI += "git://github.com/munnerz/goautoneg;name=goautoneg;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/munnerz/goautoneg"
+SRC_URI += "git://github.com/munnerz/goautoneg;name=goautoneg;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/munnerz/goautoneg"
 
 #       github.com/pelletier/go-toml v1.9.5
 # [1] git ls-remote https://github.com/pelletier/go-toml fed1464066413075eac02cd4dc368b5221845541
 SRCREV_go-toml="fed1464066413075eac02cd4dc368b5221845541"
-SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml"
+SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pelletier/go-toml"
 
 #       github.com/prometheus/common v0.45.0
 # [1] git ls-remote https://github.com/prometheus/common c59927ec74c04c0c17891bf27784fe7c484ae97f
 SRCREV_common="c59927ec74c04c0c17891bf27784fe7c484ae97f"
-SRC_URI += "git://github.com/prometheus/common;name=common;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/common"
+SRC_URI += "git://github.com/prometheus/common;name=common;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/common"
 
 #       github.com/prometheus/procfs v0.12.0
 # [1] git ls-remote https://github.com/prometheus/procfs ff0ad85f7e8bcd5c677d99143f14a2a3aab533aa
 SRCREV_procfs="ff0ad85f7e8bcd5c677d99143f14a2a3aab533aa"
-SRC_URI += "git://github.com/prometheus/procfs;name=procfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/procfs"
+SRC_URI += "git://github.com/prometheus/procfs;name=procfs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/procfs"
 
 #       github.com/vishvananda/netns v0.0.4
 # [1] git ls-remote https://github.com/vishvananda/netns 7a452d2d15292b2bfb2a2d88e6bdeac156a761b9
 SRCREV_netns="7a452d2d15292b2bfb2a2d88e6bdeac156a761b9"
-SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netns"
+SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vishvananda/netns"
 
 #       go.opentelemetry.io/otel/sdk v1.13.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go f2fd476f433128c2494476950ce11600a51bbe35
 SRCREV_sdk="f2fd476f433128c2494476950ce11600a51bbe35"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=sdk;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/sdk"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=sdk;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/sdk"
 
 #       github.com/k3s-io/cri-dockerd v0.3.9-k3s2
 # [1] git ls-remote https://github.com/k3s-io/cri-dockerd 0d2146805dcd844e15d02d6f1956b4cd0e4365cf
 SRCREV_cri-dockerd="0d2146805dcd844e15d02d6f1956b4cd0e4365cf"
-SRC_URI += "git://github.com/k3s-io/cri-dockerd;name=cri-dockerd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/cri-dockerd"
+SRC_URI += "git://github.com/k3s-io/cri-dockerd;name=cri-dockerd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/cri-dockerd"
 
 #       github.com/coreos/go-iptables v0.7.0
 # [1] git ls-remote https://github.com/coreos/go-iptables b9dff5a19d9c3925da3f9b3c0a705de6c1fdc56c
 SRCREV_go-iptables="b9dff5a19d9c3925da3f9b3c0a705de6c1fdc56c"
-SRC_URI += "git://github.com/coreos/go-iptables;name=go-iptables;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-iptables"
+SRC_URI += "git://github.com/coreos/go-iptables;name=go-iptables;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-iptables"
 
 #       github.com/flannel-io/flannel v0.24.2
 # [1] git ls-remote https://github.com/flannel-io/flannel 3d56ed16e123a6fb06841ba920664b3ce4c99cda
 SRCREV_flannel="3d56ed16e123a6fb06841ba920664b3ce4c99cda"
-SRC_URI += "git://github.com/flannel-io/flannel;name=flannel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/flannel-io/flannel"
+SRC_URI += "git://github.com/flannel-io/flannel;name=flannel;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/flannel-io/flannel"
 
 #       github.com/ipfs/go-ds-leveldb v0.5.0
 # [1] git ls-remote https://github.com/ipfs/go-ds-leveldb 6f6dc580f7325ad411fc5967ccee67e40545e208
 SRCREV_go-ds-leveldb="6f6dc580f7325ad411fc5967ccee67e40545e208"
-SRC_URI += "git://github.com/ipfs/go-ds-leveldb;name=go-ds-leveldb;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-ds-leveldb"
+SRC_URI += "git://github.com/ipfs/go-ds-leveldb;name=go-ds-leveldb;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/go-ds-leveldb"
 
 #       github.com/klauspost/compress v1.17.2
 # [1] git ls-remote https://github.com/klauspost/compress 8eb6542f08f086fb92796f6d8a4531d754947309
 SRCREV_compress="8eb6542f08f086fb92796f6d8a4531d754947309"
-SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/compress"
+SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/klauspost/compress"
 
 #       github.com/k3s-io/etcd/api/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_api-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=api-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/api/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=api-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/api/v3"
 
 #       github.com/chenzhuoyu/base64x v0.0.0-20221115062448-fe3a3abad311
 # [1] git ls-remote https://github.com/chenzhuoyu/base64x fe3a3abad31102e33411b1b239aa111b80ae336d
 SRCREV_base64x="fe3a3abad31102e33411b1b239aa111b80ae336d"
-SRC_URI += "git://github.com/chenzhuoyu/base64x;name=base64x;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/chenzhuoyu/base64x"
+SRC_URI += "git://github.com/chenzhuoyu/base64x;name=base64x;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/chenzhuoyu/base64x"
 
 #       github.com/ipld/go-ipld-prime v0.20.0
 # [1] git ls-remote https://github.com/ipld/go-ipld-prime 200b4a6b6fb6720911cb385aff05da55c39d56de
 SRCREV_go-ipld-prime="200b4a6b6fb6720911cb385aff05da55c39d56de"
-SRC_URI += "git://github.com/ipld/go-ipld-prime;name=go-ipld-prime;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipld/go-ipld-prime"
+SRC_URI += "git://github.com/ipld/go-ipld-prime;name=go-ipld-prime;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipld/go-ipld-prime"
 
 #       github.com/jackpal/go-nat-pmp v1.0.2
 # [1] git ls-remote https://github.com/jackpal/go-nat-pmp 059203efa1edd7130293a583541b8308e7c640c4
 SRCREV_go-nat-pmp="059203efa1edd7130293a583541b8308e7c640c4"
-SRC_URI += "git://github.com/jackpal/go-nat-pmp;name=go-nat-pmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jackpal/go-nat-pmp"
+SRC_URI += "git://github.com/jackpal/go-nat-pmp;name=go-nat-pmp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jackpal/go-nat-pmp"
 
 #       github.com/libp2p/go-netroute v0.2.1
 # [1] git ls-remote https://github.com/libp2p/go-netroute 462cbfaf52f4c2a2321e6382455a8f56396f3664
 SRCREV_go-netroute="462cbfaf52f4c2a2321e6382455a8f56396f3664"
-SRC_URI += "git://github.com/libp2p/go-netroute;name=go-netroute;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-netroute"
+SRC_URI += "git://github.com/libp2p/go-netroute;name=go-netroute;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-netroute"
 
 #       github.com/libp2p/go-yamux/v4 v4.0.1
 # [1] git ls-remote https://github.com/libp2p/go-yamux e584a210c72651b67829477b4b4285cae25b1a1b
 SRCREV_go-yamux-v4="e584a210c72651b67829477b4b4285cae25b1a1b"
-SRC_URI += "git://github.com/libp2p/go-yamux;name=go-yamux-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-yamux/v4"
+SRC_URI += "git://github.com/libp2p/go-yamux;name=go-yamux-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-yamux/v4"
 
 #       github.com/marten-seemann/tcp v0.0.0-20210406111302-dfbc87cc63fd
 # [1] git ls-remote https://github.com/marten-seemann/tcp dfbc87cc63fd003b9a070c76d605769fa3e2e3b2
 SRCREV_tcp="dfbc87cc63fd003b9a070c76d605769fa3e2e3b2"
-SRC_URI += "git://github.com/marten-seemann/tcp;name=tcp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/marten-seemann/tcp"
+SRC_URI += "git://github.com/marten-seemann/tcp;name=tcp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/marten-seemann/tcp"
 
 #       github.com/JeffAshton/win_pdh v0.0.0-20161109143554-76bb4ee9f0ab
 # [1] git ls-remote https://github.com/JeffAshton/win_pdh 76bb4ee9f0ab50f77826f2a2ee7fb9d3880d6ec2
 SRCREV_win_pdh="76bb4ee9f0ab50f77826f2a2ee7fb9d3880d6ec2"
-SRC_URI += "git://github.com/JeffAshton/win_pdh;name=win_pdh;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/JeffAshton/win_pdh"
+SRC_URI += "git://github.com/JeffAshton/win_pdh;name=win_pdh;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/JeffAshton/win_pdh"
 
 #       github.com/Microsoft/go-winio v0.6.1
 # [1] git ls-remote https://github.com/microsoft/go-winio 070c828abb873da9e71c7247740253b50f7cf049
 SRCREV_go-winio="070c828abb873da9e71c7247740253b50f7cf049"
-SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/go-winio"
+SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Microsoft/go-winio"
 
 #       github.com/containerd/cgroups v1.1.0
 # [1] git ls-remote https://github.com/containerd/cgroups fe7323f622bc222e72473679f12a9089aeeda177
 SRCREV_cgroups="fe7323f622bc222e72473679f12a9089aeeda177"
-SRC_URI += "git://github.com/containerd/cgroups;name=cgroups;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups"
+SRC_URI += "git://github.com/containerd/cgroups;name=cgroups;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/cgroups"
 
 #       github.com/containerd/console v1.0.3
 # [1] git ls-remote https://github.com/containerd/console b5cb846c9186d67bcae3ce3c324e47cd317d9527
 SRCREV_console="b5cb846c9186d67bcae3ce3c324e47cd317d9527"
-SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
+SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/console"
 
 #       github.com/containerd/go-runc v1.0.0
 # [1] git ls-remote https://github.com/containerd/go-runc 16b287bc67d069a60fa48db15f330b790b74365b
 SRCREV_go-runc="16b287bc67d069a60fa48db15f330b790b74365b"
-SRC_URI += "git://github.com/containerd/go-runc;name=go-runc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/go-runc"
+SRC_URI += "git://github.com/containerd/go-runc;name=go-runc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/go-runc"
 
 #       github.com/containerd/typeurl v1.0.2
 # [1] git ls-remote https://github.com/containerd/typeurl 5e43fb8b75ed2f2305fc04e6918c8d10636771bc
 SRCREV_typeurl="5e43fb8b75ed2f2305fc04e6918c8d10636771bc"
-SRC_URI += "git://github.com/containerd/typeurl;name=typeurl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl"
+SRC_URI += "git://github.com/containerd/typeurl;name=typeurl;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/typeurl"
 
 #       github.com/dustin/go-humanize v1.0.1
 # [1] git ls-remote https://github.com/dustin/go-humanize 9ec74ab2f7a7161664182fd4e5e292fccffbc75f
 SRCREV_go-humanize="9ec74ab2f7a7161664182fd4e5e292fccffbc75f"
-SRC_URI += "git://github.com/dustin/go-humanize;name=go-humanize;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/dustin/go-humanize"
+SRC_URI += "git://github.com/dustin/go-humanize;name=go-humanize;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/dustin/go-humanize"
 
 #       github.com/evanphx/json-patch v5.6.0+incompatible
 # [1] git ls-remote https://github.com/evanphx/json-patch 5561fe05a1ec79c9bca966376211b2ab81959671
 SRCREV_json-patch="5561fe05a1ec79c9bca966376211b2ab81959671"
-SRC_URI += "git://github.com/evanphx/json-patch;name=json-patch;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/evanphx/json-patch"
+SRC_URI += "git://github.com/evanphx/json-patch;name=json-patch;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/evanphx/json-patch"
 
 #       github.com/fvbommel/sortorder v1.1.0
 # [1] git ls-remote https://github.com/fvbommel/sortorder a8d9302c17f9f46c6580b82b919672e58ef6e396
 SRCREV_sortorder="a8d9302c17f9f46c6580b82b919672e58ef6e396"
-SRC_URI += "git://github.com/fvbommel/sortorder;name=sortorder;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fvbommel/sortorder"
+SRC_URI += "git://github.com/fvbommel/sortorder;name=sortorder;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fvbommel/sortorder"
 
 #       github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572
 # [1] git ls-remote https://github.com/go-task/slim-sprig 52ccab3ef572c7e1a2c258be183f9a9296d60152
 SRCREV_slim-sprig="52ccab3ef572c7e1a2c258be183f9a9296d60152"
-SRC_URI += "git://github.com/go-task/slim-sprig;name=slim-sprig;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-task/slim-sprig"
+SRC_URI += "git://github.com/go-task/slim-sprig;name=slim-sprig;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-task/slim-sprig"
 
 #       github.com/klauspost/cpuid/v2 v2.2.5
 # [1] git ls-remote https://github.com/klauspost/cpuid 1af2d99c24e60b21f4c8e8ea63ed69523ebbbb16
 SRCREV_cpuid-v2="1af2d99c24e60b21f4c8e8ea63ed69523ebbbb16"
-SRC_URI += "git://github.com/klauspost/cpuid;name=cpuid-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpuid/v2"
+SRC_URI += "git://github.com/klauspost/cpuid;name=cpuid-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/klauspost/cpuid/v2"
 
 #       github.com/kylelemons/godebug v1.1.0
 # [1] git ls-remote https://github.com/kylelemons/godebug 9ff306d4fbead574800b66369df5b6144732d58e
 SRCREV_godebug="9ff306d4fbead574800b66369df5b6144732d58e"
-SRC_URI += "git://github.com/kylelemons/godebug;name=godebug;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kylelemons/godebug"
+SRC_URI += "git://github.com/kylelemons/godebug;name=godebug;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/kylelemons/godebug"
 
 #       github.com/mdlayher/genetlink v1.3.2
 # [1] git ls-remote https://github.com/mdlayher/genetlink 7531bffe0f5e10d1ce558d35e6feb5d1d1600851
 SRCREV_genetlink="7531bffe0f5e10d1ce558d35e6feb5d1d1600851"
-SRC_URI += "git://github.com/mdlayher/genetlink;name=genetlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mdlayher/genetlink"
+SRC_URI += "git://github.com/mdlayher/genetlink;name=genetlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mdlayher/genetlink"
 
 #       github.com/moby/sys/mountinfo v0.6.2
 # [1] git ls-remote https://github.com/moby/sys 1bf36f7188c31f2797c556c4c4d7d9af7a6a965b
 SRCREV_mountinfo="1bf36f7188c31f2797c556c4c4d7d9af7a6a965b"
-SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mountinfo"
+SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/mountinfo"
 
 #       github.com/modern-go/reflect2 v1.0.2
 # [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc5231aea69b8861c540102b087070
 SRCREV_reflect2="2b33151c9bbc5231aea69b8861c540102b087070"
-SRC_URI += "git://github.com/modern-go/reflect2;name=reflect2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/reflect2"
+SRC_URI += "git://github.com/modern-go/reflect2;name=reflect2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/modern-go/reflect2"
 
 #       github.com/peterbourgon/diskv v2.0.1+incompatible
 # [1] git ls-remote https://github.com/peterbourgon/diskv 5f041e8faa004a95c88a202771f4cc3e991971e6
 SRCREV_diskv="5f041e8faa004a95c88a202771f4cc3e991971e6"
-SRC_URI += "git://github.com/peterbourgon/diskv;name=diskv;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/peterbourgon/diskv"
+SRC_URI += "git://github.com/peterbourgon/diskv;name=diskv;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/peterbourgon/diskv"
 
 #       github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2
 # [1] git ls-remote https://github.com/pmezard/go-difflib 5d4384ee4fb2527b0a1256a821ebfc92f91efefc
 SRCREV_go-difflib="5d4384ee4fb2527b0a1256a821ebfc92f91efefc"
-SRC_URI += "git://github.com/pmezard/go-difflib;name=go-difflib;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pmezard/go-difflib"
+SRC_URI += "git://github.com/pmezard/go-difflib;name=go-difflib;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pmezard/go-difflib"
 
 #       github.com/shengdoushi/base58 v1.0.0
 # [1] git ls-remote https://github.com/shengdoushi/base58 c5f44ca1af76fb63925d5fba8fa7b85870199839
 SRCREV_shengdoushi-base58="c5f44ca1af76fb63925d5fba8fa7b85870199839"
-SRC_URI += "git://github.com/shengdoushi/base58;name=shengdoushi-base58;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/shengdoushi/base58"
+SRC_URI += "git://github.com/shengdoushi/base58;name=shengdoushi-base58;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/shengdoushi/base58"
 
 #       github.com/stoewer/go-strcase v1.2.0
 # [1] git ls-remote https://github.com/stoewer/go-strcase 7962b205553802087345c0b4c74d57b65236f676
 SRCREV_go-strcase="7962b205553802087345c0b4c74d57b65236f676"
-SRC_URI += "git://github.com/stoewer/go-strcase;name=go-strcase;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stoewer/go-strcase"
+SRC_URI += "git://github.com/stoewer/go-strcase;name=go-strcase;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/stoewer/go-strcase"
 
 #       github.com/k3s-io/etcd/pkg/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_pkg-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=pkg-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/pkg/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=pkg-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/pkg/v3"
 
 #       github.com/erikdubbelboer/gspt v0.0.0-20190125194910-e68493906b83
 # [1] git ls-remote https://github.com/erikdubbelboer/gspt e68493906b8382891943ddc9960cb9c6ecd1a1f0
 SRCREV_gspt="e68493906b8382891943ddc9960cb9c6ecd1a1f0"
-SRC_URI += "git://github.com/erikdubbelboer/gspt;name=gspt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/erikdubbelboer/gspt"
+SRC_URI += "git://github.com/erikdubbelboer/gspt;name=gspt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/erikdubbelboer/gspt"
 
 #       github.com/go-sql-driver/mysql v1.7.1
 # [1] git ls-remote https://github.com/go-sql-driver/mysql f20b2863636093e5fbf1481b59bdaff3b0fbb779
 SRCREV_mysql="f20b2863636093e5fbf1481b59bdaff3b0fbb779"
-SRC_URI += "git://github.com/go-sql-driver/mysql;name=mysql;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-sql-driver/mysql"
+SRC_URI += "git://github.com/go-sql-driver/mysql;name=mysql;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-sql-driver/mysql"
 
 #       github.com/vishvananda/netlink v1.2.1-beta.2
 # [1] git ls-remote https://github.com/vishvananda/netlink 5e915e0149386ce3d02379ff93f4c0a5601779d5
 SRCREV_netlink="5e915e0149386ce3d02379ff93f4c0a5601779d5"
-SRC_URI += "git://github.com/vishvananda/netlink;name=netlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netlink"
+SRC_URI += "git://github.com/vishvananda/netlink;name=netlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vishvananda/netlink"
 
 #       github.com/libp2p/go-cidranger v1.1.0
 # [1] git ls-remote https://github.com/libp2p/go-cidranger 1dec7f87b45b32e24d3f59548ad61647de34586d
 SRCREV_go-cidranger="1dec7f87b45b32e24d3f59548ad61647de34586d"
-SRC_URI += "git://github.com/libp2p/go-cidranger;name=go-cidranger;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-cidranger"
+SRC_URI += "git://github.com/libp2p/go-cidranger;name=go-cidranger;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-cidranger"
 
 #       github.com/libp2p/go-reuseport v0.4.0
 # [1] git ls-remote https://github.com/libp2p/go-reuseport ac34b4fb35437abcc176b5bb97cc431d62d983e0
 SRCREV_go-reuseport="ac34b4fb35437abcc176b5bb97cc431d62d983e0"
-SRC_URI += "git://github.com/libp2p/go-reuseport;name=go-reuseport;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-reuseport"
+SRC_URI += "git://github.com/libp2p/go-reuseport;name=go-reuseport;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-reuseport"
 
 #       github.com/quic-go/qtls-go1-20 v0.3.3
 # [1] git ls-remote https://github.com/quic-go/qtls-go1-20 5ba42598e0a018acd682059ee240c6bb8d085b07
 SRCREV_qtls-go1-20="5ba42598e0a018acd682059ee240c6bb8d085b07"
-SRC_URI += "git://github.com/quic-go/qtls-go1-20;name=qtls-go1-20;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/quic-go/qtls-go1-20"
+SRC_URI += "git://github.com/quic-go/qtls-go1-20;name=qtls-go1-20;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/quic-go/qtls-go1-20"
 
 #       github.com/MakeNowJust/heredoc v1.0.0
 # [1] git ls-remote https://github.com/makenowjust/heredoc bbd9af33722b79a933ef99c7c94833065e2d6c20
 SRCREV_heredoc="bbd9af33722b79a933ef99c7c94833065e2d6c20"
-SRC_URI += "git://github.com/makenowjust/heredoc;name=heredoc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/MakeNowJust/heredoc"
+SRC_URI += "git://github.com/makenowjust/heredoc;name=heredoc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/MakeNowJust/heredoc"
 
 #       github.com/NYTimes/gziphandler v1.1.1
 # [1] git ls-remote https://github.com/nytimes/gziphandler dd0439581c7657cb652dfe5c71d7d48baf39541d
 SRCREV_gziphandler="dd0439581c7657cb652dfe5c71d7d48baf39541d"
-SRC_URI += "git://github.com/nytimes/gziphandler;name=gziphandler;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/NYTimes/gziphandler"
+SRC_URI += "git://github.com/nytimes/gziphandler;name=gziphandler;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/NYTimes/gziphandler"
 
 #       github.com/canonical/go-dqlite v1.5.1
 # [1] git ls-remote https://github.com/canonical/go-dqlite 830c1a017995b73322e86c2a6f2ca799c1caca07
 SRCREV_go-dqlite="830c1a017995b73322e86c2a6f2ca799c1caca07"
-SRC_URI += "git://github.com/canonical/go-dqlite;name=go-dqlite;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/canonical/go-dqlite"
+SRC_URI += "git://github.com/canonical/go-dqlite;name=go-dqlite;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/canonical/go-dqlite"
 
 #       github.com/cenkalti/backoff/v4 v4.2.1
 # [1] git ls-remote https://github.com/cenkalti/backoff a04a6fe64ffb0e3fd0816460529d300be5f252df
 SRCREV_backoff-v4="a04a6fe64ffb0e3fd0816460529d300be5f252df"
-SRC_URI += "git://github.com/cenkalti/backoff;name=backoff-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cenkalti/backoff/v4"
+SRC_URI += "git://github.com/cenkalti/backoff;name=backoff-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cenkalti/backoff/v4"
 
 #       github.com/chai2010/gettext-go v1.0.2
 # [1] git ls-remote https://github.com/chai2010/gettext-go 274d1753d015d0362761b6a1cc2a572e6a035913
 SRCREV_gettext-go="274d1753d015d0362761b6a1cc2a572e6a035913"
-SRC_URI += "git://github.com/chai2010/gettext-go;name=gettext-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/chai2010/gettext-go"
+SRC_URI += "git://github.com/chai2010/gettext-go;name=gettext-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/chai2010/gettext-go"
 
 #       github.com/containerd/btrfs/v2 v2.0.0
 # [1] git ls-remote https://github.com/containerd/btrfs f611cf12b33f43269574b2ad82bcb55e4d6f9982
 SRCREV_btrfs-v2="f611cf12b33f43269574b2ad82bcb55e4d6f9982"
-SRC_URI += "git://github.com/containerd/btrfs;name=btrfs-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/btrfs/v2"
+SRC_URI += "git://github.com/containerd/btrfs;name=btrfs-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/btrfs/v2"
 
 #       github.com/containerd/imgcrypt v1.1.7
 # [1] git ls-remote https://github.com/containerd/imgcrypt 01a05dffff35aadeb0a3008016ed745e7ff6beda
 SRCREV_imgcrypt="01a05dffff35aadeb0a3008016ed745e7ff6beda"
-SRC_URI += "git://github.com/containerd/imgcrypt;name=imgcrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/imgcrypt"
+SRC_URI += "git://github.com/containerd/imgcrypt;name=imgcrypt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/imgcrypt"
 
 #       github.com/containers/ocicrypt v1.1.6
 # [1] git ls-remote https://github.com/containers/ocicrypt c61dfa5ee6c2ac10004c4e156d1a435f11c444cf
 SRCREV_ocicrypt="c61dfa5ee6c2ac10004c4e156d1a435f11c444cf"
-SRC_URI += "git://github.com/containers/ocicrypt;name=ocicrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containers/ocicrypt"
+SRC_URI += "git://github.com/containers/ocicrypt;name=ocicrypt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containers/ocicrypt"
 
 #       github.com/docker/distribution v2.8.2+incompatible
 # [1] git ls-remote https://github.com/distribution/distribution 7c354a4b40feeea21d7eeae4de91c8ff7951e672
 SRCREV_distribution="7c354a4b40feeea21d7eeae4de91c8ff7951e672"
-SRC_URI += "git://github.com/distribution/distribution;name=distribution;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/distribution"
+SRC_URI += "git://github.com/distribution/distribution;name=distribution;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/distribution"
 
 #       github.com/emicklei/go-restful v2.16.0+incompatible
 # [1] git ls-remote https://github.com/emicklei/go-restful ac666c045e035603f2704c98c59e979fccbfa94f
 SRCREV_go-restful="ac666c045e035603f2704c98c59e979fccbfa94f"
-SRC_URI += "git://github.com/emicklei/go-restful;name=go-restful;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/emicklei/go-restful"
+SRC_URI += "git://github.com/emicklei/go-restful;name=go-restful;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/emicklei/go-restful"
 
 #       github.com/gregjones/httpcache v0.0.0-20180305231024-9cad4c3443a7
 # [1] git ls-remote https://github.com/gregjones/httpcache 9cad4c3443a7200dd6400aef47183728de563a38
 SRCREV_httpcache="9cad4c3443a7200dd6400aef47183728de563a38"
-SRC_URI += "git://github.com/gregjones/httpcache;name=httpcache;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gregjones/httpcache"
+SRC_URI += "git://github.com/gregjones/httpcache;name=httpcache;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gregjones/httpcache"
 
 #       github.com/jackc/pgservicefile v0.0.0-20221227161230-091c0ba34f0a
 # [1] git ls-remote https://github.com/jackc/pgservicefile 091c0ba34f0a65a78ab8d0e313fde0695c0f7186
 SRCREV_pgservicefile="091c0ba34f0a65a78ab8d0e313fde0695c0f7186"
-SRC_URI += "git://github.com/jackc/pgservicefile;name=pgservicefile;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jackc/pgservicefile"
+SRC_URI += "git://github.com/jackc/pgservicefile;name=pgservicefile;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jackc/pgservicefile"
 
 #       github.com/jonboulle/clockwork v0.4.0
 # [1] git ls-remote https://github.com/jonboulle/clockwork 606c48b92358fcca153952b56fb0d14d6845f84a
 SRCREV_clockwork="606c48b92358fcca153952b56fb0d14d6845f84a"
-SRC_URI += "git://github.com/jonboulle/clockwork;name=clockwork;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jonboulle/clockwork"
+SRC_URI += "git://github.com/jonboulle/clockwork;name=clockwork;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jonboulle/clockwork"
 
 #       github.com/mistifyio/go-zfs/v3 v3.0.1
 # [1] git ls-remote https://github.com/mistifyio/go-zfs f6d5c373cf63ae2477370aa9bda9fa49804c2d72
 SRCREV_go-zfs-v3="f6d5c373cf63ae2477370aa9bda9fa49804c2d72"
-SRC_URI += "git://github.com/mistifyio/go-zfs;name=go-zfs-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mistifyio/go-zfs/v3"
+SRC_URI += "git://github.com/mistifyio/go-zfs;name=go-zfs-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mistifyio/go-zfs/v3"
 
 #       github.com/moby/sys/sequential v0.5.0
 # [1] git ls-remote https://github.com/moby/sys b22ba8a69b306f0b4adbbe2a529457e6283ed9f7
 SRCREV_sequential="b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
-SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequential"
+SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/sequential"
 
 #       github.com/syndtr/gocapability v0.0.0-20200815063812-42c35b437635
 # [1] git ls-remote https://github.com/syndtr/gocapability 42c35b4376354fd554efc7ad35e0b7f94e3a0ffb
 SRCREV_gocapability="42c35b4376354fd554efc7ad35e0b7f94e3a0ffb"
-SRC_URI += "git://github.com/syndtr/gocapability;name=gocapability;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/syndtr/gocapability"
+SRC_URI += "git://github.com/syndtr/gocapability;name=gocapability;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/syndtr/gocapability"
 
 #       github.com/k3s-io/etcd/raft/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_raft-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=raft-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/raft/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=raft-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/raft/v3"
 
 #       go.opentelemetry.io/otel/trace v1.13.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go f2fd476f433128c2494476950ce11600a51bbe35
 SRCREV_trace="f2fd476f433128c2494476950ce11600a51bbe35"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/trace"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/trace"
 
 #       go.opentelemetry.io/proto/otlp v0.19.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-proto-go c98f6b5f7362c9b4a717c7a4dab1ba90796a8f21
 SRCREV_otlp="c98f6b5f7362c9b4a717c7a4dab1ba90796a8f21"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-proto-go;name=otlp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/proto/otlp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-proto-go;name=otlp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/proto/otlp"
 
 #       github.com/natefinch/lumberjack v2.0.0+incompatible
 # [1] git ls-remote https://github.com/natefinch/lumberjack 7d6a1875575e09256dc552b4c0e450dcd02bd10e
 SRCREV_lumberjack="7d6a1875575e09256dc552b4c0e450dcd02bd10e"
-SRC_URI += "git://github.com/natefinch/lumberjack;name=lumberjack;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/natefinch/lumberjack"
+SRC_URI += "git://github.com/natefinch/lumberjack;name=lumberjack;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/natefinch/lumberjack"
 
 #       github.com/rancher/remotedialer v0.3.0
 # [1] git ls-remote https://github.com/rancher/remotedialer 24498689a9ccec9adbdbadbe3f5d18df75ba133b
 SRCREV_remotedialer="24498689a9ccec9adbdbadbe3f5d18df75ba133b"
-SRC_URI += "git://github.com/rancher/remotedialer;name=remotedialer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rancher/remotedialer"
+SRC_URI += "git://github.com/rancher/remotedialer;name=remotedialer;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rancher/remotedialer"
 
 #       github.com/davidlazar/go-crypto v0.0.0-20200604182044-b73af7476f6c
 # [1] git ls-remote https://github.com/davidlazar/go-crypto b73af7476f6c55b31aa2797d1f98afc94699548d
 SRCREV_go-crypto="b73af7476f6c55b31aa2797d1f98afc94699548d"
-SRC_URI += "git://github.com/davidlazar/go-crypto;name=go-crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/davidlazar/go-crypto"
+SRC_URI += "git://github.com/davidlazar/go-crypto;name=go-crypto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/davidlazar/go-crypto"
 
 #       github.com/hashicorp/golang-lru v0.5.4
 # [1] git ls-remote https://github.com/hashicorp/golang-lru 14eae340515388ca95aa8e7b86f0de668e981f54
 SRCREV_golang-lru="14eae340515388ca95aa8e7b86f0de668e981f54"
-SRC_URI += "git://github.com/hashicorp/golang-lru;name=golang-lru;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/golang-lru"
+SRC_URI += "git://github.com/hashicorp/golang-lru;name=golang-lru;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/golang-lru"
 
 #       github.com/pelletier/go-toml/v2 v2.1.1
 # [1] git ls-remote https://github.com/pelletier/go-toml 34765b4a9e937ab927b5bd57231e98c68fe13109
 SRCREV_go-toml-v2="34765b4a9e937ab927b5bd57231e98c68fe13109"
-SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml/v2"
+SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pelletier/go-toml/v2"
 
 #       github.com/slok/go-http-metrics v0.10.0
 # [1] git ls-remote https://github.com/slok/go-http-metrics 9382ededffcb5ecf9f7041bfb779ddc1fc9c08dc
 SRCREV_go-http-metrics="9382ededffcb5ecf9f7041bfb779ddc1fc9c08dc"
-SRC_URI += "git://github.com/slok/go-http-metrics;name=go-http-metrics;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/slok/go-http-metrics"
+SRC_URI += "git://github.com/slok/go-http-metrics;name=go-http-metrics;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/slok/go-http-metrics"
 
 #       github.com/xenitab/pkg/channels v0.0.2
 # [1] git ls-remote https://github.com/xenitab/pkg 94c2ab1cbf9c7aff34ed28237765cefd6d409f34
 SRCREV_channels="94c2ab1cbf9c7aff34ed28237765cefd6d409f34"
-SRC_URI += "git://github.com/xenitab/pkg;name=channels;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xenitab/pkg/channels"
+SRC_URI += "git://github.com/xenitab/pkg;name=channels;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xenitab/pkg/channels"
 
 #       github.com/euank/go-kmsg-parser v2.0.0+incompatible
 # [1] git ls-remote https://github.com/euank/go-kmsg-parser 5ba4d492e455a77d25dcf0d2c4acc9f2afebef4e
 SRCREV_go-kmsg-parser="5ba4d492e455a77d25dcf0d2c4acc9f2afebef4e"
-SRC_URI += "git://github.com/euank/go-kmsg-parser;name=go-kmsg-parser;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/euank/go-kmsg-parser"
+SRC_URI += "git://github.com/euank/go-kmsg-parser;name=go-kmsg-parser;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/euank/go-kmsg-parser"
 
 #       github.com/exponent-io/jsonpath v0.0.0-20151013193312-d6023ce2651d
 # [1] git ls-remote https://github.com/exponent-io/jsonpath d6023ce2651d8eafb5c75bb0c7167536102ec9f5
 SRCREV_jsonpath="d6023ce2651d8eafb5c75bb0c7167536102ec9f5"
-SRC_URI += "git://github.com/exponent-io/jsonpath;name=jsonpath;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/exponent-io/jsonpath"
+SRC_URI += "git://github.com/exponent-io/jsonpath;name=jsonpath;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/exponent-io/jsonpath"
 
 #       github.com/googleapis/gax-go/v2 v2.12.0
 # [1] git ls-remote https://github.com/googleapis/gax-go db3387b70e605dfc1f09513359d396496a91c66b
 SRCREV_gax-go-v2="db3387b70e605dfc1f09513359d396496a91c66b"
-SRC_URI += "git://github.com/googleapis/gax-go;name=gax-go-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/googleapis/gax-go/v2"
+SRC_URI += "git://github.com/googleapis/gax-go;name=gax-go-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/googleapis/gax-go/v2"
 
 #       github.com/hashicorp/go-version v1.6.0
 # [1] git ls-remote https://github.com/hashicorp/go-version 78d058c5618891f74d604bd15356fca690b64d8a
 SRCREV_go-version="78d058c5618891f74d604bd15356fca690b64d8a"
-SRC_URI += "git://github.com/hashicorp/go-version;name=go-version;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-version"
+SRC_URI += "git://github.com/hashicorp/go-version;name=go-version;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-version"
 
 #       github.com/mitchellh/go-homedir v1.1.0
 # [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf3004701891bf4fdb884bfe4920b3727
 SRCREV_go-homedir="af06845cf3004701891bf4fdb884bfe4920b3727"
-SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-homedir"
+SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/go-homedir"
 
 #       github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
 # [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94
 SRCREV_concurrent="bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
-SRC_URI += "git://github.com/modern-go/concurrent;name=concurrent;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/modern-go/concurrent"
+SRC_URI += "git://github.com/modern-go/concurrent;name=concurrent;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/modern-go/concurrent"
 
 #       github.com/pquerna/cachecontrol v0.1.0
 # [1] git ls-remote https://github.com/pquerna/cachecontrol fb00f8a766ae43bf209f50299ce7d69669416dfb
 SRCREV_cachecontrol="fb00f8a766ae43bf209f50299ce7d69669416dfb"
-SRC_URI += "git://github.com/pquerna/cachecontrol;name=cachecontrol;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pquerna/cachecontrol"
+SRC_URI += "git://github.com/pquerna/cachecontrol;name=cachecontrol;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pquerna/cachecontrol"
 
 #       github.com/tchap/go-patricia/v2 v2.3.1
 # [1] git ls-remote https://github.com/tchap/go-patricia 5fc88dd7937ad82ca516f7f1f6b2c06dd0180309
 SRCREV_go-patricia-v2="5fc88dd7937ad82ca516f7f1f6b2c06dd0180309"
-SRC_URI += "git://github.com/tchap/go-patricia;name=go-patricia-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tchap/go-patricia/v2"
+SRC_URI += "git://github.com/tchap/go-patricia;name=go-patricia-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tchap/go-patricia/v2"
 
 #       go.opentelemetry.io/otel/metric v0.32.1
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go d7bfe6675fe79b0c01cae3d4c5f06330b2fece73
 SRCREV_metric="d7bfe6675fe79b0c01cae3d4c5f06330b2fece73"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=metric;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/metric"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=metric;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/metric"
 
 #       github.com/k3s-io/kube-router/v2 v2.0.1
 # [1] git ls-remote https://github.com/k3s-io/kube-router 6842973d656f0bf1562858d278ea5d1f06a16f56
 SRCREV_v2="6842973d656f0bf1562858d278ea5d1f06a16f56"
-SRC_URI += "git://github.com/k3s-io/kube-router;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kube-router/v2"
+SRC_URI += "git://github.com/k3s-io/kube-router;name=v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kube-router/v2"
 
 #       github.com/containerd/cgroups/v3 v3.0.2
 # [1] git ls-remote https://github.com/containerd/cgroups 8fa64246e17ceea54277b3ad7139d9ec17545bfa
 SRCREV_v3="8fa64246e17ceea54277b3ad7139d9ec17545bfa"
-SRC_URI += "git://github.com/containerd/cgroups;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups/v3"
+SRC_URI += "git://github.com/containerd/cgroups;name=v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/cgroups/v3"
 
 #       github.com/go-bindata/go-bindata v3.1.2+incompatible
 # [1] git ls-remote https://github.com/go-bindata/go-bindata ff7109080027ec152dabb369e157c4f359b76f31
 SRCREV_go-bindata="ff7109080027ec152dabb369e157c4f359b76f31"
-SRC_URI += "git://github.com/go-bindata/go-bindata;name=go-bindata;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-bindata/go-bindata"
+SRC_URI += "git://github.com/go-bindata/go-bindata;name=go-bindata;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-bindata/go-bindata"
 
 #       github.com/k3s-io/etcd/client/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_client-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=client-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/client/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=client-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/client/v3"
 
 #       github.com/k3s-io/etcd/server/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_server-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=server-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/server/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=server-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/server/v3"
 
 #       github.com/go-playground/locales v0.14.1
 # [1] git ls-remote https://github.com/go-playground/locales ce315c8672599942003599943a1e64288f55b03f
 SRCREV_locales="ce315c8672599942003599943a1e64288f55b03f"
-SRC_URI += "git://github.com/go-playground/locales;name=locales;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-playground/locales"
+SRC_URI += "git://github.com/go-playground/locales;name=locales;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-playground/locales"
 
 #       github.com/libp2p/go-buffer-pool v0.1.0
 # [1] git ls-remote https://github.com/libp2p/go-buffer-pool c5070857211a0615ebd7b56588154941af580a4d
 SRCREV_go-buffer-pool="c5070857211a0615ebd7b56588154941af580a4d"
-SRC_URI += "git://github.com/libp2p/go-buffer-pool;name=go-buffer-pool;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-buffer-pool"
+SRC_URI += "git://github.com/libp2p/go-buffer-pool;name=go-buffer-pool;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-buffer-pool"
 
 #       github.com/containerd/continuity v0.4.2
 # [1] git ls-remote https://github.com/containerd/continuity 77a2d47a6668b82465fdf6cb749fe3a2aa2c9743
 SRCREV_continuity="77a2d47a6668b82465fdf6cb749fe3a2aa2c9743"
-SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/continuity"
+SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/continuity"
 
 #       github.com/containerd/typeurl/v2 v2.1.1
 # [1] git ls-remote https://github.com/containerd/typeurl 7ef6316b771f959cbb208b229e3423a466947df3
 SRCREV_typeurl-v2="7ef6316b771f959cbb208b229e3423a466947df3"
-SRC_URI += "git://github.com/containerd/typeurl;name=typeurl-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl/v2"
+SRC_URI += "git://github.com/containerd/typeurl;name=typeurl-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/typeurl/v2"
 
 #       github.com/coreos/go-systemd/v22 v22.5.0
 # [1] git ls-remote https://github.com/coreos/go-systemd d5623bf85e8e73ae6352f78ee6b55a287619dd4e
 SRCREV_v22="d5623bf85e8e73ae6352f78ee6b55a287619dd4e"
-SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd/v22"
+SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-systemd/v22"
 
 #       github.com/cpuguy83/go-md2man/v2 v2.0.3
 # [1] git ls-remote https://github.com/cpuguy83/go-md2man f67b5f6400a3ea2156517041a329ae5f5935395c
 SRCREV_go-md2man-v2="f67b5f6400a3ea2156517041a329ae5f5935395c"
-SRC_URI += "git://github.com/cpuguy83/go-md2man;name=go-md2man-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cpuguy83/go-md2man/v2"
+SRC_URI += "git://github.com/cpuguy83/go-md2man;name=go-md2man-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cpuguy83/go-md2man/v2"
 
 #       github.com/docker/go-connections v0.5.0
 # [1] git ls-remote https://github.com/docker/go-connections fa09c952e3eadbffaf8afc5b8a1667158ba38ace
 SRCREV_go-connections="fa09c952e3eadbffaf8afc5b8a1667158ba38ace"
-SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-connections"
+SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-connections"
 
 #       github.com/google/gnostic-models v0.6.9-0.20230804172637-c7be7c783f49
 # [1] git ls-remote https://github.com/google/gnostic-models c7be7c783f49e86348a1081eb387e01a347a4f23
 SRCREV_gnostic-models="c7be7c783f49e86348a1081eb387e01a347a4f23"
-SRC_URI += "git://github.com/google/gnostic-models;name=gnostic-models;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/gnostic-models"
+SRC_URI += "git://github.com/google/gnostic-models;name=gnostic-models;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/gnostic-models"
 
 #       github.com/mitchellh/go-wordwrap v1.0.1
 # [1] git ls-remote https://github.com/mitchellh/go-wordwrap ecf0936a077a4bd73a1cc2ac5c370f2b55618d62
 SRCREV_go-wordwrap="ecf0936a077a4bd73a1cc2ac5c370f2b55618d62"
-SRC_URI += "git://github.com/mitchellh/go-wordwrap;name=go-wordwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-wordwrap"
+SRC_URI += "git://github.com/mitchellh/go-wordwrap;name=go-wordwrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/go-wordwrap"
 
 #       github.com/k3s-io/etcd/client/v2 v2.305.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_client-v2="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=client-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/client/v2"
+SRC_URI += "git://github.com/k3s-io/etcd;name=client-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/client/v2"
 
 #       gopkg.in/natefinch/lumberjack.v2 v2.2.1
 # [1] git ls-remote https://github.com/natefinch/lumberjack 4cb27fcfbb0f35cb48c542c5ea80b7c1d18933d0
 SRCREV_lumberjack.v2="4cb27fcfbb0f35cb48c542c5ea80b7c1d18933d0"
-SRC_URI += "git://github.com/natefinch/lumberjack;name=lumberjack.v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/natefinch/lumberjack.v2"
+SRC_URI += "git://github.com/natefinch/lumberjack;name=lumberjack.v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/natefinch/lumberjack.v2"
 
 #       github.com/k3s-io/helm-controller v0.15.8
 # [1] git ls-remote https://github.com/k3s-io/helm-controller 6479edd3c7f919dd9cc65a88aca75390f391eb4f
 SRCREV_helm-controller="6479edd3c7f919dd9cc65a88aca75390f391eb4f"
-SRC_URI += "git://github.com/k3s-io/helm-controller;name=helm-controller;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/helm-controller"
+SRC_URI += "git://github.com/k3s-io/helm-controller;name=helm-controller;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/helm-controller"
 
 #       github.com/mwitkow/go-http-dialer v0.0.0-20161116154839-378f744fb2b8
 # [1] git ls-remote https://github.com/mwitkow/go-http-dialer 378f744fb2b81a6b96e3f40cde4f3bcab5a9cff0
 SRCREV_go-http-dialer="378f744fb2b81a6b96e3f40cde4f3bcab5a9cff0"
-SRC_URI += "git://github.com/mwitkow/go-http-dialer;name=go-http-dialer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mwitkow/go-http-dialer"
+SRC_URI += "git://github.com/mwitkow/go-http-dialer;name=go-http-dialer;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mwitkow/go-http-dialer"
 
 #       github.com/opencontainers/selinux v1.10.1
 # [1] git ls-remote https://github.com/opencontainers/selinux 84e248a28e776216cd33a51fdea90a20fe308136
 SRCREV_selinux="84e248a28e776216cd33a51fdea90a20fe308136"
-SRC_URI += "git://github.com/opencontainers/selinux;name=selinux;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/selinux"
+SRC_URI += "git://github.com/opencontainers/selinux;name=selinux;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/selinux"
 
 #       github.com/k3s-io/etcd/etcdutl/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_etcdutl-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=etcdutl-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/etcdutl/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=etcdutl-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/etcdutl/v3"
 
 #       github.com/libp2p/go-flow-metrics v0.1.0
 # [1] git ls-remote https://github.com/libp2p/go-flow-metrics 3f13d05958e2d1be0245aed1bdb38f9ff1b4efdc
 SRCREV_go-flow-metrics="3f13d05958e2d1be0245aed1bdb38f9ff1b4efdc"
-SRC_URI += "git://github.com/libp2p/go-flow-metrics;name=go-flow-metrics;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-flow-metrics"
+SRC_URI += "git://github.com/libp2p/go-flow-metrics;name=go-flow-metrics;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-flow-metrics"
 
 #       github.com/multiformats/go-base32 v0.1.0
 # [1] git ls-remote https://github.com/multiformats/go-base32 a16b66327f327428b32b919939b8c93482507e1f
 SRCREV_go-base32="a16b66327f327428b32b919939b8c93482507e1f"
-SRC_URI += "git://github.com/multiformats/go-base32;name=go-base32;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-base32"
+SRC_URI += "git://github.com/multiformats/go-base32;name=go-base32;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-base32"
 
 #       github.com/multiformats/go-base36 v0.2.0
 # [1] git ls-remote https://github.com/multiformats/go-base36 da52c98bb97cfaa321be04030bc97dcee7de63ff
 SRCREV_go-base36="da52c98bb97cfaa321be04030bc97dcee7de63ff"
-SRC_URI += "git://github.com/multiformats/go-base36;name=go-base36;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-base36"
+SRC_URI += "git://github.com/multiformats/go-base36;name=go-base36;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-base36"
 
 #       github.com/multiformats/go-varint v0.0.7
 # [1] git ls-remote https://github.com/multiformats/go-varint 8c8129accb08fc978bb276c81d568c41eafdd48f
 SRCREV_go-varint="8c8129accb08fc978bb276c81d568c41eafdd48f"
-SRC_URI += "git://github.com/multiformats/go-varint;name=go-varint;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-varint"
+SRC_URI += "git://github.com/multiformats/go-varint;name=go-varint;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-varint"
 
 #       github.com/Azure/azure-sdk-for-go v68.0.0+incompatible
 # [1] git ls-remote https://github.com/Azure/azure-sdk-for-go 2187aca40bbf6931ffac666977e5d29128d82585
 SRCREV_azure-sdk-for-go="2187aca40bbf6931ffac666977e5d29128d82585"
-SRC_URI += "git://github.com/Azure/azure-sdk-for-go;name=azure-sdk-for-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/azure-sdk-for-go"
+SRC_URI += "git://github.com/Azure/azure-sdk-for-go;name=azure-sdk-for-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/azure-sdk-for-go"
 
 #       github.com/asaskevich/govalidator v0.0.0-20190424111038-f61b66f89f4a
 # [1] git ls-remote https://github.com/asaskevich/govalidator f61b66f89f4a311bef65f13e575bcf1a2ffadda6
 SRCREV_govalidator="f61b66f89f4a311bef65f13e575bcf1a2ffadda6"
-SRC_URI += "git://github.com/asaskevich/govalidator;name=govalidator;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/asaskevich/govalidator"
+SRC_URI += "git://github.com/asaskevich/govalidator;name=govalidator;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/asaskevich/govalidator"
 
 #       github.com/emicklei/go-restful/v3 v3.9.0
 # [1] git ls-remote https://github.com/emicklei/go-restful ce871fa2f7069b65c784c9c708da1f00b1f2bd66
 SRCREV_go-restful-v3="ce871fa2f7069b65c784c9c708da1f00b1f2bd66"
-SRC_URI += "git://github.com/emicklei/go-restful;name=go-restful-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/emicklei/go-restful/v3"
+SRC_URI += "git://github.com/emicklei/go-restful;name=go-restful-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/emicklei/go-restful/v3"
 
 #       github.com/go-openapi/jsonpointer v0.20.0
 # [1] git ls-remote https://github.com/go-openapi/jsonpointer 7df7a464d60e04018cf8f616a7abda94907fdf63
 SRCREV_jsonpointer="7df7a464d60e04018cf8f616a7abda94907fdf63"
-SRC_URI += "git://github.com/go-openapi/jsonpointer;name=jsonpointer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/jsonpointer"
+SRC_URI += "git://github.com/go-openapi/jsonpointer;name=jsonpointer;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-openapi/jsonpointer"
 
 #       github.com/hashicorp/go-cleanhttp v0.5.2
 # [1] git ls-remote https://github.com/hashicorp/go-cleanhttp 6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2
 SRCREV_go-cleanhttp="6d9e2ac5d828e5f8594b97f88c4bde14a67bb6d2"
-SRC_URI += "git://github.com/hashicorp/go-cleanhttp;name=go-cleanhttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-cleanhttp"
+SRC_URI += "git://github.com/hashicorp/go-cleanhttp;name=go-cleanhttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-cleanhttp"
 
 #       github.com/nats-io/nats-server/v2 v2.10.5
 # [1] git ls-remote https://github.com/nats-io/nats-server 0883d32bbcc5619603a9e5344d15aa10d069f059
 SRCREV_nats-server-v2="0883d32bbcc5619603a9e5344d15aa10d069f059"
-SRC_URI += "git://github.com/nats-io/nats-server;name=nats-server-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/nats-io/nats-server/v2"
+SRC_URI += "git://github.com/nats-io/nats-server;name=nats-server-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/nats-io/nats-server/v2"
 
 #       golang.zx2c4.com/wireguard/wgctrl v0.0.0-20230429144221-925a1e7659e6
 # [1] git ls-remote https://github.com/WireGuard/wgctrl-go 925a1e7659e675c94c1a659d39daa9141e450c7d
 SRCREV_wgctrl="925a1e7659e675c94c1a659d39daa9141e450c7d"
-SRC_URI += "git://github.com/WireGuard/wgctrl-go;name=wgctrl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.zx2c4.com/wireguard/wgctrl"
+SRC_URI += "git://github.com/WireGuard/wgctrl-go;name=wgctrl;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.zx2c4.com/wireguard/wgctrl"
 
 #       github.com/rancher/dynamiclistener v0.3.6
 # [1] git ls-remote https://github.com/rancher/dynamiclistener 0a2d8dff62fde6dfaf009141c12b30c316d8cff3
 SRCREV_dynamiclistener="0a2d8dff62fde6dfaf009141c12b30c316d8cff3"
-SRC_URI += "git://github.com/rancher/dynamiclistener;name=dynamiclistener;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rancher/dynamiclistener"
+SRC_URI += "git://github.com/rancher/dynamiclistener;name=dynamiclistener;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rancher/dynamiclistener"
 
 #       github.com/gabriel-vasile/mimetype v1.4.2
 # [1] git ls-remote https://github.com/gabriel-vasile/mimetype 6f575b3e3509415374009db9cb81d6eae1fdfefb
 SRCREV_mimetype="6f575b3e3509415374009db9cb81d6eae1fdfefb"
-SRC_URI += "git://github.com/gabriel-vasile/mimetype;name=mimetype;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gabriel-vasile/mimetype"
+SRC_URI += "git://github.com/gabriel-vasile/mimetype;name=mimetype;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gabriel-vasile/mimetype"
 
 #       github.com/hashicorp/golang-lru/v2 v2.0.5
 # [1] git ls-remote https://github.com/hashicorp/golang-lru 99d7b177d1c3f01ae145e824fe627961e76edb8b
 SRCREV_golang-lru-v2="99d7b177d1c3f01ae145e824fe627961e76edb8b"
-SRC_URI += "git://github.com/hashicorp/golang-lru;name=golang-lru-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/golang-lru/v2"
+SRC_URI += "git://github.com/hashicorp/golang-lru;name=golang-lru-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/golang-lru/v2"
 
 #       github.com/libp2p/go-libp2p-record v0.2.0
 # [1] git ls-remote https://github.com/libp2p/go-libp2p-record 90bb9b0e21ffe5e9a5f1af1c1e8cc6d9a0fce24c
 SRCREV_go-libp2p-record="90bb9b0e21ffe5e9a5f1af1c1e8cc6d9a0fce24c"
-SRC_URI += "git://github.com/libp2p/go-libp2p-record;name=go-libp2p-record;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-libp2p-record"
+SRC_URI += "git://github.com/libp2p/go-libp2p-record;name=go-libp2p-record;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-libp2p-record"
 
 #       github.com/quic-go/webtransport-go v0.5.3
 # [1] git ls-remote https://github.com/quic-go/webtransport-go 16472ffb325d4869a24326e509abf359a8309775
 SRCREV_webtransport-go="16472ffb325d4869a24326e509abf359a8309775"
-SRC_URI += "git://github.com/quic-go/webtransport-go;name=webtransport-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/quic-go/webtransport-go"
+SRC_URI += "git://github.com/quic-go/webtransport-go;name=webtransport-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/quic-go/webtransport-go"
 
 #       github.com/containernetworking/cni v1.1.2
 # [1] git ls-remote https://github.com/containernetworking/cni 3363d143688bb83ca18489ac8b9dc204c1d49c4a
 SRCREV_cni="3363d143688bb83ca18489ac8b9dc204c1d49c4a"
-SRC_URI += "git://github.com/containernetworking/cni;name=cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/cni"
+SRC_URI += "git://github.com/containernetworking/cni;name=cni;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containernetworking/cni"
 
 #       github.com/hashicorp/go-multierror v1.1.1
 # [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0
 SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
-SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
+SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-multierror"
 
 #       github.com/prometheus/client_model v0.5.0
 # [1] git ls-remote https://github.com/prometheus/client_model 1c92cadf7d8fa1726bae12e6025cca9b86d2ba5f
 SRCREV_client_model="1c92cadf7d8fa1726bae12e6025cca9b86d2ba5f"
-SRC_URI += "git://github.com/prometheus/client_model;name=client_model;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_model"
+SRC_URI += "git://github.com/prometheus/client_model;name=client_model;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/client_model"
 
 #       github.com/russross/blackfriday/v2 v2.1.0
 # [1] git ls-remote https://github.com/russross/blackfriday 4c9bf9512682b995722660a4196c0013228e2049
 SRCREV_blackfriday-v2="4c9bf9512682b995722660a4196c0013228e2049"
-SRC_URI += "git://github.com/russross/blackfriday;name=blackfriday-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/russross/blackfriday/v2"
+SRC_URI += "git://github.com/russross/blackfriday;name=blackfriday-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/russross/blackfriday/v2"
 
 #       sigs.k8s.io/kustomize/kustomize/v5 v5.0.4-0.20230601165947-6ce0bf390ce3
 # [1] git ls-remote https://github.com/kubernetes-sigs/kustomize 6ce0bf390ce3dae580947a2b739da3306c675eef
 SRCREV_kustomize-v5="6ce0bf390ce3dae580947a2b739da3306c675eef"
-SRC_URI += "git://github.com/kubernetes-sigs/kustomize;name=kustomize-v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/kustomize/kustomize/v5"
+SRC_URI += "git://github.com/kubernetes-sigs/kustomize;name=kustomize-v5;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/kustomize/kustomize/v5"
 
 #       github.com/libp2p/go-libp2p-kad-dht v0.25.2
 # [1] git ls-remote https://github.com/libp2p/go-libp2p-kad-dht bdca14419ec5f7ad0790f17856964bb99bee7436
 SRCREV_go-libp2p-kad-dht="bdca14419ec5f7ad0790f17856964bb99bee7436"
-SRC_URI += "git://github.com/libp2p/go-libp2p-kad-dht;name=go-libp2p-kad-dht;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-libp2p-kad-dht"
+SRC_URI += "git://github.com/libp2p/go-libp2p-kad-dht;name=go-libp2p-kad-dht;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-libp2p-kad-dht"
 
 #       github.com/libp2p/go-libp2p-kbucket v0.6.3
 # [1] git ls-remote https://github.com/libp2p/go-libp2p-kbucket 437b9fccd6a22835a67b8fe2a5eae0b92f307224
 SRCREV_go-libp2p-kbucket="437b9fccd6a22835a67b8fe2a5eae0b92f307224"
-SRC_URI += "git://github.com/libp2p/go-libp2p-kbucket;name=go-libp2p-kbucket;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-libp2p-kbucket"
+SRC_URI += "git://github.com/libp2p/go-libp2p-kbucket;name=go-libp2p-kbucket;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-libp2p-kbucket"
 
 #       github.com/Azure/go-autorest/logger v0.2.1
 # [1] git ls-remote https://github.com/Azure/go-autorest 820a319d2214dc91d083022ae5ec50070175314c
 SRCREV_logger="820a319d2214dc91d083022ae5ec50070175314c"
-SRC_URI += "git://github.com/Azure/go-autorest;name=logger;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/logger"
+SRC_URI += "git://github.com/Azure/go-autorest;name=logger;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/logger"
 
 #       github.com/daviddengcn/go-colortext v1.0.0
 # [1] git ls-remote https://github.com/daviddengcn/go-colortext dc4cd66b56a892657c0bea8bf4389d35210ce0ee
 SRCREV_go-colortext="dc4cd66b56a892657c0bea8bf4389d35210ce0ee"
-SRC_URI += "git://github.com/daviddengcn/go-colortext;name=go-colortext;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/daviddengcn/go-colortext"
+SRC_URI += "git://github.com/daviddengcn/go-colortext;name=go-colortext;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/daviddengcn/go-colortext"
 
 #       github.com/go-openapi/jsonreference v0.20.2
 # [1] git ls-remote https://github.com/go-openapi/jsonreference 1f158e563669961b8e54817e3ea57978d439ffff
 SRCREV_jsonreference="1f158e563669961b8e54817e3ea57978d439ffff"
-SRC_URI += "git://github.com/go-openapi/jsonreference;name=jsonreference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-openapi/jsonreference"
+SRC_URI += "git://github.com/go-openapi/jsonreference;name=jsonreference;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-openapi/jsonreference"
 
 #       github.com/opencontainers/go-digest v1.0.0
 # [1] git ls-remote https://github.com/opencontainers/go-digest ea51bea511f75cfa3ef6098cc253c5c3609b037a
 SRCREV_go-digest="ea51bea511f75cfa3ef6098cc253c5c3609b037a"
-SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/go-digest"
+SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/go-digest"
 
 #       github.com/prometheus/client_golang v1.18.0
 # [1] git ls-remote https://github.com/prometheus/client_golang 53be91d12107cb69053a8792d0a3a2a6124d59cf
 SRCREV_client_golang="53be91d12107cb69053a8792d0a3a2a6124d59cf"
-SRC_URI += "git://github.com/prometheus/client_golang;name=client_golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/prometheus/client_golang"
+SRC_URI += "git://github.com/prometheus/client_golang;name=client_golang;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/prometheus/client_golang"
 
 #       github.com/tmc/grpc-websocket-proxy v0.0.0-20220101234140-673ab2c3ae75
 # [1] git ls-remote https://github.com/tmc/grpc-websocket-proxy 673ab2c3ae75cc01952b84b88590e30e75dcf395
 SRCREV_grpc-websocket-proxy="673ab2c3ae75cc01952b84b88590e30e75dcf395"
-SRC_URI += "git://github.com/tmc/grpc-websocket-proxy;name=grpc-websocket-proxy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tmc/grpc-websocket-proxy"
+SRC_URI += "git://github.com/tmc/grpc-websocket-proxy;name=grpc-websocket-proxy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tmc/grpc-websocket-proxy"
 
 #       github.com/k3s-io/etcd/client/pkg/v3 v3.5.9-k3s1
 # [1] git ls-remote https://github.com/k3s-io/etcd 341ce193b458049401364c20193ebd14f38fce6d
 SRCREV_pkg-v3="341ce193b458049401364c20193ebd14f38fce6d"
-SRC_URI += "git://github.com/k3s-io/etcd;name=pkg-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/etcd/client/pkg/v3"
+SRC_URI += "git://github.com/k3s-io/etcd;name=pkg-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/etcd/client/pkg/v3"
 
 #       github.com/libp2p/go-libp2p-asn-util v0.3.0
 # [1] git ls-remote https://github.com/libp2p/go-libp2p-asn-util bce6420c4bcf80f1ab03cdfd4b64575e53328099
 SRCREV_go-libp2p-asn-util="bce6420c4bcf80f1ab03cdfd4b64575e53328099"
-SRC_URI += "git://github.com/libp2p/go-libp2p-asn-util;name=go-libp2p-asn-util;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-libp2p-asn-util"
+SRC_URI += "git://github.com/libp2p/go-libp2p-asn-util;name=go-libp2p-asn-util;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-libp2p-asn-util"
 
 #       github.com/multiformats/go-multiaddr v0.12.0
 # [1] git ls-remote https://github.com/multiformats/go-multiaddr 5dd793c6fc4935fad347429a48a168acc8073474
 SRCREV_go-multiaddr="5dd793c6fc4935fad347429a48a168acc8073474"
-SRC_URI += "git://github.com/multiformats/go-multiaddr;name=go-multiaddr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multiaddr"
+SRC_URI += "git://github.com/multiformats/go-multiaddr;name=go-multiaddr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multiaddr"
 
 #       github.com/multiformats/go-multibase v0.2.0
 # [1] git ls-remote https://github.com/multiformats/go-multibase 58a41f7df1d82d16599e259325b3337d69f70e3b
 SRCREV_go-multibase="58a41f7df1d82d16599e259325b3337d69f70e3b"
-SRC_URI += "git://github.com/multiformats/go-multibase;name=go-multibase;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multibase"
+SRC_URI += "git://github.com/multiformats/go-multibase;name=go-multibase;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multibase"
 
 #       github.com/multiformats/go-multihash v0.2.3
 # [1] git ls-remote https://github.com/multiformats/go-multihash ff9da31500dddfc675e996601a05cdfc3ce7c764
 SRCREV_go-multihash="ff9da31500dddfc675e996601a05cdfc3ce7c764"
-SRC_URI += "git://github.com/multiformats/go-multihash;name=go-multihash;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multihash"
+SRC_URI += "git://github.com/multiformats/go-multihash;name=go-multihash;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multihash"
 
 #       github.com/whyrusleeping/go-keyspace v0.0.0-20160322163242-5b898ac5add1
 # [1] git ls-remote https://github.com/whyrusleeping/go-keyspace 5b898ac5add1da7178a4a98e69cb7b9205c085ee
 SRCREV_go-keyspace="5b898ac5add1da7178a4a98e69cb7b9205c085ee"
-SRC_URI += "git://github.com/whyrusleeping/go-keyspace;name=go-keyspace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/whyrusleeping/go-keyspace"
+SRC_URI += "git://github.com/whyrusleeping/go-keyspace;name=go-keyspace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/whyrusleeping/go-keyspace"
 
 #       cloud.google.com/go/compute/metadata v0.2.3
 # [1] git ls-remote https://github.com/googleapis/google-cloud-go cf8081fada0955a1682ce3fc400b44bc141309c7
 SRCREV_metadata="cf8081fada0955a1682ce3fc400b44bc141309c7"
-SRC_URI += "git://github.com/googleapis/google-cloud-go;name=metadata;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/cloud.google.com/go/compute/metadata"
+SRC_URI += "git://github.com/googleapis/google-cloud-go;name=metadata;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/cloud.google.com/go/compute/metadata"
 
 #       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa24
 # [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers ced1acdcaa24dc39c01b039fc37576c395f506cf
 SRCREV_go-fuzz-headers="ced1acdcaa24dc39c01b039fc37576c395f506cf"
-SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
+SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
 
 #       github.com/Azure/go-autorest/tracing v0.6.0
 # [1] git ls-remote https://github.com/Azure/go-autorest b3a0b30a7423314874b3f585289e0e260cf5fc8d
 SRCREV_tracing="b3a0b30a7423314874b3f585289e0e260cf5fc8d"
-SRC_URI += "git://github.com/Azure/go-autorest;name=tracing;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/tracing"
+SRC_URI += "git://github.com/Azure/go-autorest;name=tracing;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/tracing"
 
 #       github.com/inconshreveable/mousetrap v1.1.0
 # [1] git ls-remote https://github.com/inconshreveable/mousetrap 4e8053ee7ef85a6bd26368364a6d27f1641c1d21
 SRCREV_mousetrap="4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
-SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
+SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/inconshreveable/mousetrap"
 
 #       github.com/opencontainers/image-spec v1.1.0-rc5
 # [1] git ls-remote https://github.com/opencontainers/image-spec 1e54f0195ce54b4a1a2ecbac8eab7686d91d3080
 SRCREV_image-spec="1e54f0195ce54b4a1a2ecbac8eab7686d91d3080"
-SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image-spec"
+SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/image-spec"
 
 #       github.com/seccomp/libseccomp-golang v0.10.0
 # [1] git ls-remote https://github.com/seccomp/libseccomp-golang 879684a7b708c2ebc730e62fdae39ae9081b4680
 SRCREV_libseccomp-golang="879684a7b708c2ebc730e62fdae39ae9081b4680"
-SRC_URI += "git://github.com/seccomp/libseccomp-golang;name=libseccomp-golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/seccomp/libseccomp-golang"
+SRC_URI += "git://github.com/seccomp/libseccomp-golang;name=libseccomp-golang;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/seccomp/libseccomp-golang"
 
 #       github.com/stefanberger/go-pkcs11uri v0.0.0-20201008174630-78d3cae3a980
 # [1] git ls-remote https://github.com/stefanberger/go-pkcs11uri 78d3cae3a9805d89aa4fa80a362ca944c89a1b99
 SRCREV_go-pkcs11uri="78d3cae3a9805d89aa4fa80a362ca944c89a1b99"
-SRC_URI += "git://github.com/stefanberger/go-pkcs11uri;name=go-pkcs11uri;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stefanberger/go-pkcs11uri"
+SRC_URI += "git://github.com/stefanberger/go-pkcs11uri;name=go-pkcs11uri;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/stefanberger/go-pkcs11uri"
 
 #       sigs.k8s.io/structured-merge-diff/v4 v4.3.0
 # [1] git ls-remote https://github.com/kubernetes-sigs/structured-merge-diff 7785c50b1768fa997df435a484ab9aa5041596a6
 SRCREV_structured-merge-diff-v4="7785c50b1768fa997df435a484ab9aa5041596a6"
-SRC_URI += "git://github.com/kubernetes-sigs/structured-merge-diff;name=structured-merge-diff-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4"
+SRC_URI += "git://github.com/kubernetes-sigs/structured-merge-diff;name=structured-merge-diff-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/structured-merge-diff/v4"
 
 #       github.com/jbenet/go-temp-err-catcher v0.1.0
 # [1] git ls-remote https://github.com/jbenet/go-temp-err-catcher fa11adda5e7cccb838a208007c9ea79dda63c0c0
 SRCREV_go-temp-err-catcher="fa11adda5e7cccb838a208007c9ea79dda63c0c0"
-SRC_URI += "git://github.com/jbenet/go-temp-err-catcher;name=go-temp-err-catcher;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/jbenet/go-temp-err-catcher"
+SRC_URI += "git://github.com/jbenet/go-temp-err-catcher;name=go-temp-err-catcher;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/jbenet/go-temp-err-catcher"
 
 #       github.com/multiformats/go-multicodec v0.9.0
 # [1] git ls-remote https://github.com/multiformats/go-multicodec b8b4bf5270f9f220f00bcdeddf1641b13e67cc0b
 SRCREV_go-multicodec="b8b4bf5270f9f220f00bcdeddf1641b13e67cc0b"
-SRC_URI += "git://github.com/multiformats/go-multicodec;name=go-multicodec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multicodec"
+SRC_URI += "git://github.com/multiformats/go-multicodec;name=go-multicodec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multicodec"
 
 #       github.com/opentracing/opentracing-go v1.2.0
 # [1] git ls-remote https://github.com/opentracing/opentracing-go d34af3eaa63c4d08ab54863a4bdd0daa45212e12
 SRCREV_opentracing-go="d34af3eaa63c4d08ab54863a4bdd0daa45212e12"
-SRC_URI += "git://github.com/opentracing/opentracing-go;name=opentracing-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opentracing/opentracing-go"
+SRC_URI += "git://github.com/opentracing/opentracing-go;name=opentracing-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opentracing/opentracing-go"
 
 #       github.com/twitchyliquid64/golang-asm v0.15.1
 # [1] git ls-remote https://github.com/twitchyliquid64/golang-asm 8d7f1f783b11f9a00f5bcdfcae17f5ac8f22512e
 SRCREV_golang-asm="8d7f1f783b11f9a00f5bcdfcae17f5ac8f22512e"
-SRC_URI += "git://github.com/twitchyliquid64/golang-asm;name=golang-asm;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/twitchyliquid64/golang-asm"
+SRC_URI += "git://github.com/twitchyliquid64/golang-asm;name=golang-asm;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/twitchyliquid64/golang-asm"
 
 #       github.com/Azure/go-autorest/autorest v0.11.29
 # [1] git ls-remote https://github.com/Azure/go-autorest c2958ac74c65c138045daa60f149c5f9d949d743
 SRCREV_autorest="c2958ac74c65c138045daa60f149c5f9d949d743"
-SRC_URI += "git://github.com/Azure/go-autorest;name=autorest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/autorest"
+SRC_URI += "git://github.com/Azure/go-autorest;name=autorest;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/autorest"
 
 #       github.com/cyphar/filepath-securejoin v0.2.4
 # [1] git ls-remote https://github.com/cyphar/filepath-securejoin 2710d06c5b4ba3168beffa0689798d2db12e8ac4
 SRCREV_filepath-securejoin="2710d06c5b4ba3168beffa0689798d2db12e8ac4"
-SRC_URI += "git://github.com/cyphar/filepath-securejoin;name=filepath-securejoin;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cyphar/filepath-securejoin"
+SRC_URI += "git://github.com/cyphar/filepath-securejoin;name=filepath-securejoin;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cyphar/filepath-securejoin"
 
 #       github.com/hashicorp/go-retryablehttp v0.7.4
 # [1] git ls-remote https://github.com/hashicorp/go-retryablehttp 571a88bc9c3b7c64575f0e9b0f646af1510f2c76
 SRCREV_go-retryablehttp="571a88bc9c3b7c64575f0e9b0f646af1510f2c76"
-SRC_URI += "git://github.com/hashicorp/go-retryablehttp;name=go-retryablehttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-retryablehttp"
+SRC_URI += "git://github.com/hashicorp/go-retryablehttp;name=go-retryablehttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-retryablehttp"
 
 #       github.com/libopenstorage/openstorage v1.0.0
 # [1] git ls-remote https://github.com/libopenstorage/openstorage 093a0c3888753c2056e7373183693d670c6bba01
 SRCREV_openstorage="093a0c3888753c2056e7373183693d670c6bba01"
-SRC_URI += "git://github.com/libopenstorage/openstorage;name=openstorage;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libopenstorage/openstorage"
+SRC_URI += "git://github.com/libopenstorage/openstorage;name=openstorage;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libopenstorage/openstorage"
 
 #       github.com/go-playground/validator/v10 v10.14.0
 # [1] git ls-remote https://github.com/go-playground/validator ce28d7c4b27fbcafff82bc87a8bf58257beb9030
 SRCREV_v10="ce28d7c4b27fbcafff82bc87a8bf58257beb9030"
-SRC_URI += "git://github.com/go-playground/validator;name=v10;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-playground/validator/v10"
+SRC_URI += "git://github.com/go-playground/validator;name=v10;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-playground/validator/v10"
 
 #       github.com/hashicorp/golang-lru/arc/v2 v2.0.5
 # [1] git ls-remote https://github.com/hashicorp/golang-lru 3afaa48530f711754c178ceb61ff060d86c17b95
 SRCREV_arc-v2="3afaa48530f711754c178ceb61ff060d86c17b95"
-SRC_URI += "git://github.com/hashicorp/golang-lru;name=arc-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/golang-lru/arc/v2"
+SRC_URI += "git://github.com/hashicorp/golang-lru;name=arc-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/golang-lru/arc/v2"
 
 #       github.com/multiformats/go-multistream v0.4.1
 # [1] git ls-remote https://github.com/multiformats/go-multistream 5b2f48e2db22aa1db90bb5a21aa4e6702d4ee33c
 SRCREV_go-multistream="5b2f48e2db22aa1db90bb5a21aa4e6702d4ee33c"
-SRC_URI += "git://github.com/multiformats/go-multistream;name=go-multistream;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multistream"
+SRC_URI += "git://github.com/multiformats/go-multistream;name=go-multistream;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multistream"
 
 #       github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20230306123547-8075edf89bb0
 # [1] git ls-remote https://github.com/AdamKorcz/go-118-fuzz-build 8075edf89bb034603c758f28fe93143047ac5677
 SRCREV_go-118-fuzz-build="8075edf89bb034603c758f28fe93143047ac5677"
-SRC_URI += "git://github.com/AdamKorcz/go-118-fuzz-build;name=go-118-fuzz-build;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdamKorcz/go-118-fuzz-build"
+SRC_URI += "git://github.com/AdamKorcz/go-118-fuzz-build;name=go-118-fuzz-build;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/AdamKorcz/go-118-fuzz-build"
 
 #       github.com/bronze1man/goStrongswanVici v0.0.0-20221114103242-3f6dc524986c
 # [1] git ls-remote https://github.com/bronze1man/goStrongswanVici 3f6dc524986c8a20ee1e139f9e1bef1595877b5d
 SRCREV_goStrongswanVici="3f6dc524986c8a20ee1e139f9e1bef1595877b5d"
-SRC_URI += "git://github.com/bronze1man/goStrongswanVici;name=goStrongswanVici;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/bronze1man/goStrongswanVici"
+SRC_URI += "git://github.com/bronze1man/goStrongswanVici;name=goStrongswanVici;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/bronze1man/goStrongswanVici"
 
 #       github.com/containernetworking/plugins v1.3.0
 # [1] git ls-remote https://github.com/containernetworking/plugins 38f18d26ecfef550b8bac02656cc11103fd7cff1
 SRCREV_plugins="38f18d26ecfef550b8bac02656cc11103fd7cff1"
-SRC_URI += "git://github.com/containernetworking/plugins;name=plugins;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/plugins"
+SRC_URI += "git://github.com/containernetworking/plugins;name=plugins;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containernetworking/plugins"
 
 #       github.com/google/go-containerregistry v0.14.0
 # [1] git ls-remote https://github.com/google/go-containerregistry 4b081f801f399fa293f23e42ba4c4ac6a6003f2c
 SRCREV_go-containerregistry="4b081f801f399fa293f23e42ba4c4ac6a6003f2c"
-SRC_URI += "git://github.com/google/go-containerregistry;name=go-containerregistry;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-containerregistry"
+SRC_URI += "git://github.com/google/go-containerregistry;name=go-containerregistry;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/go-containerregistry"
 
 #       github.com/grpc-ecosystem/grpc-gateway v1.16.0
 # [1] git ls-remote https://github.com/grpc-ecosystem/grpc-gateway 094a6fe78b3ca888297d090185cdf30f0e42e157
 SRCREV_grpc-gateway="094a6fe78b3ca888297d090185cdf30f0e42e157"
-SRC_URI += "git://github.com/grpc-ecosystem/grpc-gateway;name=grpc-gateway;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway"
+SRC_URI += "git://github.com/grpc-ecosystem/grpc-gateway;name=grpc-gateway;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway"
 
 #       github.com/monochromegane/go-gitignore v0.0.0-20200626010858-205db1a8cc00
 # [1] git ls-remote https://github.com/monochromegane/go-gitignore 205db1a8cc001de79230472da52edde4974df734
 SRCREV_go-gitignore="205db1a8cc001de79230472da52edde4974df734"
-SRC_URI += "git://github.com/monochromegane/go-gitignore;name=go-gitignore;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/monochromegane/go-gitignore"
+SRC_URI += "git://github.com/monochromegane/go-gitignore;name=go-gitignore;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/monochromegane/go-gitignore"
 
 #       github.com/opencontainers/runtime-spec v1.0.3-0.20220909204839-494a5a6aca78
 # [1] git ls-remote https://github.com/opencontainers/runtime-spec 494a5a6aca782455c0fbfc35af8e12f04e98a55e
 SRCREV_runtime-spec="494a5a6aca782455c0fbfc35af8e12f04e98a55e"
-SRC_URI += "git://github.com/opencontainers/runtime-spec;name=runtime-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runtime-spec"
+SRC_URI += "git://github.com/opencontainers/runtime-spec;name=runtime-spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/runtime-spec"
 
 #       github.com/opencontainers/runtime-tools v0.9.1-0.20221107090550-2e043c6bd626
 # [1] git ls-remote https://github.com/opencontainers/runtime-tools 2e043c6bd62639199bdd0d5f0c5082797de4de2a
 SRCREV_runtime-tools="2e043c6bd62639199bdd0d5f0c5082797de4de2a"
-SRC_URI += "git://github.com/opencontainers/runtime-tools;name=runtime-tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runtime-tools"
+SRC_URI += "git://github.com/opencontainers/runtime-tools;name=runtime-tools;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/runtime-tools"
 
 #       github.com/containerd/stargz-snapshotter v0.14.4-0.20230913082252-7275d45b185c
 # [1] git ls-remote https://github.com/containerd/stargz-snapshotter 7275d45b185cd720ce13747f0d0a78e9e7cd60e3
 SRCREV_stargz-snapshotter="7275d45b185cd720ce13747f0d0a78e9e7cd60e3"
-SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=stargz-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=stargz-snapshotter;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/stargz-snapshotter"
 
 #       github.com/multiformats/go-multiaddr-dns v0.3.1
 # [1] git ls-remote https://github.com/multiformats/go-multiaddr-dns 448c10b622b0c09ce6834487156c1fd9a65f1597
 SRCREV_go-multiaddr-dns="448c10b622b0c09ce6834487156c1fd9a65f1597"
-SRC_URI += "git://github.com/multiformats/go-multiaddr-dns;name=go-multiaddr-dns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multiaddr-dns"
+SRC_URI += "git://github.com/multiformats/go-multiaddr-dns;name=go-multiaddr-dns;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multiaddr-dns"
 
 #       github.com/multiformats/go-multiaddr-fmt v0.1.0
 # [1] git ls-remote https://github.com/multiformats/go-multiaddr-fmt 113ed87ed03cfff94f29fd95236be3ccd933fd36
 SRCREV_go-multiaddr-fmt="113ed87ed03cfff94f29fd95236be3ccd933fd36"
-SRC_URI += "git://github.com/multiformats/go-multiaddr-fmt;name=go-multiaddr-fmt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multiaddr-fmt"
+SRC_URI += "git://github.com/multiformats/go-multiaddr-fmt;name=go-multiaddr-fmt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multiaddr-fmt"
 
 #       github.com/Azure/go-autorest/autorest/to v0.4.0
 # [1] git ls-remote https://github.com/Azure/go-autorest b3a0b30a7423314874b3f585289e0e260cf5fc8d
 SRCREV_to="b3a0b30a7423314874b3f585289e0e260cf5fc8d"
-SRC_URI += "git://github.com/Azure/go-autorest;name=to;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/autorest/to"
+SRC_URI += "git://github.com/Azure/go-autorest;name=to;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/autorest/to"
 
 #       github.com/checkpoint-restore/go-criu/v5 v5.3.0
 # [1] git ls-remote https://github.com/checkpoint-restore/go-criu e3059103a5cf6adca2183e08c0315e8d8d5135a5
 SRCREV_v5="e3059103a5cf6adca2183e08c0315e8d8d5135a5"
-SRC_URI += "git://github.com/checkpoint-restore/go-criu;name=v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/checkpoint-restore/go-criu/v5"
+SRC_URI += "git://github.com/checkpoint-restore/go-criu;name=v5;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/checkpoint-restore/go-criu/v5"
 
 #       github.com/decred/dcrd/dcrec/secp256k1/v4 v4.2.0
 # [1] git ls-remote https://github.com/decred/dcrd bacf8444a8bc79178f9eb2c65477ab6df01a6439
 SRCREV_secp256k1-v4="bacf8444a8bc79178f9eb2c65477ab6df01a6439"
-SRC_URI += "git://github.com/decred/dcrd;name=secp256k1-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/decred/dcrd/dcrec/secp256k1/v4"
+SRC_URI += "git://github.com/decred/dcrd;name=secp256k1-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/decred/dcrd/dcrec/secp256k1/v4"
 
 #       github.com/grpc-ecosystem/grpc-gateway/v2 v2.16.0
 # [1] git ls-remote https://github.com/grpc-ecosystem/grpc-gateway 09e3965a330155f7db8482269d7d91b9bceb7641
 SRCREV_grpc-gateway-v2="09e3965a330155f7db8482269d7d91b9bceb7641"
-SRC_URI += "git://github.com/grpc-ecosystem/grpc-gateway;name=grpc-gateway-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
+SRC_URI += "git://github.com/grpc-ecosystem/grpc-gateway;name=grpc-gateway-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/grpc-gateway/v2"
 
 #       google.golang.org/genproto/googleapis/api v0.0.0-20231106174013-bbf56f31fb17
 # [1] git ls-remote https://github.com/googleapis/go-genproto bbf56f31fb17579209f44dda2d2567d20ff21a20
 SRCREV_googleapis-api="bbf56f31fb17579209f44dda2d2567d20ff21a20"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=googleapis-api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/api"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=googleapis-api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto/googleapis/api"
 
 #       google.golang.org/genproto/googleapis/rpc v0.0.0-20231120223509-83a465c0220f
 # [1] git ls-remote https://github.com/googleapis/go-genproto 83a465c0220f57b4c18228172454daeffa772607
 SRCREV_rpc="83a465c0220f57b4c18228172454daeffa772607"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=rpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/rpc"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=rpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto/googleapis/rpc"
 
 #       github.com/rootless-containers/rootlesskit v1.0.1
 # [1] git ls-remote https://github.com/rootless-containers/rootlesskit 5d5f4c0c26e26a6b51d1838c23e793e5836442d0
 SRCREV_rootlesskit="5d5f4c0c26e26a6b51d1838c23e793e5836442d0"
-SRC_URI += "git://github.com/rootless-containers/rootlesskit;name=rootlesskit;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/rootlesskit"
+SRC_URI += "git://github.com/rootless-containers/rootlesskit;name=rootlesskit;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rootless-containers/rootlesskit"
 
 #       github.com/Azure/go-autorest/autorest/adal v0.9.23
 # [1] git ls-remote https://github.com/Azure/go-autorest 553a90ae65a6a2b18306fa04d7b1625960c5decb
 SRCREV_adal="553a90ae65a6a2b18306fa04d7b1625960c5decb"
-SRC_URI += "git://github.com/Azure/go-autorest;name=adal;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/autorest/adal"
+SRC_URI += "git://github.com/Azure/go-autorest;name=adal;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/autorest/adal"
 
 #       github.com/Azure/go-autorest/autorest/date v0.3.0
 # [1] git ls-remote https://github.com/Azure/go-autorest b3a0b30a7423314874b3f585289e0e260cf5fc8d
 SRCREV_date="b3a0b30a7423314874b3f585289e0e260cf5fc8d"
-SRC_URI += "git://github.com/Azure/go-autorest;name=date;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/autorest/date"
+SRC_URI += "git://github.com/Azure/go-autorest;name=date;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/autorest/date"
 
 #       github.com/libp2p/go-libp2p-routing-helpers v0.7.2
 # [1] git ls-remote https://github.com/libp2p/go-libp2p-routing-helpers 71d7c965185ed346e39cc26140ac49ea13b2222f
 SRCREV_go-libp2p-routing-helpers="71d7c965185ed346e39cc26140ac49ea13b2222f"
-SRC_URI += "git://github.com/libp2p/go-libp2p-routing-helpers;name=go-libp2p-routing-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/libp2p/go-libp2p-routing-helpers"
+SRC_URI += "git://github.com/libp2p/go-libp2p-routing-helpers;name=go-libp2p-routing-helpers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/libp2p/go-libp2p-routing-helpers"
 
 #       github.com/Azure/go-autorest/autorest/mocks v0.4.2
 # [1] git ls-remote https://github.com/Azure/go-autorest a91292dd2fc10381ac9b90eea72b92e60761eac4
 SRCREV_mocks="a91292dd2fc10381ac9b90eea72b92e60761eac4"
-SRC_URI += "git://github.com/Azure/go-autorest;name=mocks;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/autorest/mocks"
+SRC_URI += "git://github.com/Azure/go-autorest;name=mocks;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/autorest/mocks"
 
 #       github.com/antlr/antlr4/runtime/Go/antlr/v4 v4.0.0-20230305170008-8188dc5388df
 # [1] git ls-remote https://github.com/antlr/antlr4 8188dc5388dfe9246deb9b6ae507c3693fd55c3f
 SRCREV_antlr-v4="8188dc5388dfe9246deb9b6ae507c3693fd55c3f"
-SRC_URI += "git://github.com/antlr/antlr4;name=antlr-v4;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/antlr/antlr4/runtime/Go/antlr/v4"
+SRC_URI += "git://github.com/antlr/antlr4;name=antlr-v4;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/antlr/antlr4/runtime/Go/antlr/v4"
 
 #       github.com/container-storage-interface/spec v1.8.0
 # [1] git ls-remote https://github.com/container-storage-interface/spec c7ab2f379311a9ae234ae42bdfbfebfa9c15e538
 SRCREV_spec="c7ab2f379311a9ae234ae42bdfbfebfa9c15e538"
-SRC_URI += "git://github.com/container-storage-interface/spec;name=spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/container-storage-interface/spec"
+SRC_URI += "git://github.com/container-storage-interface/spec;name=spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/container-storage-interface/spec"
 
 #       github.com/docker/docker-credential-helpers v0.7.0
 # [1] git ls-remote https://github.com/docker/docker-credential-helpers ac5992b5f4756fc0398a7d0c93c609e624368bde
 SRCREV_docker-credential-helpers="ac5992b5f4756fc0398a7d0c93c609e624368bde"
-SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker-credential-helpers"
+SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker-credential-helpers"
 
 #       github.com/grpc-ecosystem/go-grpc-middleware v1.3.0
 # [1] git ls-remote https://github.com/grpc-ecosystem/go-grpc-middleware df0f91b29bbbdfc3a686a7a8edbe2b9de2072fdd
 SRCREV_go-grpc-middleware="df0f91b29bbbdfc3a686a7a8edbe2b9de2072fdd"
-SRC_URI += "git://github.com/grpc-ecosystem/go-grpc-middleware;name=go-grpc-middleware;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/go-grpc-middleware"
+SRC_URI += "git://github.com/grpc-ecosystem/go-grpc-middleware;name=go-grpc-middleware;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/go-grpc-middleware"
 
 #       github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0
 # [1] git ls-remote https://github.com/grpc-ecosystem/go-grpc-prometheus c225b8c3b01faf2899099b768856a9e916e5087b
 SRCREV_go-grpc-prometheus="c225b8c3b01faf2899099b768856a9e916e5087b"
-SRC_URI += "git://github.com/grpc-ecosystem/go-grpc-prometheus;name=go-grpc-prometheus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/grpc-ecosystem/go-grpc-prometheus"
+SRC_URI += "git://github.com/grpc-ecosystem/go-grpc-prometheus;name=go-grpc-prometheus;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/grpc-ecosystem/go-grpc-prometheus"
 
 #       github.com/go-playground/universal-translator v0.18.1
 # [1] git ls-remote https://github.com/go-playground/universal-translator f83cd526536e253181a13835b00cd107f627c505
 SRCREV_universal-translator="f83cd526536e253181a13835b00cd107f627c505"
-SRC_URI += "git://github.com/go-playground/universal-translator;name=universal-translator;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-playground/universal-translator"
+SRC_URI += "git://github.com/go-playground/universal-translator;name=universal-translator;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-playground/universal-translator"
 
 #       github.com/containerd/fuse-overlayfs-snapshotter v1.0.5
 # [1] git ls-remote https://github.com/containerd/fuse-overlayfs-snapshotter 11c45f4d24689d8cb279813fbcb9bbd01773e0e8
 SRCREV_fuse-overlayfs-snapshotter="11c45f4d24689d8cb279813fbcb9bbd01773e0e8"
-SRC_URI += "git://github.com/containerd/fuse-overlayfs-snapshotter;name=fuse-overlayfs-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/fuse-overlayfs-snapshotter"
+SRC_URI += "git://github.com/containerd/fuse-overlayfs-snapshotter;name=fuse-overlayfs-snapshotter;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/fuse-overlayfs-snapshotter"
 
 #       github.com/Azure/go-autorest/autorest/validation v0.3.1
 # [1] git ls-remote https://github.com/Azure/go-autorest 446f41b7d65b2ab6c25b1a7afe42abd3622e9110
 SRCREV_validation="446f41b7d65b2ab6c25b1a7afe42abd3622e9110"
-SRC_URI += "git://github.com/Azure/go-autorest;name=validation;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-autorest/autorest/validation"
+SRC_URI += "git://github.com/Azure/go-autorest;name=validation;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-autorest/autorest/validation"
 
 #       github.com/containerd/stargz-snapshotter/estargz v0.14.3
 # [1] git ls-remote https://github.com/containerd/stargz-snapshotter 6ee6fa1a88df6ea098f6b7dddde29e33f09d5331
 SRCREV_estargz="6ee6fa1a88df6ea098f6b7dddde29e33f09d5331"
-SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=estargz;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter/estargz"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=estargz;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/stargz-snapshotter/estargz"
 
 #       github.com/GoogleCloudPlatform/k8s-cloud-provider v1.18.1-0.20220218231025-f11817397a1b
 # [1] git ls-remote https://github.com/GoogleCloudPlatform/k8s-cloud-provider f11817397a1bb27e88115807a9c083a36e12eaf8
 SRCREV_k8s-cloud-provider="f11817397a1bb27e88115807a9c083a36e12eaf8"
-SRC_URI += "git://github.com/GoogleCloudPlatform/k8s-cloud-provider;name=k8s-cloud-provider;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/GoogleCloudPlatform/k8s-cloud-provider"
+SRC_URI += "git://github.com/GoogleCloudPlatform/k8s-cloud-provider;name=k8s-cloud-provider;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/GoogleCloudPlatform/k8s-cloud-provider"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.13.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go f2fd476f433128c2494476950ce11600a51bbe35
 SRCREV_otlptrace="f2fd476f433128c2494476950ce11600a51bbe35"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptrace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptrace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace"
 
 #       github.com/googleapis/enterprise-certificate-proxy v0.3.2
 # [1] git ls-remote https://github.com/googleapis/enterprise-certificate-proxy d928958b5b9ec0c2d3ce5e97ea5d1f000125ba7b
 SRCREV_enterprise-certificate-proxy="d928958b5b9ec0c2d3ce5e97ea5d1f000125ba7b"
-SRC_URI += "git://github.com/googleapis/enterprise-certificate-proxy;name=enterprise-certificate-proxy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/googleapis/enterprise-certificate-proxy"
+SRC_URI += "git://github.com/googleapis/enterprise-certificate-proxy;name=enterprise-certificate-proxy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/googleapis/enterprise-certificate-proxy"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/api v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_api="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/api"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/api"
 
 #       github.com/matttproud/golang_protobuf_extensions/v2 v2.0.0
 # [1] git ls-remote https://github.com/matttproud/golang_protobuf_extensions 5a0f9169fc38cc42a5c617c3dc049548ddc27487
 SRCREV_golang_protobuf_extensions-v2="5a0f9169fc38cc42a5c617c3dc049548ddc27487"
-SRC_URI += "git://github.com/matttproud/golang_protobuf_extensions;name=golang_protobuf_extensions-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobuf_extensions/v2"
+SRC_URI += "git://github.com/matttproud/golang_protobuf_extensions;name=golang_protobuf_extensions-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/matttproud/golang_protobuf_extensions/v2"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kms v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kms="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kms;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kms"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kms;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kms"
 
 #       go.opentelemetry.io/otel/exporters/otlp/internal/retry v1.13.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go f2fd476f433128c2494476950ce11600a51bbe35
 SRCREV_internal-retry="f2fd476f433128c2494476950ce11600a51bbe35"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=internal-retry;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/internal/retry"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=internal-retry;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/internal/retry"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/cri-api v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_cri-api="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=cri-api;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cri-api"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=cri-api;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cri-api"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kubectl v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kubectl="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kubectl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kubectl"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kubectl;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kubectl"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kubelet v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kubelet="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kubelet;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kubelet"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kubelet;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kubelet"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/metrics v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_metrics="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=metrics;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/metrics"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=metrics;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/metrics"
 
 #       sigs.k8s.io/apiserver-network-proxy/konnectivity-client v0.1.2
 # [1] git ls-remote https://github.com/kubernetes-sigs/apiserver-network-proxy 60b5f0e02800910cbb363668e285ec0e78d7cae1
 SRCREV_konnectivity-client="60b5f0e02800910cbb363668e285ec0e78d7cae1"
-SRC_URI += "git://github.com/kubernetes-sigs/apiserver-network-proxy;name=konnectivity-client;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/sigs.k8s.io/apiserver-network-proxy/konnectivity-client"
+SRC_URI += "git://github.com/kubernetes-sigs/apiserver-network-proxy;name=konnectivity-client;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/sigs.k8s.io/apiserver-network-proxy/konnectivity-client"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/apiserver v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_apiserver="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=apiserver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/apiserver"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=apiserver;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/apiserver"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/client-go v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_client-go="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=client-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/client-go"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=client-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/client-go"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-proxy v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kube-proxy="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-proxy;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-proxy"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-proxy;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-proxy"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/cli-runtime v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_cli-runtime="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=cli-runtime;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cli-runtime"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=cli-runtime;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cli-runtime"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/mount-utils v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_mount-utils="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=mount-utils;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/mount-utils"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=mount-utils;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/mount-utils"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/apimachinery v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_apimachinery="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=apimachinery;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/apimachinery"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=apimachinery;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/apimachinery"
 
 #       go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.35.1
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib 356ee7f4343df3704346603fbde1b8d3d8fb86e9
 SRCREV_otelhttp="356ee7f4343df3704346603fbde1b8d3d8fb86e9"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/endpointslice v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_endpointslice="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=endpointslice;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/endpointslice"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=endpointslice;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/endpointslice"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/cloud-provider v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_cloud-provider="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=cloud-provider;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cloud-provider"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=cloud-provider;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cloud-provider"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/component-base v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_component-base="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=component-base;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/component-base"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=component-base;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/component-base"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/code-generator v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_code-generator="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=code-generator;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/code-generator"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=code-generator;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/code-generator"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-scheduler v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kube-scheduler="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-scheduler;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-scheduler"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-scheduler;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-scheduler"
 
 #       go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.13.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go f2fd476f433128c2494476950ce11600a51bbe35
 SRCREV_otlptracegrpc="f2fd476f433128c2494476950ce11600a51bbe35"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptracegrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otlptracegrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-aggregator v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kube-aggregator="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-aggregator;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-aggregator"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-aggregator;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-aggregator"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/cluster-bootstrap v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_cluster-bootstrap="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=cluster-bootstrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cluster-bootstrap"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=cluster-bootstrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/cluster-bootstrap"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/component-helpers v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_component-helpers="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=component-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/component-helpers"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=component-helpers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/component-helpers"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/controller-manager v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_controller-manager="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=controller-manager;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/controller-manager"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=controller-manager;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/controller-manager"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/csi-translation-lib v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_csi-translation-lib="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=csi-translation-lib;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/csi-translation-lib"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=csi-translation-lib;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/csi-translation-lib"
 
 #       github.com/container-orchestrated-devices/container-device-interface v0.5.4
 # [1] git ls-remote https://github.com/cncf-tags/container-device-interface 0a1a5bea37b41bbdbb65d0e42b6305eba051f185
 SRCREV_container-device-interface="0a1a5bea37b41bbdbb65d0e42b6305eba051f185"
-SRC_URI += "git://github.com/cncf-tags/container-device-interface;name=container-device-interface;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/container-orchestrated-devices/container-device-interface"
+SRC_URI += "git://github.com/cncf-tags/container-device-interface;name=container-device-interface;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/container-orchestrated-devices/container-device-interface"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/legacy-cloud-providers v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_legacy-cloud-providers="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=legacy-cloud-providers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/legacy-cloud-providers"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=legacy-cloud-providers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/legacy-cloud-providers"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/pod-security-admission v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_pod-security-admission="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=pod-security-admission;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/pod-security-admission"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=pod-security-admission;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/pod-security-admission"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/apiextensions-apiserver v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_apiextensions-apiserver="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=apiextensions-apiserver;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/apiextensions-apiserver"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=apiextensions-apiserver;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/apiextensions-apiserver"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-controller-manager v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_kube-controller-manager="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-controller-manager;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-controller-manager"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=kube-controller-manager;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/kube-controller-manager"
 
 #       go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.35.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib c4876c33a8e2e4b09501013f3543153d8aa10178
 SRCREV_otelgrpc="c4876c33a8e2e4b09501013f3543153d8aa10178"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelgrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelgrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc"
 
 #       github.com/k3s-io/kubernetes/staging/src/k8s.io/dynamic-resource-allocation v1.28.7-k3s1
 # [1] git ls-remote https://github.com/k3s-io/kubernetes 94b07a975a29425d3f5f835ef5e7d9c22f33f8c1
 SRCREV_dynamic-resource-allocation="94b07a975a29425d3f5f835ef5e7d9c22f33f8c1"
-SRC_URI += "git://github.com/k3s-io/kubernetes;name=dynamic-resource-allocation;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/dynamic-resource-allocation"
+SRC_URI += "git://github.com/k3s-io/kubernetes;name=dynamic-resource-allocation;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/k3s-io/kubernetes/staging/src/k8s.io/dynamic-resource-allocation"
 
 #       go.opentelemetry.io/contrib/instrumentation/github.com/emicklei/go-restful/otelrestful v0.35.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib c4876c33a8e2e4b09501013f3543153d8aa10178
 SRCREV_otelrestful="c4876c33a8e2e4b09501013f3543153d8aa10178"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelrestful;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/github.com/emicklei/go-restful/otelrestful"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelrestful;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/github.com/emicklei/go-restful/otelrestful"
 
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 044175eb..87cfca60 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -1,4 +1,4 @@
-HOMEPAGE = "git://github.com/kubernetes/kubernetes;branch=master;protocol=https"
+HOMEPAGE = "git://github.com/kubernetes/kubernetes;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 SUMMARY = "Production-Grade Container Scheduling and Management"
 DESCRIPTION = "Kubernetes is an open source system for managing containerized \
 applications across multiple hosts, providing basic mechanisms for deployment, \
@@ -14,7 +14,7 @@ PE = "1"
 BBCLASSEXTEND = "devupstream:target"
 LIC_FILES_CHKSUM:class-devupstream = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRC_URI:class-devupstream = "git://github.com/kubernetes/kubernetes.git;branch=release-1.29;name=kubernetes;protocol=https \
+SRC_URI:class-devupstream = "git://github.com/kubernetes/kubernetes.git;branch=release-1.29;name=kubernetes;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
                              git://github.com/kubernetes/release;branch=master;name=kubernetes-release;destsuffix=git/release;protocol=https \
                             "
 SRCREV_kubernetes:class-devupstream = "e3b5e621f07f0fee298f641ebded61b8f393fe27"
@@ -112,14 +112,14 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 	install -d "${D}${BIN_PREFIX}${base_bindir}"
-	install -m 755 "${WORKDIR}/k8s-init" "${D}${BIN_PREFIX}${base_bindir}"
+	install -m 755 "${UNPACKDIR}/k8s-init" "${D}${BIN_PREFIX}${base_bindir}"
 
 	install -d ${D}${sysconfdir}/sysctl.d
-	install -m 0644 "${WORKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
+	install -m 0644 "${UNPACKDIR}/99-kubernetes.conf" "${D}${sysconfdir}/sysctl.d"
     fi
 }
 
-CNI_NETWORKING_FILES ?= "${WORKDIR}/cni-containerd-net.conflist"
+CNI_NETWORKING_FILES ?= "${UNPACKDIR}/cni-containerd-net.conflist"
 
 PACKAGES =+ "kubeadm kubectl kubelet kube-proxy ${PN}-misc ${PN}-host"
 
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
index ee0e442f..550f910e 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -161,12 +161,12 @@ do_install:append() {
 	# /etc/default/lxc sources lxc-net, this allows lxc bridge when lxc-networking
 	# is not installed this results in no lxcbr0, but when lxc-networking is installed
 	# lxcbr0 will be fully configured.
-	install -m 644 ${WORKDIR}/lxc-net ${D}${sysconfdir}/default/
+	install -m 644 ${UNPACKDIR}/lxc-net ${D}${sysconfdir}/default/
 
 	# Force the main dnsmasq instance to bind only to specified interfaces and
 	# to not bind to virbr0. Libvirt will run its own instance on this interface.
 	install -d ${D}/${sysconfdir}/dnsmasq.d
-	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
+	install -m 644 ${UNPACKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/lxc
 }
 
 EXTRA_OEMAKE += "TEST_DIR=${D}${PTEST_PATH}/src/tests"
diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
index 8868274f..649b81d2 100644
--- a/recipes-containers/nerdctl/nerdctl_git.bb
+++ b/recipes-containers/nerdctl/nerdctl_git.bb
@@ -13,7 +13,7 @@ DEPENDS = " \
 SRCREV_FORMAT="nerdcli_cgroups"
 SRCREV_nerdcli = "265d6b9cf526ce7d9ed8d34a0e3c3066901cc463"
 
-SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https"
+SRC_URI = "git://github.com/containerd/nerdctl.git;name=nerdcli;branch=main;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 include src_uri.inc
 
@@ -69,7 +69,7 @@ do_compile() {
 	# our copied .go files are to be used for the build
 	ln -sf vendor.copy vendor
 	# inform go that we know what we are doing
-	cp ${WORKDIR}/modules.txt vendor/
+	cp ${UNPACKDIR}/modules.txt vendor/
 
 	oe_runmake GO=${GO} BUILDTAGS="${BUILDTAGS}" binaries
 }
diff --git a/recipes-containers/nerdctl/src_uri.inc b/recipes-containers/nerdctl/src_uri.inc
index eff9ec1a..c839e4bc 100644
--- a/recipes-containers/nerdctl/src_uri.inc
+++ b/recipes-containers/nerdctl/src_uri.inc
@@ -1,675 +1,675 @@
 #       gotest.tools/v3 v3.5.1
 # [1] git ls-remote https://github.com/gotestyourself/gotest.tools 81cea1abc596b025bf2573c7fdf97740512e4c6c
 SRCREV_gotest.tools-v3="81cea1abc596b025bf2573c7fdf97740512e4c6c"
-SRC_URI += "git://github.com/gotestyourself/gotest.tools;name=gotest.tools-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gotest.tools/v3"
+SRC_URI += "git://github.com/gotestyourself/gotest.tools;name=gotest.tools-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gotest.tools/v3"
 
 #       go.uber.org/mock v0.4.0
 # [1] git ls-remote https://github.com/uber/mock 74a29c6e6c2cbb8ccee94db061c1604ff33fd188
 SRCREV_mock="74a29c6e6c2cbb8ccee94db061c1604ff33fd188"
-SRC_URI += "git://github.com/uber/mock;name=mock;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org/mock"
+SRC_URI += "git://github.com/uber/mock;name=mock;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.uber.org/mock"
 
 #       golang.org/x/net v0.21.0
 # [1] git ls-remote https://go.googlesource.com/net 73d21fdbb4d7dc7115b50526b93b6c37a4e3377f
 SRCREV_net="73d21fdbb4d7dc7115b50526b93b6c37a4e3377f"
-SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net"
+SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/net"
 
 #       golang.org/x/sys v0.17.0
 # [1] git ls-remote https://go.googlesource.com/sys 914b96c1bddd0738464c043cccbbac14fc94b955
 SRCREV_sys="914b96c1bddd0738464c043cccbbac14fc94b955"
-SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys"
+SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sys"
 
 #       gopkg.in/yaml.v3 v3.0.1
 # [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f56608cd2c32c51f8194bf51
 SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3"
 
 #       go.opencensus.io v0.24.0
 # [1] git ls-remote https://github.com/census-instrumentation/opencensus-go b1a01ee95db0e690d91d7193d037447816fae4c5
 SRCREV_go.opencensus.io="b1a01ee95db0e690d91d7193d037447816fae4c5"
-SRC_URI += "git://github.com/census-instrumentation/opencensus-go;name=go.opencensus.io;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opencensus.io"
+SRC_URI += "git://github.com/census-instrumentation/opencensus-go;name=go.opencensus.io;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opencensus.io"
 
 #       golang.org/x/exp v0.0.0-20231006140011-7918f672742d
 # [1] git ls-remote https://go.googlesource.com/exp 7918f672742dd40ff5cf8d3c316a9315410c2d3c
 SRCREV_exp="7918f672742dd40ff5cf8d3c316a9315410c2d3c"
-SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/exp"
+SRC_URI += "git://go.googlesource.com/exp;name=exp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/exp"
 
 #       golang.org/x/mod v0.13.0
 # [1] git ls-remote https://go.googlesource.com/mod 5b692803cf76a65fc5d39178c0a36678e69c0e5a
 SRCREV_mod="5b692803cf76a65fc5d39178c0a36678e69c0e5a"
-SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/mod"
+SRC_URI += "git://go.googlesource.com/mod;name=mod;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/mod"
 
 #       golang.org/x/sync v0.6.0
 # [1] git ls-remote https://go.googlesource.com/sync 59c1ca1e4661ed4452be4069ceea3c233f4deec1
 SRCREV_sync="59c1ca1e4661ed4452be4069ceea3c233f4deec1"
-SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sync"
+SRC_URI += "git://go.googlesource.com/sync;name=sync;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sync"
 
 #       golang.org/x/term v0.17.0
 # [1] git ls-remote https://go.googlesource.com/term 353276a841e232e41e0f76e7a61fe0e5d1f92cf1
 SRCREV_x-term="353276a841e232e41e0f76e7a61fe0e5d1f92cf1"
-SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/term"
+SRC_URI += "git://go.googlesource.com/term;name=x-term;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/term"
 
 #       golang.org/x/text v0.14.0
 # [1] git ls-remote https://go.googlesource.com/text 6c97a165dd661335ff7bce6104a008558123c353
 SRCREV_text="6c97a165dd661335ff7bce6104a008558123c353"
-SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text"
+SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/text"
 
 #       golang.org/x/tools v0.14.0
 # [1] git ls-remote https://go.googlesource.com/tools 3f4194ee29d7db9b59757dfff729ef55cf89661c
 SRCREV_tools="3f4194ee29d7db9b59757dfff729ef55cf89661c"
-SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
+SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/tools"
 
 #       golang.org/x/crypto v0.19.0
 # [1] git ls-remote https://go.googlesource.com/crypto 405cb3bdea78b1b48ee79096733841247a944de0
 SRCREV_crypto="405cb3bdea78b1b48ee79096733841247a944de0"
-SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto"
+SRC_URI += "git://go.googlesource.com/crypto;name=crypto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/crypto"
 
 #       github.com/moby/term v0.5.0
 # [1] git ls-remote https://github.com/moby/term 9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9
 SRCREV_term="9c3c875fad924eb6c9dd32a361b5fc0a49a4feb9"
-SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/term"
+SRC_URI += "git://github.com/moby/term;name=term;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/term"
 
 #       go.mozilla.org/pkcs7 v0.0.0-20200128120323-432b2356ecb1
 # [1] git ls-remote https://github.com/mozilla-services/pkcs7 432b2356ecb18209c1cec25680b8a23632794f21
 SRCREV_pkcs7="432b2356ecb18209c1cec25680b8a23632794f21"
-SRC_URI += "git://github.com/mozilla-services/pkcs7;name=pkcs7;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.mozilla.org/pkcs7"
+SRC_URI += "git://github.com/mozilla-services/pkcs7;name=pkcs7;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.mozilla.org/pkcs7"
 
 #       github.com/docker/cli v24.0.7+incompatible
 # [1] git ls-remote https://github.com/docker/cli afdd53b4e341be38d2056a42113b938559bb1d94
 SRCREV_cli="afdd53b4e341be38d2056a42113b938559bb1d94"
-SRC_URI += "git://github.com/docker/cli;name=cli;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/cli"
+SRC_URI += "git://github.com/docker/cli;name=cli;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/cli"
 
 #       github.com/pkg/errors v0.9.1
 # [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a985424175c39b465
 SRCREV_errors="614d223910a179a466c1767a985424175c39b465"
-SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pkg/errors"
+SRC_URI += "git://github.com/pkg/errors;name=errors;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pkg/errors"
 
 #       github.com/fatih/color v1.16.0
 # [1] git ls-remote https://github.com/fatih/color 0f9779ed479afd460f0c2cc5a3d3eb69b9ba188b
 SRCREV_color="0f9779ed479afd460f0c2cc5a3d3eb69b9ba188b"
-SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fatih/color"
+SRC_URI += "git://github.com/fatih/color;name=color;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fatih/color"
 
 #       github.com/ipfs/go-cid v0.4.1
 # [1] git ls-remote https://github.com/ipfs/go-cid d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7
 SRCREV_go-cid="d46e7f28669cd2c463bc68fe86e7dbe4f8240ab7"
-SRC_URI += "git://github.com/ipfs/go-cid;name=go-cid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/ipfs/go-cid"
+SRC_URI += "git://github.com/ipfs/go-cid;name=go-cid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/ipfs/go-cid"
 
 #       github.com/spf13/cobra v1.8.0
 # [1] git ls-remote https://github.com/spf13/cobra a0a6ae020bb3899ff0276067863e50523f897370
 SRCREV_cobra="a0a6ae020bb3899ff0276067863e50523f897370"
-SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/cobra"
+SRC_URI += "git://github.com/spf13/cobra;name=cobra;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/cobra"
 
 #       github.com/spf13/pflag v1.0.5
 # [1] git ls-remote https://github.com/spf13/pflag 2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab
 SRCREV_pflag="2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
-SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spf13/pflag"
+SRC_URI += "git://github.com/spf13/pflag;name=pflag;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spf13/pflag"
 
 #       github.com/cilium/ebpf v0.11.0
 # [1] git ls-remote https://github.com/cilium/ebpf 270c859894bd38cdd0c7783317b16343409e4df8
 SRCREV_ebpf="270c859894bd38cdd0c7783317b16343409e4df8"
-SRC_URI += "git://github.com/cilium/ebpf;name=ebpf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cilium/ebpf"
+SRC_URI += "git://github.com/cilium/ebpf;name=ebpf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cilium/ebpf"
 
 #       github.com/google/uuid v1.6.0
 # [1] git ls-remote https://github.com/google/uuid 0f11ee6918f41a04c201eceeadf612a377bc7fbc
 SRCREV_uuid="0f11ee6918f41a04c201eceeadf612a377bc7fbc"
-SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/uuid"
+SRC_URI += "git://github.com/google/uuid;name=uuid;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/uuid"
 
 #       github.com/moby/locker v1.0.1
 # [1] git ls-remote https://github.com/moby/locker 281af2d563954745bea9d1487c965f24d30742fe
 SRCREV_locker="281af2d563954745bea9d1487c965f24d30742fe"
-SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/locker"
+SRC_URI += "git://github.com/moby/locker;name=locker;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/locker"
 
 #       google.golang.org/grpc v1.59.0
 # [1] git ls-remote https://github.com/grpc/grpc-go 7765221f4bf6104973db7946d56936cf838cad46
 SRCREV_grpc="7765221f4bf6104973db7946d56936cf838cad46"
-SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/grpc"
+SRC_URI += "git://github.com/grpc/grpc-go;name=grpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/grpc"
 
 #       github.com/go-logr/logr v1.3.0
 # [1] git ls-remote https://github.com/go-logr/logr 8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f
 SRCREV_logr="8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f"
-SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/logr"
+SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/logr"
 
 #       github.com/go-logr/stdr v1.2.2
 # [1] git ls-remote https://github.com/go-logr/stdr 521af2addfa7c81c8a65d0e85ed34bb6bb6dc262
 SRCREV_stdr="521af2addfa7c81c8a65d0e85ed34bb6bb6dc262"
-SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/stdr"
+SRC_URI += "git://github.com/go-logr/stdr;name=stdr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/stdr"
 
 #       github.com/miekg/pkcs11 v1.1.1
 # [1] git ls-remote https://github.com/miekg/pkcs11 f3481918a208bd212aa995a41f92d786eb418a7d
 SRCREV_pkcs11="f3481918a208bd212aa995a41f92d786eb418a7d"
-SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/miekg/pkcs11"
+SRC_URI += "git://github.com/miekg/pkcs11;name=pkcs11;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/miekg/pkcs11"
 
 #       github.com/tinylib/msgp v1.1.6
 # [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b486e350b4d105da6d8b
 SRCREV_msgp="205265da651409c54677b486e350b4d105da6d8b"
-SRC_URI += "git://github.com/tinylib/msgp;name=msgp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tinylib/msgp"
+SRC_URI += "git://github.com/tinylib/msgp;name=msgp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tinylib/msgp"
 
 #       lukechampine.com/blake3 v1.1.7
 # [1] git ls-remote https://github.com/lukechampine/blake3 bb7ece4161ea910c6c385c17799b17d658075fcd
 SRCREV_blake3="bb7ece4161ea910c6c385c17799b17d658075fcd"
-SRC_URI += "git://github.com/lukechampine/blake3;name=blake3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/lukechampine.com/blake3"
+SRC_URI += "git://github.com/lukechampine/blake3;name=blake3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/lukechampine.com/blake3"
 
 #       github.com/docker/docker v24.0.7+incompatible
 # [1] git ls-remote https://github.com/moby/moby 311b9ff0aa93aa55880e1e5f8871c4fb69583426
 SRCREV_docker="311b9ff0aa93aa55880e1e5f8871c4fb69583426"
-SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker"
+SRC_URI += "git://github.com/moby/moby;name=docker;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker"
 
 #       github.com/tidwall/gjson v1.17.1
 # [1] git ls-remote https://github.com/tidwall/gjson bbf40bb0e4f47860677c7115b2eaa5b3413ce23e
 SRCREV_gjson="bbf40bb0e4f47860677c7115b2eaa5b3413ce23e"
-SRC_URI += "git://github.com/tidwall/gjson;name=gjson;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/gjson"
+SRC_URI += "git://github.com/tidwall/gjson;name=gjson;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tidwall/gjson"
 
 #       github.com/moby/sys/user v0.1.0
 # [1] git ls-remote https://github.com/moby/sys c0711cde08c8fa33857a2c28721659267f49b5e2
 SRCREV_user="c0711cde08c8fa33857a2c28721659267f49b5e2"
-SRC_URI += "git://github.com/moby/sys;name=user;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/user"
+SRC_URI += "git://github.com/moby/sys;name=user;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/user"
 
 #       github.com/gogo/protobuf v1.3.2
 # [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede29f62fe3ce239267c1bc
 SRCREV_protobuf="b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
-SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/gogo/protobuf"
+SRC_URI += "git://github.com/gogo/protobuf;name=protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/gogo/protobuf"
 
 #       github.com/google/go-cmp v0.6.0
 # [1] git ls-remote https://github.com/google/go-cmp c3ad8435e7bef96af35732bc0789e5a2278c6d5f
 SRCREV_go-cmp="c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
-SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp"
+SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/go-cmp"
 
 #       github.com/imdario/mergo v0.3.16
 # [1] git ls-remote https://github.com/darccio/mergo 14fe2b165b83359196f820886a2b24f2771729e9
 SRCREV_mergo="14fe2b165b83359196f820886a2b24f2771729e9"
-SRC_URI += "git://github.com/darccio/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/imdario/mergo"
+SRC_URI += "git://github.com/darccio/mergo;name=mergo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/imdario/mergo"
 
 #       github.com/philhofer/fwd v1.1.1
 # [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a132ec243ba944efdb644
 SRCREV_fwd="9bcb9cab1b0394d8516a132ec243ba944efdb644"
-SRC_URI += "git://github.com/philhofer/fwd;name=fwd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/philhofer/fwd"
+SRC_URI += "git://github.com/philhofer/fwd;name=fwd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/philhofer/fwd"
 
 #       github.com/tidwall/match v1.1.1
 # [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf
 SRCREV_match="4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
-SRC_URI += "git://github.com/tidwall/match;name=match;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/match"
+SRC_URI += "git://github.com/tidwall/match;name=match;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tidwall/match"
 
 #       go.opentelemetry.io/otel v1.19.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_otel="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=otel;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel"
 
 #       github.com/containerd/log v0.1.0
 # [1] git ls-remote https://github.com/containerd/log 0fc1e28871fdf2786e2cc51bbe4133db6547a199
 SRCREV_log="0fc1e28871fdf2786e2cc51bbe4133db6547a199"
-SRC_URI += "git://github.com/containerd/log;name=log;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/log"
+SRC_URI += "git://github.com/containerd/log;name=log;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/log"
 
 #       github.com/moby/sys/mount v0.3.3
 # [1] git ls-remote https://github.com/moby/sys 416188aff8404d549e1e34a50e513befeb11c3b9
 SRCREV_mount="416188aff8404d549e1e34a50e513befeb11c3b9"
-SRC_URI += "git://github.com/moby/sys;name=mount;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mount"
+SRC_URI += "git://github.com/moby/sys;name=mount;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/mount"
 
 #       github.com/djherbis/times v1.5.0
 # [1] git ls-remote https://github.com/djherbis/times a1edc5dc082a710e4a808e99c78989b8d04e3025
 SRCREV_times="a1edc5dc082a710e4a808e99c78989b8d04e3025"
-SRC_URI += "git://github.com/djherbis/times;name=times;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/djherbis/times"
+SRC_URI += "git://github.com/djherbis/times;name=times;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/djherbis/times"
 
 #       github.com/godbus/dbus/v5 v5.1.0
 # [1] git ls-remote https://github.com/godbus/dbus e523abc905595cf17fb0001a7d77eaaddfaa216d
 SRCREV_v5="e523abc905595cf17fb0001a7d77eaaddfaa216d"
-SRC_URI += "git://github.com/godbus/dbus;name=v5;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/godbus/dbus/v5"
+SRC_URI += "git://github.com/godbus/dbus;name=v5;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/godbus/dbus/v5"
 
 #       github.com/mr-tron/base58 v1.2.0
 # [1] git ls-remote https://github.com/mr-tron/base58 cd0e5141f51dfcadb8311fd8e495eb11126a8010
 SRCREV_base58="cd0e5141f51dfcadb8311fd8e495eb11126a8010"
-SRC_URI += "git://github.com/mr-tron/base58;name=base58;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mr-tron/base58"
+SRC_URI += "git://github.com/mr-tron/base58;name=base58;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mr-tron/base58"
 
 #       github.com/tidwall/pretty v1.2.0
 # [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a854b85675801362cbdaa2
 SRCREV_pretty="aaa765e7476acb0028a854b85675801362cbdaa2"
-SRC_URI += "git://github.com/tidwall/pretty;name=pretty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/tidwall/pretty"
+SRC_URI += "git://github.com/tidwall/pretty;name=pretty;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/tidwall/pretty"
 
 #       github.com/containerd/fifo v1.1.0
 # [1] git ls-remote https://github.com/containerd/fifo 151b205263c29d471e0d55c787d2ce9f5343fd46
 SRCREV_fifo="151b205263c29d471e0d55c787d2ce9f5343fd46"
-SRC_URI += "git://github.com/containerd/fifo;name=fifo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/fifo"
+SRC_URI += "git://github.com/containerd/fifo;name=fifo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/fifo"
 
 #       github.com/docker/go-units v0.5.0
 # [1] git ls-remote https://github.com/docker/go-units e682442797b36348f8e1f98defdbf32bac0b6c6f
 SRCREV_go-units="e682442797b36348f8e1f98defdbf32bac0b6c6f"
-SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-units"
+SRC_URI += "git://github.com/docker/go-units;name=go-units;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-units"
 
 #       github.com/mattn/go-isatty v0.0.20
 # [1] git ls-remote https://github.com/mattn/go-isatty a7c02353c47bc4ec6b30dc9628154ae4fe760c11
 SRCREV_go-isatty="a7c02353c47bc4ec6b30dc9628154ae4fe760c11"
-SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-isatty"
+SRC_URI += "git://github.com/mattn/go-isatty;name=go-isatty;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-isatty"
 
 #       github.com/moby/sys/signal v0.7.0
 # [1] git ls-remote https://github.com/moby/sys b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5
 SRCREV_signal="b8d8fabf1fa5cf0de7c1a1729145eee854ea31f5"
-SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/signal"
+SRC_URI += "git://github.com/moby/sys;name=signal;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/signal"
 
 #       github.com/yuchanns/srslog v1.1.0
 # [1] git ls-remote https://github.com/yuchanns/srslog becd9b11119269a7928ae89fde90784335c1d016
 SRCREV_srslog="becd9b11119269a7928ae89fde90784335c1d016"
-SRC_URI += "git://github.com/yuchanns/srslog;name=srslog;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/yuchanns/srslog"
+SRC_URI += "git://github.com/yuchanns/srslog;name=srslog;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/yuchanns/srslog"
 
 #       github.com/golang/protobuf v1.5.3
 # [1] git ls-remote https://github.com/golang/protobuf 5d5e8c018a13017f9d5b8bf4fad64aaa42a87308
 SRCREV_golang-protobuf="5d5e8c018a13017f9d5b8bf4fad64aaa42a87308"
-SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/protobuf"
+SRC_URI += "git://github.com/golang/protobuf;name=golang-protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/protobuf"
 
 #       github.com/sirupsen/logrus v1.9.3
 # [1] git ls-remote https://github.com/sirupsen/logrus d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
 SRCREV_logrus="d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd"
-SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/sirupsen/logrus"
+SRC_URI += "git://github.com/sirupsen/logrus;name=logrus;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/sirupsen/logrus"
 
 #       google.golang.org/genproto v0.0.0-20231012201019-e917dd12ba7a
 # [1] git ls-remote https://github.com/googleapis/go-genproto e917dd12ba7ad5f78e3112f832eeda0f94ca8fd4
 SRCREV_genproto="e917dd12ba7ad5f78e3112f832eeda0f94ca8fd4"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=genproto;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto"
 
 #       google.golang.org/protobuf v1.31.0
 # [1] git ls-remote https://github.com/protocolbuffers/protobuf-go 68463f0e96c93bc19ef36ccd3adfe690bfdb568c
 SRCREV_google.golang.org-protobuf="68463f0e96c93bc19ef36ccd3adfe690bfdb568c"
-SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/protobuf"
+SRC_URI += "git://github.com/protocolbuffers/protobuf-go;name=google.golang.org-protobuf;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/protobuf"
 
 #       github.com/bmizerany/assert v0.0.0-20160611221934-b7ed37b82869
 # [1] git ls-remote https://github.com/bmizerany/assert b7ed37b82869576c289d7d97fb2bbd8b64a0cb28
 SRCREV_assert="b7ed37b82869576c289d7d97fb2bbd8b64a0cb28"
-SRC_URI += "git://github.com/bmizerany/assert;name=assert;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/bmizerany/assert"
+SRC_URI += "git://github.com/bmizerany/assert;name=assert;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/bmizerany/assert"
 
 #       github.com/containerd/ttrpc v1.2.2
 # [1] git ls-remote https://github.com/containerd/ttrpc ac26f8cbea1c440d451dd19a4a1b847fd073f3c3
 SRCREV_ttrpc="ac26f8cbea1c440d451dd19a4a1b847fd073f3c3"
-SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/ttrpc"
+SRC_URI += "git://github.com/containerd/ttrpc;name=ttrpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/ttrpc"
 
 #       github.com/docker/go-events v0.0.0-20190806004212-e31b211e4f1c
 # [1] git ls-remote https://github.com/docker/go-events e31b211e4f1cd09aa76fe4ac244571fab96ae47f
 SRCREV_go-events="e31b211e4f1cd09aa76fe4ac244571fab96ae47f"
-SRC_URI += "git://github.com/docker/go-events;name=go-events;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-events"
+SRC_URI += "git://github.com/docker/go-events;name=go-events;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-events"
 
 #       github.com/moby/sys/symlink v0.2.0
 # [1] git ls-remote https://github.com/moby/sys 03b9f8d59a07f5206a2264105f4903a222aea964
 SRCREV_symlink="03b9f8d59a07f5206a2264105f4903a222aea964"
-SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/symlink"
+SRC_URI += "git://github.com/moby/sys;name=symlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/symlink"
 
 #       github.com/vbatts/tar-split v0.11.5
 # [1] git ls-remote https://github.com/vbatts/tar-split 5ef0dd8243164ebacd755916a89d8085a5b6bb7f
 SRCREV_tar-split="5ef0dd8243164ebacd755916a89d8085a5b6bb7f"
-SRC_URI += "git://github.com/vbatts/tar-split;name=tar-split;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vbatts/tar-split"
+SRC_URI += "git://github.com/vbatts/tar-split;name=tar-split;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vbatts/tar-split"
 
 #       github.com/Microsoft/hcsshim v0.11.4
 # [1] git ls-remote https://github.com/microsoft/hcsshim b16edf62c1723deb948632261b445d0228d973e0
 SRCREV_hcsshim="b16edf62c1723deb948632261b445d0228d973e0"
-SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/hcsshim"
+SRC_URI += "git://github.com/microsoft/hcsshim;name=hcsshim;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Microsoft/hcsshim"
 
 #       github.com/containerd/go-cni v1.1.9
 # [1] git ls-remote https://github.com/containerd/go-cni 6603d5bd8941d7f2026bb5627f6aa4ff434f859a
 SRCREV_go-cni="6603d5bd8941d7f2026bb5627f6aa4ff434f859a"
-SRC_URI += "git://github.com/containerd/go-cni;name=go-cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/go-cni"
+SRC_URI += "git://github.com/containerd/go-cni;name=go-cni;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/go-cni"
 
 #       github.com/vishvananda/netns v0.0.4
 # [1] git ls-remote https://github.com/vishvananda/netns 7a452d2d15292b2bfb2a2d88e6bdeac156a761b9
 SRCREV_netns="7a452d2d15292b2bfb2a2d88e6bdeac156a761b9"
-SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netns"
+SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vishvananda/netns"
 
 #       github.com/Azure/go-ansiterm v0.0.0-20210617225240-d185dfc1b5a1
 # [1] git ls-remote https://github.com/Azure/go-ansiterm d185dfc1b5a126116ea5a19e148e29d16b4574c9
 SRCREV_go-ansiterm="d185dfc1b5a126116ea5a19e148e29d16b4574c9"
-SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Azure/go-ansiterm"
+SRC_URI += "git://github.com/Azure/go-ansiterm;name=go-ansiterm;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Azure/go-ansiterm"
 
 #       github.com/felixge/httpsnoop v1.0.3
 # [1] git ls-remote https://github.com/felixge/httpsnoop ef9fc62cdc3cc5abc33d6018fe1324890bb48145
 SRCREV_httpsnoop="ef9fc62cdc3cc5abc33d6018fe1324890bb48145"
-SRC_URI += "git://github.com/felixge/httpsnoop;name=httpsnoop;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/felixge/httpsnoop"
+SRC_URI += "git://github.com/felixge/httpsnoop;name=httpsnoop;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/felixge/httpsnoop"
 
 #       github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da
 # [1] git ls-remote https://github.com/golang/groupcache 41bb18bfe9da5321badc438f91158cd790a33aa3
 SRCREV_groupcache="41bb18bfe9da5321badc438f91158cd790a33aa3"
-SRC_URI += "git://github.com/golang/groupcache;name=groupcache;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/golang/groupcache"
+SRC_URI += "git://github.com/golang/groupcache;name=groupcache;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/golang/groupcache"
 
 #       github.com/hashicorp/errwrap v1.1.0
 # [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14dd0caaacbd13e76254d02c0
 SRCREV_errwrap="7b00e5db719c64d14dd0caaacbd13e76254d02c0"
-SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/errwrap"
+SRC_URI += "git://github.com/hashicorp/errwrap;name=errwrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/errwrap"
 
 #       github.com/minio/sha256-simd v1.0.1
 # [1] git ls-remote https://github.com/minio/sha256-simd 6096f891a77bfe490cbea7a424c821b5fdb92849
 SRCREV_sha256-simd="6096f891a77bfe490cbea7a424c821b5fdb92849"
-SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/minio/sha256-simd"
+SRC_URI += "git://github.com/minio/sha256-simd;name=sha256-simd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/minio/sha256-simd"
 
 #       github.com/pelletier/go-toml v1.9.5
 # [1] git ls-remote https://github.com/pelletier/go-toml fed1464066413075eac02cd4dc368b5221845541
 SRCREV_go-toml="fed1464066413075eac02cd4dc368b5221845541"
-SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml"
+SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pelletier/go-toml"
 
 #       github.com/spaolacci/murmur3 v1.1.0
 # [1] git ls-remote https://github.com/spaolacci/murmur3 f09979ecbc725b9e6d41a297405f65e7e8804acc
 SRCREV_murmur3="f09979ecbc725b9e6d41a297405f65e7e8804acc"
-SRC_URI += "git://github.com/spaolacci/murmur3;name=murmur3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/spaolacci/murmur3"
+SRC_URI += "git://github.com/spaolacci/murmur3;name=murmur3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/spaolacci/murmur3"
 
 #       github.com/Microsoft/go-winio v0.6.1
 # [1] git ls-remote https://github.com/microsoft/go-winio 070c828abb873da9e71c7247740253b50f7cf049
 SRCREV_go-winio="070c828abb873da9e71c7247740253b50f7cf049"
-SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Microsoft/go-winio"
+SRC_URI += "git://github.com/microsoft/go-winio;name=go-winio;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Microsoft/go-winio"
 
 #       github.com/containerd/console v1.0.4
 # [1] git ls-remote https://github.com/containerd/console 8f6c4e4faef5a326d2cd907097d04c0239ee5e2f
 SRCREV_console="8f6c4e4faef5a326d2cd907097d04c0239ee5e2f"
-SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/console"
+SRC_URI += "git://github.com/containerd/console;name=console;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/console"
 
 #       github.com/coreos/go-iptables v0.7.0
 # [1] git ls-remote https://github.com/coreos/go-iptables b9dff5a19d9c3925da3f9b3c0a705de6c1fdc56c
 SRCREV_go-iptables="b9dff5a19d9c3925da3f9b3c0a705de6c1fdc56c"
-SRC_URI += "git://github.com/coreos/go-iptables;name=go-iptables;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-iptables"
+SRC_URI += "git://github.com/coreos/go-iptables;name=go-iptables;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-iptables"
 
 #       github.com/containerd/cgroups v1.1.0
 # [1] git ls-remote https://github.com/containerd/cgroups fe7323f622bc222e72473679f12a9089aeeda177
 SRCREV_cgroups="fe7323f622bc222e72473679f12a9089aeeda177"
-SRC_URI += "git://github.com/containerd/cgroups;name=cgroups;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups"
+SRC_URI += "git://github.com/containerd/cgroups;name=cgroups;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/cgroups"
 
 #       github.com/containerd/go-runc v1.0.0
 # [1] git ls-remote https://github.com/containerd/go-runc 16b287bc67d069a60fa48db15f330b790b74365b
 SRCREV_go-runc="16b287bc67d069a60fa48db15f330b790b74365b"
-SRC_URI += "git://github.com/containerd/go-runc;name=go-runc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/go-runc"
+SRC_URI += "git://github.com/containerd/go-runc;name=go-runc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/go-runc"
 
 #       github.com/containerd/typeurl v1.0.3-0.20220422153119-7f6e6d160d67
 # [1] git ls-remote https://github.com/containerd/typeurl 7f6e6d160d675241af388d5cf1b90814786bac40
 SRCREV_typeurl="7f6e6d160d675241af388d5cf1b90814786bac40"
-SRC_URI += "git://github.com/containerd/typeurl;name=typeurl;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl"
+SRC_URI += "git://github.com/containerd/typeurl;name=typeurl;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/typeurl"
 
 #       github.com/go-jose/go-jose/v3 v3.0.1
 # [1] git ls-remote https://github.com/go-jose/go-jose 47edce0854d533ac27795c9befd90b1f7ef87554
 SRCREV_go-jose-v3="47edce0854d533ac27795c9befd90b1f7ef87554"
-SRC_URI += "git://github.com/go-jose/go-jose;name=go-jose-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-jose/go-jose/v3"
+SRC_URI += "git://github.com/go-jose/go-jose;name=go-jose-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-jose/go-jose/v3"
 
 #       github.com/klauspost/compress v1.17.6
 # [1] git ls-remote https://github.com/klauspost/compress 255a13270e4608f2f2b97166d92f297de906c951
 SRCREV_compress="255a13270e4608f2f2b97166d92f297de906c951"
-SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/compress"
+SRC_URI += "git://github.com/klauspost/compress;name=compress;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/klauspost/compress"
 
 #       github.com/klauspost/cpuid/v2 v2.2.3
 # [1] git ls-remote https://github.com/klauspost/cpuid 3c0ec06adeb260a595bfb1dff123742e8bac34fb
 SRCREV_cpuid-v2="3c0ec06adeb260a595bfb1dff123742e8bac34fb"
-SRC_URI += "git://github.com/klauspost/cpuid;name=cpuid-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/klauspost/cpuid/v2"
+SRC_URI += "git://github.com/klauspost/cpuid;name=cpuid-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/klauspost/cpuid/v2"
 
 #       github.com/mattn/go-colorable v0.1.13
 # [1] git ls-remote https://github.com/mattn/go-colorable 11a925cff3d38c293ddc8c05a16b504e3e2c63be
 SRCREV_go-colorable="11a925cff3d38c293ddc8c05a16b504e3e2c63be"
-SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-colorable"
+SRC_URI += "git://github.com/mattn/go-colorable;name=go-colorable;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-colorable"
 
 #       github.com/moby/sys/mountinfo v0.7.1
 # [1] git ls-remote https://github.com/moby/sys 4950d7687cf6c9b138dc0e18c2c7351e1f6ed497
 SRCREV_mountinfo="4950d7687cf6c9b138dc0e18c2c7351e1f6ed497"
-SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/mountinfo"
+SRC_URI += "git://github.com/moby/sys;name=mountinfo;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/mountinfo"
 
 #       github.com/containerd/imgcrypt v1.1.9
 # [1] git ls-remote https://github.com/containerd/imgcrypt 90513b079771363133611a91de350ea932e09b26
 SRCREV_imgcrypt="90513b079771363133611a91de350ea932e09b26"
-SRC_URI += "git://github.com/containerd/imgcrypt;name=imgcrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/imgcrypt"
+SRC_URI += "git://github.com/containerd/imgcrypt;name=imgcrypt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/imgcrypt"
 
 #       github.com/muesli/cancelreader v0.2.2
 # [1] git ls-remote https://github.com/muesli/cancelreader d11f1e77abf7f8d69d81553ccaaf0b81163541a6
 SRCREV_cancelreader="d11f1e77abf7f8d69d81553ccaaf0b81163541a6"
-SRC_URI += "git://github.com/muesli/cancelreader;name=cancelreader;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/muesli/cancelreader"
+SRC_URI += "git://github.com/muesli/cancelreader;name=cancelreader;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/muesli/cancelreader"
 
 #       github.com/vishvananda/netlink v1.2.1-beta.2
 # [1] git ls-remote https://github.com/vishvananda/netlink 5e915e0149386ce3d02379ff93f4c0a5601779d5
 SRCREV_netlink="5e915e0149386ce3d02379ff93f4c0a5601779d5"
-SRC_URI += "git://github.com/vishvananda/netlink;name=netlink;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netlink"
+SRC_URI += "git://github.com/vishvananda/netlink;name=netlink;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vishvananda/netlink"
 
 #       github.com/containers/ocicrypt v1.1.9
 # [1] git ls-remote https://github.com/containers/ocicrypt c0e1fd5b82bc57acdb1a241dc602534eea42edb6
 SRCREV_ocicrypt="c0e1fd5b82bc57acdb1a241dc602534eea42edb6"
-SRC_URI += "git://github.com/containers/ocicrypt;name=ocicrypt;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containers/ocicrypt"
+SRC_URI += "git://github.com/containers/ocicrypt;name=ocicrypt;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containers/ocicrypt"
 
 #       github.com/mattn/go-shellwords v1.0.12
 # [1] git ls-remote https://github.com/mattn/go-shellwords 973b9d5391598d4ee601db46fa32f6e186a356ac
 SRCREV_go-shellwords="973b9d5391598d4ee601db46fa32f6e186a356ac"
-SRC_URI += "git://github.com/mattn/go-shellwords;name=go-shellwords;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mattn/go-shellwords"
+SRC_URI += "git://github.com/mattn/go-shellwords;name=go-shellwords;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mattn/go-shellwords"
 
 #       github.com/moby/sys/sequential v0.5.0
 # [1] git ls-remote https://github.com/moby/sys b22ba8a69b306f0b4adbbe2a529457e6283ed9f7
 SRCREV_sequential="b22ba8a69b306f0b4adbbe2a529457e6283ed9f7"
-SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/moby/sys/sequential"
+SRC_URI += "git://github.com/moby/sys;name=sequential;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/moby/sys/sequential"
 
 #       go.opentelemetry.io/otel/trace v1.19.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_trace="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/trace"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=trace;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/trace"
 
 #       github.com/containerd/platforms v0.1.1
 # [1] git ls-remote https://github.com/containerd/platforms db76a43eaea9a004a5f240620f966b0081123884
 SRCREV_platforms="db76a43eaea9a004a5f240620f966b0081123884"
-SRC_URI += "git://github.com/containerd/platforms;name=platforms;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/platforms"
+SRC_URI += "git://github.com/containerd/platforms;name=platforms;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/platforms"
 
 #       github.com/pelletier/go-toml/v2 v2.1.1
 # [1] git ls-remote https://github.com/pelletier/go-toml 34765b4a9e937ab927b5bd57231e98c68fe13109
 SRCREV_go-toml-v2="34765b4a9e937ab927b5bd57231e98c68fe13109"
-SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/pelletier/go-toml/v2"
+SRC_URI += "git://github.com/pelletier/go-toml;name=go-toml-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/pelletier/go-toml/v2"
 
 #       github.com/mitchellh/go-homedir v1.1.0
 # [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf3004701891bf4fdb884bfe4920b3727
 SRCREV_go-homedir="af06845cf3004701891bf4fdb884bfe4920b3727"
-SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/go-homedir"
+SRC_URI += "git://github.com/mitchellh/go-homedir;name=go-homedir;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/go-homedir"
 
 #       github.com/xeipuuv/gojsonschema v1.2.0
 # [1] git ls-remote https://github.com/xeipuuv/gojsonschema 82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927
 SRCREV_gojsonschema="82fcdeb203eb6ab2a67d0a623d9c19e5e5a64927"
-SRC_URI += "git://github.com/xeipuuv/gojsonschema;name=gojsonschema;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonschema"
+SRC_URI += "git://github.com/xeipuuv/gojsonschema;name=gojsonschema;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xeipuuv/gojsonschema"
 
 #       go.opentelemetry.io/otel/metric v1.19.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go 60666c554065ac4da502fe28943eea4b938ab479
 SRCREV_metric="60666c554065ac4da502fe28943eea4b938ab479"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=metric;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/otel/metric"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go;name=metric;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/otel/metric"
 
 #       github.com/Masterminds/semver/v3 v3.2.1
 # [1] git ls-remote https://github.com/Masterminds/semver e06051f8fcc4c8b4a4990c337b9862a2448722e5
 SRCREV_v3="e06051f8fcc4c8b4a4990c337b9862a2448722e5"
-SRC_URI += "git://github.com/Masterminds/semver;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Masterminds/semver/v3"
+SRC_URI += "git://github.com/Masterminds/semver;name=v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/semver/v3"
 
 #       github.com/containerd/cgroups/v3 v3.0.3
 # [1] git ls-remote https://github.com/containerd/cgroups 1e056883d58ac58daf7566065a46016b4532f35c
 SRCREV_cgroups-v3="1e056883d58ac58daf7566065a46016b4532f35c"
-SRC_URI += "git://github.com/containerd/cgroups;name=cgroups-v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/cgroups/v3"
+SRC_URI += "git://github.com/containerd/cgroups;name=cgroups-v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/cgroups/v3"
 
 #       github.com/containerd/containerd v1.7.13
 # [1] git ls-remote https://github.com/containerd/containerd 7c3aca7a610df76212171d200ca3811ff6096eb8
 SRCREV_containerd="7c3aca7a610df76212171d200ca3811ff6096eb8"
-SRC_URI += "git://github.com/containerd/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/containerd"
+SRC_URI += "git://github.com/containerd/containerd;name=containerd;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/containerd"
 
 #       github.com/containerd/continuity v0.4.3
 # [1] git ls-remote https://github.com/containerd/continuity 1743d9104d944131cdedaba33a59d2f9bd80a6f2
 SRCREV_continuity="1743d9104d944131cdedaba33a59d2f9bd80a6f2"
-SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/continuity"
+SRC_URI += "git://github.com/containerd/continuity;name=continuity;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/continuity"
 
 #       github.com/containerd/typeurl/v2 v2.1.1
 # [1] git ls-remote https://github.com/containerd/typeurl 7ef6316b771f959cbb208b229e3423a466947df3
 SRCREV_v2="7ef6316b771f959cbb208b229e3423a466947df3"
-SRC_URI += "git://github.com/containerd/typeurl;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/typeurl/v2"
+SRC_URI += "git://github.com/containerd/typeurl;name=v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/typeurl/v2"
 
 #       github.com/coreos/go-systemd/v22 v22.5.0
 # [1] git ls-remote https://github.com/coreos/go-systemd d5623bf85e8e73ae6352f78ee6b55a287619dd4e
 SRCREV_v22="d5623bf85e8e73ae6352f78ee6b55a287619dd4e"
-SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/coreos/go-systemd/v22"
+SRC_URI += "git://github.com/coreos/go-systemd;name=v22;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/coreos/go-systemd/v22"
 
 #       github.com/docker/go-connections v0.5.0
 # [1] git ls-remote https://github.com/docker/go-connections fa09c952e3eadbffaf8afc5b8a1667158ba38ace
 SRCREV_go-connections="fa09c952e3eadbffaf8afc5b8a1667158ba38ace"
-SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/go-connections"
+SRC_URI += "git://github.com/docker/go-connections;name=go-connections;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/go-connections"
 
 #       github.com/xeipuuv/gojsonpointer v0.0.0-20190905194746-02993c407bfb
 # [1] git ls-remote https://github.com/xeipuuv/gojsonpointer 02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb
 SRCREV_gojsonpointer="02993c407bfbf5f6dae44c4f4b1cf6a39b5fc5bb"
-SRC_URI += "git://github.com/xeipuuv/gojsonpointer;name=gojsonpointer;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonpointer"
+SRC_URI += "git://github.com/xeipuuv/gojsonpointer;name=gojsonpointer;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xeipuuv/gojsonpointer"
 
 #       github.com/fahedouch/go-logrotate v0.2.0
 # [1] git ls-remote https://github.com/fahedouch/go-logrotate 6b28a8e09e886889e0bc4347e66bd4d4d82f5b10
 SRCREV_go-logrotate="6b28a8e09e886889e0bc4347e66bd4d4d82f5b10"
-SRC_URI += "git://github.com/fahedouch/go-logrotate;name=go-logrotate;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fahedouch/go-logrotate"
+SRC_URI += "git://github.com/fahedouch/go-logrotate;name=go-logrotate;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fahedouch/go-logrotate"
 
 #       github.com/mitchellh/mapstructure v1.5.0
 # [1] git ls-remote https://github.com/mitchellh/mapstructure ab69d8d93410fce4361f4912bb1ff88110a81311
 SRCREV_mapstructure="ab69d8d93410fce4361f4912bb1ff88110a81311"
-SRC_URI += "git://github.com/mitchellh/mapstructure;name=mapstructure;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mitchellh/mapstructure"
+SRC_URI += "git://github.com/mitchellh/mapstructure;name=mapstructure;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/mitchellh/mapstructure"
 
 #       github.com/distribution/reference v0.5.0
 # [1] git ls-remote https://github.com/distribution/reference 49c28499d219290c3226822e9cfcd4ede6d75379
 SRCREV_reference="49c28499d219290c3226822e9cfcd4ede6d75379"
-SRC_URI += "git://github.com/distribution/reference;name=reference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/distribution/reference"
+SRC_URI += "git://github.com/distribution/reference;name=reference;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/distribution/reference"
 
 #       github.com/multiformats/go-base32 v0.1.0
 # [1] git ls-remote https://github.com/multiformats/go-base32 a16b66327f327428b32b919939b8c93482507e1f
 SRCREV_go-base32="a16b66327f327428b32b919939b8c93482507e1f"
-SRC_URI += "git://github.com/multiformats/go-base32;name=go-base32;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-base32"
+SRC_URI += "git://github.com/multiformats/go-base32;name=go-base32;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-base32"
 
 #       github.com/multiformats/go-base36 v0.1.0
 # [1] git ls-remote https://github.com/multiformats/go-base36 dc4afa6ad3b0720f4a1b282776db2a59ca9c8be7
 SRCREV_go-base36="dc4afa6ad3b0720f4a1b282776db2a59ca9c8be7"
-SRC_URI += "git://github.com/multiformats/go-base36;name=go-base36;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-base36"
+SRC_URI += "git://github.com/multiformats/go-base36;name=go-base36;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-base36"
 
 #       github.com/multiformats/go-varint v0.0.6
 # [1] git ls-remote https://github.com/multiformats/go-varint a3ded45ab16ca9f2f2a516e68053ffa7ebd9bb0e
 SRCREV_go-varint="a3ded45ab16ca9f2f2a516e68053ffa7ebd9bb0e"
-SRC_URI += "git://github.com/multiformats/go-varint;name=go-varint;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-varint"
+SRC_URI += "git://github.com/multiformats/go-varint;name=go-varint;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-varint"
 
 #       github.com/opencontainers/selinux v1.11.0
 # [1] git ls-remote https://github.com/opencontainers/selinux b68c45eb2df48c6b0c949901ccda90c8e65fe677
 SRCREV_selinux="b68c45eb2df48c6b0c949901ccda90c8e65fe677"
-SRC_URI += "git://github.com/opencontainers/selinux;name=selinux;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/selinux"
+SRC_URI += "git://github.com/opencontainers/selinux;name=selinux;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/selinux"
 
 #       github.com/compose-spec/compose-go v1.20.2
 # [1] git ls-remote https://github.com/compose-spec/compose-go e390b9774ca100e1d75c8bc075054502783b48b8
 SRCREV_compose-go="e390b9774ca100e1d75c8bc075054502783b48b8"
-SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/compose-spec/compose-go"
+SRC_URI += "git://github.com/compose-spec/compose-go;name=compose-go;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/compose-spec/compose-go"
 
 #       github.com/containernetworking/cni v1.1.2
 # [1] git ls-remote https://github.com/containernetworking/cni 3363d143688bb83ca18489ac8b9dc204c1d49c4a
 SRCREV_cni="3363d143688bb83ca18489ac8b9dc204c1d49c4a"
-SRC_URI += "git://github.com/containernetworking/cni;name=cni;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/cni"
+SRC_URI += "git://github.com/containernetworking/cni;name=cni;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containernetworking/cni"
 
 #       github.com/hashicorp/go-multierror v1.1.1
 # [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec57696378079ecc3accd3d6f29401b3a0
 SRCREV_go-multierror="9974e9ec57696378079ecc3accd3d6f29401b3a0"
-SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/hashicorp/go-multierror"
+SRC_URI += "git://github.com/hashicorp/go-multierror;name=go-multierror;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/hashicorp/go-multierror"
 
 #       github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415
 # [1] git ls-remote https://github.com/xeipuuv/gojsonreference bd5ef7bd5415a7ac448318e64f11a24cd21e594b
 SRCREV_gojsonreference="bd5ef7bd5415a7ac448318e64f11a24cd21e594b"
-SRC_URI += "git://github.com/xeipuuv/gojsonreference;name=gojsonreference;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/xeipuuv/gojsonreference"
+SRC_URI += "git://github.com/xeipuuv/gojsonreference;name=gojsonreference;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/xeipuuv/gojsonreference"
 
 #       github.com/awslabs/soci-snapshotter v0.4.1
 # [1] git ls-remote https://github.com/awslabs/soci-snapshotter 34e069d90460f422c549b3a8994aa26820cf6544
 SRCREV_soci-snapshotter="34e069d90460f422c549b3a8994aa26820cf6544"
-SRC_URI += "git://github.com/awslabs/soci-snapshotter;name=soci-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/awslabs/soci-snapshotter"
+SRC_URI += "git://github.com/awslabs/soci-snapshotter;name=soci-snapshotter;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/awslabs/soci-snapshotter"
 
 #       github.com/opencontainers/go-digest v1.0.0
 # [1] git ls-remote https://github.com/opencontainers/go-digest ea51bea511f75cfa3ef6098cc253c5c3609b037a
 SRCREV_go-digest="ea51bea511f75cfa3ef6098cc253c5c3609b037a"
-SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/go-digest"
+SRC_URI += "git://github.com/opencontainers/go-digest;name=go-digest;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/go-digest"
 
 #       github.com/opencontainers/image-spec v1.1.0
 # [1] git ls-remote https://github.com/opencontainers/image-spec e7f7c0ca69b21688c3cea7c87a04e4503e6099e2
 SRCREV_image-spec="e7f7c0ca69b21688c3cea7c87a04e4503e6099e2"
-SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/image-spec"
+SRC_URI += "git://github.com/opencontainers/image-spec;name=image-spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/image-spec"
 
 #       github.com/AdaLogics/go-fuzz-headers v0.0.0-20230811130428-ced1acdcaa24
 # [1] git ls-remote https://github.com/AdaLogics/go-fuzz-headers ced1acdcaa24dc39c01b039fc37576c395f506cf
 SRCREV_go-fuzz-headers="ced1acdcaa24dc39c01b039fc37576c395f506cf"
-SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
+SRC_URI += "git://github.com/AdaLogics/go-fuzz-headers;name=go-fuzz-headers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/AdaLogics/go-fuzz-headers"
 
 #       github.com/inconshreveable/mousetrap v1.1.0
 # [1] git ls-remote https://github.com/inconshreveable/mousetrap 4e8053ee7ef85a6bd26368364a6d27f1641c1d21
 SRCREV_mousetrap="4e8053ee7ef85a6bd26368364a6d27f1641c1d21"
-SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/inconshreveable/mousetrap"
+SRC_URI += "git://github.com/inconshreveable/mousetrap;name=mousetrap;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/inconshreveable/mousetrap"
 
 #       github.com/multiformats/go-multiaddr v0.12.0
 # [1] git ls-remote https://github.com/multiformats/go-multiaddr 5dd793c6fc4935fad347429a48a168acc8073474
 SRCREV_go-multiaddr="5dd793c6fc4935fad347429a48a168acc8073474"
-SRC_URI += "git://github.com/multiformats/go-multiaddr;name=go-multiaddr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multiaddr"
+SRC_URI += "git://github.com/multiformats/go-multiaddr;name=go-multiaddr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multiaddr"
 
 #       github.com/multiformats/go-multibase v0.1.1
 # [1] git ls-remote https://github.com/multiformats/go-multibase c1bc15b22eedb45f9205f3b60ce5fcb8fca93e08
 SRCREV_go-multibase="c1bc15b22eedb45f9205f3b60ce5fcb8fca93e08"
-SRC_URI += "git://github.com/multiformats/go-multibase;name=go-multibase;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multibase"
+SRC_URI += "git://github.com/multiformats/go-multibase;name=go-multibase;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multibase"
 
 #       github.com/multiformats/go-multihash v0.2.1
 # [1] git ls-remote https://github.com/multiformats/go-multihash 16974ad98ab1fb19eb756919f55373b39cc80bec
 SRCREV_go-multihash="16974ad98ab1fb19eb756919f55373b39cc80bec"
-SRC_URI += "git://github.com/multiformats/go-multihash;name=go-multihash;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/multiformats/go-multihash"
+SRC_URI += "git://github.com/multiformats/go-multihash;name=go-multihash;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/multiformats/go-multihash"
 
 #       github.com/stefanberger/go-pkcs11uri v0.0.0-20201008174630-78d3cae3a980
 # [1] git ls-remote https://github.com/stefanberger/go-pkcs11uri 78d3cae3a9805d89aa4fa80a362ca944c89a1b99
 SRCREV_go-pkcs11uri="78d3cae3a9805d89aa4fa80a362ca944c89a1b99"
-SRC_URI += "git://github.com/stefanberger/go-pkcs11uri;name=go-pkcs11uri;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/stefanberger/go-pkcs11uri"
+SRC_URI += "git://github.com/stefanberger/go-pkcs11uri;name=go-pkcs11uri;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/stefanberger/go-pkcs11uri"
 
 #       github.com/cyphar/filepath-securejoin v0.2.4
 # [1] git ls-remote https://github.com/cyphar/filepath-securejoin 2710d06c5b4ba3168beffa0689798d2db12e8ac4
 SRCREV_filepath-securejoin="2710d06c5b4ba3168beffa0689798d2db12e8ac4"
-SRC_URI += "git://github.com/cyphar/filepath-securejoin;name=filepath-securejoin;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/cyphar/filepath-securejoin"
+SRC_URI += "git://github.com/cyphar/filepath-securejoin;name=filepath-securejoin;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/cyphar/filepath-securejoin"
 
 #       github.com/containernetworking/plugins v1.4.0
 # [1] git ls-remote https://github.com/containernetworking/plugins 1fb5bf669e42cd208008e52d45b41fe2c3eb8dbc
 SRCREV_plugins="1fb5bf669e42cd208008e52d45b41fe2c3eb8dbc"
-SRC_URI += "git://github.com/containernetworking/plugins;name=plugins;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containernetworking/plugins"
+SRC_URI += "git://github.com/containernetworking/plugins;name=plugins;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containernetworking/plugins"
 
 #       github.com/fluent/fluent-logger-golang v1.9.0
 # [1] git ls-remote https://github.com/fluent/fluent-logger-golang 5538e904aeb515c10a624da620581bdf420d4b8a
 SRCREV_fluent-logger-golang="5538e904aeb515c10a624da620581bdf420d4b8a"
-SRC_URI += "git://github.com/fluent/fluent-logger-golang;name=fluent-logger-golang;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/fluent/fluent-logger-golang"
+SRC_URI += "git://github.com/fluent/fluent-logger-golang;name=fluent-logger-golang;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/fluent/fluent-logger-golang"
 
 #       github.com/opencontainers/runtime-spec v1.2.0
 # [1] git ls-remote https://github.com/opencontainers/runtime-spec 36852b0d072a4b5da675300a9e73bc4b0853f5c6
 SRCREV_runtime-spec="36852b0d072a4b5da675300a9e73bc4b0853f5c6"
-SRC_URI += "git://github.com/opencontainers/runtime-spec;name=runtime-spec;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/opencontainers/runtime-spec"
+SRC_URI += "git://github.com/opencontainers/runtime-spec;name=runtime-spec;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/opencontainers/runtime-spec"
 
 #       github.com/AdamKorcz/go-118-fuzz-build v0.0.0-20230306123547-8075edf89bb0
 # [1] git ls-remote https://github.com/AdamKorcz/go-118-fuzz-build 8075edf89bb034603c758f28fe93143047ac5677
 SRCREV_go-118-fuzz-build="8075edf89bb034603c758f28fe93143047ac5677"
-SRC_URI += "git://github.com/AdamKorcz/go-118-fuzz-build;name=go-118-fuzz-build;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/AdamKorcz/go-118-fuzz-build"
+SRC_URI += "git://github.com/AdamKorcz/go-118-fuzz-build;name=go-118-fuzz-build;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/AdamKorcz/go-118-fuzz-build"
 
 #       github.com/containerd/nydus-snapshotter v0.13.7
 # [1] git ls-remote https://github.com/containerd/nydus-snapshotter 3fcac86ccfe192b34e8605de9e26b9f40150c8cb
 SRCREV_nydus-snapshotter="3fcac86ccfe192b34e8605de9e26b9f40150c8cb"
-SRC_URI += "git://github.com/containerd/nydus-snapshotter;name=nydus-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/nydus-snapshotter"
+SRC_URI += "git://github.com/containerd/nydus-snapshotter;name=nydus-snapshotter;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/nydus-snapshotter"
 
 #       github.com/containerd/stargz-snapshotter v0.15.1
 # [1] git ls-remote https://github.com/containerd/stargz-snapshotter 64ab83bd65cd4a763e262955984232cc5ddfeb3f
 SRCREV_stargz-snapshotter="64ab83bd65cd4a763e262955984232cc5ddfeb3f"
-SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=stargz-snapshotter;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=stargz-snapshotter;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/stargz-snapshotter"
 
 #       google.golang.org/genproto/googleapis/rpc v0.0.0-20231016165738-49dd2c1f3d0b
 # [1] git ls-remote https://github.com/googleapis/go-genproto 49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846
 SRCREV_rpc="49dd2c1f3d0bf0f025ccaf8eeaaad902e3c63846"
-SRC_URI += "git://github.com/googleapis/go-genproto;name=rpc;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/google.golang.org/genproto/googleapis/rpc"
+SRC_URI += "git://github.com/googleapis/go-genproto;name=rpc;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/google.golang.org/genproto/googleapis/rpc"
 
 #       github.com/rootless-containers/bypass4netns v0.4.0
 # [1] git ls-remote https://github.com/rootless-containers/bypass4netns 3385f1f32437dba4300a2bdf1567a7ece939f9b9
 SRCREV_bypass4netns="3385f1f32437dba4300a2bdf1567a7ece939f9b9"
-SRC_URI += "git://github.com/rootless-containers/bypass4netns;name=bypass4netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/bypass4netns"
+SRC_URI += "git://github.com/rootless-containers/bypass4netns;name=bypass4netns;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rootless-containers/bypass4netns"
 
 #       github.com/docker/docker-credential-helpers v0.7.0
 # [1] git ls-remote https://github.com/docker/docker-credential-helpers ac5992b5f4756fc0398a7d0c93c609e624368bde
 SRCREV_docker-credential-helpers="ac5992b5f4756fc0398a7d0c93c609e624368bde"
-SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/docker/docker-credential-helpers"
+SRC_URI += "git://github.com/docker/docker-credential-helpers;name=docker-credential-helpers;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/docker/docker-credential-helpers"
 
 #       github.com/containerd/stargz-snapshotter/ipfs v0.15.1
 # [1] git ls-remote https://github.com/containerd/stargz-snapshotter 64ab83bd65cd4a763e262955984232cc5ddfeb3f
 SRCREV_ipfs="64ab83bd65cd4a763e262955984232cc5ddfeb3f"
-SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=ipfs;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter/ipfs"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=ipfs;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/stargz-snapshotter/ipfs"
 
 #       github.com/rootless-containers/rootlesskit/v2 v2.0.1
 # [1] git ls-remote https://github.com/rootless-containers/rootlesskit 5e9cd7880619a3c0a675e6a41d9562b6839066ee
 SRCREV_rootlesskit-v2="5e9cd7880619a3c0a675e6a41d9562b6839066ee"
-SRC_URI += "git://github.com/rootless-containers/rootlesskit;name=rootlesskit-v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rootless-containers/rootlesskit/v2"
+SRC_URI += "git://github.com/rootless-containers/rootlesskit;name=rootlesskit-v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/rootless-containers/rootlesskit/v2"
 
 #       github.com/containerd/stargz-snapshotter/estargz v0.15.1
 # [1] git ls-remote https://github.com/containerd/stargz-snapshotter 64ab83bd65cd4a763e262955984232cc5ddfeb3f
 SRCREV_estargz="64ab83bd65cd4a763e262955984232cc5ddfeb3f"
-SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=estargz;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/stargz-snapshotter/estargz"
+SRC_URI += "git://github.com/containerd/stargz-snapshotter;name=estargz;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/stargz-snapshotter/estargz"
 
 #       github.com/containerd/accelerated-container-image v1.0.2
 # [1] git ls-remote https://github.com/containerd/accelerated-container-image 526b680966031d9e07371894e1de68cbf9ae6282
 SRCREV_accelerated-container-image="526b680966031d9e07371894e1de68cbf9ae6282"
-SRC_URI += "git://github.com/containerd/accelerated-container-image;name=accelerated-container-image;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/containerd/accelerated-container-image"
+SRC_URI += "git://github.com/containerd/accelerated-container-image;name=accelerated-container-image;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/containerd/accelerated-container-image"
 
 #       go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.45.0
 # [1] git ls-remote https://github.com/open-telemetry/opentelemetry-go-contrib 9d4eb7e7706038b07d33f83f76afbe13f53d171d
 SRCREV_otelhttp="9d4eb7e7706038b07d33f83f76afbe13f53d171d"
-SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
+SRC_URI += "git://github.com/open-telemetry/opentelemetry-go-contrib;name=otelhttp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp"
 
diff --git a/recipes-containers/podman-tui/podman-tui_git.bb b/recipes-containers/podman-tui/podman-tui_git.bb
index 210f4f5b..2ae8ce18 100644
--- a/recipes-containers/podman-tui/podman-tui_git.bb
+++ b/recipes-containers/podman-tui/podman-tui_git.bb
@@ -21,7 +21,7 @@ SRCREV_FORMAT = "podmantui_storage"
 SRCREV_podmantui = "b4350927babdaa35fbf50424190683aeb9f5f66f"
 SRCREV_storage = "246ba3062e8b551026aef2708eee747014ce5c52"
 SRC_URI = " \
-    git://github.com/containers/podman-tui;protocol=https;name=podmantui;branch=release-v0.17 \
+    git://github.com/containers/podman-tui;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX};name=podmantui;branch=release-v0.17 \
 "
 # Due to some other API changes, we can't directly import containers/storage at
 # the right commit, so we instead extract a patch and apply it to the tree
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 32de3f0c..8fc3a854 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
 
 SRCREV = "bb81e85a430fa95d23a15b77c717fd68bf06ebf2"
 SRC_URI = " \
-    git://github.com/containers/libpod.git;branch=v5.0;protocol=https \
+    git://github.com/containers/libpod.git;branch=v5.0;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
     file://run-ptest \
 "
@@ -116,7 +116,7 @@ do_install() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'true', 'false', d)}; then
 		install -d "${D}${sysconfdir}/sysctl.d"
-		install -m 0644 "${WORKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
+		install -m 0644 "${UNPACKDIR}/50-podman-rootless.conf" "${D}${sysconfdir}/sysctl.d"
 	fi
 }
 
diff --git a/recipes-core/kata-containers/kata-agent_git.bb b/recipes-core/kata-containers/kata-agent_git.bb
index de28235c..a44918b8 100644
--- a/recipes-core/kata-containers/kata-agent_git.bb
+++ b/recipes-core/kata-containers/kata-agent_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/kata-containers/agent/LICENSE;md5=86d3
 
 GO_IMPORT = "github.com/kata-containers/agent"
 SRCREV = "e03f7d7453fabffb17e1540f28666c26178d3cbf"
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
           "
 
 RDEPENDS:${PN}-dev:append = "bash"
diff --git a/recipes-core/kata-containers/kata-proxy_git.bb b/recipes-core/kata-containers/kata-proxy_git.bb
index d835e4d2..2882c5b2 100644
--- a/recipes-core/kata-containers/kata-proxy_git.bb
+++ b/recipes-core/kata-containers/kata-proxy_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/kata-containers/proxy/LICENSE;md5=86d3
 
 GO_IMPORT = "github.com/kata-containers/proxy"
 SRCREV = "1148847739f9a9f47b92e34e4f309dc109d4dba9"
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
           "
 
 
diff --git a/recipes-core/kata-containers/kata-runtime_git.bb b/recipes-core/kata-containers/kata-runtime_git.bb
index c0d7c4cb..d39850c4 100644
--- a/recipes-core/kata-containers/kata-runtime_git.bb
+++ b/recipes-core/kata-containers/kata-runtime_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/kata-containers/runtime/LICENSE;md5=86
 
 GO_IMPORT = "github.com/kata-containers/runtime"
 SRCREV = "04c77eb20e9bd603cab5c711bcbe7c69db58b040"
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
            file://0001-makefile-allow-SKIP_GO_VERSION_CHECK-to-be-overriden.patch \
           "
 RDEPENDS:${PN}-dev:append = "bash"
diff --git a/recipes-core/kata-containers/kata-shim_git.bb b/recipes-core/kata-containers/kata-shim_git.bb
index 8a7cb78a..43e8b001 100644
--- a/recipes-core/kata-containers/kata-shim_git.bb
+++ b/recipes-core/kata-containers/kata-shim_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/kata-containers/shim/LICENSE;md5=86d3f
 
 GO_IMPORT = "github.com/kata-containers/shim"
 SRCREV = "bcc35aeca3ef6fa0976005c9e93525906aefed2f"
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
           "
 
 SKIP_RECIPE[kata-shim] ?= "kata containers are currently broken, patches accepted"
diff --git a/recipes-core/runv/runv_git.bb b/recipes-core/runv/runv_git.bb
index 73cd81a6..9cf5e491 100644
--- a/recipes-core/runv/runv_git.bb
+++ b/recipes-core/runv/runv_git.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Hypervisor-based Runtime for OCI"
 
 SRCREV_runv = "b360a686abc6c6e896382990ef1b93ef07c7a677"
 SRC_URI = "\
-	git://github.com/hyperhq/runv.git;nobranch=1;name=runv;protocol=https \
+	git://github.com/hyperhq/runv.git;nobranch=1;name=runv;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
 	"
 
 LICENSE = "Apache-2.0"
diff --git a/recipes-core/runx/runx_git.bb b/recipes-core/runx/runx_git.bb
index 831360ba..52b494d0 100644
--- a/recipes-core/runx/runx_git.bb
+++ b/recipes-core/runx/runx_git.bb
@@ -61,7 +61,7 @@ do_compile() {
     # In the future, we might want to link the extracted kernel source (if
     # we move patches to recipe space, but for now, we need make-kernel to
     # extract a copy and possibly patch it.
-    # ln -sf ${WORKDIR}/${KERNEL_SRC_VER} ${S}/kernel/src/
+    # ln -sf ${UNPACKDIR}/${KERNEL_SRC_VER} ${S}/kernel/src/
 
     # build the kernel
     echo "[INFO]: runx: building the kernel"
@@ -85,10 +85,10 @@ do_compile() {
     bbnote "runx: constructing the initrd"
     if [ -z "${RUNX_USE_INTERNAL_BUSYBOX}" ]; then
         bbnote "runx: using external busybox"
-        cp ${STAGING_DIR_HOST}/bin/busybox.nosuid ${WORKDIR}/busybox
+        cp ${STAGING_DIR_HOST}/bin/busybox.nosuid ${UNPACKDIR}/busybox
         export QEMU_USER="`which qemu-${HOST_ARCH}` -L ${STAGING_BASELIBDIR}/.."
-        export BUSYBOX="${WORKDIR}/busybox"
-        export busybox="${WORKDIR}/busybox"
+        export BUSYBOX="${UNPACKDIR}/busybox"
+        export busybox="${UNPACKDIR}/busybox"
         export CROSS_COMPILE="${TARGET_PREFIX}"
     else
         bbnote "runx: using internal busybox"
diff --git a/recipes-demo/helloworld-flask/helloworld-flask_0.1.bb b/recipes-demo/helloworld-flask/helloworld-flask_0.1.bb
index 896e45fd..3f5507b3 100644
--- a/recipes-demo/helloworld-flask/helloworld-flask_0.1.bb
+++ b/recipes-demo/helloworld-flask/helloworld-flask_0.1.bb
@@ -19,20 +19,20 @@ EXTERNALPORT ?= "10000"
 do_install() {
 
     for tgt in flask-app.yaml flask-app-service.yaml; do
-	sed -i 's%\@NAME\@%${NAME}%g' ${WORKDIR}/$tgt
-	sed -i 's%\@APPNAME\@%${APPNAME}%g' ${WORKDIR}/$tgt
-	sed -i 's%\@CONTAINERNAME\@%${CONTAINERNAME}%g' ${WORKDIR}/$tgt
-	sed -i 's%\@CONTAINERIMAGE\@%${CONTAINERIMAGE}%g' ${WORKDIR}/$tgt
-	sed -i 's%\@CONTAINERPORT\@%${CONTAINERPORT}%g' ${WORKDIR}/$tgt
-	sed -i 's%\@EXTERNALPORT\@%${EXTERNALPORT}%g' ${WORKDIR}/$tgt
+	sed -i 's%\@NAME\@%${NAME}%g' ${UNPACKDIR}/$tgt
+	sed -i 's%\@APPNAME\@%${APPNAME}%g' ${UNPACKDIR}/$tgt
+	sed -i 's%\@CONTAINERNAME\@%${CONTAINERNAME}%g' ${UNPACKDIR}/$tgt
+	sed -i 's%\@CONTAINERIMAGE\@%${CONTAINERIMAGE}%g' ${UNPACKDIR}/$tgt
+	sed -i 's%\@CONTAINERPORT\@%${CONTAINERPORT}%g' ${UNPACKDIR}/$tgt
+	sed -i 's%\@EXTERNALPORT\@%${EXTERNALPORT}%g' ${UNPACKDIR}/$tgt
     done
     
     install -d ${D}${bindir}/
-    install -m 755 ${WORKDIR}/flask-app ${D}${bindir}/
+    install -m 755 ${UNPACKDIR}/flask-app ${D}${bindir}/
 
     install -d ${D}${sysconfdir}/deploy
-    install -m 644 ${WORKDIR}/flask-app.yaml ${D}${sysconfdir}/
-    install -m 644 ${WORKDIR}/flask-app-service.yaml ${D}${sysconfdir}/
+    install -m 644 ${UNPACKDIR}/flask-app.yaml ${D}${sysconfdir}/
+    install -m 644 ${UNPACKDIR}/flask-app-service.yaml ${D}${sysconfdir}/
 }
 
 RDEPENDS:${PN} += "python3-core python3-flask"
diff --git a/recipes-devtools/go/go-build_git.bb b/recipes-devtools/go/go-build_git.bb
index 75ea40a8..c0253298 100644
--- a/recipes-devtools/go/go-build_git.bb
+++ b/recipes-devtools/go/go-build_git.bb
@@ -7,7 +7,7 @@ SRCREV_runc = "1e7bb5b773162b57333d57f612fd72e3f8612d94"
 
 SRCREV_FORMAT = "runx_runc"
 SRC_URI = "\
-	  git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https \
+	  git://github.com/lf-edge/runx;nobranch=1;name=runx;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
           git://github.com/opencontainers/runc;branch=release-1.1;name=runc;protocol=https;destsuffix=git/src/import/gobuild/go/src/github.com/opencontainers/runc \
           file://0001-build-use-instead-of-go.patch \
 	  "
diff --git a/recipes-devtools/go/go-md2man_git.bb b/recipes-devtools/go/go-md2man_git.bb
index 1d96bb1b..73d8d167 100644
--- a/recipes-devtools/go/go-md2man_git.bb
+++ b/recipes-devtools/go/go-md2man_git.bb
@@ -9,7 +9,7 @@ BBCLASSEXTEND = "native"
 GO_IMPORT = "github.com/cpuguy83/go-md2man"
 #GO_INSTALL = "${GO_IMPORT}/bin/go-md2man"
 
-SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https"
+SRC_URI = "git://${GO_IMPORT}.git;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 
 SRCREV = "f79a8a8ca69da163eee19ab442bedad7a35bba5a"
 PV = "1.0.10+git"
diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
index 45f2f970..3f4b5e70 100644
--- a/recipes-devtools/yq/yq_git.bb
+++ b/recipes-devtools/yq/yq_git.bb
@@ -24,7 +24,7 @@ SRCREV_text = "434eadcdbc3b0256971992e8c70027278364c72c"
 SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
 
 SRCREV_FORMAT = "yq_color"
-SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
+SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
            git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=main;protocol=https \
            git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
 	       git://github.com/spf13/cobra;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
@@ -53,7 +53,7 @@ inherit go ptest
 do_compile:prepend() {
     # arrange for some of the golang built ins to be found
     (
-	cd ${WORKDIR}/build/src/
+	cd ${UNPACKDIR}/build/src/
 	ln -sf ${STAGING_DIR_TARGET}/${prefix}/lib/go/src/cmd/vendor/golang.org .
     )
 
diff --git a/recipes-extended/ceph/ceph_18.2.2.bb b/recipes-extended/ceph/ceph_18.2.2.bb
index e6c44188..f7389f85 100644
--- a/recipes-extended/ceph/ceph_18.2.2.bb
+++ b/recipes-extended/ceph/ceph_18.2.2.bb
@@ -100,13 +100,13 @@ do_install:prepend() {
 
 do_install:append () {
 	sed -i -e 's:^#!/usr/bin/python$:&3:' \
-		-e 's:${WORKDIR}.*python3:${bindir}/python3:' \
+		-e 's:${UNPACKDIR}.*python3:${bindir}/python3:' \
 		${D}${bindir}/ceph ${D}${bindir}/ceph-crash \
 		${D}${bindir}/cephfs-top \
 		${D}${sbindir}/ceph-volume ${D}${sbindir}/ceph-volume-systemd
-	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${WORKDIR}::'
+	find ${D} -name SOURCES.txt | xargs sed -i -e 's:${UNPACKDIR}::'
 	install -d ${D}${sysconfdir}/ceph
-	install -m 644 ${WORKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
+	install -m 644 ${UNPACKDIR}/ceph.conf ${D}${sysconfdir}/ceph/
 	install -d ${D}${systemd_unitdir}
 	mv ${D}${libexecdir}/ceph/ceph-osd-prestart.sh ${D}${libdir}/ceph
 	mv ${D}${libexecdir}/ceph/ceph_common.sh ${D}${libdir}/ceph
diff --git a/recipes-extended/diod/diod_1.0.24.bb b/recipes-extended/diod/diod_1.0.24.bb
index 6019fbfb..d555e5c0 100644
--- a/recipes-extended/diod/diod_1.0.24.bb
+++ b/recipes-extended/diod/diod_1.0.24.bb
@@ -26,9 +26,9 @@ inherit autotools pkgconfig systemd
 
 do_install:append () {
         # install our init based on start-stop-daemon
-        install -D -m 0755 ${WORKDIR}/diod ${D}${sysconfdir}/init.d/diod
+        install -D -m 0755 ${UNPACKDIR}/diod ${D}${sysconfdir}/init.d/diod
         # install a real(not commented) configuration file for diod
-        install -m 0644 ${WORKDIR}/diod.conf ${D}${sysconfdir}/diod.conf
+        install -m 0644 ${UNPACKDIR}/diod.conf ${D}${sysconfdir}/diod.conf
 }
 
 FILES:${PN} += "${systemd_unitdir}"
diff --git a/recipes-extended/images/xtf-image.bb b/recipes-extended/images/xtf-image.bb
index f9ecea91..26d279da 100644
--- a/recipes-extended/images/xtf-image.bb
+++ b/recipes-extended/images/xtf-image.bb
@@ -22,8 +22,8 @@ DESCRIPTION = "A minimal Xen Test Framework (XTF) image for testing the Xen hype
 # and the tests that are configured (see the xtf-oeqa-conf package)
 # can be run with: bitbake -c testimage xtf-image
 #
-# For testimage, see the qemu boot log: ${WORKDIR}/testimage/qemu_boot_log.*
-# and the test log: ${WORKDIR}/temp/log.do_testimage
+# For testimage, see the qemu boot log: ${UNPACKDIR}/testimage/qemu_boot_log.*
+# and the test log: ${UNPACKDIR}/temp/log.do_testimage
 
 IMAGE_NAME="xtf"
 
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 6fb2b68c..12041df0 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -46,7 +46,7 @@ do_compile:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=
-		cd ${WORKDIR}/${BPN}-python-${PV} && \
+		cd ${UNPACKDIR}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py build
 	fi
 }
@@ -57,7 +57,7 @@ do_install:append() {
 		# the syroot staged pkgconfig entries. So we clear the sysroot
 		# for just this portion.
 		export PKG_CONFIG_SYSROOT_DIR=
-		cd ${WORKDIR}/${BPN}-python-${PV} && \
+		cd ${UNPACKDIR}/${BPN}-python-${PV} && \
 		  ${STAGING_BINDIR_NATIVE}/python3-native/python3 setup.py install \
                        --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${LIBVIRT_INSTALL_ARGS}
 	fi
diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
index 6b19b700..a29956a6 100644
--- a/recipes-extended/libvirt/libvirt_10.0.0.bb
+++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
@@ -42,9 +42,9 @@ GROUPADD_PARAM:${PN} = "-r qemu; -r kvm"
 USERADD_PARAM:${PN} = "-r -g qemu -G kvm qemu"
 
 
-EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
+EXTRA_OEMESON += "--cross-file ${UNPACKDIR}/meson-${PN}.cross"
 do_write_config:append() {
-    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+    cat >${UNPACKDIR}/meson-${PN}.cross <<EOF
 [binaries]
 iptables = '/usr/sbin/iptables'
 ip6tables = '/usr/sbin/ip6tables'
@@ -195,8 +195,8 @@ do_install:append() {
 	install -d ${D}/etc/libvirt
 	install -d ${D}/etc/dnsmasq.d
 
-	install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
-	install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
+	install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
+	install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 	    # This will wind up in the libvirtd package, but will NOT be invoked by default.
@@ -255,12 +255,12 @@ do_install:append() {
 	mkdir -p ${D}/etc/libvirt/hooks
 	for hook in "daemon" "lxc" "network" "qemu"
 	do
-		install -m 0755 ${WORKDIR}/hook_support.py ${D}/etc/libvirt/hooks/${hook}
+		install -m 0755 ${UNPACKDIR}/hook_support.py ${D}/etc/libvirt/hooks/${hook}
 	done
 
 	# Force the main dnsmasq instance to bind only to specified interfaces and
 	# to not bind to virbr0. Libvirt will run its own instance on this interface.
-	install -m 644 ${WORKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/libvirt-daemon
+	install -m 644 ${UNPACKDIR}/dnsmasq.conf ${D}/${sysconfdir}/dnsmasq.d/libvirt-daemon
 
 	# remove .la references to our working diretory
 	for i in `find ${D}${libdir} -type f -name *.la`; do
@@ -286,21 +286,21 @@ do_install:append() {
 
 	if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
 	    # Generate sample keys and certificates.
-	    cd ${WORKDIR}
-	    ${WORKDIR}/gnutls-helper.py -y
+	    cd ${UNPACKDIR}
+	    ${UNPACKDIR}/gnutls-helper.py -y
 
 	    # Deploy all sample keys and certificates of CA, server and client
 	    # to target so that libvirtd is able to boot successfully and local
 	    # connection via 127.0.0.1 is available out of box.
 	    install -d ${D}/etc/pki/CA
 	    install -d ${D}/etc/pki/libvirt/private
-            install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
-	    install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
-	    install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
-	    install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
-	    install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
-	    install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
-	    install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
+            install -m 0755 ${UNPACKDIR}/gnutls-helper.py ${D}/${bindir}
+	    install -m 0644 ${UNPACKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
+	    install -m 0644 ${UNPACKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
+	    install -m 0644 ${UNPACKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
+	    install -m 0644 ${UNPACKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
+	    install -m 0644 ${UNPACKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
+	    install -m 0644 ${UNPACKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
 
 	    # Force the connection to be tls.
 	    sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
diff --git a/recipes-extended/nagios/nagios-core_4.4.6.bb b/recipes-extended/nagios/nagios-core_4.4.6.bb
index 59b70895..7ec930cd 100644
--- a/recipes-extended/nagios/nagios-core_4.4.6.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.6.bb
@@ -106,14 +106,14 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
+        install -m 644 ${UNPACKDIR}/nagios-core.service ${D}${systemd_unitdir}/system/
         # use our own service file
         rm -f ${D}${systemd_unitdir}/system/nagios.service
         install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m 755 ${WORKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
+        install -m 755 ${UNPACKDIR}/nagios-core-systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/nagios-core-volatile.conf
     else
         install -d ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
+        install -m 0644 ${UNPACKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/99_nagios
     fi
 }
 
diff --git a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
index ac54469b..503ef547 100644
--- a/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
+++ b/recipes-extended/nagios/nagios-nrpe_4.0.2.bb
@@ -73,11 +73,11 @@ do_install:append() {
         -i ${D}${NAGIOS_CONF_DIR}/nrpe.cfg
 
     install -d ${D}${NAGIOS_PLUGIN_CONF_DIR}
-    install -m 664 ${WORKDIR}/check_nrpe.cfg ${D}${NAGIOS_PLUGIN_CONF_DIR}
+    install -m 664 ${UNPACKDIR}/check_nrpe.cfg ${D}${NAGIOS_PLUGIN_CONF_DIR}
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/nagios-nrpe.service ${D}${systemd_unitdir}/system/
+        install -m 644 ${UNPACKDIR}/nagios-nrpe.service ${D}${systemd_unitdir}/system/
     fi
 }
 
diff --git a/recipes-extended/nagios/nagios-nsca_2.9.2.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
index 2db51238..a400b68f 100644
--- a/recipes-extended/nagios/nagios-nsca_2.9.2.bb
+++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF += "--with-nsca-user=${NAGIOS_USER} \
 "
 
 do_configure() {
-    cp ${WORKDIR}/init-script.in ${S}/init-script.in
+    cp ${UNPACKDIR}/init-script.in ${S}/init-script.in
     oe_runconf || die "make failed"
 }
 
@@ -55,7 +55,7 @@ do_install() {
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/nagios-nsca.service ${D}${systemd_unitdir}/system/
+        install -m 644 ${UNPACKDIR}/nagios-nsca.service ${D}${systemd_unitdir}/system/
     fi
 }
 
diff --git a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
index c2f3464c..c2e8be93 100644
--- a/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
+++ b/recipes-extended/uxen/uxen-guest-tools_4.1.8.bb
@@ -19,7 +19,7 @@ SRC_URI[uxen.sha384sum] = "be2233bc6506a23350d76c03ac28ea7ea381e1dc6ed5ce996e8ac
 SRC_URI[license.sha384sum] = "92e48c614df3094cb52321d4c4e01f6df5526d46aee5c6fa36c43ee23d4c33f03baa1fc5f6f29efafff636b6d13bc92c"
 
 # The software license is GPLv2: please see page 199 of the pdf document
-LIC_FILES_CHKSUM = "file://${WORKDIR}/Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
+LIC_FILES_CHKSUM = "file://${UNPACKDIR}/Bromium-4.1.8-Open-Source-Software.pdf;md5=cf120df6ffa417b36f870a9997650049"
 
 S = "${WORKDIR}/uxen-${PV}-72a4af9/vm-support/linux"
 
diff --git a/recipes-extended/virt-viewer/virt-viewer_11.0.bb b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
index 273e1fc5..02f34185 100644
--- a/recipes-extended/virt-viewer/virt-viewer_11.0.bb
+++ b/recipes-extended/virt-viewer/virt-viewer_11.0.bb
@@ -34,5 +34,5 @@ do_compile:append() {
     # glib-mkenums is embedding full paths into this file. There's no
     # option to it to use a sysroot style variable. So to avoid QA
     # errors, we sed WORKDIR out and make its includes relative
-    sed -i "s,${WORKDIR}/build/,," src/virt-viewer-enums.c
+    sed -i "s,${UNPACKDIR}/build/,," src/virt-viewer-enums.c
 }
diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
index dcd281b5..7e483e10 100644
--- a/recipes-extended/xen/xen.inc
+++ b/recipes-extended/xen/xen.inc
@@ -93,7 +93,7 @@ EXTRA_CFLAGS_XEN_CORE ?= ""
 # Add prefix maps to support buildpaths QA test and reproducibility
 DEBUG_PREFIX_MAP:append = " \
     -ffile-prefix-map=${S}=${PN}-source \
-    -fdebug-prefix-map=${WORKDIR}=${PN} \
+    -fdebug-prefix-map=${UNPACKDIR}=${PN} \
     "
 
 # - The Xen tools build for x86 systems with HVM-mode enabled includes hvmloader
@@ -209,8 +209,8 @@ do_configure_common() {
         echo "XSM_ENABLE := y" > ${S}/.config
     fi
 
-    if [ -f "${WORKDIR}/defconfig" ]; then
-        cp "${WORKDIR}/defconfig" "${S}/xen/.config" || \
+    if [ -f "${UNPACKDIR}/defconfig" ]; then
+        cp "${UNPACKDIR}/defconfig" "${S}/xen/.config" || \
         bbfatal "Unable to copy defconfig to .config"
     fi
 
diff --git a/recipes-networking/cni/cni_git.bb b/recipes-networking/cni/cni_git.bb
index b41b47cf..e83a00ae 100644
--- a/recipes-networking/cni/cni_git.bb
+++ b/recipes-networking/cni/cni_git.bb
@@ -14,9 +14,9 @@ SRCREV_plugins = "b6a0e0bc96906f0d3bd6bfcaab0b5ae72292f46c"
 SRCREV_flannel_plugin = "6464faacf5c00e25321573225d74638455ef03a0"
 SRCREV_FORMAT = "cni_plugins"
 SRC_URI = "\
-	git://github.com/containernetworking/cni.git;branch=main;name=cni;protocol=https \
-        git://github.com/containernetworking/plugins.git;branch=main;destsuffix=${S}/src/github.com/containernetworking/plugins;name=plugins;protocol=https \
-        git://github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protocol=https;destsuffix=${S}/src/github.com/containernetworking/plugins/plugins/meta/flannel \
+	git://github.com/containernetworking/cni.git;branch=main;name=cni;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
+        git://github.com/containernetworking/plugins.git;branch=main;destsuffix=${GO_SRCURI_DESTSUFFIX}/../../src/github.com/containernetworking/plugins;name=plugins;protocol=https \
+        git://github.com/flannel-io/cni-plugin;branch=main;name=flannel_plugin;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}/../../src/github.com/containernetworking/plugins/plugins/meta/flannel \
         file://modules.txt \
 	"
 
@@ -53,7 +53,7 @@ do_compile() {
 	ln -sf vendor.copy vendor
 
 	# inform go that we know what we are doing
-	cp ${WORKDIR}/modules.txt vendor/
+	cp ${UNPACKDIR}/modules.txt vendor/
 
 	export GO111MODULE=off
 
diff --git a/recipes-networking/cni/src_uri.inc b/recipes-networking/cni/src_uri.inc
index 6cda91ab..fe90f20f 100644
--- a/recipes-networking/cni/src_uri.inc
+++ b/recipes-networking/cni/src_uri.inc
@@ -1,65 +1,65 @@
 #       golang.org/x/net v0.17.0
 # [1] git ls-remote https://go.googlesource.com/net b225e7ca6dde1ef5a5ae5ce922861bda011cfabd
 SRCREV_net="b225e7ca6dde1ef5a5ae5ce922861bda011cfabd"
-SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/net"
+SRC_URI += "git://go.googlesource.com/net;name=net;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/net"
 
 #       golang.org/x/sys v0.14.0
 # [1] git ls-remote https://go.googlesource.com/sys cb378ae1ff8cd45e69d4f172df8370bc844e1f86
 SRCREV_sys="cb378ae1ff8cd45e69d4f172df8370bc844e1f86"
-SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/sys"
+SRC_URI += "git://go.googlesource.com/sys;name=sys;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/sys"
 
 #       gopkg.in/yaml.v3 v3.0.1
 # [1] git ls-remote https://github.com/go-yaml/yaml f6f7691b1fdeb513f56608cd2c32c51f8194bf51
 SRCREV_yaml.v3="f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
-SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml.v3"
+SRC_URI += "git://github.com/go-yaml/yaml;name=yaml.v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/gopkg.in/yaml.v3"
 
 #       golang.org/x/text v0.13.0
 # [1] git ls-remote https://go.googlesource.com/text f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02
 SRCREV_text="f488e191e67ed95a5b9b7b39024e5a5f5f1ffd02"
-SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/text"
+SRC_URI += "git://go.googlesource.com/text;name=text;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/text"
 
 #       golang.org/x/tools v0.14.0
 # [1] git ls-remote https://go.googlesource.com/tools 3f4194ee29d7db9b59757dfff729ef55cf89661c
 SRCREV_tools="3f4194ee29d7db9b59757dfff729ef55cf89661c"
-SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/tools"
+SRC_URI += "git://go.googlesource.com/tools;name=tools;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/tools"
 
 #       github.com/onsi/gomega v1.30.0
 # [1] git ls-remote https://github.com/onsi/gomega f804ac6ada8d36164ecae0513295de8affce1245
 SRCREV_gomega="f804ac6ada8d36164ecae0513295de8affce1245"
-SRC_URI += "git://github.com/onsi/gomega;name=gomega;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/onsi/gomega"
+SRC_URI += "git://github.com/onsi/gomega;name=gomega;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/onsi/gomega"
 
 #       github.com/go-logr/logr v1.3.0
 # [1] git ls-remote https://github.com/go-logr/logr 8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f
 SRCREV_logr="8adefbede0fe82bdee4fb8c9c9bdc7bc5d91388f"
-SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-logr/logr"
+SRC_URI += "git://github.com/go-logr/logr;name=logr;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-logr/logr"
 
 #       github.com/google/pprof v0.0.0-20210407192527-94a9f03dee38
 # [1] git ls-remote https://github.com/google/pprof 94a9f03dee38882adc8bdfc42cdd6a04f8e7056e
 SRCREV_pprof="94a9f03dee38882adc8bdfc42cdd6a04f8e7056e"
-SRC_URI += "git://github.com/google/pprof;name=pprof;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/pprof"
+SRC_URI += "git://github.com/google/pprof;name=pprof;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/pprof"
 
 #       github.com/google/go-cmp v0.6.0
 # [1] git ls-remote https://github.com/google/go-cmp c3ad8435e7bef96af35732bc0789e5a2278c6d5f
 SRCREV_go-cmp="c3ad8435e7bef96af35732bc0789e5a2278c6d5f"
-SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/google/go-cmp"
+SRC_URI += "git://github.com/google/go-cmp;name=go-cmp;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/google/go-cmp"
 
 #       github.com/onsi/ginkgo/v2 v2.13.2
 # [1] git ls-remote https://github.com/onsi/ginkgo 931dc0b144749710bd085d4eb7cd4192a22972d7
 SRCREV_v2="931dc0b144749710bd085d4eb7cd4192a22972d7"
-SRC_URI += "git://github.com/onsi/ginkgo;name=v2;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/onsi/ginkgo/v2"
+SRC_URI += "git://github.com/onsi/ginkgo;name=v2;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/onsi/ginkgo/v2"
 
 #       github.com/vishvananda/netns v0.0.4
 # [1] git ls-remote https://github.com/vishvananda/netns 7a452d2d15292b2bfb2a2d88e6bdeac156a761b9
 SRCREV_netns="7a452d2d15292b2bfb2a2d88e6bdeac156a761b9"
-SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/vishvananda/netns"
+SRC_URI += "git://github.com/vishvananda/netns;name=netns;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/vishvananda/netns"
 
 #       github.com/go-task/slim-sprig v0.0.0-20230315185526-52ccab3ef572
 # [1] git ls-remote https://github.com/go-task/slim-sprig 52ccab3ef572c7e1a2c258be183f9a9296d60152
 SRCREV_slim-sprig="52ccab3ef572c7e1a2c258be183f9a9296d60152"
-SRC_URI += "git://github.com/go-task/slim-sprig;name=slim-sprig;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/go-task/slim-sprig"
+SRC_URI += "git://github.com/go-task/slim-sprig;name=slim-sprig;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/go-task/slim-sprig"
 
 #       github.com/Masterminds/semver/v3 v3.2.1
 # [1] git ls-remote https://github.com/Masterminds/semver e06051f8fcc4c8b4a4990c337b9862a2448722e5
 SRCREV_v3="e06051f8fcc4c8b4a4990c337b9862a2448722e5"
-SRC_URI += "git://github.com/Masterminds/semver;name=v3;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Masterminds/semver/v3"
+SRC_URI += "git://github.com/Masterminds/semver;name=v3;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/semver/v3"
 
diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
index 357275c1..be41d2b8 100644
--- a/recipes-networking/netns/netns_git.bb
+++ b/recipes-networking/netns/netns_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "Runc hook for setting up default bridge networking."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=7bac31faf84a2d7e88972f562a3ebbe5"
 
-SRC_URI = "git://github.com/genuinetools/netns;branch=master;protocol=https \
+SRC_URI = "git://github.com/genuinetools/netns;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
            file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch \
           "
 SRCREV = "00d5d07ab1c8afcf481ffa5958719943b6ecfde4"
diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
index 767a41e6..a792a903 100644
--- a/recipes-networking/openvswitch/openvswitch.inc
+++ b/recipes-networking/openvswitch/openvswitch.inc
@@ -104,13 +104,13 @@ do_install:prepend() {
 
 do_install:append() {
 	install -d ${D}/${sysconfdir}/default/
-	install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
+	install -m 660 ${UNPACKDIR}/openvswitch-switch-setup ${D}/${sysconfdir}/default/openvswitch-switch
 	install -d ${D}/${sysconfdir}/openvswitch-testcontroller
-	install -m 660 ${WORKDIR}/openvswitch-testcontroller-setup ${D}/${sysconfdir}/default/openvswitch-testcontroller
+	install -m 660 ${UNPACKDIR}/openvswitch-testcontroller-setup ${D}/${sysconfdir}/default/openvswitch-testcontroller
 
 	install -d ${D}/${sysconfdir}/init.d/
-	install -m 755 ${WORKDIR}/openvswitch-testcontroller ${D}/${sysconfdir}/init.d/openvswitch-testcontroller
-	install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
+	install -m 755 ${UNPACKDIR}/openvswitch-testcontroller ${D}/${sysconfdir}/init.d/openvswitch-testcontroller
+	install -m 755 ${UNPACKDIR}/openvswitch-switch ${D}/${sysconfdir}/init.d/openvswitch-switch
 	true || rm -fr ${D}/${datadir}/${PN}/pki
 
 	install -d ${D}/${sysconfdir}/sysconfig
diff --git a/scripts/oe-go-mod-autogen.py b/scripts/oe-go-mod-autogen.py
index c44c096a..59381081 100755
--- a/scripts/oe-go-mod-autogen.py
+++ b/scripts/oe-go-mod-autogen.py
@@ -59,7 +59,7 @@ class GoModTool(object):
         # module_name = github.com/Masterminds/semver/v3
         # url = https://github.com/Masterminds/semver
         # version = v3.1.1
-        # destdir = ${WORKDIR}/${BP}/src/${GO_IMPORT}/vendor/github.com/Masterminds/semver/v3
+        # destdir = ${UNPACKDIR}/${BP}/src/${GO_IMPORT}/vendor/github.com/Masterminds/semver/v3
         # fullsrcrev = d387ce7889a157b19ad7694dba39a562051f41b0
         self.modules_require = OrderedDict()
 
@@ -323,7 +323,7 @@ class GoModTool(object):
         # module_name: golang.org/x/crypto
         # url: https://go.googlesource.com/crypto
         # version: v0.0.0-20220321153916-2c7772ba3064
-        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/golang.org/x/crypto
+        # destdir: ${GO_SRCURI_DESTSUFFIX}/vendor.fetch/golang.org/x/crypto
         # fullsrcrev: 2c7772ba30643b7a2026cbea938420dce7c6384d (git rev-list -1 2c7772ba3064)
         #
         # If not, try https://pkg.go.dev/<module_name>, and find the 'Repository'.
@@ -333,7 +333,7 @@ class GoModTool(object):
         # module_name: github.com/Masterminds/semver/v3
         # url: https://github.com/Masterminds/semver
         # version: v3.1.1
-        # destdir: ${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/Masterminds/semver/v3
+        # destdir: ${GO_SRCURI_DESTSUFFIX}/vendor.fetch/github.com/Masterminds/semver/v3
         # fullsrcrev: 7bb0c843b53d6ad21a3f619cb22c4b442bb3ef3e (git rev-list -1 v3.1.1)
         #
         # As a last resort, if the last component of <module_name> matches 'v[0-9]+',
@@ -347,7 +347,7 @@ class GoModTool(object):
             # take the modules_replace into consideration to get the actual version and actual module name
             # note that the module_name is used in destdir, and the actual_module_name and actual_version
             # are used to determine the url and fullsrcrev
-            destdir = '${WORKDIR}/${BP}/src/import/vendor.fetch/%s' % module_name
+            destdir = '${GO_SRCURI_DESTSUFFIX}/vendor.fetch/%s' % module_name
             actual_module_name = module_name
             actual_version = version
             if module_name in self.modules_replace:
@@ -502,7 +502,7 @@ class GoModTool(object):
         template = """#       %s %s
 # [1] git ls-remote %s %s
 SRCREV_%s="%s"
-SRC_URI += "git://%s;name=%s;protocol=https;nobranch=1;destsuffix=${WORKDIR}/${BP}/src/import/vendor.fetch/%s"
+SRC_URI += "git://%s;name=%s;protocol=https;nobranch=1;destsuffix=${GO_SRCURI_DESTSUFFIX}/vendor.fetch/%s"
 
 """
         # We can't simply write SRC_URIs one by one in the order that go.mod specify them.
@@ -735,7 +735,7 @@ def main():
 
             .....
 
-               cp ${WORKDIR}/modules.txt vendor/
+               cp ${UNPACKDIR}/modules.txt vendor/
 
         Example: Updating the K3S recipe
         ================================
-- 
2.45.1



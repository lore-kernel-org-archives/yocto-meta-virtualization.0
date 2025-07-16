Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D080C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:00:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15186.1752645608025396129
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 23:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9292a11c7f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G507Bb1895310
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Jul 2025 23:00:07 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0sh3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 15 Jul 2025 23:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwUhVpqF1VMRcmZb64I6yb6pLykLYs7f38JyqRzXMVxeYyILbI6erhfgNytovwAqf6du7qUXHzc+FFDt0lgeusm0gSRaTpQsL8UPb9S8r0wOXCVhbU5RbjU3Cm2+wTq9ZtC1IE0Va3gs70z88cHZK0r591mSxzLeR51CStuPKlLpV+NyNnPnmtgXmoV80YIdEF4lxP+KdWlGqYnT+xOlcZuQErnaPX4hzaztJ01H3YkHJJC5vbR0XrqrsomlminDkeWhr/9h5ohsYxbOlvqIgg7OoqQW9Icy1tCTQ1OyPnP+UlE80YhkEZRvphLpJXcV9AxIDMYkovlnAomlmP3b7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mH3LLcVQGdpW8jASLrShNSsSk4gfQWw1vHAx0YLh8g=;
 b=r2hfxSODgXybAmDIc8IvIx1xRiXT+Pzjg1WiSCVOzPpOXEQn0GR/Fr4jgQL5Y08hQekWL2xih2K1FBtVqAGRgXdVkK2joDaMITNsBWk6H3jG8ueBqmBvlTTk/qQeS2FVwiMD+OL0SSMe0fKF8FFC1wd82IJkyFrw9UZwTOpbfLdCSeAEbl6e7SmF9BOZN9/6TgpxKx5ta8WuX16Corr+8GQ6Z4D7sMVW9jg2G5xP84uORx0uYCAHklxYzflYE4Kfll5FPZplLgHYRs6DlGdqHIj0B387TBlb/ggfkO5EkwhiBZWZkJkveGxo2zHm+tP0wMhihINuNaIKYes2+sR6/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 06:00:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 05:59:58 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][m-c-s][PATCH] meta-cloud-services: remove invalid S settings
Date: Wed, 16 Jul 2025 13:59:43 +0800
Message-Id: <20250716055943.446042-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::13) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbe61b4-7f00-43c7-d6c8-08ddc42dfe07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4VzTcK1rInGZHIWhhs/pYqtU99m7dpS5P8y4KK9wAskWBE1EhJuW9hHw3Ffi?=
 =?us-ascii?Q?SCxH6+T/j1lKtjJVrLZrnupBjOUQlNUTfAwjuh1m1IqvpyrC62FH3wcZjssI?=
 =?us-ascii?Q?s90S63GFeYcAD7hlvQ0IC720nbS46wQTiJHghz+gCh9za/uD8SHK4pEzMFEY?=
 =?us-ascii?Q?dcgVoEHopNcV6Yt7KcoTEqyc16oaAjQjoNATyp5KPfZKbqFqbm81OYB+YCcp?=
 =?us-ascii?Q?XbmC5KyPFE+XDhCnDYKoo58VsQC+g7Dn7tKe8rPPirKwHbtqVSM8LqpfO5WD?=
 =?us-ascii?Q?o37rMKGlGQNaGR8KK832S4jOtmPDczYdgrabGERvngW8RM1ZBDjfEZqMIeHv?=
 =?us-ascii?Q?+YRzKfjcXQD7UABWEzTwH/bVYKfHkZJonG9PosKwWzmfUjfaD/lxeShA9r7o?=
 =?us-ascii?Q?+JuGzPLFFTuWMoTGR5W3dPU6i/VTNwQ7o8FjrHmrMKS0SMX1IQD0KYt7Pjxf?=
 =?us-ascii?Q?XgkXJbvMue9OD8xVrSrEDXEOuVqjTBiLP0ZqQHS0u6h7XkyzU90qrYRm4G18?=
 =?us-ascii?Q?WDMMU2FVI/yz/9de/WNwtPoE/13GTdGuJifmCCuZimlzJjxYhtC2NQpW48J+?=
 =?us-ascii?Q?uixzKaQ6klLub4XUq5p2/Gm8dtV3S4IpTrJtxfI/1n+AH5/QMNI715bdkCEa?=
 =?us-ascii?Q?nrVAvRqOf6FCzP8J5MDM/UVLWpsRShMew4BTtI5oRmlRR7W6R8LLgHSQwvk3?=
 =?us-ascii?Q?o7CKruR8BhU09ij3wp2eOyyNZY2Gou5cn7QTpFCzLdmuEidmEycJln8YqVQx?=
 =?us-ascii?Q?x48iJEz9nCZYdo+aAd4ZOHPYGVabzN99loMNmLI1gFP2S8seS2q0KDup5dUv?=
 =?us-ascii?Q?ih4I9qYMC7903wqPHGqxtEGE6VPYA8p1NZAoKhph0frSnKXq55mWS+cIZ5qE?=
 =?us-ascii?Q?jk3h+oCT79KWaf5zCIVoyM+krYIirRGkmLLogWb1WDptHUB+m9VV8rKPLgOg?=
 =?us-ascii?Q?rx7P6Lxs6U2PYT9FgxgIXhscYvEq+n5VT2MB2EgATiaYuKhbUVV29E/GJdvM?=
 =?us-ascii?Q?f273upTAqfI8ThAZQ4L+iRIzGJ96QilltXMzdBJwBJTOJkp0Rjbmwojtelbl?=
 =?us-ascii?Q?vBwJICJtY9sIfIMeKdvOZb/DBn/lfxTZTiOF6MVraaRpniQnuhmY5STd6vwW?=
 =?us-ascii?Q?KLCC2AJxwNcUbFtVpxnD8DHh6B2fwVa6PcjJck4zYYxLOxMlib/6EiDxSXeS?=
 =?us-ascii?Q?Bwi3qhOHLImWTZ4Ne0kMzAc34g+9ejfe8hZuuDAkqcXq0VgfVA7aXlzcHvzm?=
 =?us-ascii?Q?ElHCpe2fSFEZLFmZ1MFFYS9gw25gRV5TrbivMUB0u2h1lDBMTUbk97fvPaLK?=
 =?us-ascii?Q?Tf4UsO74e/j+5ez9D0m9ILketTN75bGkYT2yUwjFlLv+Ax1olAAc5Radvtot?=
 =?us-ascii?Q?BiEwNGdIxFYJc+UPY1e2xdG9Clpi70L/K7QTnKPcm5B7Zq/oQ6fYMqWw1/jN?=
 =?us-ascii?Q?HjSpK0KuNQE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iZZGEn9+fPxHSKA/EG22xXSKr1VupIE6hEKEk0n23J9I4WCWYjCd+cloclry?=
 =?us-ascii?Q?Xh8mKyM4u6mGOZBH1sfjVc6cEgAnuSkgd7+0lgOqj5qqtLIcsj24Pu2pPLQR?=
 =?us-ascii?Q?SmSZCXM5aEIv/EPlDk48nUjMbBcPYTUBGTXhEJgebmrY0UGV1QHFUOAwJlPz?=
 =?us-ascii?Q?bGA9lNLP4AEizohWWk9hXiOn8Od6+b796ZSF7YCgS/q+orxIoZaxe8NVSF0T?=
 =?us-ascii?Q?G5l4IqEvw0wSZZSMq9ukMKkVA7fzuY23q94RmwNgbVEHe53IIp1+hHF5sBfw?=
 =?us-ascii?Q?4xZsZnSt8j2omdg6YA3bvzjyffvZ0mOOSKa6O7W4KdvUuP7+kq/IsAO3fzK6?=
 =?us-ascii?Q?kY/9Bro9A5f2TPv1IsBrelfuj7h8duY5AuNeEt01f8Nnh1l2BisiK9/3+qWc?=
 =?us-ascii?Q?4mHxeZGqiAWOg8gNRPllg0+NFPDLs0NqhwtIThZ/xiLTKxXY2wy/x3SYnt0S?=
 =?us-ascii?Q?meiAwFeQ2C0poIb2QybTvpl0ueBAkBx9GHYnuW17D0Wf84tdwGOZz9WYJGbY?=
 =?us-ascii?Q?uVkBaTU0eP2vIeVRn9EpuhNVAScCyR+zDce4LCn703VoGAyxKbWj6Gt+ceOg?=
 =?us-ascii?Q?xv1PKyehzIadyxhMgnrgzpCIqGI2kdLDRE6MoMIyG49Pur3t5aMeE1EVlweZ?=
 =?us-ascii?Q?VwXes5RXGQjKOLM3TySlx42z3Uy8YiOO6161j9KPHjr6jOE9utbQK9MIJu3/?=
 =?us-ascii?Q?wLpAH2NaDQiCHasmG6oiKmBpgdYm8lfZCNIf1fLU3B6towiAda9OM0UfQpvs?=
 =?us-ascii?Q?vx/anD1F23eGNU+S/D5SByrnTYrSizGi34o6p6olNUIH7Thcp2JVN7UJo1jq?=
 =?us-ascii?Q?WXIUEt6hAOmv87b2WxLOjxSi0g+EPV3FWEI/I+UQ1aLZW6PL/GB3kY0GDeHL?=
 =?us-ascii?Q?ZgPCQUMk0uySTB9ogO8bVGCsh68aim33Rivet7k1IxUxHB5+XCQd5gC9bWb+?=
 =?us-ascii?Q?jf3G9C2Gom4BstYtfzAjX9QchL5lz+GRaq5oszhjBkCw7/IoRgPh9BK/dtVP?=
 =?us-ascii?Q?ibW43KSkw/pnHcQ9DouqA2b/xnGK+PAAJC14T3a+1HgntBP7z7a6UAgcRJFR?=
 =?us-ascii?Q?9Bo3sdBWvVI7lGo0Y9DVnOD0H9jTpCzaYWkelYpEsWz4LuZUrLPbh2iGtKRb?=
 =?us-ascii?Q?b7Kb7WfKo4UbbhrAx3oPK6uFE+tx50tQBsI/b2vUvO7IckHvYkI5/DalO59Q?=
 =?us-ascii?Q?2T+4DTHvBEmUCo2mgbEKTDgUB4r5tFLdUlmsOudgGVQ/Hag/fvJC+GFlL5fI?=
 =?us-ascii?Q?590semSVScQNRJaFVE+wJsLTf7zB3y79zor6EjUSST+Rjrpz2+0QB5b+ZZeA?=
 =?us-ascii?Q?XkSpssMnTDKwyycxhXx8Nq37iENVqtzh6XdFO8ThVSFkrkbjfs+mtmSNxdj5?=
 =?us-ascii?Q?rS8hAKv0w7/RsW4rSUO96wn2PHzVe0MVLf5Tvl0UyLLXgm2Y+vHrgUcZf9bi?=
 =?us-ascii?Q?XfLgToyyUyrtwpvCOUfWcrOsD8XCVJPtWWtvj8bKTCwFY5yaWAh3kLy1eM+0?=
 =?us-ascii?Q?sXXrZQJIRUdzFxqvsDx+UIjbR9Z9VFNPrajVtccGxnP/NPtxMry7MZdkYBm7?=
 =?us-ascii?Q?5/BHE2U+hcjMWViDYllXG/pWhaHHXXQ+JWGin2dQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbe61b4-7f00-43c7-d6c8-08ddc42dfe07
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 05:59:58.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twHRKtTo+3VqUUUnDVv5y7X/myhyY7Z/kRtAHm1Fl3MB37ydkpUl7N2ypFpb5Dj50IKGio9z+5GigWceUShg/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
X-Proofpoint-ORIG-GUID: ABfa3TeI-vr4q-pYjtcEiYHOdsI55zUW
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=68773fe7 cx=c_pps
 a=hmQExvEuNndbDUJzyc080g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=39wqaSaG6dEM9dAd5RMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX0YbQFXQmY/wf
 m1vhUkf35GMpwlt28ei26tzkDybMhNj2/Q+zbQZzjhGNgXPch1psG48Q79/dcEQqjsVOhdoAA8t
 dkRrVQMQfCryDSmOvqZIJBihLnpuAVpGEmwF6tXH5AVBbbC/LYENGgL9PGjjZ+Q862jugJzjKq/
 WQUBFwDtOmMRiwGQcM+HKHYzrdCE3m6KtOhh8RrE82NUwYBGJ5MWmQ5WiES8FemM2ITxzvldx2j
 8XFEWTgZwCWxuBhWvahtrqZkADiQ5kNbVQ0QEQQvPQQMfyBRhlsBQ1YafAmNZjQQ+Qtnas+w3fe
 /BxnISekYyWVvCI3W2QgXLxwzt8wtLSs9xJ8tevLTaqJtktojM12uuirmxMzHbMJUvQyidqOpn+
 BhPURpgk
X-Proofpoint-GUID: ABfa3TeI-vr4q-pYjtcEiYHOdsI55zUW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 16 Jul 2025 06:00:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9309

From: Chen Qi <Qi.Chen@windriver.com>

Due to recent oe-core's change about UNPACKDIR/S, these settings
are no longer valid and are causing errors.

The git fetcher in bitbake now defaults to fetch git source to
be under /${BP} instead of /git. So using '/git' is no longer valid.

In addition, S now locates under ${UNPACKDIR} instead of ${WORKDIR}.

So the default value of S (S = "${UNPACKDIR}/${BP}" from bitbake.conf)
is already enough and do not need any further settings for these git
recipes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-connectivity/consul/consul-migrate_git.bb          | 1 -
 recipes-connectivity/consul/consul_git.bb                  | 1 -
 recipes-connectivity/serf/hashicorp-serf_0.9.4.bb          | 1 -
 recipes-devtools/python/python-ansible.inc                 | 1 -
 recipes-support/puppet-vswitch/puppet-vswitch_git.bb       | 1 -
 recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb | 1 -
 recipes-support/ruby-shadow/ruby-shadow_git.bb             | 1 -
 7 files changed, 7 deletions(-)

diff --git a/recipes-connectivity/consul/consul-migrate_git.bb b/recipes-connectivity/consul/consul-migrate_git.bb
index 1393c912..3c9518ee 100644
--- a/recipes-connectivity/consul/consul-migrate_git.bb
+++ b/recipes-connectivity/consul/consul-migrate_git.bb
@@ -7,7 +7,6 @@ GO_IMPORT = "github.com/hashicorp/consul-migrate"
 SRC_URI = "https://${GO_IMPORT}.git;branch=master"
 SRCREV = "678fb10cdeae25ab309e99e655148f0bf65f9710"
 
-S = "${WORKDIR}/git"
 
 SRCREV_raft = "057b893fd996696719e98b6c44649ea14968c811"
 SRCREV_go-metrics = "f303b03b91d770a11a39677f1d3b55da4002bbcb"
diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index 0d084b0d..3dceb9d8 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://${GO_IMPORT}.git;branch=main;protocol=https \
            file://consul.service \
           "
 
-S = "${WORKDIR}/git"
 
 RDEPENDS:${PN}-dev:append = " bash"
 
diff --git a/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb b/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
index 8318400d..e46acbdc 100644
--- a/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
+++ b/recipes-connectivity/serf/hashicorp-serf_0.9.4.bb
@@ -22,7 +22,6 @@ SRC_URI = "git://${GO_IMPORT}.git;protocol=https;branch=master"
 PV = "0.8.5+git${SRCPV}"
 SRCREV = "1d3fdf93bbe5002c5023da50402368a817488691"
 
-S = "${WORKDIR}/git"
 
 inherit go
 
diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
index 4bb90cb7..737daa9a 100644
--- a/recipes-devtools/python/python-ansible.inc
+++ b/recipes-devtools/python/python-ansible.inc
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.1
 
 SRCREV = "dc0e3bd16cc7ded081bc46c88e4e3d1997ca9bb0"
 
-S = "${WORKDIR}/git"
 
 ANSIBLE_WHITELIST_MODULES ?= "commands files system network/ovs __pycache__ service"
 
diff --git a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
index b2413283..6b282168 100644
--- a/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
+++ b/recipes-support/puppet-vswitch/puppet-vswitch_git.bb
@@ -16,7 +16,6 @@ inherit rubyv2
 GEM_NAME = "puppetlabs-std"
 GEM_SPEC_FILE = "puppet-vswitch.gemspec"
 
-S = "${WORKDIR}/git"
 
 DEPENDS += " \
         ruby \
diff --git a/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb b/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
index 8a3c1def..1132f6be 100644
--- a/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
+++ b/recipes-support/puppetlabs-stdlib/puppetlabs-stdlib_git.bb
@@ -16,7 +16,6 @@ inherit rubyv2
 GEM_NAME = "puppetlabs-std"
 GEM_SPEC_FILE = "puppetlabs-stdlib.gemspec"
 
-S = "${WORKDIR}/git"
 
 DEPENDS += " \
         ruby \
diff --git a/recipes-support/ruby-shadow/ruby-shadow_git.bb b/recipes-support/ruby-shadow/ruby-shadow_git.bb
index 9a82a5bd..c9251aa3 100644
--- a/recipes-support/ruby-shadow/ruby-shadow_git.bb
+++ b/recipes-support/ruby-shadow/ruby-shadow_git.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/apalmblad/ruby-shadow.git;branch=master;protocol=htt
            file://extconf.rb"
 
 SRCREV = "f135b3fd52d0a638f2eb9b17a8952a7f0f317688"
-S = "${WORKDIR}/git"
 
 inherit ruby
 
-- 
2.34.1



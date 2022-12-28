Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBC2C3DA7A
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 03:56:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.173912.1672199800544060308
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 27 Dec 2022 19:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93619a1b28=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BS3qSGD022259;
	Wed, 28 Dec 2022 03:56:39 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnrda23p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Dec 2022 03:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUkswrsNcHJVQ5NOCvtGgkVzmvN1fIwobTN4OVUUEqyHQxDMp11Gi0EzjCIODvqCZnn7ZRMobuQOkRlhztWXn7NDXgwPHys2PeLvs7D2wUoan0L8hGD/t4T6R9NrqPWCEANLtIgdVQ2zw5pV9Bk5obQeDxakNF3Wnp5D50Nkls8rmevP9ng9BY0QLPm87keOPzawDkQvmRqNWTW4oKsKoVN3nSQa8ef4Be33pA1AuQGXTZsX0GfchstFioSfAL+R+JXZ57evTXDT4C5AoTFV9EhXTzeXVlHzBJ+z/UqigRFkD8OmmjjOqGCeFMHzPEUQYstjCe4fe49UK4M/xkfpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyV7/GMMZIoPBqs3XgCMi2kHD6Jl3Vt2zhNQXwGA7SU=;
 b=CAs6l8L7cc5gda0jf8QB1yiihBEiK8epi/mgl/efztelW/MY21G2IHRIBQy2F1U6hNlxFtd8R175XOX/1YnAUaWTUbr2h8empGw01Q5BNVPM0ks5IVgahxNGoZYBkLkLPEM9sZsYbsfDeK77byCiLi2qU3oC/Qa1k6uLjHgBeCrf143fVLrtNBSrhBScZnTeqZx0ELBuSY4hRHpAP9+JQB+6UVdoc/JKiml7GPCBn5zYQ4ggZp/wl4ZTYtSypuu68ZBR+cSN3+pGQpAU5v9sB/AoE06sIFRTkbJQqOQ92jcfrsiW7af9nUt7ABlY5SFwuv/aCUpYoDMTdLyJTvfoOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CH3PR11MB7673.namprd11.prod.outlook.com (2603:10b6:610:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Wed, 28 Dec
 2022 03:56:35 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%6]) with mapi id 15.20.5944.012; Wed, 28 Dec 2022
 03:56:34 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: bruce.ashfield@gmail.com, meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][master][langdale][kirkstone][PATCH] openvswitch: backport patch to fix CVE-2022-4337 and CVE-2022-4338
Date: Wed, 28 Dec 2022 11:56:20 +0800
Message-Id: <20221228035620.257925-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CH3PR11MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: b7657725-7632-4f78-c446-08dae887831e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+zJSmk3vy3HOol9QWqgWufu3/h+C7XSWsTsvenVJnSog2xhXjnD2GaPc/bpcjEelt/Rfyso/7lc4/moMkYefBa5Uls8/77WfwzrAuxqMt9ryQ2vc+qNZ27joAm8YzBRKhlP9FKzu4xBlMBab/YPEgsn3UO4WkxsJ16xjunWieNrMI55En1o8DEpDW/8vC8xRWgibi+D1H2hCl9320pcDrTHcQdGg8zHZ15oWzzssW+gGDh4A39meJB3q32W3lcUMOOmBvbtNxAT6h8cvbEsBmwvn/ZdHAOecC3SiX3DWGzmUDEnQ5NMnKa75Eh6Ozl1rqwZ9Eb8jxd8ngKA/XVhv3nyQxZY5ozXlYtI7SGZ1GvZb/gdYv/ReDH1c1cms4G/PfnEWWbszazS+Yc8SgxoiEDfN9g/UlxgXBcqsRNd0lmyU8gl7qWdnA9RaMSOvpnUAEyCPsA5pIndO0goNMtpCzw0zfAfRDV9TbIfkqTdz9z1mOOQ9OpbyZHyarBUpkmRTgrQBEb4bOTT8d3faGzSKD5V/Sk/20tn6u1/RSwyROaDcoUT8ff+i0h7bZjGe95+WFImIagbf6bcRXWSVpqNoM2CUljEdISl3e4h26Vsas03aBJ+jPQM80kUuIHcnY2HNGkJqtAZ4j3OJgQuEzhQP3SAhFCGSqYc1nKhI4yn+CnI8tK8PHi9K+tljaSRXtnXFlUTKUlYbiNqwRhfBV4/5+Sc6kcKVRri7fy5NXGyOd0EE2AfSondqmHRa+2nRTSgLdTwDcP5t6EsqQstaZEFcSA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39850400004)(366004)(396003)(451199015)(66476007)(66556008)(6512007)(66946007)(8676002)(26005)(186003)(2906002)(8936002)(5660300002)(44832011)(41300700001)(6486002)(966005)(478600001)(52116002)(6666004)(6506007)(83380400001)(2616005)(38100700002)(83170400001)(316002)(38350700002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1EVp+oVkVwWqugyCDWnePmkjLT9cGczIpsAMEpw40QXVv26wmA0Y7Z3JM4cu?=
 =?us-ascii?Q?TTUkyNt1KU8nSBZSsP6+tAirQoUutVeuc3WMgxCn3kRQiyokhB5vqfOTMF6Q?=
 =?us-ascii?Q?nZgwLcXWCIk8/0rf7u9LamHVFF8HYjUGO9jXzU8YbnblgJpj8PTK/Iq0JoAJ?=
 =?us-ascii?Q?RuyzKkC8SyzTYEc4am13RDCrWuMBDk5AFr8aub6BXMOyQesHqfrj/PDW2l8n?=
 =?us-ascii?Q?GNl8n46rDsUDIz4Ao5A2NkLcMY+xex6GQjm0J/Z8Ne2MErI495pNDXrhOfc5?=
 =?us-ascii?Q?/QrFNCMsTL/nIP7nkXVy/Q9tvyFCW12Jv9pBtr7eq0y2b/7h21AjVC3Aplvp?=
 =?us-ascii?Q?tLS1iR6x+c1cYNYchSBnYsal51n/VdhP0/K1Kw945JU1qBFSeJGv+MZrMOsE?=
 =?us-ascii?Q?f8r8OHNQ0xqrfCvVJn0qK7S3KXMUZ2QwrDqgMxrzlfuuq58N/pGn+usyPfUX?=
 =?us-ascii?Q?oTB6Gbuj9cOs8Grn44Y1XUGxhgi6Xbs2IIajZbD8JyZwwCPGtq/42wqIYBOX?=
 =?us-ascii?Q?Kf/eYGrxTIBkejCJX+o4hGsjAe+mwQ+PTO4NXgrA2rdIWa2MzUUrc59oKzTS?=
 =?us-ascii?Q?NFPqh1SkuPBZ9lLuxFr0yXo5MuEP7822EFoo0p1NfnZjiFMIZCVzVyuTjtqA?=
 =?us-ascii?Q?I+GF8h+Z67ovKueYRmHNsksHZ/Ko7iI5/aYo6MBXh2hu0a17rxi44cqAWT8q?=
 =?us-ascii?Q?krlicrNJBUZV5A8G6B1LJjOEHCRCltzPMwwT8CsJ8YiqqXuGzftUqKeEffIN?=
 =?us-ascii?Q?MF9VIXxIsG8cs+hhpzWxoMyWVbEDQL01GWdgyMC1r2rz12lzD36R5C4IjDn2?=
 =?us-ascii?Q?dsKXnPM3awcMkemTvMFKbUnZQ1IjMipGi4SrkfhtY+D2M3cGQUk3aw8bXIPc?=
 =?us-ascii?Q?VY5f3sWumyaxZVLca4IeMpCwhfpgtAUlBauKLpwcVPFJgbKu7TG9GaVfPDEM?=
 =?us-ascii?Q?XzJuGNIVDohJprv1UZRLdSzvVsOpYRstEZR7IAKei4NyNdaV6yFb64Q9Tl2g?=
 =?us-ascii?Q?UdbsT6cFzfs/ogD8YopVJN3Y6+xtUeZkdw8Y61uUvFClGF+61q1mmjxz0SaL?=
 =?us-ascii?Q?d/INUsvfUHCdSztMwZMUIVYvBtXWVSuVBP+1IWfg9fR5uBB0+vPAwhKanu+J?=
 =?us-ascii?Q?e3X8T0dDQyTnmz5olFZYit02H5Cna6kcy/2SDwj95hnio0Ctcq77ZdRNU+2L?=
 =?us-ascii?Q?E4JEwzuy0yyzdobokz86NC56v9jCX4Yay4iNAV3xZE1Qcwxo60DFgSBU7w33?=
 =?us-ascii?Q?yqZaMsBrgIcIVTrZb0yz9hKXAiGxhb6DMwYXgu3p/i02j7otxp8vMohkNhw9?=
 =?us-ascii?Q?pRRj18T+NJoToewEfFRDNFnjk3L+HEdexZpbC1uqGzSTWjUTudu9xw5n75Od?=
 =?us-ascii?Q?JXJCmqk0ZxBjHxCFU6TxPxpfGsW7V9jhdxXUxjZn4DM9RZ4YbaXLgi/EWxQv?=
 =?us-ascii?Q?VoqgFBjs/A2pNLRtNY7e0RqXjWWBNt6ieE2fNfMFpEdlJioeil1VOC/H3npz?=
 =?us-ascii?Q?Tix7n/8CRbNPhjK7afB1LmIh4b0giiqqda5qaCiqWb90hhrX5TIiegNW+4zj?=
 =?us-ascii?Q?RJHwa/Bd6chSp5n9ebBIKNUm9r2sRigoFLG/1ZnWr3RzQHkV4+vdBfragCdF?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7657725-7632-4f78-c446-08dae887831e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2022 03:56:34.6439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLRRst+Q6AaMBPkCYXzNykCfJp/Se7u3CWF1UhnaiTPu6H8NGBA7X6CTN7gQeqxpcoaK2pa1mikiVABcalRB/dWafX/s/RRtsY8TuGwZAAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7673
X-Proofpoint-ORIG-GUID: BWhPTZpKu7aI2NIFLruo5_77ntJsSzGP
X-Proofpoint-GUID: BWhPTZpKu7aI2NIFLruo5_77ntJsSzGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-28_01,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=857 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212280027
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 28 Dec 2022 03:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7781

From: Xiangyu Chen <xiangyu.chen@windriver.com>

CVE-2022-4337: openvswitch: Out-of-Bounds Read in Organization Specific TLV
CVE-2022-4338: openvswitch: Integer Underflow in Organization Specific TLV

Reference:
https://github.com/openvswitch/ovs/pull/405
https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...gs-when-parsing-malformed-AutoAttach.patch | 86 +++++++++++++++++++
 .../openvswitch/openvswitch_git.bb            |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch

diff --git a/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
new file mode 100644
index 0000000..ec40106
--- /dev/null
+++ b/recipes-networking/openvswitch/files/0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch
@@ -0,0 +1,86 @@
+From 7490f281f09a8455c48e19b0cf1b99ab758ee4f4 Mon Sep 17 00:00:00 2001
+From: Qian Chen <cq674350529@163.com>
+Date: Tue, 20 Dec 2022 09:36:08 -0500
+Subject: [PATCH] lldp: Fix bugs when parsing malformed AutoAttach.
+
+The OVS LLDP implementation includes support for AutoAttach standard, which
+the 'upstream' lldpd project does not include.  As part of adding this
+support, the message parsing for these TLVs did not include proper length
+checks for the LLDP_TLV_AA_ELEMENT_SUBTYPE and the
+LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE elements.  The result is that a message
+without a proper boundary will cause an overread of memory, and lead to
+undefined results, including crashes or other unidentified behavior.
+
+The fix is to introduce proper bounds checking for these elements.  Introduce
+a unit test to ensure that we have some proper rejection in this code
+base in the future.
+
+Fixes: be53a5c447c3 ("auto-attach: Initial support for Auto-Attach standard")
+
+Upstream-Status: Backport from upstream [https://github.com/openvswitch/ovs/commit/7490f281f09a8455c48e19b0cf1b99ab758ee4f4]
+CVE: CVE-2022-4337 - openvswitch: Out-of-Bounds Read in Organization Specific TLV
+CVE: CVE-2022-4338 - openvswitch: Integer Underflow in Organization Specific TLV
+
+Signed-off-by: Qian Chen <cq674350529@163.com>
+Co-authored-by: Aaron Conole <aconole@redhat.com>
+Signed-off-by: Aaron Conole <aconole@redhat.com>
+Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ lib/lldp/lldp.c       |  2 ++
+ tests/ofproto-dpif.at | 19 +++++++++++++++++++
+ 2 files changed, 21 insertions(+)
+
+diff --git a/lib/lldp/lldp.c b/lib/lldp/lldp.c
+index dfeb2a800..6fdcfef56 100644
+--- a/lib/lldp/lldp.c
++++ b/lib/lldp/lldp.c
+@@ -583,6 +583,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
+ 
+                 switch(tlv_subtype) {
+                 case LLDP_TLV_AA_ELEMENT_SUBTYPE:
++                    CHECK_TLV_SIZE(50, "ELEMENT");
+                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
+ 
+                     aa_element_dword = PEEK_UINT32;
+@@ -629,6 +630,7 @@ lldp_decode(struct lldpd *cfg OVS_UNUSED, char *frame, int s,
+                     break;
+ 
+                 case LLDP_TLV_AA_ISID_VLAN_ASGNS_SUBTYPE:
++                    CHECK_TLV_SIZE(36, "ISID_VLAN_ASGNS");
+                     PEEK_BYTES(&msg_auth_digest, sizeof msg_auth_digest);
+ 
+                     /* Subtract off tlv type and length (2Bytes) + OUI (3B) +
+diff --git a/tests/ofproto-dpif.at b/tests/ofproto-dpif.at
+index eb4cd1896..fa6111c1e 100644
+--- a/tests/ofproto-dpif.at
++++ b/tests/ofproto-dpif.at
+@@ -62,6 +62,25 @@ AT_CHECK([ovs-appctl coverage/read-counter rev_reconfigure], [0], [dnl
+ OVS_VSWITCHD_STOP
+ AT_CLEANUP
+ 
++AT_SETUP([ofproto-dpif - malformed lldp autoattach tlv])
++OVS_VSWITCHD_START()
++add_of_ports br0 1
++
++dnl Enable lldp
++AT_CHECK([ovs-vsctl set interface p1 lldp:enable=true])
++
++dnl Send a malformed lldp packet
++packet="0180c200000ef6b426aa5f0088cc020704f6b426aa5f000403057632060200780c"dnl
++"5044454144424545464445414442454546444541444245454644454144424545464445414"dnl
++"4424545464445414442454546444541444245454644454144424545464445414442454546"dnl
++"4445414442454546fe0500040d0c010000"
++AT_CHECK([ovs-appctl netdev-dummy/receive p1 "$packet"], [0], [stdout])
++
++OVS_WAIT_UNTIL([grep -q "ISID_VLAN_ASGNS TLV too short" ovs-vswitchd.log])
++
++OVS_VSWITCHD_STOP(["/|WARN|ISID_VLAN_ASGNS TLV too short received on/d"])
++AT_CLEANUP
++
+ AT_SETUP([ofproto-dpif - active-backup bonding (with primary)])
+ 
+ dnl Create br0 with members p1, p2 and p7, creating bond0 with p1 and
+-- 
+2.34.1
+
diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
index f5d85f3..4f4efe7 100644
--- a/recipes-networking/openvswitch/openvswitch_git.bb
+++ b/recipes-networking/openvswitch/openvswitch_git.bb
@@ -27,6 +27,7 @@ SRC_URI += "git://github.com/openvswitch/ovs.git;protocol=https;branch=branch-2.
             file://kernel_module.patch \
             file://systemd-update-tool-paths.patch \
             file://systemd-create-runtime-dirs.patch \
+            file://0001-lldp-Fix-bugs-when-parsing-malformed-AutoAttach.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
-- 
2.34.1



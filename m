Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649DBC05027
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 05:32:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.960.1676611968896191934
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 21:32:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=XHgc20vA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14120bd938=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31H5WkxE003676
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=FY2/4NNKcbfHHrCNRe53aB/lXnjr1Y5Cxa0Wex68uFw=;
 b=XHgc20vAjjmAXcCVwpyf1huDBWdAjvndSXJkterlILYQh8+QvzxlYwHeajnxl/OxaDCF
 lNPZN0dDvTiZC88LxC900670BB44uiBfSlPDze0Y7R13LwJHfc5mf90k5QmkjODyzEND
 nuTytX7D44KfvrIp4bR+CzvUfxgD5P0oXCwoCAuJS23ba1YQ/QW6A3aNpDdZfvqIK1vS
 tsXDqmGgDunguDYiVhLwjHwXvYfi5yQXZe4yAIcBEcVKdTihH0v2uc23nEHCs/mEccB3
 GVgdDBrHJ7fItLmHsW/P0PY+NC4yL8M08q98OWo/dnS1d3oBrtBu5oNNebJEC+KAC206 GA== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nsc1ks5q1-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oacUUyCz/v4GSxjYgqzScX3wG2HpRwhJNin5OfuwJ3lmoXA+zKlYw03kTu2gDxvB3yuYPyzSFYgP/KWruSmiFEFXICe6IqovpY9dTC4Em2EupFjxxdLiCVq3wW9EwdLVhtBg5WE7wsj386naGcfuxqozJnLlTE/Jso+QYhSMu836d+mffArg//VgzZp0OfFYE/Vnm7+mGB2CKXnN6IV3JrrfRh4A39/JAE9W6SnsfH8l5wdycxp5a1f1JKJM0EwA7cA19skdU2+oj44D0SrCFXA45zagx+AvYYBCA6g3BXkdUAtygoluMzdSMfHETMBO2fhUr/6LMF5JBz0I3nZy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FY2/4NNKcbfHHrCNRe53aB/lXnjr1Y5Cxa0Wex68uFw=;
 b=d3oH3vcD5ZuyieCixyaOfvFd594PTrMm0RbZkzzDzhxWbLtm1CwmHwiCrpk9A+JKqutyvGZKsSaWWFSjH9Ep1QKuOyWtNY7PqKuo8IhYXhzlELjd9YVZ5iyXsyffXUG9GCAiBIW/LfafWKgs0AqZwrhaMdr38nQZFoOhGUtlN2mc3hZWoxlR3RGJkt0l9Rw8lOAZxbcfRik3XUENQKUr8WkaWGqRbgU8X7zRNGJFoHNH3v6P0873Pec4dDTV0scm/LNFdeL11ERTUasC1J5ZvrXVFBYtBBWEnrYyDt/l1BRQtA61MJjpp8nLr5ZtxJyGR12WwVDWBDfhm4++++fzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA2PR11MB4779.namprd11.prod.outlook.com (2603:10b6:806:11a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Fri, 17 Feb
 2023 05:32:43 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::6f3f:f30b:e31e:1fc7%7]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 05:32:43 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 4/5] cri-o: create /var/lib/crio
Date: Thu, 16 Feb 2023 21:32:23 -0800
Message-Id: <20230217053224.3870-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217053224.3870-1-Qi.Chen@windriver.com>
References: <20230217053224.3870-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA2PR11MB4779:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca9cab3-667d-4688-444f-08db10a8643a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VfwKJ4FCLBf/iyFwG2W7HZtXpgxQZVThdA7IDEvGObJ8wTHe0DiAbHWZk/8LUdJGxqNyho/AmC7IdvX3Aztt7jm8CPEr4ebCbZ+LaMS5gQFey54vUBxtNI/vZ5wAbWPAiR/Q/hjSFzI3LK55pnCGFDTUCcav0NmZLB9vkU+DSzXM5FzLCAamXgmKwT1pPHgSSnpKqDDcjvm9rdEbKyHNf5cX35dL/aR+h8RGB68kvHknfbv+NVpL3iFWvk6v+XBD7QYwCQX1Xx+8wC8wwWug0IJhPaDIStfB6n88wjPIUFE/mBh70BLNprbkWljAUpNBukBh78cZ/nXYPWcXSQJI4VbisJHfl47mzJ9CKgQw09rLQKgp70C+yV78LI6J7NPVwohiitmSBCrCiOpgTt2fcwCWW4tR1i82TL9UfdKbrcvKJj89nINdCKCKANggTTzIxPPFvDDv4q7/aXd1eCf+TzrYJFh/BOj6tHf0C+9Rtu74Ww1jFrc97+Ot+E6zD14PeIFZLQiIeuECOhIyYaQXq/f7vLc0LXWvH8Yms8rNf62F3MvJqQkNQIzdk8aVxW9P1sKaen86p3y5XpODpJ99u75VFfwk5hZACaR2ogmBloEiyJbKlFKQs4FjOMPFWC/m2ZV7fU49le2pOniie64XtQmd+PH26Yw4oRCJAMd+313SCaXXTsVprnKM3OXRRQCpFEqUzaLOioPJ7dI1U1t0xw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(451199018)(86362001)(8936002)(5660300002)(316002)(478600001)(41300700001)(66556008)(8676002)(66476007)(6916009)(36756003)(66946007)(26005)(1076003)(6506007)(186003)(2616005)(6666004)(6486002)(2906002)(38350700002)(83380400001)(52116002)(6512007)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ko1x1QcxSdWdXCuuQkFgLGkIEh1g8+34IC24NkEbBxK4mB3tX1yRmN31WrVQ?=
 =?us-ascii?Q?7B6Od3Wpe1WFD9FDPyWM270CR1BV+pHtavcPf5jycNpx9AwOBx1Hjvp4lYuD?=
 =?us-ascii?Q?SZkmUqiGUJ8QOrYhKKYkRuCx6JyNb8tviXFU7VWXk+22YaYo7355Mi8Lc+Fo?=
 =?us-ascii?Q?4NSkCzo4OvQ2DJsuCGfR68CWeo1EgPMGzKmXS2jQwh44VJkR7xX8y/yaBEEe?=
 =?us-ascii?Q?jXhbqxmiCcHjAfmnUKeuTxzRzAlpcbbT8sXtQlJzGNVRQF+bLQMGgNW+zCYi?=
 =?us-ascii?Q?CkHkamGAwHUEZczoJ3CvV5D93Ob61gI+wNaIw+Ln3IqSqsxVzlEG14skjGuf?=
 =?us-ascii?Q?WFRI846m7iRO4UWmKbkg2+YZhkxNbhQMOWV0NOgnQf9FkJDXq7rCv+TDwo2y?=
 =?us-ascii?Q?1j9nsfAJoMJ7ruj8/C0j4IVQCzqBrlj2SI64emSmqxxWRB5EJUzjwSpoVpIZ?=
 =?us-ascii?Q?edPTCcBSRhe3+EUIyDYKWx5I/MNBkeC59pqiBw7aJzQR9vmWcXxhNJs7pbtR?=
 =?us-ascii?Q?F+8J5zz+YEQ5cuUePKn6cK/nqyB7EGZbeysZB6SG4YU7CwopZpUmBr1yW6mh?=
 =?us-ascii?Q?K4IGNFhRa3uH0TqWjbWMQR4Vt2NpK/D9KkyW5n/quEIceFkxeSzopy/3cVSK?=
 =?us-ascii?Q?EZptYm1OzXiDVzYXA93d+XtNJIqWGzhBhXbtJD4smVoC8mt2b0oOHnZm74vS?=
 =?us-ascii?Q?vaRD3F+W45pceoEJgZRDKXEr5ZP8yEJyFNyK05P16JNUg/B1nWzNGXfBW1cy?=
 =?us-ascii?Q?mourQHx6mZ/tdHUjMOPwUN0YMFMkWFRR1589DGiAsrHnMM/4XI17Qc19iz9h?=
 =?us-ascii?Q?PXVKGh5rgurMctuj7LLTJyRAplV4NBNfTBHa0vjpnC2PeECWQbMSHRSQyasO?=
 =?us-ascii?Q?K8o1koeC516qqW6/sjbHvhVG/k7hUaIs/ty1P0X93wL/Q39VAJCjSKujljZk?=
 =?us-ascii?Q?vp+kvXpKamFQRV4LWw5i53dpgZ5F2eY7XQXj9ySytnFliBMPzlrISYRJkYA1?=
 =?us-ascii?Q?0nXqLjIky2dv4P23g8YavnW99OuAQtkPhLat+4ZMsBnEQ7aJiSMzqmxK8mxP?=
 =?us-ascii?Q?Fxd1gbXYaFOjKQ15MmAEVPDUS2tyzI1cFoMezbaPc21gfd5bhsRxQ+jYAiAY?=
 =?us-ascii?Q?tBhE2VhjBS24nOkL398W4jrmShDNhYB4GlInSmg1weYQIyrUF/Z7H1QdO3aM?=
 =?us-ascii?Q?zs+ULyEc74y2PaOSI2NJelDkG62rO4cqbXJ60dORxTR2n1LP88hkJXRolDtD?=
 =?us-ascii?Q?rou+4HuNCFdRP17zbdMzVZns8bSvqr+sr0TB6EfY4GnZ3DS01MbDLA0TiDS2?=
 =?us-ascii?Q?GWLgSZY1dmWNQR4wepjDnp0IXElvQJYFiUHTOSJk1bLRGnyvWV5kjxO3bIF3?=
 =?us-ascii?Q?2UaoSoKHJR9r34Lyff4nUuEjXwTIj3YlZH3nfzHxt7oxaKzE6a1fADK2GteL?=
 =?us-ascii?Q?3KtXDgslYpRNH5D7P3MoA2OIPuVhL0Kxwn3FEcqDLInR4DZegpC7oV/LOxkI?=
 =?us-ascii?Q?6L/Z7lHweQVGemtAy/e3bJYQpq08LS78B9UF2z3J/VyzBRB302pSOlgSfpnJ?=
 =?us-ascii?Q?iM/RcbNHR5Drcbj5aImwFgKNzSIz6ppWdsssSQQn6rtypHoF36qHWJZJ8DUB?=
 =?us-ascii?Q?qw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca9cab3-667d-4688-444f-08db10a8643a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 05:32:42.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoSxBSsbIofGAEnbT00aAagcJKvWe2F+A7G45Qggfv6djjFCDqe+AiyXmOw3+GvqFS0f4c4UEftL0AVHr5jCLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4779
X-Proofpoint-GUID: nin7hO6x60oyl94s0Vqxbd3NknYpvkYe
X-Proofpoint-ORIG-GUID: nin7hO6x60oyl94s0Vqxbd3NknYpvkYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-17_02,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=719 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302170048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Feb 2023 05:32:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7862

crio.service now reports the following error messages:

  level=error msg="Writing clean shutdown supported file: \
      open /var/lib/crio/clean.shutdown.supported: no such file or directory"
  level=error msg="Failed to sync parent directory of clean \
      shutdown file: open /var/lib/crio: no such file or directory"

Create /var/lib/crio to avoid such error message.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/cri-o/cri-o_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/cri-o/cri-o_git.bb b/recipes-containers/cri-o/cri-o_git.bb
index 7af698f..315659d 100644
--- a/recipes-containers/cri-o/cri-o_git.bb
+++ b/recipes-containers/cri-o/cri-o_git.bb
@@ -96,6 +96,8 @@ do_install() {
     install -m 0644 ${S}/src/import/contrib/systemd/crio.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/contrib/systemd/crio-shutdown.service  ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/src/import/contrib/systemd/crio-wipe.service  ${D}${systemd_unitdir}/system/
+
+    install -d ${D}${localstatedir}/lib/crio
 }
 
 FILES:${PN}-config = "${sysconfdir}/crio/config/*"
-- 
2.37.1



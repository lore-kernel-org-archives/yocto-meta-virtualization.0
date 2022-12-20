Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40801C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 02:25:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.41044.1671503094074402290
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 Dec 2022 18:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9353379f2a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK21cMJ026395
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Dec 2022 18:24:53 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mhe5q9p0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 Dec 2022 18:24:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccyaICv85W1TcrkniMLz3wVYSxW1UmeRd3bvhpwhtih2gK9iXO6bcpvVvEpZJQSFRp+DUVsRKpzfzXmCsEzaug3Hnb3xr4/1pTW/+0VFR2rP83ePs3Ui41uUM0APwTJNeVVNajkayScvDtT+RZ5poZADIoVxXS8pcERMZQd6OMmzvSQSPmugvFr1FBz54ujBwmyY6YCDEhti0WwqA/ALXJcOnKeZ3RWbtcFYs9iqo7+8Ybw1kKu0Sllf8+X+deSg2ijErW6nYB6Enffr01zmqkjNdH20IrRsP4HM0S5tDQq8U8a0BWRQ25Wea2I9U0nWIL1NHSYft7XsIDNW+OQFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJJLt2u0aCpcXRUgY1+5u6RasRIXkb6AMeiC+Ut1BcA=;
 b=FRUKIAreqgdLADbrnY6i1MoGFwmXMdUJJgaYEra9PTlifAwaDcJgr/B96CO2VCuBQE3bSUhJbxVTqUf/iJa+pe26mgb3dfvlLSwf15KFs5HF7DFgvE7R/duqQUXdzKRZB0JoIchu4tqvvrGwz7bRzKM3oAe3nEd+9xczBMCrsIThUrZXUV2gK3HKdbHcvhZL99zRV799yhh22giA5ehjQB7Jfa146djYp5kiyiUWdYy6sQOKxEL03B85ZosKRzx1hh5Qbdk8B7tW61r0k9s6CNhL8t8djE6u0QB1CJPCTecGpcKsgyJ8vYRA1a8c6Xgn6I7+NVPfLJ77daIzHHG3rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 02:24:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 02:24:52 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH] criu: avoid textrel QA Issue warning
Date: Tue, 20 Dec 2022 10:24:36 +0800
Message-Id: <20221220022436.167085-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0212.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::6) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: edc10af5-07c1-4936-0a80-08dae2315fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jPj/7wT8P39kGvTv5Qgav1c3SVj+HKaUUAYdkUOwM0MqHikdiuaGDr4bLmYDYjcd82GxqNWBkd3dUfKy9O27Y9vSGlCP8QgGsWjpzwRDM6URMOC6JK1ycZMwy02HvXJ/Tk3VkgEyNY/8a1nm4MriskYxQNLcr3VOEZGRefbE9ty5GalSYpkshu+ryrkY3kFmE2q3Qb46/zCgYmNweHw6ZCglg8Pa5y9GhZRmPFQcJZhZ5YBXuHmQHM52JXIpp6UUtFeiyJHc+WJvDo3FWMvUxGAaiYONTnKhI1rcQyFe5r2+nECA9ls5GP3+TB0yBqc0k21mKTjAsiTXwKKTY0dlOHosidlSKibQAm4HsAvISVAMNkcFQ1+jkDcRjeIazwJjj1Bc8rc7AjjKE/2k4dVe2P9pL5T59jyocTaWFOzHLJfwvILq7Bwfoa4mwzI74fXvM0yN5XPxl2knfvxoKC0i3rbepMOOMucoZDysx0FKkKajBjb2PaSU20gXoHkRb8fs3Zy2UT9ftt1uyoHboeQvJr98A2wB4m7ibY3uEUxgoy2l4aE3w9n2Jk9OalLkj1q7FdCOUqyJfmyV+0NLDoxSRRdCFAggg8CZsY9pYq++vuusEa8uxJcc27ZVKCXPGllAnsRKH9JlfvR28OXqwNBPP+1F+aLSepv52aDLxQ4xu2XTXErgnti34v6cztIF228T/01A7WshbUFQEyoe+o+OLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(396003)(376002)(346002)(39850400004)(451199015)(38350700002)(52116002)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(1076003)(478600001)(6486002)(6666004)(83380400001)(66476007)(41300700001)(316002)(8936002)(2906002)(66946007)(66556008)(5660300002)(44832011)(83170400001)(6916009)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uWIdmJw6JpqBvBMdL4Oubf2jQVDBKKPmTZsQw6Ytd+o6a6I2hfNvAlqDtCun?=
 =?us-ascii?Q?mXnNy5CyydmoVooUtonLZ4PL09A6ZvUurZRw7qOtC9m63I0CXWUMK+nTBJow?=
 =?us-ascii?Q?5l8UqimEXbWqkwvwOUU/Th8U6YQ8TNvJGx+HfFrVRfzCNs/6BH/ilNu9WLF4?=
 =?us-ascii?Q?4sGW+pOVj7HV04lOOZZFQaUZ9TBkDhenIR1eriwPtIWAFtkJL8RIFn0agPWG?=
 =?us-ascii?Q?x9k5QNl5K8ZK4R+Gpg82MC9p1waa+15LH/VjhCu79pa4u0fau5e8WL6tJ7Hm?=
 =?us-ascii?Q?UmB9G9pVhWHsgZgP1+pwF69ZmrKJYk7AQ0MIFrCM3i/h3maTBLzTQxr4671p?=
 =?us-ascii?Q?x0Nj9HZXKE5u9Ojxi9JKeiaCfkXZKPPwgFhgUkOAsQMija3KfTOHvhhAq36q?=
 =?us-ascii?Q?QNSVYX6j+jE3Tz/XiANwhASUYcgkOKZRWm0zwf3yWCXAFAaKwDqlbuO3DZQ5?=
 =?us-ascii?Q?1qfeaqooYlDTMsQuu1H5a/ZbNlvm2YB6hDAjsJCBB8QDJcu7mJ8qP/UP3d56?=
 =?us-ascii?Q?7cL+toA7JFKn0EFdCmT01nsWR/5pV6wFUVNyUZnajyqRxFw9AqTLee6xXRap?=
 =?us-ascii?Q?nhLPYYpLvywo/1FgaV2iuOLpKVDwB8khEKSEChbPWLIBj1b+rKGFabjmMmpL?=
 =?us-ascii?Q?9kBMrztm1oJiXvIFo50rI6d0Khh31RkjJttl4kqZL5nltMFad/nSTxIt45la?=
 =?us-ascii?Q?qoAKAZyzEsJA0RDtsL3UC8cJ8nj1RHJDh5zphLBeofJmh/I1EZwkZI0eg4+F?=
 =?us-ascii?Q?II0uNXwLD1rsCMLAok5AmAoga+euZaih9jrTCOMOJ+tzNb8yqr4DVx89IRUi?=
 =?us-ascii?Q?Eac2iRqo84NuBpNtaBkbZ94F/2ACLqjzKdjZDa7GxExTK17qQuZjN7tuxx7I?=
 =?us-ascii?Q?4lVBdq0gNxethuDC8I4/p5FJgEkTppgxkTTAEcMxKDjO16kGGP2w6eFlf8xV?=
 =?us-ascii?Q?f0O9wTsY5K18dJQgbktFjq7SDXJ/PYZZL/EJyJ/1xIzA8sXq4a4PGKlkhElw?=
 =?us-ascii?Q?UfEBWdPezBnZnLi4vfaoqdL/WTiy2AkXqXzVi6pWiJ4bFGk3RUEMR3cX4+6F?=
 =?us-ascii?Q?riV/qJIbR49/eyCTro4dBDWB3SxJJub4qcEf+ttNPut7Wfdi75Wk4kyHjsbT?=
 =?us-ascii?Q?LGGaftcArJFV4Jen0UKXLHdokJlqi5oTvr69/mM9OE89hOgZnEEtfPKmklP2?=
 =?us-ascii?Q?HL8mwF5lNywB3f4PqIwZzhbURz1D+JeBM3X9kXRdfQHUmCpiefyOXRFh+Rx2?=
 =?us-ascii?Q?z28HZWf/FobLsF9jfcHYPrjya8LjiJqF125FoIumG7Yze4gwUg0r9OInvvcS?=
 =?us-ascii?Q?8YP13bqB95hSj6NbaG8Xtq57Pj6L+waoNHq+nIURW/1b8U5bRTKsshnQ+PMA?=
 =?us-ascii?Q?EYgRy/Z3GkOOgVXk3bLOamKZ6sjKcKlc8BLScBuY+0rMzG46nKqzszJveSgw?=
 =?us-ascii?Q?RPcfOicLlsKA+jAysK/orGm8jtEGI+1rSdOOBOl+mvVxTmhPY8OJbH2gnMYl?=
 =?us-ascii?Q?LyYIdZ9HHBW2Ovw8troGRbC7Ksq7vv9++kbNpodB5BRoIDe0QBXPWFF09Upl?=
 =?us-ascii?Q?19pkSbeVh6JmgbPQhJi8WX6gjYyReqsNefNUvn8AAlpq1w0DIqDPUdh9kL20?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edc10af5-07c1-4936-0a80-08dae2315fe6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 02:24:51.9345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwkDYbwz1h4gXLfsOIfROKgc3saOdzoV+lQF9thqVdtYXcENhzuzMQ7Unw9J03OMPZAJfCr91yTSxk1da4JWfFHtyzX7C56FazTjB1QdWQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
X-Proofpoint-ORIG-GUID: oKctKOlZvSqF16rmfTdm0V8sKD22-q8M
X-Proofpoint-GUID: oKctKOlZvSqF16rmfTdm0V8sKD22-q8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=750 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212200019
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 Dec 2022 02:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7775

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Fix some of arch such as arm/aarch64 would report QA warning as below:
WARNING: criu-3.17.1+gitAUTOINC+d46f40f4ff-r0 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 733e911..3d25aa2 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -66,6 +66,9 @@ PACKAGECONFIG[selinux] = ",,libselinux"
 
 CLEANBROKEN = "1"
 
+# WARNING: criu-3.17.1 do_package_qa: QA Issue: criu: ELF binary /usr/sbin/criu has relocations in .text [textrel]
+INSANE_SKIP:${PN} += "textrel"
+
 do_compile:prepend() {
     rm -rf ${S}/images/google/protobuf/descriptor.proto
     ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/images/google/protobuf/descriptor.proto
-- 
2.34.1



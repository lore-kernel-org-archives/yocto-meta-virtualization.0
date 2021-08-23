Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.29004.1629746426498513555
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 23 Aug 2021 12:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=NNISysby;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=38693267fd=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17NFbo10031959
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Aug 2021 14:20:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS11062020;
 bh=E35OKTr4S0kYR24uPT1iGxxpZld1lOi68TrEU2IIyw0=;
 b=NNISysbyQS3r0X4woxo5TGmutmRu9DvvNsld3SMkm1f6gOjZJzmGM1tuM8dJ+jw4y/3h
 uo2BE8i60w6DmwHg8oG4Qe6w4Z0WAnRBBScefMcUfMr4p4wZcn6XpIwWrFsqt7EcBQQ7
 ZyxNQ8nuJIqga2H50V0vFcjH09ALFwokX8J5oasq/io44KyJeJj6FeyYAWbembZR31zn
 nh1jmw0ammfGZEr3bSssEbKZJ04mdP5DoRFX2Pu6kmU6+0kZt/E2zMCt3jMCaq+zWt+q
 BB7Gba36bgKDxoox/bJ07qcPMEuqlnnOz2FsRc6qK3KYTTU/PhdcyiUfQDMngmYb0ga0 2w== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0b-00010702.pphosted.com with ESMTP id 3akvfgsvv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Aug 2021 14:20:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+MJkT0qmoLGs7WynSpqv/XCO7yuX5AKyTy+O7vFdkPoHFHdc8ebG2Qx7NxkOnhq5hXUpsRfifBbmsNXtIqtS1ecnxrlNYaVB5hfgqYk16gZUmjicVqlkIeoGhkmR4bW3S9d9lretNmBakJ90fFL/oLkbeGxOGOlYTPj1FXsDiTvx7oMSXAWr87KJcf/DEYr3w+b5fXlQo7s6nZOWREt5dNOOxtPM3gHn1tu46Gd4G1OntQxYg5cAQ27zPgEVXwGes1A9iEHZk/dDe113qkqc162X8ZN4Nz2tV7dCSGF+jCB+EtQ+yB3rV2VueIA5jKQ/QmMiKdwlJg1PtgECepubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E35OKTr4S0kYR24uPT1iGxxpZld1lOi68TrEU2IIyw0=;
 b=i8kBP93Znl/Svk6JdsduxFCYW3iGpHJVnNj0JhMk2eZCinNFX+VEhAQJxohEbITyieUmhqXqtbaEkB1/cvLyn8TZnfNaw3/npEwqzLFe+SDkD5EcfmWfTBMOlNOs9Riv+pAyPayZK7+FnmH1CSfLrQWH+fJd7CHSfIDO/d7JA3PCfL0SPfhL/fr7h7xb5QO+KByVHuM4FpLIoAN1Uf5pIwYQLEdpuydySYUmmu20hkjp45rG0zJXqWysts/m/3Iml/y9rdO9sVX7NM2LcARZIV2CyM8nOh1uhMhMJx29lMlZTBvyVxyjiliTT7SA97MYaBrSgQuQXVQ/TtPTxabL3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E35OKTr4S0kYR24uPT1iGxxpZld1lOi68TrEU2IIyw0=;
 b=fb4wKpASMlxNkV+nJYJh7ReomSkil6w3YWj7vZS+L6zqEU+n1SLxbYv70fb9tBdPhdLAROgrJk0sMPVukl0/KaW70t95glOeFbetXs6IYGRCd4okYOxV0LxgvXCyLV+TXHgrV4AKzZKlVCTtYlaNS5VoT1El9cFGtpRUqO7dn+4=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB4733.namprd04.prod.outlook.com (2603:10b6:805:a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 19:20:23 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::8cec:8bf4:cce0:906b]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::8cec:8bf4:cce0:906b%3]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 19:20:23 +0000
From: "Alex Stewart" <alex.stewart@ni.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Alex Stewart <alex.stewart@ni.com>
Subject: [meta-virtualization][m-c-s][PATCH 1/2] salt: correct LICENSE md5sum
Date: Mon, 23 Aug 2021 14:19:31 -0500
Message-Id: <20210823191932.2555152-1-alex.stewart@ni.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44)
 To SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 41d17.amer.corp.natinst.com (37.19.213.70) by YT1PR01CA0031.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 19:20:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8d90a52-3f74-4112-688d-08d9666b0e2b
X-MS-TrafficTypeDiagnostic: SN6PR04MB4733:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR04MB4733D828783FEA4774276846FEC49@SN6PR04MB4733.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eyopOao1FPycDYgzPelLhVG7HZSohxv2YVYRXl+cFxlpl59NwtxRFWvTEMfdPpQwuPlVW98OZ7TUFEQW/FSm5VAtr+XctNAkwDj198+ycASFmLhN2eBeD2tgh/hqqoMjbKqNmkp6uiFWzU4NSijeFJk/Nj64pNx7A0K8S1CLtLlElygIv+RQUYjxCZXTBlgS8ywj1gWa2lZyNYY6hb//ZOw3n0BGD0JJa/2PFuw2kFWw/JvOMBb4B7XeJAom9hVGVUXknMMScB7BMmp+zPRi9+sDlQGLBQK2UvamUvU2v7hEevMn0Ig6rwd9iF2omOTXdjr3WPEx+rqYE0eGR+jdD82eLS5eZmv26OuV2WutZkoNFrRFFX+6ujAM/2myTUDUWmYbPctJ0zifR8rrqNc/B69cLcfDTKoBYL4Ag6jqzq6Y1dN30VEuBLGls04vhiHe8c2Rlyb9LfN0E5qzbf0gOJ5dkYRExKow60QuIVEHOZvPJ1JNuSloFfm/KkYFVey4Danm2Zc6xQTXpGGkb2LLKO8ZxyiP3V9vrzzytDm6WyXOKFZtlJ2UVhR0eLAYteFSwZYy8Ifb97ZdfqDy+OWHkqi6Uz83xExpAASAOnF0KbSWVSjwwqnwFWvrui+LjBbuMMraTiDNsOnlsdJSrXDXr3OUCx0EEH7GNIsYjUF2swsxJ478mh0MSigBAmjc+9vTzJyscFYwe073zntBh8TvKXyc7zBIJcLPXo1SvKcmPSxY/il+doMA3F5GxoBih4MdrfgUkQzV08m7j1Eb5hXlpKf/1EIhxhPv3DqZeanp+WEt45yAJC8kBSsBnkr5AFMe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6666004)(44832011)(26005)(66946007)(36756003)(2906002)(52116002)(6486002)(956004)(2616005)(5660300002)(66476007)(38350700002)(38100700002)(8676002)(86362001)(6512007)(1076003)(186003)(8936002)(6506007)(6916009)(4326008)(316002)(508600001)(83380400001)(66556008)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?R0V2jCnSoxCvA5h3BX6qRsK00y74RLdLACN6j+KyJoAEWjnf6UdLr35XEv//?=
 =?us-ascii?Q?/OdAklA5CvQq4Cyzng4+5QaP6Cq9T4g6p7ZlVMyDX8ntcuxznaicvMfUJbdM?=
 =?us-ascii?Q?CDn7o5YWI3wi0DcJ226QZXcMASCUjEQl9SQQs9JIfFGCDSIXPHxIYKZ8BEtf?=
 =?us-ascii?Q?7vaH3vRQI3u0SWI9SqqWGBWCa4RlzWCf5mzNdPuayEOWi+JSc9mXUqmEf2jW?=
 =?us-ascii?Q?KDyQUc0XyBsV9tYZeL2+9hkg59A/1ukM47971bnmLgUuOYMM7IdCtQ2SrInV?=
 =?us-ascii?Q?LhdXzTw0/hfy4dlfGjtC44QRqptuadLn/D5qDLWOpjv9bSpKqSr2eoWOnRW7?=
 =?us-ascii?Q?+vg8CHVlGBZc8tB9YrOFvUYBkplas5rrNQQqO4wpNKhbij0KRtsGhOcar7uB?=
 =?us-ascii?Q?Na1+PqhCCbuBXIOna85WW+qC4AYIKOzlCRoRcvcLpeisOKoTH6BT9Uz1RPfz?=
 =?us-ascii?Q?tlF2GYMFjertStXSWkHVr3YrgbcYf1zHZqBkStQasrSa378jHey+PMTtyKFK?=
 =?us-ascii?Q?HZNlp4yjUdwLNU/2Bz+fWNG+kfALCcH8ay5IQR/p21k13sou4yPlyGlljTB1?=
 =?us-ascii?Q?4UqoQBTh8rRxB7TSjc/nwiIrUZ9/M6cK0wvQ3QISABMdqd30OuVgHYfilKLW?=
 =?us-ascii?Q?kZdFY5qotUKEl4ioRaTGdBCJLpVDp2MW12VEUEfq3KgWlWo05VlSsvESFm8K?=
 =?us-ascii?Q?PArfdWO9TopKtAjxeG3++Ce2R+Gq3zNUrEjlICo0GnD4VQ9+9F1rFnz9t3/l?=
 =?us-ascii?Q?qLcdCCKKXx9ZCiy1g492rBaeUJvfsQyNU0RoF4XmYfPCBMldX6lxjI/ZgapA?=
 =?us-ascii?Q?uSvYHJUMp2gNuwoDPU1hSQl1bRdsh2LuPCSMnlMEOg807xksigqfIbhDg+tk?=
 =?us-ascii?Q?ughYX5kwK6NfALlKK0QsSS/ePC4Fci4Abs/6VpI+/szMshLNtbOzk5PfNSI3?=
 =?us-ascii?Q?Q6DeNFv6Pht91eK6K5DHfH9BhkMYQJebnUb/H1KoYhzMzvQKKs9r7py4TCNP?=
 =?us-ascii?Q?MAy/h+zHTWEAMJ7L1u3ZEsJ4GVHDRmpuTXESDjia19KTPqd/LiIdY3ev632+?=
 =?us-ascii?Q?oEmkBGhir5ppi/QuD5DISKS1WKK410MoxGlJ8V2xY9gf3HIuqcOhRKaDnoyN?=
 =?us-ascii?Q?KIIdRMPyRQYp8HqNmXdtPkiFyNeb8Nr3sD4bBOuH373wZ+7AuP7HXToFWMCk?=
 =?us-ascii?Q?jRTPqQRxYgoBtihKTvaFvOMbH/4OC0YSPsh04n5vSIl7Wgzqgf0s3Lxtb/e5?=
 =?us-ascii?Q?95ly9i3r2pf9EXJcfBn5RfEDWs8vrVvL5a8B/H/YI5TjgdRqb1oBaBFPXFFH?=
 =?us-ascii?Q?cayrUwm85Go1VacnyafqJ09g?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d90a52-3f74-4112-688d-08d9666b0e2b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 19:20:23.7164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gg++O3qKq5/ALAN/gyeMAILSL4Arb92mWx+BWDiWfxcO4GRoO1IUou5g0bDvemNf2/7xM1x5/i8TpPgHnI7H9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4733
X-Proofpoint-ORIG-GUID: tJ2BEpgx14jkJ75l4omq81LobCIuTeNe
X-Proofpoint-GUID: tJ2BEpgx14jkJ75l4omq81LobCIuTeNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-23_04,2021-08-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 phishscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108230132
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The md5sum "ac9a49d8..." has never been a salt LICENSE file hashsum.
Salt_3001 verification therefore fails after fetch.

Set the LICENSE file hashsum to the correct value as of salt upstream
commit a1d07e9cc5d84895468bf360390754c4d68308d9 - which services salt
3001.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 meta-openstack/recipes-support/salt/salt_3001.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_3001.1.bb b/meta-openstack/recipes-support/salt/salt_3001.1.bb
index 9b485d699b5e01ed287256b96e33249e98b02ae0..c789ab94c44bb6fd8713f15174b4ffa91a173e47 100644
--- a/meta-openstack/recipes-support/salt/salt_3001.1.bb
+++ b/meta-openstack/recipes-support/salt/salt_3001.1.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://saltstack.com/"
 SECTION = "admin"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=89aea4e17d99a7cacdbeed46a0096b10"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ac9a49d86925151327b277d6a3999a07"
 DEPENDS = "\
            python3-msgpack \
            python3-pyyaml \
-- 
2.32.0


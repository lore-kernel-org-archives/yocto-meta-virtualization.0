Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.57])
 by mx.groups.io with SMTP id smtpd.web09.8827.1616740314631680103
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 23:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nfdk1Zae;
 spf=pass (domain: windriver.com, ip: 40.107.220.57, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAuDP5RL5VT45MXCmrWJkAcrN1oybsxsed/G+jVE41IXoWSbl/rn8l5yu5gYkJa0DMNHo7k2bE9vSXofyO61IfAXWx+UojMSvyW1SkIsItlXA5i2struWWNujfPVRUbg1V6YH/qNz4eu7wIjqYVs+GhIaechNPxNpNh7Vk/1TyeQwFAgpxAAWG3uucDzR8blZMenqXeIA+uN+dqhKD5jGgJcYvK693tXXV0Azj6plz4EYFVYmmso0K16OsagmtuxjJlSLAlcbylJ4m2rEwJINwAZ2drrLd4Fa6cwdMtutoDPkCP+6RFHy3CvBVqNrGqfnJhXDrWtN1Rc0lFcLSoE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z70ojt7KSXEUVtid4fLNt3zA8GvKYNIL6RC5RGJ7ZI=;
 b=nsgPsFNxr8M4p0hqUmqcAG1PYUpv3q3KNXGFjl4qzatPGRQpvyZebTbMIa5LzqXtbUMG8tDIC3YWrI2SC5XvtLr9Y0/9BTj23Iq7v82KTj2H5+NBBReuAtVvrmjUDwBrmufS0oU+sxRRKJfiNo63QPY7y9nm0qPxdAExf1X4bIuOP6sXUIrv7Bgcq3cJSnitKoAv8qhqZy47Yu5RSu3qBVb87Q2pVauFmT36t4jpQfQdmG3U3MBKu4cy8D7uaHM7BqXSehXu6hBKb+ech6trS4wOwUopP4nrHv8eAO8qJY4CphuEYXEzngBZd5/mw5amBbztNrZNm2FKa2ZvlN44iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z70ojt7KSXEUVtid4fLNt3zA8GvKYNIL6RC5RGJ7ZI=;
 b=nfdk1ZaetOkWqArjEHAfxmifwwZ2g5WLkZ+cZ8fNZw7rLxHIbKIulvylk7zIIZq2uL+qMJD9QVIsRseQD1t1KR4Ku6rUUUDh/cDujYXNVUsuhz0701w1236Ot2yYQURPJ2I9hqSjXleKOEUFvKrncxgG/YTgHAOOjkVy93aTqd0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM5PR11MB1929.namprd11.prod.outlook.com (2603:10b6:3:10a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 06:31:52 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 06:31:52 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: bruce.ashfield@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization] [PATCH] ceph: uprev from 15.2.8 to 15.2.9
Date: Fri, 26 Mar 2021 14:31:58 +0800
Message-Id: <20210326063158.4015-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0160.apcprd02.prod.outlook.com
 (2603:1096:201:1f::20) To DM6PR11MB4202.namprd11.prod.outlook.com
 (2603:10b6:5:1df::16)
Return-Path: qiang.zhang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR02CA0160.apcprd02.prod.outlook.com (2603:1096:201:1f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 06:31:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e455bfdd-dcb8-4310-4db6-08d8f020d7a3
X-MS-TrafficTypeDiagnostic: DM5PR11MB1929:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB192909C5C4C57D15363E2938FF619@DM5PR11MB1929.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gpZYm5FpQMoIWAf/6cNDJOTcPX15WBd798KTkn5mMYt8mojZFdNTZMDHIt2CEAdthYpD0ot/9IctjU52IpDK/BpNFS9kZnQXgt54sYusWkQ1Cy65UTJg52zmuvqXnLHblRWgH97lpuAHmcCpSmCuvuVM4xexASACWLZ/6X0C+BAYFidkamn+jos5BV1Sv6n58RrAWZz7mi9EYeV8KLqV4nOWfVajYbfHlvfXVT9CJLlDLfV+GmvmnZZ7TP54zgHP2ADZqlr/qkE4wMDD96uNrrSqVRn2lcdsD8ouy583tp9NIR6QmMapND9XsMW3QlnUC5zb29XqL77HlPym76aMixZ6oST2r5Z9jk5LymUeHnwau+t6xWTK2laQps0N+1b90ufNUFEGRzl6d5sFqb1I2lcbBkFRB3LbJJS4JGlxPaJPmbvn5fSzjQX/mY57g/4kWb19OJ+eOQt/nbg6lggw19UPvd+INqqQR0f19/bl+VCl2UoSS23dEvwafRcwbR9YVGTWhLI993wIWUIaWHbiT4QiMQIjmWqKobBiCJG/8YNpCLc2PgDiTOrlNjK6gmH/S9aqY8PQu5PK9zmRVkZf/xzqVGgFHRjxc38TWyenlfgdetphiNwGl67QY/fRwa2cMud2dCDdJwlemyDXHYWTrDlJCKaX5s3lxaioi99b+LnO5fcgW/ExWYgoX6SSLqp+rJUx0KeQ3nwCKjz4fbulX1b8mlyE/B7Nd0kaJmRJVc2NgHC81//tj/SmU3lQf7Ou66u9Z4vCjurBL35C5paItA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(396003)(136003)(39850400004)(83380400001)(38100700001)(8676002)(8936002)(86362001)(6512007)(6506007)(66556008)(66476007)(6486002)(16526019)(2906002)(6916009)(1076003)(26005)(186003)(52116002)(6666004)(478600001)(36756003)(5660300002)(66946007)(9686003)(956004)(2616005)(4326008)(316002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?qrgPV+pQ7gvE6CJqRYrLDh5Ejido9M4hNBwE3XMsYGp5ZlGUwvz0/P0b+Pck?=
 =?us-ascii?Q?pgSj3t+x4NANMFqn04psO8z6EtNpfmthR/0uNI6smuDzJpeIeryGLTcEpjQP?=
 =?us-ascii?Q?nM/iee0Ewv7rDQPjvDGvgVv5YydZIThp0mH8UUNKnY7iPyKhjGDPzRT9IXEy?=
 =?us-ascii?Q?5uBcnD10txHXdq2t0GHS6vtbc8Cx0WGOwaWUrVBJcLDV8GCM1geUk1MUFWEX?=
 =?us-ascii?Q?W6WwNF20DQ5Jr1J4SF05zMfbdkbhpyPfV42Vf470XXpMuxGFVcP2so22mdYM?=
 =?us-ascii?Q?xJ1NJuFXzwecYgkVbdNUdyDibeBzxDiy2lqiN/MN+MyM1a/uRIID2LJ2Db2M?=
 =?us-ascii?Q?gBLkd2nHFItm6DNSzqbZGcMJOtLb/jpzxWz6QMeo/NAmVZNuVSWH2fbLyWaR?=
 =?us-ascii?Q?fB3Z263OA1tMWZ5sYEctnEasnYlYuukDee++9KsRYh4qQ26pZcN3cV9SuL+E?=
 =?us-ascii?Q?xode5D+QfiEQOj4cW0tAn+46VGWDkzrEYORTO5I5B18AH4jRTuydwvKBXdqQ?=
 =?us-ascii?Q?GA5nx3IuIB+WKt+UQq42p/fUbZurp7HlCooMPkZ/dkVJhTd9/B/XNFI2h29z?=
 =?us-ascii?Q?+3BzpKzb/1f/oPlicFqiaAKyqZgZg6gYWca6aTPqhh3N0GTgmWf66LAqUK9n?=
 =?us-ascii?Q?QLg2IZxSh+fvb85LhuymUIGosQ366/pLI0YOd9cg4/KpXpZc263/P0wFRv3T?=
 =?us-ascii?Q?aKvpOnrNUmDwxgoWMvD8ej3DK+H/n5kFujBAL6266i8ZAwdd+ZqLUQUXqhAs?=
 =?us-ascii?Q?3L2KZEzrwWG5qkmtmoRDvSvGEr6OVPdXCuRkeDa8/cRdJqbd9Q7MOCL2x/QO?=
 =?us-ascii?Q?cFAblXq+L4E3B/cuOyRu+FIH9/rR2oSpPS6OzK7laT+YvG5UVxfzBC67l/rx?=
 =?us-ascii?Q?RxwrwkeU+0l2pY/MFrbO8VcxvXUKkQUXzwCAiOJstBD/GqwMQYJbaOIIewTb?=
 =?us-ascii?Q?9mhCpldR4HZ7++7pz1moeoB5uWF31BxxY7NecQ0mNQWOSdOenQv0RzQFIFGy?=
 =?us-ascii?Q?G2JosjRosWVDIIq9ZxEXvGOIONoxFS75JqyICgBhWtXYmFhnGzs6dSVRXlYR?=
 =?us-ascii?Q?wQv7VuSHY3YQZdgqSBBWRywPHvaC/cP6gLRogV48NykmpRMvqyJhPbDlNHlK?=
 =?us-ascii?Q?nLLbKNG1iqCbrY0Z07UVUByVz1QiwyXlF8FgO9I5a6ZwDuGaFLeggVQB9GHt?=
 =?us-ascii?Q?xOfY9RfkSL/TkxdIbueukV412EWULLLvjN/DOXANnJ6bHDr88bRqKoYBQhcT?=
 =?us-ascii?Q?DjNIRMa6rErKJFx9P4eez4GENF/P6HI5EnrP3RHH79/RbCGwMeuOHqRyzzLY?=
 =?us-ascii?Q?SiCyo8zimRzeTJQ1FyQ+hGMh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e455bfdd-dcb8-4310-4db6-08d8f020d7a3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 06:31:52.3876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSikET/SsrveSAWzV88Bs8dYB8r/ruT/w6ti1xv7uAn4PSzAm6bbLkcCOanRwguht+rw/j7khSk4NLBgAfoU++qRi7mdDyjVuWc9l2Ez2Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1929
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

Notable Changes:
1. progress module can now be turned on/off, using the
commands: ceph progress on and ceph progress off.
2. PG removal has been optimized in this release.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 .../ceph/{ceph_15.2.8.bb => ceph_15.2.9.bb}            | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-extended/ceph/{ceph_15.2.8.bb => ceph_15.2.9.bb} (91%)

diff --git a/recipes-extended/ceph/ceph_15.2.8.bb b/recipes-extended/ceph/ceph_15.2.9.bb
similarity index 91%
rename from recipes-extended/ceph/ceph_15.2.8.bb
rename to recipes-extended/ceph/ceph_15.2.9.bb
index f771baa2..0d821f0b 100644
--- a/recipes-extended/ceph/ceph_15.2.8.bb
+++ b/recipes-extended/ceph/ceph_15.2.9.bb
@@ -16,11 +16,11 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-cmake-add-support-for-python3.9.patch \
 "
 
-SRC_URI[md5sum] = "cab93dadfe38888561d390fd58b8c947"
-SRC_URI[sha256sum] = "64c5eaf8c1e4092e59bc538e9241b6d5cf4ffca92563031abbea8b37b4cab9da"
-SRC_URI[sha1sum] = "77b60c3775cd6e38f2d07870aee550368105c74b"
-SRC_URI[sha384sum] = "2173c5176e9ff3745e4bc493585a8cf14e9e7737cf575551a010b7b84cd6b88b378dc93e6509b3a696732c51f530fa60"
-SRC_URI[sha512sum] = "66c7322575165b4747955ac9de34f9f9e2d4361c8cd8498819383883045601b92f786c4336c79369d6f019db1c4524c492faa40cdceed7fc1b2b373ca6ab5065"
+SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
+SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
+SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
+SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
+SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
-- 
2.17.1


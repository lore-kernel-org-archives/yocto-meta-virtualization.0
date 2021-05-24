Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.24684.1621869814752343430
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 24 May 2021 08:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AeMWQOwO;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0778c2e939=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14OF89wa027250;
	Mon, 24 May 2021 15:23:33 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 38re2qg12u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 May 2021 15:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YY2gP6zG8NXl9+iAH4tSMezXecgCTVuOsaEQF6f0qYnK1Esm+ubYfAklPrwji8YAZQip1S3oSSRpWdW1zeF2V+sHKUKKRgrH7aIHqWBW1DJL6S21+wHhlyFUfs6ZyTm2hjb3IPNDIN1nI4s23oZdQWqGXyIeo8r9tU1iROET6KYwTgA2CL4sBQuEcc91GDNvmLOV0hDAVmvfJihBK1EsV0DC0pKlOLUvhVhjhKbNSi3fyBTwSYCUNkq8ewwIaVdJ1RQAJ4QRxbiU4XCcig+o9Hqa7/NmEZ5ZAjFGiHuQKzEl4tKz5wX3M1sInUpv5g9L49HoywVJSY69LjKhNVEdfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b7meZdLThQCXGUfF7sQvwCNxB6mHKdf+ymhUGW9Ez4=;
 b=JY4BJZM8nT+khVfo4/PFsRRxvFD4+dGiNo4emLshW51TAy/sdQsDzyWwjh42DgcTwBUYJtQ/EGK3zGi3L9zaml5SEFnYzFtmo/8PfSYtih01aDGxj/ueWC2iVnfLO5KJVjPoe/k+bEeTALBzQDf9hyGHIGEOM6ywtTgv5OI0xd39VxHWTNwMemvDvuywORoyAV9OzJUFm0y0z1zcQK3c6VhbdBUhKxJp/305prp2SAPsjgOfTh05sNcoMXSJnjKFNfld6wNQceVIus/9dVzHvU0DzaJTAeuB0QiCWNE9vCW3vuutvlYULqVJFiNEvxCawGv47udOTw8ODotMEg+GzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/b7meZdLThQCXGUfF7sQvwCNxB6mHKdf+ymhUGW9Ez4=;
 b=AeMWQOwO8fwMtEItnyvH3+Nqrrw68I8BK5ZUK/w8nbEfi1yNkmJ8mCRuzoL0b8oLNMlDkmPh6Jw+bQPKU3uPUty+m582ohiFpgps8I2KuunuFpQFafVgyIrP2n4bkqVTa0OVkPfSv1zVjEAABMxVnoLnfha4MxejYtjXtOUULOg=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:95::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 15:23:31 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%8]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:23:31 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Saul Wold <Saul.Wold@windriver.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [hardknott] ceph: update to 15.2.12 to address CVEs
Date: Mon, 24 May 2021 08:23:16 -0700
Message-Id: <20210524152316.3296558-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MWHPR19CA0096.namprd19.prod.outlook.com
 (2603:10b6:320:1f::34) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MWHPR19CA0096.namprd19.prod.outlook.com (2603:10b6:320:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 15:23:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c728fbe-cc0e-45a7-386d-08d91ec7e37e
X-MS-TrafficTypeDiagnostic: CO1PR11MB5170:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5170BAFBDD22698E36DA6B2BEE269@CO1PR11MB5170.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4SvNMZZM6oX9BOz2eYvsY+LBnoYbCGrjZK0XS5/IqqDB4bjcuTDVQOe89C2ioE/76zdCV8r0naRVCfDO5lSxvuOZhUwFW/DaGaPVZfu6F/QRnAJDHR3SnM87deRG7sUAPmXzxSXhxwLFqV5Oh3Jl/qleIK9KF/kdcZYikfp6ehhX/1TKqM06Zz325cGQSD9lm+/DFXV//260JoDxjVi4v9ACl2CYmvCjQG+OKRWtiypsT5CgKEFlaITZdMuwm/j9/u3moXDazxxf5YSTH98S0Vvp4sNbONCq8NL5XQtsTxs1F5L7qyWYtF5cN1zuti+e5Q06tdQ2540Qal5jp8tXTxKB9U3IQvAV/8E/Jml1rGihxzpILpJvqS6Zwxi9bCujl0b3japyQLa2C7pSw49W8jEHILee+iEjFz45N+bD+9KhKPWfNW9wWh5/aKNzhfetuZWvf+Vg1VoCI2SX6xWmdANKyWWjf4kEnyp5nKb+OqzLITRXMxlsqd89+ycCC7K1Uk+IP7GeHZaWtTbuRl4EcWKuegkQIWTZbRxbBQpMKgvL5h5EMkW0358HeyIyfPEG5I6DKlzbMHQm0HhpQqS4lbQkv/xtZjzo2GVafBRBbpgwVVe+LytnAA+qEzQ2dUNrdQAKHt8H0HKU5n5YUX9IvdjsQqOETKH/9NCGwK46Pc0EwsgZYQI9/pSck0Qu9Xck63XvdvAXl0edZXOuM65I1AMINBsPQI1/+XgFHNZ66GZHJn8Q7iVO8UpCVez01xiByrk3sC/0EIEWpirSLkAfQoL7h6BdWb86vS0ieoULyaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(396003)(346002)(366004)(136003)(52116002)(8676002)(83380400001)(316002)(8936002)(6506007)(1076003)(36756003)(2616005)(956004)(26005)(5660300002)(6666004)(86362001)(4326008)(186003)(6512007)(6486002)(38350700002)(6916009)(38100700002)(2906002)(15650500001)(66946007)(44832011)(478600001)(16526019)(66556008)(66476007)(54906003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?R9wAaYP4vDK02h/9JwxzO/dGWl2GGdyX4H97DVEPaj/TP+0PSm9fX0jwFWex?=
 =?us-ascii?Q?kViApNZwoN98ipa7FgQnqmVr1Q+WF02j9TdHH4xmtwTdzmbUIVb3Nw5vtTCN?=
 =?us-ascii?Q?VQXhvtCXauLP3SJR0h34F2Xyy1cjdec+HqjNNUUQQ5jbpPX2O86kQ3hamHTI?=
 =?us-ascii?Q?ci1kfHKjs4Z/4BeFU+0hb7ICeKfadqHwvJ7nZOFZIUNCtNg628Q0n4WsWH7w?=
 =?us-ascii?Q?hwQ+CiduSMtv1XdpVAnRF5t+5Lj4BaHN/LlzTz6HWHaHc8NuhNApXbJ/Qlnm?=
 =?us-ascii?Q?XE+RcYhXHU77Hg/8VTmT1N0Si344SFN2+95h5AWRo0X0mdqoWE45L+nkfRwH?=
 =?us-ascii?Q?RZt8z3nf7aAlZ1/CVAnXtXdhV4aiVU7JTDcND8kHNBD9RbEnQ1b2qHEo+4y2?=
 =?us-ascii?Q?wuMsadMw1ZPhzATTqxSzpmZWdPTg2Zid9x5Vv7QF3vvnyn+nrFzZfCReTUWB?=
 =?us-ascii?Q?/gatXNWxrgAIg79Uob9jB4tfIeIvfp3TCIFZ7PmPGvr3xw+38xEGp3zVgc8R?=
 =?us-ascii?Q?jscPS5AR4bdxQNzA6j6QmxGG6NnWPwfKRjDVwrEuNIXVXaOlz/Fk/zhEJAZn?=
 =?us-ascii?Q?YPJ8o0VO9+XxPCPFXd7NyzSXn/paNdLJsTYzvgap32JMWdLq4j3ehdubykIt?=
 =?us-ascii?Q?NpfwT0aU0SZlga3/pkkqzgvUKIgMy/E3a2EI63MJyEBUofl9oDM5la711jg1?=
 =?us-ascii?Q?skOJhvWe9xxYVapQTewA6G83uGtGcoAzmQztmM+eUd567WH14/8q8TCurm+p?=
 =?us-ascii?Q?GDaoKaDg60+9SvawX2dzvasdDUAC5f9YZ/gJQ122h9pL8gIQB0O0AYTxvKEB?=
 =?us-ascii?Q?T1fxRXBe1s+wLl6eQvCWiKOFli1Q8OcMtrA/749OI27YzC2K4oYR7LdQsNXI?=
 =?us-ascii?Q?m1kwWmcVaBlTEuj1NSBObi23SEYQZW41nL6bFQvSFmmGT+jCShnQ4SW33bEq?=
 =?us-ascii?Q?BaE2szVf5iImwblS7WlSNnMlJ/MX4fsY9Sdvvs4TbU3XrmNBwohrGBgTDTLe?=
 =?us-ascii?Q?9c3YKozDsrK0m7HdSZKRLs7isLQ2QeeuNURxvD8JZzTe/b6ardjHpOCMBc5L?=
 =?us-ascii?Q?rDjCqoKAqUPgK3qVNo1F0/k8h8mPSO+6aP5dbXQP4Gsi8c2tjK91qc9Im+we?=
 =?us-ascii?Q?Utkj86va5dUPwv9jpmEwEAo71HiFv0jwheaKziz4nd4KGS4c/rfyjS+o7pUH?=
 =?us-ascii?Q?To3lnzZC3SNtLQZuV7RQhyk5Hb0vfm3cQl/Lrsk0kgdHukzmteeWPHDtSKNQ?=
 =?us-ascii?Q?rE0gnMTsLiBxLTRNcWiBwDBDBQvO9KTlkilpbv9RJiVm1+NvrW7hjVKCCtdI?=
 =?us-ascii?Q?xe0ipWEPo33h5HPGWV/kqAcA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c728fbe-cc0e-45a7-386d-08d91ec7e37e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:23:31.6379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zKbL+kkq2+ijI984cFgc6nGAWsyn2BClS6E6cyvmtjGYv4zdvpV+k/RtxxSqgCPxsCrgM9J/0rsyE2ztMT0VBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
X-Proofpoint-GUID: Fjx8ac7nclgn3lAJqIOQUqLN4gvW1-Vy
X-Proofpoint-ORIG-GUID: Fjx8ac7nclgn3lAJqIOQUqLN4gvW1-Vy
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_08:2021-05-24,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 mlxlogscore=790 spamscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240094
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Saul Wold <Saul.Wold@windriver.com>

Updated sha*

Fixes: CVE-2021-3509
Fixes: CVE-2021-3524
Fixes: CVE-2021-3531

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb} (91%)

diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_15.2.12.bb
similarity index 91%
rename from recipes-extended/ceph/ceph_15.2.9.bb
rename to recipes-extended/ceph/ceph_15.2.12.bb
index 0d821f0..9ba72b4 100644
--- a/recipes-extended/ceph/ceph_15.2.9.bb
+++ b/recipes-extended/ceph/ceph_15.2.12.bb
@@ -16,11 +16,10 @@ SRC_URI = "http://download.ceph.com/tarballs/ceph-${PV}.tar.gz \
            file://0001-cmake-add-support-for-python3.9.patch \
 "
 
-SRC_URI[md5sum] = "5a949b91199efe130bfe2e57f200eacd"
-SRC_URI[sha256sum] = "ea7fa2be68b3570c5c3aa02774dca27de20b6f20a8498f65e5c4ef375a209ace"
-SRC_URI[sha1sum] = "0503649d7c7d9268cb61b03bbe839106988f87d7"
-SRC_URI[sha384sum] = "57208c126ea8e640c3979073fd64ce58606f17b4b7ed2e005b0792bdfd51b13391af325658d0f68f961f94175d93e891"
-SRC_URI[sha512sum] = "1f55b0a13bf06df782831d0c9d5f8617c22442ab97fb186e6ccb08183e02bf1756caf8633fa6b1cf156c3fb7b1bdff90a60a1249adfad0b9450036e2329bf8ff"
+SRC_URI[sha1sum] = "9c76b298e1e659b9c5501003ac77fb28aab7823d"
+SRC_URI[sha256sum] = "8710f6700de83765138df8eb4fc7a5e7c66104dd838033e0827a1850f250ac85"
+SRC_URI[sha384sum] = "2a2f177e5b68f6f5d13b253a8d4daba9e956b4a79a40a4775aee288b60c612fe13b417d6baf77944c32b1181b2136f68"
+SRC_URI[sha512sum] = "08266a2e9a7ca5a37e03f340873571fd012c630dd898a87241cd97c29760b2bf41fe64c8883e7b08e0f83c26245072cd26e69ecb1db02378d1ec38335ba1cd0f"
 
 DEPENDS = "boost bzip2 curl expat gperf-native \
            keyutils libaio libibverbs lz4 \
-- 
2.25.1


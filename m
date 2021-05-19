Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.314.1621462556672375370
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 May 2021 15:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aKxmhPfo;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=077372f3ab=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14JMDbaQ021585
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 22:15:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 38muc70np1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 May 2021 22:15:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0Z0KNX2sPBJdbvLhiWbPDfVaUiVB0UNdginMLsL1iNJYNpmILfENpnrbWfz5jx6KaZ/0HSzd8CNQI6mXJfWhU+tCbbVdS4qFBSEsHRLgMPeTJ+pgpnuolJcd9vGcKqt8VOTz+FnWLCy7MhFAsOKc5Ny3v/MJL9ujlVXegyPCWUVcnYLDTWArHdfj0LjWYiqULaMBfskI1d/I0Vl3ZzvZq9yuEbfxjMmPtppmzBBoRrENukWkCVOQ0D1S4Hfsetb7I96lS9nh3tbuFajuXl+R0PMXBwbmB17RPsg+wkMyjsjjuUxIHU9N3mkIiLNkDIDvAPsDDSrSBTrZoVy9NCKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+jAyYlWS92AKXfZWoV3e/NfUKuQMyvXyibsWZiisyU=;
 b=CU8OYKY7wMEuzuuENCXAGGU/2iGu8+tGchMR8VM9CTEtxPQdooqUcOFPlBAtyNWkiSi8FkqSQpXuWgvOqqcqPJ+bPMZZsv0hiPSDS44mZHgXJA7RAAxjHOd2rvusJrANPKM8s9u5abvwKwFH7lbiJAS18fe0wdhjrv+tNqKs0OdjY40OxgCXE9h+Vgaje4FPeSrViMTB0s2QViMELwKezbU951G2L82sW+IRtsDcScd58SaPn4mrmc42klaKTJwoBfPPJCb7605ZjvfixU00OwOBh1FOTlIJPwDg6rv8ELPB9U8KaLaNkKRWElQUVurnBukZliK+55tn9U3BYB6T9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+jAyYlWS92AKXfZWoV3e/NfUKuQMyvXyibsWZiisyU=;
 b=aKxmhPfos+LUj1fr8OGjE2iq+9Fit5TgE4e0n8XSXl+5kkmK4MPITGjFdt5Nr583htgIzg+WxbZw7lg9g601NHunLa0f2mNyKKV+XHFechh7gsYyfFP9SXkxnG5UaE+mCdlu4axZmjjI/FJ7FPUoEwiTyPMtdeXD3eVoWQ8WMSw=
Authentication-Results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 22:15:53 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::fda5:ca87:9468:ad8%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 22:15:53 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [PATCH] ceph: update to 15.2.12 to address CVEs
Date: Wed, 19 May 2021 15:13:31 -0700
Message-Id: <20210519221332.289403-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW4PR04CA0045.namprd04.prod.outlook.com
 (2603:10b6:303:6a::20) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW4PR04CA0045.namprd04.prod.outlook.com (2603:10b6:303:6a::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend Transport; Wed, 19 May 2021 22:15:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c794f71-0de9-4b50-7068-08d91b13aa5c
X-MS-TrafficTypeDiagnostic: CO1PR11MB5027:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB5027275829518EEF04C1EC5AEE2B9@CO1PR11MB5027.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lKZgeuXYEWr3YICOWvFEU7UctT6RGLGBupyr/O6powI06+nQsHvYDRMxmLPsSBY/tFyzGPrdaXOhBK/eRQC0HA/yBQlGv9rjTnlVohf2mguZxNJq6Jm57SxhXA00qhyhljt85QsmUZzf61kM+1xqDIOJi043xxyZG78hr599WYha1vuQd782ANRMblO6mGpmxwb+gtZi5qZ9rUVELIZLkPCDGMAKFgSLSfVuzpMEovO2xTD0MCluKLlGYtmvufZRJ7YTafW/RHsH7Sun9qWRioXsFHNlUtvVFAcqHJuhMQIihmzioP2Z+Bwem6/24cpohs/Ss6J9NtqMhjMPj5uPSyckDRvYPa9V+QRGLc+LjhPcjX3fQ9a55LKja8ANaA7gbzdzK8egJPPATPvZkn2fxty6dzBgsWXEgVkZ+GfRIz7t33956Di68qmzWMgB4HnC9RGrkjEDdr7g8Q4t+8As6qiRj98XrpihzLgyGvUwdOPzEt3YXcwouVEox9TZ0WhdL+oDXnYxDSL/IVPitZIxDNkymLBJIL2u6wgfoxiSd91PD/8wvTaEDnGqMqqxWahAy0Fr6Q771/x1z28lrZxbs2MTlnq32ej4QUHUyKpW4pMlAgL9zYZuvRIvYZaDe8WRTQ105hNsBbaswzz67fD78CaZm7JmlbZfWklKOMo+7DBIji0T7YG7XJ2KJPDt+dFxri+C/BKo6L3TS4CU+IQsPxTo8p4OtH4ux9+hJD2u7XDj+Pm/7G6QPfXOfnKgSC32
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39840400004)(346002)(376002)(366004)(36756003)(6666004)(6512007)(26005)(6486002)(44832011)(2906002)(1076003)(6916009)(66476007)(2616005)(83380400001)(6506007)(38100700002)(316002)(38350700002)(5660300002)(186003)(478600001)(15650500001)(8936002)(52116002)(86362001)(956004)(16526019)(66946007)(8676002)(66556008)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DVn83398w82O/ok1TJSYMRQwT2eUbV4KrfdFtPvG24sfzY3ki019uIrfawsz?=
 =?us-ascii?Q?jCWL+lK8GyAiXRg5zkRUF0oZPyGpNvT0NG9uxGneZ7Yx13AQ0SPOEvxKDpUa?=
 =?us-ascii?Q?q9tfqS9G0Puuwby0tRuX0pla2OWGV7J9AN5VGCDBXX7u3/yfNo9fCYbQ/WIE?=
 =?us-ascii?Q?eavJ36aycU4XOIPiVe0+yxWTK4cMSaDPEpM701nHQwPQ1EviZ9M5SAJilnbx?=
 =?us-ascii?Q?1biGv03ubAavfz4uOVYBHLDwRw6bJHmtWeufNcEJjPBg54NfD6zpjw+OZVzZ?=
 =?us-ascii?Q?ogWPVKDwG/p5jalh44NxzRtriJy/YGrrxeZ9Lj2V0Y2JfcJhVKPMC+cTc9dG?=
 =?us-ascii?Q?zeLxGHpmMzBw1Doo+XOS5FLvw5O7HQrN8UI2ZK2yCqoGo0cp0ApBliLLPSxB?=
 =?us-ascii?Q?b4fXHdD/Y53iC8eez3BK2zamO3pdi+t5hs9mJxMBxsuaZYZOA1/HXYO+Pu5p?=
 =?us-ascii?Q?IBg55rl2U2TAFdT1e7n8aNxltud9Afz+EhkC822lDVc4K6RA83ZAQQ/uDtOD?=
 =?us-ascii?Q?OuQdNi1FTSbDqAgE4v0P4J7M5MfG3vroowXXaBA1B9W/KVmo4dpT5KzPbKos?=
 =?us-ascii?Q?elpsHnC5FfMRrw3sylqRjwU4FuFcbQ39UlQwjjSZZt/+HYHcEBASENgX7yiP?=
 =?us-ascii?Q?gAMwlVzP8FcXthwt9Ey4mP3xMDfi/lXCQHsf8fXfu+m4lNZnnTtnIdbx2x+q?=
 =?us-ascii?Q?A4wf7P4DWU0XHCd9G6TKbuVpWt0X8accMWXHowaJkgnbMxIDTrWcylhZYBTm?=
 =?us-ascii?Q?2HvMKF6UGXIV6wSGRUv+VjoDV4XTuL8mM3E5XZlJqF4Mpt3OX8O/m/2NRv++?=
 =?us-ascii?Q?M9eL3Ip/ntuAuT6fggK8WeXUZi5dTuJq6GbxOaY5xXtACcIYMMQXuMdhejhT?=
 =?us-ascii?Q?EDPR7i28TA6DZGyKu9D3S/tvDcKEt+KywMXfG7P+t/XX7hVnOXoFJV8kDMU8?=
 =?us-ascii?Q?DNkeHV3fh1Ja3l8GwOV5ilrJqca9jPKperPEDN8WL0TDSh4aCjqLNTq6vmMU?=
 =?us-ascii?Q?ryRbfROxEKy8OPTcboBbC0Fna2CR0T5HpNgXWOrXvJ/AloYpSPdsQ+6aDsrC?=
 =?us-ascii?Q?wD4QZcbIv920W3oMsrAeyXlt0MU3IOf7BSKon/e7rC/i1RnlHSSVkgda9GUi?=
 =?us-ascii?Q?zmRwVJQoM7bHtn9gWCpdn0SYGfxY8zd/f/ZLcAgEMyWqLFlXriQ9srlGoARG?=
 =?us-ascii?Q?kUmU4jJgYiBe+Axa8CxCCndIKkuEx0YPcZ9+N/bJMYjNKYqkvniD5gD/xZup?=
 =?us-ascii?Q?3Ql5DKIVaXWxbRSIwB2g+6XD2E3h9Tl8GnytPlofp9rL2TjpRYbBHEXpIhB2?=
 =?us-ascii?Q?rmQi8lqhbRqDXvWqYsyCMd2V?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c794f71-0de9-4b50-7068-08d91b13aa5c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 22:15:52.8518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJYOC+/olwI0aa7DHb4haGHKnugFeZNnPosX1RpxBaJfpm+MoNwSiZU9iWItOeYvfBiWOXakTC1iZ/kjZczQOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-Proofpoint-ORIG-GUID: Ge7P577B_GsqsQw_g9rfuOX3HjphqH3h
X-Proofpoint-GUID: Ge7P577B_GsqsQw_g9rfuOX3HjphqH3h
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-19_10:2021-05-19,2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=830 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105190135
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Updated sha*

Fixes: CVE-2021-3509
Fixes: CVE-2021-3524
Fixes: CVE-2021-3531

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 .../ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename recipes-extended/ceph/{ceph_15.2.9.bb => ceph_15.2.12.bb} (91%)

diff --git a/recipes-extended/ceph/ceph_15.2.9.bb b/recipes-extended/ceph/ceph_15.2.12.bb
similarity index 91%
rename from recipes-extended/ceph/ceph_15.2.9.bb
rename to recipes-extended/ceph/ceph_15.2.12.bb
index 0d821f0b..9ba72b40 100644
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
2.17.1


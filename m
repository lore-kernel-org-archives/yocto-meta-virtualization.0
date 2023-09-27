Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3936DE80A8F
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 05:54:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11471.1695794064181450512
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Sep 2023 22:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E/DMf117;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76349c5ec6=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38R5rjPT001547
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Sep 2023 22:54:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=4gmqMPrMAS0KaQ+iEK
	36jrKh46N6xGgYAO/Z7BJZpJ4=; b=E/DMf117BkPjNFDIgYCKqtXpvCU3CoLHzJ
	c3QtEiEtbnzO8SOpe4JnHRZetqTgxqPWqg9tLRsH/CWP0jGJ3Dg93tYDsDQdXady
	20Z5ucW4Y+4ld3NRtMWw9QUMlJheygyvIf0yIvu4Wl4oicO+E5E61ljHcCoMR/0V
	xJkwjRw91PHEPN6LKxGCcqvfPV8ox157amdic7UpheFYEaNqIUxtYDV1ra638q38
	lfGEoyT54do5AVEDgUygyBa+Rg5AyQlkkSlIlOvuHCK2Gnl+n/+hjzWIwZpfXoJA
	SslCB6d+BtaoF6abGaNZG5hhJ7ihKfPrgf5PQV+DfKLBEt2yPh9A==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9ua0ke44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Sep 2023 22:54:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HttDaR99qLRzz81/KuRaKgTCZojrmE/+GHv3uIGwbBFfwLJg4P7oQHmTJM2mu+NMWFwwoolc00PIumXKvpuu2MBGY/UxsElmxZB7z1xHuoLTE4AhUFvOuhGhoMp3VbqiOxMUdpCKrZUVy/Fqqbpd2UsK4RyXGQo39bi9A9BfnP9VblULQxVwaZrb+6uj6xyVDLBYeuW7EQycr1HOrLdjQ5j1AXD6x26tuUjOgcgSU9/O36TdNZ6pA9MTa461DhUIOvj5iBOlucq0emcH0JkjuQk9DRDc8s7DY8Qr7T1v9bMsD7CrrvF6cb/B/ED+JZm8tw4Uoo3k5OGQMS7i4WGb2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4gmqMPrMAS0KaQ+iEK36jrKh46N6xGgYAO/Z7BJZpJ4=;
 b=BCP7dd8YscJrZC3WCdtfQywm5046ANZiny3wpZQR+aDpJuSA0PwY4p4XYY53BcBhDxd8Wz3PgKrLmd4Q9G8y/gJWDo1iWjrIJNzXwa+3eaecKxjMGoJ0VmQsGjokmO5EYtTEbY9v3BdWEmWyhFwTJ9+08QcyA7DD3Ml9k+6N4jfKU3Dz3L+SnN23A9Xb52Xmhmxv4v0rVX52Dxycj7TkKc/w1fA3pKjVHo5438f2C7LsAtpNOnkFe/3OFj9UMPe7PXaitQ6wYTknYwLVIYi2l86OpWxaAf54GlJ+2nah+kiurrjub43WFLQkdR6dSrmP/M862KS9aLY9UclqKzHGjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 05:54:21 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::da88:58a3:bc6b:2e3d%6]) with mapi id 15.20.6813.017; Wed, 27 Sep 2023
 05:54:21 +0000
From: Qi.Chen@windriver.com
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH V2] docker-compose: fix textrel QA issue
Date: Tue, 26 Sep 2023 22:54:10 -0700
Message-Id: <20230927055410.1833651-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5f70e9-159e-41ec-9ced-08dbbf1e3217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E3XYqfsY7snxSeH7TwH6nOa77gMlpWOiYSFlpTxMytaZ77Q8SRSbuR/fmnJYdKnXdcA14zKPmKV/CIF0cWNfNct1QGsVhsMc0wOFsaEkqBlL4XZ6dKR9LY6ygjuFbmTA5Na5vviTMV+cXNdBnSZPYlddul+IG71V4KWsgxyJwosY1SbANVi+cpyoVAYnvb8BwFRbO3tH3Tw4LoW6Y5yAZ1CglBPgvp3hZ7BA5i7M9b0wOyvKPt+KYIEeXW+RrDvEb74WcUZabQ1C7BcLbj+ck84VBuyYGnBj1MZXS6z7ys3H/oiMG7gDiEJUiSQOyM2vIo8EW5djQjDEnjcCJFiEDFEwyTJs3njbwDkzdk62aN1ZhP3wpC8cyFypGRKNqRlxJAmFwsCLdGwNQ65xxiApbbGshXBbsDgzmo5KX7zcAw1fqTVcmRGr6vivLijh43edBY/M2e4L5YeTaCM5QCQ98v+oDnjjgnd2rfWGZw8vNXuD7LYJBKxyawAcxLA+t0SNOfHOzrH5+b9oi1/xzLQX0WQtY1aG3YQMsIwnvzUgPJM9/dBp8wrIVcEamuYlRle0HdPtCGASQMIeo4OcCezljguK1riteUU5dP/mwoeNjb6q5W4mv+djMV+3tpKY6Gdt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39840400004)(366004)(396003)(230922051799003)(186009)(451199024)(1800799009)(8676002)(41300700001)(316002)(66476007)(66946007)(66556008)(6916009)(6512007)(9686003)(8936002)(2906002)(478600001)(6666004)(26005)(6486002)(38350700002)(38100700002)(6506007)(5660300002)(52116002)(83380400001)(36756003)(1076003)(86362001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0ih/w+GLLqEZxAzjfvhy/LSX0ZmXbPi2OBy1dDIjhNK3V6NK9r5lniHly8u5?=
 =?us-ascii?Q?fuMasN1DY4ewTUF6k41eC56BZFM3XDbQQtjiQ01xeJMVyKAGgt+SiNJjT1AO?=
 =?us-ascii?Q?6PUTWybG5uN9zeIRPT8+Qicdg7CA5bXWmiNoc8UhxEex0zWLFvhzGLe3nO1Q?=
 =?us-ascii?Q?dFjfnL15tVdBvl0KvcgIjXaxGr2QB5j20FEsA5iEobLOR+KWOvJcAtgc5jIT?=
 =?us-ascii?Q?SddvR9bbhNrh2rHsOgcLef07NBg72Ttsa9ngticEpdJwCzE64BOcNRpkpcIV?=
 =?us-ascii?Q?H8mlE9fOb+828OxX55Of3xhNGfOEzPEWOn8whE3ESq+E1qMMlUzgOGozprEC?=
 =?us-ascii?Q?OlLAENV4i5e8cHo/vTTo8Xgymm3MG2HVyDxGZjVjiotjhqggUabiBIXiTuoT?=
 =?us-ascii?Q?+gDccnNrDIeqIGpudc6nCChOzRke2Vm73SZ62pjWn45m4C8dhIDw01B0xVkZ?=
 =?us-ascii?Q?jy+wWxqPwWi4tBqwcazhsord/AZynwKnV3c4C5Fcwr+GWx5v9EW3wUAwGgU/?=
 =?us-ascii?Q?oomWVBuV2cK5oBmOSZW21OuVczZ3v4OVHQtG33vZlLWk4CDPbyltFlFG1sYl?=
 =?us-ascii?Q?FaviybZQBifuTY+bfbh1eIJKAMJ0O7ogCPd0v593OYB09muovSAV4NoO+Mxz?=
 =?us-ascii?Q?1fGVbbwticvMs5rwBeJT1FcADnpBq7Bw4ELtZ8b5JvwgP7CyyK6EQhtoyK5b?=
 =?us-ascii?Q?JENoVnW62PeJUpbd+O5LKGTSqod9HgR6ZjSvaEYsoqlVYses6C5HV+ZP5yiN?=
 =?us-ascii?Q?gyCl7rpdVbcK9aSoOMwbhqsRzGsEaucWydg77aRZI6bxssbhVoM865ixSMZV?=
 =?us-ascii?Q?4E5VGvR9jAPzb3OuchUr8FuXiK0gu4LAai9B62Jp63vfgHN92h/6Edro15ry?=
 =?us-ascii?Q?SrFuLbL0dQZnt+8bQ4oEOTlkUjlCsByFTyzissc0uOmvG4B1BrfXQya1ZlEC?=
 =?us-ascii?Q?VSCoqJh+U3gLJ00DKBM6qLdhGl/laXfbbQ6XVPlDZgpBiAk8ilg7gkVTizFu?=
 =?us-ascii?Q?tVUSMzlbxp0Yo8f8aR/AVSrDI4TbERzOEYhkJlD9fgiDVUnxHB1GEI6kIW8Q?=
 =?us-ascii?Q?juHk9OSzNMa5Lf1hoMvIhogNisYd25oDJ6QAgaedur3JEGUKTEJGyPeWt0ow?=
 =?us-ascii?Q?z1r4fCEwSO8dfJjmzNTPn5MfCoLVTNezQL0OqSdK4B2AXHj2rmYs0KOmPDku?=
 =?us-ascii?Q?+6LP2DUluaTz2Omwm21l1WkhLiIWiJkFq5XG4dfn6rEpbHtXU+TFmq7YkvsZ?=
 =?us-ascii?Q?sz/0q0sgIfopo4zAvIynnszqVskTnZCuz9iRr2k4sLQSZ3q2KH6vUJafnlP1?=
 =?us-ascii?Q?rdVNnfrBFHWQg9XTnooyQ/qt31GMDvpXXTRvpwUuoCw/nc+EsU5tdiCJFLRx?=
 =?us-ascii?Q?2xzGctMRJh7YY+JKF5KGg2Z2kwAdyJGS9vNwJlaC6WgD59DrUk9PcgJSuk91?=
 =?us-ascii?Q?4S4ScB4csyqc0niYK0sgkKCmhuAF4HND2k9wZg7p34QN+ml1sr/yCtkMGyC8?=
 =?us-ascii?Q?lsebtzx6HiCALGvhYh1RG/bDXriwCy0kbSIoiHiGa3+OfnShGZ3X2YYvYacJ?=
 =?us-ascii?Q?LFGer8J0WlhgumZwLShSb2yrhUm3kKxXQ4fIEjKcPXfvowqD4fC2ypcAy4mq?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5f70e9-159e-41ec-9ced-08dbbf1e3217
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 05:54:21.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUHTlRelTGzrKi4tBjOASyBgvJoAU1DGjlLviqoacPSSQwGMNmUqKcWX2uXnFmVzgXfxAfLQ5jFWjC2TOzAkeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-Proofpoint-GUID: eid0Lmq0uNjRzto9tRJrOiu-nqqha-gC
X-Proofpoint-ORIG-GUID: eid0Lmq0uNjRzto9tRJrOiu-nqqha-gC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=782 impostorscore=0
 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270048
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Sep 2023 05:54:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8324

From: Chen Qi <Qi.Chen@windriver.com>

Fix textrel QA issue like below:

  ERROR: QA Issue: docker-compose: ELF binary /usr/lib/docker/cli-plugins/
         docker-compose has relocations in .text [textrel]

The problem could be fixed by adding -buildmode=pie, as this option has
already been in GOBUILDFLAGS except for mips and riscv32, let's make
use of GOBUILDFLAGS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/docker-compose/docker-compose_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/docker-compose/docker-compose_git.bb b/recipes-containers/docker-compose/docker-compose_git.bb
index d528535c..f6a2502a 100644
--- a/recipes-containers/docker-compose/docker-compose_git.bb
+++ b/recipes-containers/docker-compose/docker-compose_git.bb
@@ -38,6 +38,7 @@ PACKAGECONFIG ?= ""
 
 include relocation.inc
 
+GOBUILDFLAGS:append = " -mod=vendor"
 do_compile() {
     	cd ${S}/src/import
 
@@ -50,8 +51,6 @@ do_compile() {
 	export CGO_CFLAGS="${CFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 	export CGO_LDFLAGS="${LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
 
-	export GOFLAGS="-mod=vendor -trimpath"
-
 	# our copied .go files are to be used for the build
 	ln -sf vendor.copy vendor
 	# inform go that we know what we are doing
@@ -60,7 +59,7 @@ do_compile() {
 	GO_LDFLAGS="-s -w -X internal.Version=${PV} -X ${COMPOSE_PKG}/internal.Version=${PV}"
 	GO_BUILDTAGS=""
 	mkdir -p ./bin
-	${GO} build $GOFLAGS -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
+	${GO} build ${GOBUILDFLAGS} -tags "$GO_BUILDTAGS" -ldflags "$GO_LDFLAGS" -o ./bin/docker-compose ./cmd
 }
 
 do_install() {
-- 
2.40.0



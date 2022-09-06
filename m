Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16108ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 18:14:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2758.1662488046007547164
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 11:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PzNGpZ9C;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6248b16c11=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 286D217a002072
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 6 Sep 2022 11:14:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=9kS9cPDJZO2Wftepi+ssvjHRAMlpnZcBxk5Gu1J773Y=;
 b=PzNGpZ9C1tatOLPco+Wm+MebNMxH5rscVAmbv3UDgep2323WiGg+M+OnuoaFXJyM331l
 ZYH7cBznm4STJ/18tLyw+6bWjSE3DHCys4pOD5pSDoJhY9313kan4BFPH74zM8tZhn/u
 D8iuy4Ux95Nyo61O5udzt6FurO2URuiXmBNL1GQgnnABhbQpB3Z5zzeuEMkGEL4vDZTX
 /RoICrkpRncBXGy97Zh9NR3RxCkaSN9nGGtOLB738nd9xu0s+Tmw2kJyFMYJix8iIIH3
 TB8JD+j2Ip7Q3TvDWg+4kBmqtoWhN8pSfRMcb5K/L4+5vM+v+6b0KP085Zy8mbXn/oHR RA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jc6ejtm0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 11:14:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMfnp3cLkDZtAzaS6Doixs77tts/ilhkrz0wIDjz8n/VVobNSNd1rxfgWa8ZnRWxUl1RDUgMsKTTQUVh8NgwuI51d4F+sJjFjU2Bk4ewsR7SlCOIwmZ9KtB2zsQtWWH2yYxoBrJaRrJdZEfSEm+A9/M/g4Z2iCO5GkCcRUG9HuRpmWyVUZiU8cITwd53F8UeYXU3UuZfQcr0r2tagax3b8h1VRRM9izrzdPs9niT5Fv7GWIevK5mZ5TKQG3VrFNr35AfscXNU7VpeFZsrcXSwb7D1LKrultNbBeKB64MW0t2mXfe85rCygh5GAgePFyhDLOqGxR19TSX30gAWy0Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kS9cPDJZO2Wftepi+ssvjHRAMlpnZcBxk5Gu1J773Y=;
 b=Jb4U5gRUI3aEvEmmxmVBwAp4I/dUAVUH5PzKOQ7AHJWrHx92QnEcubyg4EXZ70cZYfTNfQys6UgU1PESN8NufnqhWxE2WyoEc51qD87PE8I/SFwLdVCmjoAfFkitm9UFEnMXfMzpiquA3ZfqcadsSqxK1PsEjRaMuYMG6RXfpdxFZ1rwdtDwrttM0vRtgdbJUY+Qk5cdcYmcW2AGiN47sF+aCoSRiafnCRnBj1gjZo+mMHpGO8vWxFXdaHrRdTmFZBCIcfrUzkKpHgu72qe++TD83cd1xP7Jxqazo034P5XBUPCdA5ojuYvKUrjgdQjZKghoQr9PK46MWpG/9e7EFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Tue, 6 Sep 2022 18:14:03 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::3526:31b1:a7c:cd2%5]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 18:14:02 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][PATCH 0/1] Error while compiling ceph v17.2.3
 as part of uprev from v15.2.15.
Date: Tue,  6 Sep 2022 14:13:49 -0400
Message-Id: <20220906181350.30639-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0347.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be2d8eab-ba54-4e61-1cb6-08da90339406
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4LGMj3DMP1a5I2fgs/+QnR9XXQNhuiR74+IhDzWjev0PRxfSqXRi13BpH8S2nsLRZfID2/Q5ZIpGdZA9BXoWLFpKh4DXPvgXKlOfU1BmF5OGt9f14pgQ3K54kIQhnF/e9fD+PfHJPL/gvi/HGPxHbX0rrZewDJK5RqKxdg3nzZtFs85IL/c3KNMJB+KkPXfMpxgzRJXhz2CwqFUH9oNUB5j7Csajfud9+bkVb620PUljdwyIoXszF1HC/Vqhjb3XtzMoHhmFOp5HIsjl87NJdQ8IKGDTPZQYnltGZWtYkkMdeFtve6G21vUkBKXF8GoCqQ1JZ0xTC/2oW6+XXu+j/3P4M94jvXLcDjL+zfxapRX1/kJMuHUZXXAI/rfPg6Q4bqzpj8R7R3S3AQutGsbMqCGt2fyLeX+kIM1IuHQFwXaRv9D04NCaJJ10wopgfedkQYGpAVNa9Rv9Nc4marqr6xoBikdBamRtONoDrx0QqBZavjlGukW+gS2LWWvx77nKhma3p1gfKKuf5ezk5bHZvOXxJrBpG4yXGokuiJMcc51KdOiTDRQdK9PEuJ8KXOc5ZRDGM2mjy1FJtji0l/Q08vDQb2YkWKQdWJ2FChA3R94XXYb4wHJiDh5AQ68YZpFl4dB5Nz8PoOyGAfO4blfc6MR+PNqZkgbXv5mrSYpmsbN2E/ZTetUGLEkdh2z1V1aT1U90uiYgZOqeNf4Ry2phvMD6gg2Oeb2FbQ/XkaGcxTXnhl57cUi5dmLHW8BUQTN/4sEY86GHBoS60gvogvUytHyQ1grHJdBWlDewCwgPJwZYVVsPgaiPVEln+4oxj4L6toWFtf5i5JtmziP1XwCoWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39850400004)(366004)(396003)(376002)(316002)(6916009)(66946007)(5660300002)(44832011)(8936002)(2906002)(36756003)(66476007)(66556008)(8676002)(186003)(6512007)(966005)(6486002)(6506007)(83380400001)(478600001)(41300700001)(1076003)(2616005)(26005)(52116002)(38100700002)(6666004)(86362001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8KU4c5Fsv8bPGI+mRNtzOGhGCpk0Kg4o+Q1yc85DJts71aZtT/Ih9hw8hG7E?=
 =?us-ascii?Q?moDdDHuS0NshaihPjjoyN+L+Ps8qdeUMB2jts2ny2yovXiTGMAgOyc+mzNQy?=
 =?us-ascii?Q?2ghQOLnreNp5mPV1r1fE7Tw+xPA0rgQ/K//fsiLEc/8DG1twJiwrOz1aOZv1?=
 =?us-ascii?Q?9wxIpqj+BEXEBBoYamgyg2o8eqbLMV+U4rqYaooHd277uJ/pH+KYvZzHGjzQ?=
 =?us-ascii?Q?jlqbZ+xzXzVjiwkitabMLk7BbEwQEvggwEpeo2RkNqIckEzIZmIo0sY2ndvI?=
 =?us-ascii?Q?Vcf5tnvl7dor+psSlDPTu1WlZLIszvmx570cs9LSnLrvywXT5WEOmaAdXZNZ?=
 =?us-ascii?Q?FtafFtIvuf5sKMsC26SoqCTAGW443O69ifjaTkePkKhd6zCoR6kJ4VW26fOC?=
 =?us-ascii?Q?+T+S9GBAU/D+CGty16cWkHM0bZ2qiA4Jf5BHxOxcCmsRyktvB5fiHndCry/t?=
 =?us-ascii?Q?zAKughlWvnKhLBDCi28UBQYH6flJ1q+n3RxpqlnzPaqaE8MNB/ohO/KIB9Ys?=
 =?us-ascii?Q?uT3qjaGwnjjVdkLZ2O2MLX9KrfcNLF90V4B8qng+kHEU4xIoxGUGaM0mOzqQ?=
 =?us-ascii?Q?0/avTPF1N/QgON8OYngXq4wuqWGeboSyeHc8PR3HJiUSzISvIS7Z0K4uCg3X?=
 =?us-ascii?Q?juubHjOKScs8GDaNahvC3/NMEwg7hNqbyQZUfRmBRcu21P5uejRZYgm0jjUH?=
 =?us-ascii?Q?r17EoiU4t/OlB6UFCeBPgQazdNjcMHUSTyxWeOSGSx/Ohk6HXGToaUrM0lDQ?=
 =?us-ascii?Q?TNTX8O777t1dKxNbFxRuLQOd1fxUcwt8KBcijAmuZkBGKXfab/rS2JIB+a2d?=
 =?us-ascii?Q?mJXbMWPKuSkGEY9w4fzlXU+e7J9nK6PpIYrY+6piILSbqCKPrKgNKoN75hiV?=
 =?us-ascii?Q?mGWjikK7nibrGipcvuAnK87/2i+XhJgs1ue6vMS6nXMGqkD5TdFJGNLePh8n?=
 =?us-ascii?Q?gNLvG4sx1mPCbtR84Hk13LqDBDqIYnhlEq1ci141UPtDfnAVuKuQOqAoN0D2?=
 =?us-ascii?Q?aEDcXd10RxcRS40J/W5SKhgdM7ztXghQPn7IzhDdz8UdIb9LYkF3RmyEOYeS?=
 =?us-ascii?Q?QgL9nehbLJcM02JDaK8jckeiAuIEbhKKPGseDVCh0AlYAtfwty2lQP7mVeUo?=
 =?us-ascii?Q?WxlZIyRwPRI94O/GdKCzp+xQO/Xf8YHpHzHkQkvKzXMXqvlf4iO4j67GEZy6?=
 =?us-ascii?Q?/F6kRN4yUdkEY41sa/RHFBqRajuL3tVJfvmfj5oJyKUPUlNCbH2KswlgcOzI?=
 =?us-ascii?Q?41lXMfZnGQUnL7gLpff2i+KFmqBbDOaNeqbbPteZ3M9PpEeapht5Z4TS3teK?=
 =?us-ascii?Q?mvFjE6QVoF+vUszE/FM0y7gh1GMA2fC7ppCD4mpYQgHjCp2rgTYzWzRzFQ6g?=
 =?us-ascii?Q?ZwTKNBQpKp1VihO8u/j2l4Kpetz0wB2Mx72PKIp1dZqKLVofvnCHL0wToxbk?=
 =?us-ascii?Q?BdBs7Ix2UajtJcyKN8aBtgtalPJSEn+Y092MjzckoCR9EgrHs77SZycrb+VL?=
 =?us-ascii?Q?DvQkU0c7coW+lruQLmUBnUTa4nwQ9Rb+3rDuJdFw6OjFjczlwXQzRx7EhQTZ?=
 =?us-ascii?Q?K9VjkkmCcx+MwtL+3qckKhf4zMAFpz0jxRXzx2kZCX1u6CXwpzJHUgxHaytI?=
 =?us-ascii?Q?jA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 be2d8eab-ba54-4e61-1cb6-08da90339406
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 18:14:02.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 es7wUSrMVr+K237fMphPUCAQZ6aQQPbgUDTl3UPnoI5U83K3MeOWs/KwESd6pzVH335e/P56EGMjf9Tt2YzjQAFqefUs4vEKbKtO4+Mkzvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
X-Proofpoint-ORIG-GUID: olzoBUb6-w6lcnHSkojAIrzx8HaoISbP
X-Proofpoint-GUID: olzoBUb6-w6lcnHSkojAIrzx8HaoISbP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=696
 clxscore=1011 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060084
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Sep 2022 18:14:09 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7599

I am running into a compilation issue [1] while building ceph v17.2.3 as
part of uprev from v15.2.15.

There is an upstream issue (https://tracker.ceph.com/issues/55256) and
fixes [2] (which are contained in v17.2.3)  that addresses the issue.
However I still end up with the compilation issue.

I have tried a solution provided on a similar compilation issue
(https://tracker.ceph.com/issues/55256) as shown in [3] but end up with
the following error:

make: *** No rule to make target
'cmake_object_order_depends_target_common-options-objs'.  Stop.

I also tried turning of legacy option, ie "with_legacy: false", with no
success.

Does anyone have any suggestions? Am I missing something?

I have attached the patch for the uprev:
New build time deps on lua, cryptsetup and thrift
There was some patch refreshing as well.

[1] :
|     1 | #include "global_legacy_options.h"                                                                                                                                                                       
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~                                                                                                                                                                       
| compilation terminated.                                                                                                                                                                                          
| make[2]: ***
[src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/build.make:90:
src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/openssl_crypto_plugin.cc.o]
Error 1
| make[2]: *** Waiting for unfinished jobs....                                                                                                                                                                     
| make[2]: ***
[src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/build.make:76:
src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/openssl_crypto_accel.cc.o]
Error 1
| make[2]: Leaving directory '/yow-lpggp31/ssajal/repos/build/master/cph_uprev/tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/build'                                                                              
| make[1]: *** [CMakeFiles/Makefile2:6587: src/crypto/openssl/CMakeFiles/ceph_crypto_openssl.dir/all] Error 2                                                                                                      
| In file included from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/config_values.h:59,                                                
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/config.h:27,                                                       
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/config_proxy.h:6,                                                  
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/ceph_context.h:41,                                                 
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/common/dout.h:29,                                                         
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/include/Context.h:19,                                                     
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/msg/Message.h:24,                                                         
|                  from ..../tmp-glibc/work/core2-64-oe-linux/ceph/17.2.3-r0/ceph-17.2.3/src/msg/DispatchQueue.cc:15:
ceph/17.2.3-r0/ceph-17.2.3/src/common/options/legacy_config_opts.h:1:10:
fatal error: global_legacy_options.h: No such file or directory

[2]:

https://github.com/ceph/ceph/commit/6007448501b3bf3bd8ee4b619a74b9b4146df745
https://github.com/ceph/ceph/commit/d93880880dad2cdbdc9abed1a51edf5264068ff1

[3]

do_compile() {
        cmake_do_compile
}

cmake_do_compile() {
        cmake_runcmake_build --target
cmake_object_order_depends_target_common-options-objs all 
}

Sakib Sajal (1):
  ceph: upgrade v15.2.15 -> v17.2.3

 ...mpressor.h-fix-snappy-compiler-error.patch |  30 ----
 ...h-fix-build-errors-for-cross-compile.patch | 134 ++++++++-------
 ...001-cmake-add-support-for-python3.10.patch |  34 ----
 ...001-fix-host-library-paths-were-used.patch |  30 ++--
 .../ceph/ceph/CVE-2021-3979.patch             | 158 ------------------
 .../ceph/{ceph_15.2.15.bb => ceph_17.2.3.bb}  |  14 +-
 6 files changed, 98 insertions(+), 302 deletions(-)
 delete mode 100644 recipes-extended/ceph/ceph/0001-SnappyCompressor.h-fix-snappy-compiler-error.patch
 delete mode 100644 recipes-extended/ceph/ceph/0001-cmake-add-support-for-python3.10.patch
 delete mode 100644 recipes-extended/ceph/ceph/CVE-2021-3979.patch
 rename recipes-extended/ceph/{ceph_15.2.15.bb => ceph_17.2.3.bb} (91%)

-- 
2.33.0


